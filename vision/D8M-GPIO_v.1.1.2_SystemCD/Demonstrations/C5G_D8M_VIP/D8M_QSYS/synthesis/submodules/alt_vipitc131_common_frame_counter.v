module alt_vipitc131_common_frame_counter
    #(parameter
        NUMBER_OF_COLOUR_PLANES = 0,
        COLOUR_PLANES_ARE_IN_PARALLEL = 0,
        LOG2_NUMBER_OF_COLOUR_PLANES = 0,
        CONVERT_SEQ_TO_PAR = 0,
        TOTALS_MINUS_ONE = 0,
	PIXELS_IN_PARALLEL = 1)
    (
    input wire rst,
    input wire clk,
    input wire sclr,
    
    // control signals
    input wire enable,
    input wire hd_sdn,
    input wire [1:0] uhd,    
    // frame sizes
    input wire [15:0] h_total,
    input wire [14:0] v_total,
    
    // reset values
    input wire [15:0] h_reset,
    input wire [14:0] v_reset,
    
    // outputs
    output wire new_line,
    output wire start_of_sample,
    output wire [LOG2_NUMBER_OF_COLOUR_PLANES-1:0] sample_ticks,
    output reg [15:0] h_count,
    output reg [14:0] v_count);

wire count_sample;
reg [15:0] uhd_h_inc;
reg [14:0] uhd_v_inc;

parameter LOG2_PIXELS_IN_PARALLEL = alt_clogb2(PIXELS_IN_PARALLEL);

function integer alt_clogb2;
  input [31:0] value;
  integer i;
  begin
    alt_clogb2 = 32;
    for (i=31; i>0; i=i-1) begin
      if (2**i>=value)
        alt_clogb2 = i;
    end
  end
endfunction

alt_vipitc131_common_sample_counter sample_counter(
    .rst(rst),
    .clk(clk),
    .sclr(sclr),
    .hd_sdn(hd_sdn),
    .count_cycle(enable),
    .count_sample(count_sample),
    .start_of_sample(start_of_sample),
    .sample_ticks(sample_ticks));

defparam sample_counter.NUMBER_OF_COLOUR_PLANES = NUMBER_OF_COLOUR_PLANES,
         sample_counter.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
         sample_counter.LOG2_NUMBER_OF_COLOUR_PLANES = LOG2_NUMBER_OF_COLOUR_PLANES;
    
wire [15:0] h_total_int;
wire [14:0] v_total_int;
    
generate 
    if(TOTALS_MINUS_ONE) begin : totals_minus_one_generate
        assign h_total_int = h_total;
        assign v_total_int = v_total;
    end else begin
        assign h_total_int = h_total - 15'd1;
        assign v_total_int = v_total - 14'd1;
    end
endgenerate

wire [15:0] h_wrap_int;
wire [14:0] v_wrap_int;
assign h_wrap_int = h_count - h_total_int;
assign v_wrap_int = v_count - v_total_int;   

// Only support 1, 2, 4 or 8 Pixels in parallel
generate
    if (PIXELS_IN_PARALLEL > 1) begin
        always @(*) begin
	    case (uhd)
		2'd1 : begin // Outputting in DisplayPort parallel form (horizontal sub-sampling only)
		    uhd_h_inc <= 16'd0 | 16'd1 << LOG2_PIXELS_IN_PARALLEL;
		    uhd_v_inc <= 15'd1;
		end
		2'd2 : begin // Outputting in SDI parallel form (horizontal and vertical sub-sampling)
		    uhd_h_inc <= (LOG2_PIXELS_IN_PARALLEL == 2 || LOG2_PIXELS_IN_PARALLEL == 4) ? 16'd2 : 16'd4;
		    uhd_v_inc <= (LOG2_PIXELS_IN_PARALLEL == 2) ? 15'd1 : (LOG2_PIXELS_IN_PARALLEL == 4) ? 15'd2 : 15'd4;
		end
		default : begin
		    uhd_h_inc <= 16'd1;
		    uhd_v_inc <= 15'd1;
		end
		
	    endcase
	end
    end
endgenerate

always @ (posedge rst or posedge clk) begin
    if(rst) begin
        h_count <= 15'd0;
        v_count <= 14'd0;
    end else begin
        if(sclr) begin
            h_count <= h_reset + {{15{1'b0}}, count_sample & hd_sdn};
            v_count <= v_reset;
        end else if(enable) begin
            if(new_line) begin
                h_count <= 16'd0;
                if(v_count >= v_total_int)
                    v_count <= 15'd0;
                else
                    v_count <= v_count + uhd_v_inc;
            end else if(count_sample)
                h_count <= h_count + uhd_h_inc;
        end
    end
end

assign new_line = (h_count >= h_total_int) && count_sample;

endmodule

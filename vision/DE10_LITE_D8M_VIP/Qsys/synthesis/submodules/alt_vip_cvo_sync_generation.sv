// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// This module takes vertical and horizontal counts along with frame parameters to form vertical and horizontal sync signals

module alt_vip_cvo_sync_generation (
    rst,			// rst
    clk,			// clk

    // sync generation control
    interlaced,
    h_total_minus_one,
    enable_synced_nxt,
    ap,
    state_next,
    
    vid_datavalid_nxt,
    anc_datavalid_nxt,
    vid_h_nxt,
    vid_v_nxt,
    vid_f_nxt,
    
    // Counter inputs
    h_count,
    v_count,
    
    // Mode Bank Inputs
    h_blank,
    h_sync_start,
    h_sync_end,
    f2_v_start,
    f1_v_start,
    f1_v_end,
    f2_v_sync_end,
    f1_v_sync_end,
    f2_v_sync_start,
    f1_v_sync_start,
    vid_h_sync_polarity,
    vid_v_sync_polarity,
    f2_anc_v_start,
    f1_anc_v_start,
    f_rising_edge,
    f_falling_edge,
    ap_line,
    ap_line_end,
        
    // Synchronisation control
    vid_v_pipeline,
//    vid_v_sync_pipeline,
    vid_datavalid_pipeline,
    anc_valid_word_pipeline,
    vid_v,
    vid_h,
    vid_f,
    vid_v_sync,
    vid_h_sync,
    vid_datavalid,
    start_of_vsync,
    
    start_of_frame   
    
    
);
parameter GENERATE_SYNC = 1;

parameter BPS = 10;
parameter NUMBER_OF_COLOUR_PLANES = 2;
parameter COLOUR_PLANES_ARE_IN_PARALLEL = 1;
parameter PIXELS_IN_PARALLEL = 1;
parameter STD_WIDTH = 3;
parameter USE_EMBEDDED_SYNCS = 1;
parameter ACCEPT_COLOURS_IN_SEQ = 0;

parameter [3:0] INSERT_ANC      = 4'd15; // This should be defined from the CVO_core so that changes to the state machine are automatically accounted for
parameter H_OFFSET = 0;
parameter V_OFFSET = 0;

localparam integer v_offset_const = V_OFFSET;
localparam integer h_offset_const = H_OFFSET;

localparam READ_LATENCY = 2;
localparam DATA_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? BPS * NUMBER_OF_COLOUR_PLANES * PIXELS_IN_PARALLEL : BPS;

localparam CONVERT_SEQ_TO_PAR = COLOUR_PLANES_ARE_IN_PARALLEL == 1 && ACCEPT_COLOURS_IN_SEQ != 0 && NUMBER_OF_COLOUR_PLANES > 1;
localparam COLOUR_PLANES_IN_SEQUENCE = (COLOUR_PLANES_ARE_IN_PARALLEL && !CONVERT_SEQ_TO_PAR) ? 1 : NUMBER_OF_COLOUR_PLANES;
localparam LOG2_COLOUR_PLANES_IN_SEQUENCE = alt_clogb2(COLOUR_PLANES_IN_SEQUENCE);



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

// optional video ports
input rst;			// rst
input clk;			// clk

// sync generation control
input interlaced;
input [15:0] h_total_minus_one;
input enable_synced_nxt;
input ap;
input [3:0] state_next;

output vid_datavalid_nxt;
output anc_datavalid_nxt;
output vid_h_nxt;
output vid_v_nxt;
output vid_f_nxt;

// Counter inputs
input [15:0] h_count;
input [15:0] v_count;

// Mode Bank Inputs
input [15:0] h_blank;
input [15:0] h_sync_start;
input [15:0] h_sync_end;
input [15:0] f2_v_start;
input [15:0] f1_v_start;
input [15:0] f1_v_end;
input [15:0] f2_v_sync_end;
input [15:0] f1_v_sync_end;
input [15:0] f2_v_sync_start;
input [15:0] f1_v_sync_start;
input vid_h_sync_polarity;
input vid_v_sync_polarity;
input [15:0] f2_anc_v_start;
input [15:0] f1_anc_v_start;
input [15:0] f_rising_edge;
input [15:0] f_falling_edge;
input [15:0] ap_line;
input [15:0] ap_line_end;

// Synchronisation control
output [READ_LATENCY-1:0] vid_v_pipeline;
//output [READ_LATENCY-1:0] vid_v_sync_pipeline;
output vid_datavalid_pipeline;
output anc_valid_word_pipeline;
output vid_v;
output vid_h;
output vid_f;
output vid_v_sync;
output vid_h_sync;
output vid_datavalid;
output start_of_vsync;

input start_of_frame;

wire vid_datavalid_nxt;
wire anc_datavalid_nxt;
wire vid_h_nxt;
wire vid_v_nxt;
wire vid_f_nxt;
wire [READ_LATENCY-1:0] vid_v_pipeline;
wire [READ_LATENCY-1:0] vid_v_sync_pipeline;
wire vid_datavalid_pipeline;
wire anc_valid_word_pipeline;
wire vid_v;
wire vid_h;
wire vid_f;
wire vid_v_sync;
wire vid_h_sync;
wire vid_datavalid;


// Blanking and sync control signals
wire vid_h_sync_form;
wire vid_v_sync_form;

//wire [15:0] f2_v_sync_end_m1;
//wire [15:0] f1_v_sync_end_m1;
wire [15:0] h_total_div_2;
wire [15:0] v_sync_h_start;
wire [15:0] f2_h_front_porch;
wire vid_v_sync_p;
wire vid_v_sync_i;
wire vid_h_sync_nxt;
wire vid_v_sync_nxt;
wire anc_valid_word_nxt;
wire start_of_vsync_nxt;


reg [READ_LATENCY-1:0] vid_f_pipeline;
reg [READ_LATENCY-1:0] vid_h_pipeline;
reg [READ_LATENCY-1:0] vid_h_sync_pipeline;
reg [READ_LATENCY-1:0] vid_v_pipeline_reg;
reg [READ_LATENCY-1:0] vid_v_sync_pipeline_reg;
reg [READ_LATENCY-1:0] vid_datavalid_pipeline_reg;
reg [READ_LATENCY-1:0] anc_valid_word_pipeline_reg;

reg vid_v_reg;
reg vid_h_reg;
reg vid_f_reg;
reg vid_v_sync_reg;
reg vid_h_sync_reg;
reg vid_datavalid_reg;

reg start_of_vsync_reg;

// Generate all the blanking and sync signals based on the sample and line counters.
assign vid_h_nxt = enable_synced_nxt && h_count < h_blank;
assign vid_h_sync_form = enable_synced_nxt && (h_count >= h_sync_start && h_count < h_sync_end);
assign vid_v_nxt = enable_synced_nxt && (v_count >= f2_v_start ||
                                    (interlaced && (v_count >= f1_v_start && v_count < f1_v_end)));

//assign vid_v_sync_form = enable_synced_nxt && ((v_count >= f2_v_sync_start && v_count < f2_v_sync_end) ||
//                                         (interlaced && (v_count >= f1_v_sync_start && v_count < f1_v_sync_end)));
//assign f2_v_sync_end_m1 = f2_v_sync_end - 1;
//assign f1_v_sync_end_m1 = f1_v_sync_end - 1;

// The rising edge of the v_sync signal for the second field in interlaced frames is required to start at h_total/2 //
// This htotal/2 point is relative to the h-sync rising edge so must also account for the h-sync front porch        //
assign h_total_div_2 = h_total_minus_one >> 1;                            // Cacluate line the mid-point            //
assign v_sync_h_start = h_total_div_2 + h_sync_start;                     // Add the front porch                    //

// progresive sync also defines the sync for the second field in interlaced frames
assign f2_h_front_porch = vid_f_nxt ? v_sync_h_start : h_sync_start;
assign vid_v_sync_p =  enable_synced_nxt && ( (v_count == f2_v_sync_start && h_count >= f2_h_front_porch) ||
					      (v_count > f2_v_sync_start && v_count < f2_v_sync_end) ||
					      (v_count == f2_v_sync_end && h_count < f2_h_front_porch));

assign vid_v_sync_i =  enable_synced_nxt && ( (v_count == f1_v_sync_start && h_count >= h_sync_start) ||
					      (v_count > f1_v_sync_start && v_count < f1_v_sync_end) ||
					      (v_count == f1_v_sync_end && h_count < h_sync_start));

				      
assign vid_v_sync_form = vid_v_sync_p || (interlaced && vid_v_sync_i);
//assign vid_v_sync_form = enable_synced_nxt && ((v_count >= f2_v_sync_start && v_count < f2_v_sync_end) ||
//                                         (interlaced && (v_count >= f1_v_sync_start && v_count < f1_v_sync_end)));
//Configurable polarities TODO : update mode-banks
assign vid_h_sync_nxt = vid_h_sync_polarity ? vid_h_sync_form : ~vid_h_sync_form;
assign vid_v_sync_nxt = vid_v_sync_polarity ? vid_v_sync_form : ~vid_v_sync_form;

assign vid_datavalid_nxt = enable_synced_nxt & ap;
assign anc_datavalid_nxt = enable_synced_nxt && h_count >= h_blank && (v_count >= f2_anc_v_start || 
                                                                      (interlaced && v_count >= f1_anc_v_start && v_count < f1_v_end));
assign vid_f_nxt = interlaced && (v_count >= f_rising_edge && v_count < f_falling_edge);

assign anc_valid_word_nxt = (state_next == INSERT_ANC) && anc_datavalid_nxt; // when the next packet is received we start filling with blanking
                                                                             // (state_next == INSERT_ANC) breaks if READY_LATENCY != 2

// Delay all the sync and blanking lines by the fifo read latency, so that they line up with the read data.
always @ (posedge rst or posedge clk) begin
    if (rst) begin
        vid_f_pipeline <= {READ_LATENCY{1'b0}};
        vid_h_pipeline <= {READ_LATENCY{1'b0}};
        vid_h_sync_pipeline <= {READ_LATENCY{1'b0}};
        vid_v_pipeline_reg <= {READ_LATENCY{1'b0}};
        vid_v_sync_pipeline_reg <= {READ_LATENCY{1'b0}}; 
        vid_datavalid_pipeline_reg <= {READ_LATENCY{1'b0}};
        anc_valid_word_pipeline_reg <= {READ_LATENCY{1'b0}};
        
        vid_f_reg <= 1'b0;
        vid_h_reg <= 1'b0;
        vid_h_sync_reg <= 1'b0;
        vid_v_reg <= 1'b0;
        vid_v_sync_reg <= 1'b0;
        vid_datavalid_reg <= 1'b0;

        start_of_vsync_reg <= 1'b0;
    end else begin
        vid_f_pipeline <= {vid_f_pipeline[READ_LATENCY-2:0], vid_f_nxt};
        vid_h_pipeline <= {vid_h_pipeline[READ_LATENCY-2:0], vid_h_nxt};
        vid_h_sync_pipeline <= {vid_h_sync_pipeline[READ_LATENCY-2:0], vid_h_sync_nxt};
        vid_v_pipeline_reg <= {vid_v_pipeline_reg[READ_LATENCY-2:0], vid_v_nxt};
        vid_v_sync_pipeline_reg <= {vid_v_sync_pipeline_reg[READ_LATENCY-2:0], vid_v_sync_nxt};
        vid_datavalid_pipeline_reg <= {vid_datavalid_pipeline_reg[READ_LATENCY-2:0], vid_datavalid_nxt};
        anc_valid_word_pipeline_reg <= {anc_valid_word_pipeline_reg[READ_LATENCY-2:0], anc_valid_word_nxt};
        
        // Register all the outputs.
        vid_f_reg <= vid_f_pipeline[READ_LATENCY-1];
        vid_h_reg <= vid_h_pipeline[READ_LATENCY-1];
        vid_h_sync_reg <= vid_h_sync_pipeline[READ_LATENCY-1];
        vid_v_reg <= vid_v_pipeline_reg[READ_LATENCY-1];
        vid_v_sync_reg <= vid_v_sync_pipeline_reg[READ_LATENCY-1];
        vid_datavalid_reg <= vid_datavalid_pipeline_reg[READ_LATENCY-1];
        start_of_vsync_reg <= start_of_vsync_nxt;
    end
end

generate
    if(USE_EMBEDDED_SYNCS)
        assign start_of_vsync_nxt = vid_v_pipeline[READ_LATENCY-2] & ~vid_v_pipeline[READ_LATENCY-1];
    else
        assign start_of_vsync_nxt = vid_v_sync_pipeline[READ_LATENCY-2] & ~vid_v_sync_pipeline[READ_LATENCY-1];
endgenerate

assign vid_v_pipeline = vid_v_pipeline_reg;
assign vid_v_sync_pipeline = vid_v_sync_pipeline_reg;
assign vid_datavalid_pipeline = vid_datavalid_pipeline_reg[READ_LATENCY-1];
assign anc_valid_word_pipeline = anc_valid_word_pipeline_reg[READ_LATENCY-1];

assign vid_f = vid_f_reg;
assign vid_h = vid_h_reg;
assign vid_h_sync = vid_h_sync_reg;
assign vid_v = vid_v_reg;
assign vid_v_sync = vid_v_sync_reg;
assign vid_datavalid = vid_datavalid_reg;
assign start_of_vsync = start_of_vsync_reg;
endmodule


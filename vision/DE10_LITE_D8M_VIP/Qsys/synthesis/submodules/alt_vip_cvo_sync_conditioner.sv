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


module alt_vip_cvo_sync_conditioner (
    rst,                        // rst
    clk,                        // clk

    // Sync
    sof,
    sof_locked,

    // optional video ports
    vid_v,
    vid_h,
    vid_f,
    vid_v_sync,
    vid_h_sync,
    vid_datavalid,
    
    vid_ln,
    vid_trs,
    vid_sof,
    vid_sof_locked,
    vid_vcoclk_div,

    // sync generation control
    restart_sample_count,
    restart_line_count,
    serial_output,
    field_prediction,
    interlaced,
    h_total_minus_one,
    v_total_minus_one,
    enable_synced_nxt,
    vcoclk_divider_value,
    sof_sample,
    sof_line,
    sof_subsample,    
    genlock_enable,
    ap,
    state_next,
    clear_enable,
    
    sync_lines,
    sync_samples,
    remove_repeatn,
    sync_compare_h_reset,
    sync_compare_v_reset,
    genlocked,
    vid_datavalid_nxt,
    anc_datavalid_nxt,
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
    sav,
    ap_line,
    ap_line_end,
        
    // Synchronisation control
    enable_threshold,
    enable_synced,
    vid_v_pipeline,
    vid_datavalid_pipeline,
    anc_valid_word_pipeline,
    
    threshold_reached,
    enable_sync1,
    start_of_frame,
    cp_ticks,
    
    // Optional embedded sync signals
    start_of_cp,
    trs,
    trs_data
    
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

parameter UHD_MODE = 1; // 1 = DISPLAY_PORT, 0 = SDI
parameter DP_OUTPUT_SUPPORT = 1;
parameter SDI_OUTPUT_SUPPORT = 0;

localparam integer v_offset_const = V_OFFSET;
localparam integer h_offset_const = H_OFFSET;

localparam READ_LATENCY = 2;
localparam DATA_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? BPS * NUMBER_OF_COLOUR_PLANES * PIXELS_IN_PARALLEL : BPS;
localparam PIXEL_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? BPS * NUMBER_OF_COLOUR_PLANES : BPS;

localparam CONVERT_SEQ_TO_PAR = COLOUR_PLANES_ARE_IN_PARALLEL == 1 && ACCEPT_COLOURS_IN_SEQ != 0 && NUMBER_OF_COLOUR_PLANES > 1;
localparam COLOUR_PLANES_IN_SEQUENCE = (COLOUR_PLANES_ARE_IN_PARALLEL && !CONVERT_SEQ_TO_PAR) ? 1 : NUMBER_OF_COLOUR_PLANES;
localparam LOG2_COLOUR_PLANES_IN_SEQUENCE = alt_clogb2(COLOUR_PLANES_IN_SEQUENCE);

localparam TRS_CP_OFFSET = 4 % NUMBER_OF_COLOUR_PLANES;


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
input rst;                        // rst
input clk;                        // clk

// Sync
input sof;
input sof_locked;

output [PIXELS_IN_PARALLEL - 1 : 0]vid_v;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_h;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_f;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_v_sync;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_h_sync;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid;

output [(PIXELS_IN_PARALLEL*11)-1:0] vid_ln;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_trs;
output                             vid_sof;
output                             vid_sof_locked;
output                             vid_vcoclk_div;

// sync generation control
input restart_sample_count;
input restart_line_count;
input serial_output;
input field_prediction;
input interlaced;
input [15:0] h_total_minus_one;
input [15:0] v_total_minus_one;
input enable_synced_nxt;
input [13:0] vcoclk_divider_value;
input [13:0] sof_sample;
input [12:0] sof_line;
input [1:0] sof_subsample;    
input [1:0] genlock_enable;
input ap;
input [3:0] state_next;
input clear_enable;

output sync_lines;
output sync_samples;
output remove_repeatn;
output [15:0] sync_compare_h_reset;
output [15:0] sync_compare_v_reset;
output genlocked;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_nxt;
output [PIXELS_IN_PARALLEL - 1 : 0]anc_datavalid_nxt;
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
input [15:0] sav;
input [15:0] ap_line;
input [15:0] ap_line_end;

// Synchronisation control
output enable_threshold;
output enable_synced;
output [READ_LATENCY-1:0] vid_v_pipeline;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_pipeline;
output [PIXELS_IN_PARALLEL - 1 : 0]anc_valid_word_pipeline;

input threshold_reached;
input enable_sync1;
input start_of_frame;
input [LOG2_COLOUR_PLANES_IN_SEQUENCE-1:0] cp_ticks;

// Optional embedded sync signals
input start_of_cp;
//TODO : TRS should be limited to max of 4 pixels
output [PIXELS_IN_PARALLEL - 1 : 0]trs;
output [DATA_WIDTH-1:0] trs_data;


wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_f;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v_sync;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h_sync;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_trs;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_f_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v_sync_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h_sync_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]start_of_vsync;
wire start_vsync;
wire sync_lines;
wire sync_samples;
wire remove_repeatn;
wire [15:0] sync_compare_h_reset;
wire [15:0] sync_compare_v_reset;
wire genlocked;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_nxt;
wire [PIXELS_IN_PARALLEL - 1 : 0]anc_datavalid_nxt;
wire vid_v_nxt;
wire vid_f_nxt;
wire enable_threshold;
wire enable_synced;
wire [READ_LATENCY-1:0] vid_v_pipeline;
wire [PIXELS_IN_PARALLEL - 1 : 0][READ_LATENCY-1:0] gen_vid_v_pipeline;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_pipeline;
wire [PIXELS_IN_PARALLEL - 1 : 0]anc_valid_word_pipeline;
wire [PIXELS_IN_PARALLEL - 1 : 0]trs;
wire [DATA_WIDTH-1:0] trs_data;


// Blanking and sync control signals
wire vid_h_nxt;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h_nxt_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v_nxt_gen;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_f_nxt_gen;
wire [1:0] uhd_mode;

reg enable_threshold_reg;
reg [15:0] frames_in_sync /* synthesis noprune preserve */;
reg enable_synced_reg;

generate
if (UHD_MODE == 1) begin
    genvar i;
    for (i = 0; i < PIXELS_IN_PARALLEL; i++) begin : gen_cvo_syncs
        // For Display port, the regular sync signals are sub-sampled across the pixel lanes
        // Increment horizontal count by 1 for each pixel 
        // For SDI, each channel should have largely identical synchronisation signals
        // Need one conditioner outputting to all 4 channels
        // TODO : Should the SDI sync parameters be divideed by PIXELS_IN_PARALLEL?
        // TODO : SDI needs to disable step counting to sounters during blanking
        // TODO : SDI needs to consider the effect of 2 simultaneous lines and the differing line counts
        // TODO : for AP resolutions that don't divide exactly by PIXELS_IN_PARALLEL ap may need adjusting per lane
        wire [15:0] h_count_pixel_lane[PIXELS_IN_PARALLEL-1:0];
        assign h_count_pixel_lane[i] = h_count + i;  

        alt_vip_cvo_sync_generation pixel_lane_sync_generator(
            .rst(rst),                        // rst
            .clk(clk),                        // clk

            // sync generation control
            .interlaced(interlaced),
            .h_total_minus_one(h_total_minus_one),
            .enable_synced_nxt(enable_synced_nxt),
            .ap(ap),
            .state_next(state_next),

            .vid_datavalid_nxt(vid_datavalid_nxt[i]),
            .anc_datavalid_nxt(anc_datavalid_nxt[i]),
            .vid_h_nxt(vid_h_nxt_gen[i]),
            .vid_v_nxt(vid_v_nxt_gen[i]),
            .vid_f_nxt(vid_f_nxt_gen[i]),

            // Counter inputs
            .h_count(h_count_pixel_lane[i]),
            .v_count(v_count),

            // Mode Bank Inputs
            .h_blank(h_blank),
            .h_sync_start(h_sync_start),
            .h_sync_end(h_sync_end),
            .f2_v_start(f2_v_start),
            .f1_v_start(f1_v_start),
            .f1_v_end(f1_v_end),
            .f2_v_sync_end(f2_v_sync_end),
            .f1_v_sync_end(f1_v_sync_end),
            .f2_v_sync_start(f2_v_sync_start),
            .f1_v_sync_start(f1_v_sync_start),
            .vid_h_sync_polarity(vid_h_sync_polarity),
            .vid_v_sync_polarity(vid_v_sync_polarity),
            .f2_anc_v_start(f2_anc_v_start),
            .f1_anc_v_start(f1_anc_v_start),
            .f_rising_edge(f_rising_edge),
            .f_falling_edge(f_falling_edge),
            .ap_line(ap_line),
            .ap_line_end(ap_line_end),

            // Synchronisation control (OUTPUTS)
            .vid_v_pipeline(gen_vid_v_pipeline[i]),
            .vid_datavalid_pipeline(vid_datavalid_pipeline[i]),
            .anc_valid_word_pipeline(anc_valid_word_pipeline[i]),
            .vid_v(vid_v_gen[i]),
            .vid_h(vid_h_gen[i]),
            .vid_f(vid_f_gen[i]),
            .vid_v_sync(vid_v_sync_gen[i]),
            .vid_h_sync(vid_h_sync_gen[i]),
            .vid_datavalid(vid_datavalid_gen[i]),
	    .start_of_vsync(start_of_vsync[i]),

            .start_of_frame(start_of_frame)
        );
    end
end
endgenerate

// For modulo 4PinP, only consider the vid_v 0 as they will all change in step
assign vid_v_pipeline = gen_vid_v_pipeline[0];
assign start_vsync = |start_of_vsync; // TODO This works when frame width divides into PinP but will not work for non-modulo as start_vsync causes the frame counter to reset

// The following has been seperated out from the sync pipelining as only one instance is required rather than per-lane
always @ (posedge rst or posedge clk) begin
    if (rst) begin
        enable_synced_reg <= 1'b0;
        enable_threshold_reg <= 1'b0;
        frames_in_sync <= 16'd0;
    end else begin
        enable_synced_reg <= enable_synced_nxt;
        if(clear_enable) begin
            enable_threshold_reg <= 1'b0;
            frames_in_sync <= 16'd0;
        end else begin
            enable_threshold_reg <= (threshold_reached | enable_threshold_reg) & enable_sync1;
            if(enable_synced_nxt & start_of_frame)
                frames_in_sync <= frames_in_sync + 1'b1;
        end
    end
end

assign enable_synced = enable_synced_reg;
assign enable_threshold = enable_threshold_reg;
assign uhd_mode = (PIXELS_IN_PARALLEL > 1) ? (UHD_MODE) ? 2'b01 : 2'b10 : 2'b00;

generate begin : sync_generation_generate
    if(GENERATE_SYNC) begin
        wire restart_count;
        assign restart_count = restart_sample_count | restart_line_count;
    
        // TODO : alt_vip_common_sync_generation currently only sets sof if h_count and v_count exactly match sof_sample and sof_line
	// if these values don't divide exactly by PinP then sof will not be set.
	// Need to either specify that sof_sample and line must be factored by PinP or update alt_vip_common_sync_generation to set sof
	// when (h_count >= sof_sample) && (h_count - sof_sample) <= h_inc
	//      (v_count >= sof_line) && (v_count - sof_line) <= v_inc
        alt_vip_common_sync_generation sync_generation(
            .rst(rst),
            .clk(clk),
            
            .clear_enable(restart_count),
            .enable_count(1'b1),
            .hd_sdn(~serial_output),
	    .uhd(uhd_mode),
            .start_of_vsync(start_vsync),
            .field_prediction(field_prediction),
            .interlaced(interlaced),
            .total_sample_count(h_total_minus_one), 
            .total_sample_count_valid(1'b1),
            .total_line_count(v_total_minus_one[14:0]), 
            .total_line_count_valid(1'b1),
            .stable(enable_synced_nxt),
            
            .divider_value(vcoclk_divider_value),
            .sof_sample(sof_sample),
            .sof_line(sof_line),
            .sof_subsample(sof_subsample),
            
            .output_enable(genlock_enable[0]),
            .sof(vid_sof),
            .sof_locked(vid_sof_locked),
            .div(vid_vcoclk_div));

            defparam sync_generation.NUMBER_OF_COLOUR_PLANES = NUMBER_OF_COLOUR_PLANES,
                     sync_generation.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
                     sync_generation.LOG2_NUMBER_OF_COLOUR_PLANES = LOG2_COLOUR_PLANES_IN_SEQUENCE,
                     sync_generation.TOTALS_MINUS_ONE = 1;
        
        assign sync_compare_h_reset[15:13] = 3'b000;
        assign sync_compare_v_reset[15:13] = 3'b000;
        
        wire vid_sof_sync1;
        
        // delay vid_sof by the same amount so they are aligned when comparing
        alt_vip_common_sync #(0) sof_cvo_sync(
                    .rst(rst),
                    .sync_clock(clk),
                    .data_in(vid_sof),
                    .data_out(vid_sof_sync1));
        
        alt_vip_cvo_sync_compare sync_compare(
            .rst(rst),
            .clk(clk),
            
            // control signals
            .genlock_enable(genlock_enable),
            .serial_output(serial_output),
            .h_total_minus_one(h_total_minus_one[13:0]),//TODO : does this need extending to the full 16 bits?
            .restart_count(restart_count),
            .divider_value(vcoclk_divider_value),
            
            // control signals to is2vid
            .sync_lines(sync_lines),
            .sync_samples(sync_samples),
            .remove_repeatn(remove_repeatn),
            .sync_compare_h_reset(sync_compare_h_reset[12:0]),
            .sync_compare_v_reset(sync_compare_v_reset[12:0]),
            .genlocked(genlocked),
            
            // sync signals from CVI
            .sof_cvi(sof),
            .sof_cvi_locked(sof_locked),
            
            // sync signals from CVO
            .sof_cvo(vid_sof_sync1),
            .sof_cvo_locked(vid_sof_locked));
        
        defparam
            sync_compare.NUMBER_OF_COLOUR_PLANES = NUMBER_OF_COLOUR_PLANES,
            sync_compare.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
            sync_compare.LOG2_NUMBER_OF_COLOUR_PLANES = LOG2_COLOUR_PLANES_IN_SEQUENCE;
            
    end else begin
        assign vid_sof = 1'b0;
        assign vid_sof_locked = 1'b0;
        assign vid_vcoclk_div = 1'b0;
        assign remove_repeatn = 1'b0;
        assign sync_compare_h_reset = v_offset_const[15:0]; // TODO : should htis be h_offset_const?
        assign sync_compare_v_reset = v_offset_const[15:0];
        assign sync_samples = 1'b0;
        assign sync_lines = 1'b0;
        assign genlocked = 1'b0;
    end
end endgenerate









// THIS NEEDS ADAPTING 
// TRS IS ONLY OUTPUT ONE SYMBOL AT A TIME FOR PARALLEL SYMBOLS BUT CAN BE OUTPUT MULTIPLE
// PIXELS SIMULTANEOUSLY
// When using embedded syncs the h,v and f flags must be inserted into the
// BT656 stream.
parameter [2:0] S_IDLE      = 3'b000;
parameter [2:0] S_TRS_WORD2 = 3'b001;
parameter [2:0] S_TRS_WORD3 = 3'b010;
parameter [2:0] S_TRS_XYZ   = 3'b011;
parameter [2:0] S_TRS_LN0   = 3'b100;
parameter [2:0] S_TRS_LN1   = 3'b101;
parameter [2:0] S_TRS_CR0   = 3'b110;
parameter [2:0] S_TRS_CR1   = 3'b111;

function [9:0] calc_xyz;
  input [2:0] FVH;
  case (FVH)
    3'b000 : calc_xyz = 10'h200;
    3'b001 : calc_xyz = 10'h274;
    3'b010 : calc_xyz = 10'h2ac;
    3'b011 : calc_xyz = 10'h2d8;
    3'b100 : calc_xyz = 10'h31c;
    3'b101 : calc_xyz = 10'h368;
    3'b110 : calc_xyz = 10'h3b0;
    3'b111 : calc_xyz = 10'h3c4;
  endcase
endfunction

// When assuming that Frame parameters including TRS insertion poitns will be divisible by PinP, 
// vid_f_nxt, vid_v_nxt, vid_h_nxt can all be taken from the PinP lane as it will always mark the last pixel
assign vid_f_nxt = vid_f_nxt_gen[PIXELS_IN_PARALLEL - 1];
assign vid_v_nxt = vid_v_nxt_gen[PIXELS_IN_PARALLEL - 1];
assign vid_h_nxt = vid_h_nxt_gen[PIXELS_IN_PARALLEL - 1];

generate
    if (PIXELS_IN_PARALLEL > 1 && UHD_MODE == 0) begin
        if(USE_EMBEDDED_SYNCS) begin
            wire vid_trs_nxt;
            reg vid_trs_reg;
            reg [10:0] vid_ln_reg;
            reg [READ_LATENCY-1:0] vid_trs_pipeline;
            wire [9:0] xyz;
            wire [DATA_WIDTH-1:0] flags;
            wire vid_trs_int;
            wire trs_word2;
            wire trs_word3;
            wire trs_xyz;
            reg [2:0] emb_state;
            wire [BPS-1:0] xyz_fixed;
            wire sav_enable;
            wire [15:0] v_count_plus_ap;
            wire [15:0] v_count_minus_ap;

            // TODO : there is a Fogbugz case about where the CVO generates SOF when serial TRS_CP_OFFSET is specified
            assign sav_enable = (serial_output) ? cp_ticks == TRS_CP_OFFSET : 1'b1;

            assign vid_trs_nxt = enable_synced_nxt && ((start_of_cp && h_count == 0) || 
                                                   (sav_enable && h_count == sav));
            assign xyz = calc_xyz({vid_f_nxt, vid_v_nxt, vid_h_nxt});

            always @ (posedge rst or posedge clk) begin
                if (rst) begin
                    vid_trs_pipeline <= {READ_LATENCY{1'b0}}; 
                    vid_trs_reg <= 1'b0;
                    vid_ln_reg <= 11'd0;

                    emb_state <= S_IDLE;
                end else begin
                    vid_trs_pipeline <= {vid_trs_pipeline[READ_LATENCY-2:0], vid_trs_nxt};
                    vid_trs_reg <= vid_trs_int;
                    vid_ln_reg <= (v_count <= ap_line_end) ? v_count_plus_ap[10:0] : v_count_minus_ap[10:0];

                    if(enable_synced_nxt)
                        case (emb_state)
                            S_IDLE: begin 
                                if(vid_trs_int)
                                    emb_state <= S_TRS_WORD2;
                            end
                            S_TRS_WORD2 : emb_state <= S_TRS_WORD3;
                            S_TRS_WORD3 : emb_state <= S_TRS_XYZ;
                            S_TRS_XYZ   : emb_state <= S_IDLE;
                        endcase
                end
            end

            assign vid_trs_int = vid_trs_pipeline[READ_LATENCY-1];

            if(BPS > 10)
                assign xyz_fixed = {{BPS-10{1'b0}}, xyz};
            else
                assign xyz_fixed = xyz[9:10-BPS];
            genvar i;
            if(COLOUR_PLANES_ARE_IN_PARALLEL) begin
                for(i = 0; i < NUMBER_OF_COLOUR_PLANES; i=i+1) begin : xyz_creation
                    assign flags[(i*BPS)+BPS-1:i*BPS] = xyz_fixed;
                end
            end else begin
                assign flags[BPS-1:0] = xyz_fixed;
            end
            assign trs_word2 = (emb_state == S_TRS_WORD2);
            assign trs_word3 = (emb_state == S_TRS_WORD3);
            assign trs_xyz = (emb_state == S_TRS_XYZ);
            assign trs = vid_trs_int | trs_word2 | trs_word3 | trs_xyz;

            // TODO : because SDI has PinP interfaces, the trs_data will be DATA_WIDTH/PIXELS_IN_PARALLEL
            assign trs_data = (vid_trs_int) ? {DATA_WIDTH{1'b1}} :
                              (trs_word2)   ? {DATA_WIDTH{1'b0}} :
                              (trs_word3)   ? {DATA_WIDTH{1'b0}} :
                                              flags;

            assign v_count_plus_ap = v_count + ap_line;
            assign v_count_minus_ap = v_count - ap_line_end;
            assign vid_ln = vid_ln_reg;
            assign vid_trs = vid_trs_reg;

            assign vid_v = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_h = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_f = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_v_sync = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_h_sync = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_datavalid = {PIXELS_IN_PARALLEL{1'b0}};
        end else begin
            assign trs = 1'b0;
            assign trs_data = {DATA_WIDTH{1'bx}};
            assign vid_ln = 11'd0;
            assign vid_trs = 1'b0;

            assign vid_v = vid_v_gen;
            assign vid_h = vid_h_gen;
            assign vid_f = vid_f_gen;
            assign vid_v_sync = vid_v_sync_gen;
            assign vid_h_sync = vid_h_sync_gen;
            assign vid_datavalid = vid_datavalid_gen;
        end
    end else if (UHD_MODE == 1) begin
        // DP is sub-sampling a standard output stream onto the PinP 
        if(USE_EMBEDDED_SYNCS) begin
            // DP_OUTPUT_SUPPORT is only relevant for PinP which doesn't allow serial output 
            wire vid_trs_nxt;
            reg vid_trs_reg;
            reg [10:0] vid_ln_reg;
            reg [READ_LATENCY-1:0] vid_trs_pipeline;
            wire [9:0] xyz;
            //wire [DATA_WIDTH-1:0] flags;
            wire [PIXEL_WIDTH-1:0] flags;
            wire vid_trs_int;
            wire trs_word2;
            wire trs_word3;
            wire trs_xyz;
            reg [2:0] emb_state;
            wire [BPS-1:0] xyz_fixed;
            wire [15:0] v_count_plus_ap;
            wire [15:0] v_count_minus_ap;

            // Flag when either of the 2 TRS insertion points are encountered
            // This is assuming tha the locations all divide by PinP so that only h_count need be considered
            // For resolutions where TRS is going to move pixel lane, need to account for which lane TRS starts on.
            assign vid_trs_nxt = enable_synced_nxt && ((start_of_cp && h_count == 0) || (h_count == sav));
            // For DP, the lane TRS is output on can vary so calculate xyz for each lane.
            assign xyz = calc_xyz({vid_f_nxt, vid_v_nxt, vid_h_nxt});
            
            always @ (posedge rst or posedge clk) begin
                // Check PIXELS_IN_PARALLEL IS VALID
                DP_OUTPUT_PowerOf2_PinP : assert ( PIXELS_IN_PARALLEL == 1 || PIXELS_IN_PARALLEL == 2 ||
                                                   PIXELS_IN_PARALLEL == 4 || PIXELS_IN_PARALLEL == 8) else 
                    $error("PIXELS_IN_PARALLEL must be 1,2,4 or 8");

                if (rst) begin
                    vid_trs_pipeline <= {READ_LATENCY{1'b0}}; 
                    vid_trs_reg <= 1'b0;
                    vid_ln_reg <= 11'd0;

                    emb_state <= S_IDLE;
                end else begin
                    // Does stuff using the trs_pipeline need to know that multiple parts will be output simulataneously?
                    vid_trs_pipeline <= {vid_trs_pipeline[READ_LATENCY-2:0], vid_trs_nxt};
                    vid_trs_reg <= vid_trs_int;
                    vid_ln_reg <= (v_count <= ap_line_end) ? v_count_plus_ap[10:0] : v_count_minus_ap[10:0];

                    if(enable_synced_nxt) begin
                        case (emb_state)
                            S_IDLE: begin 
                                if(vid_trs_int) begin
                                    case (PIXELS_IN_PARALLEL)
                                        1 : begin
                                            emb_state <= S_TRS_WORD2;
                                        end
                                        2 : begin
                                            emb_state <= S_TRS_WORD3;
                                        end
                                        4,8 : begin
                                            emb_state <= S_IDLE;           // All 4 TRS codes output simulataneously
                                        end
                                    endcase
                                end
                            end
                            S_TRS_WORD2 : begin
                                assert (PIXELS_IN_PARALLEL == 1) else 
                                    $error("Can only eneter S_TRS_WORD2 when PIXELS_IN_PARALLEL == 1");
                                emb_state <= S_TRS_WORD3;
                            end
                            S_TRS_WORD3 : begin
                                assert (PIXELS_IN_PARALLEL == 1 || PIXELS_IN_PARALLEL == 2) else
                                    $error("Can only enter S_TRS_WORD3 when PIXELS_IN_PARALLEL = 1 or 2");
                                emb_state <= (PIXELS_IN_PARALLEL == 1) ? S_TRS_XYZ : S_IDLE;
                            end
                            S_TRS_XYZ   : begin
                                assert (PIXELS_IN_PARALLEL == 1) else 
                                    $error("Can only enter S_TRS_WORD2 when PIXELS_IN_PARALLEL == 1");
                                emb_state <= S_IDLE;
                            end
                        endcase
                    end
                end
            end
            assign vid_trs_int = vid_trs_pipeline[READ_LATENCY-1];

            if(BPS > 10)
                assign xyz_fixed = {{BPS-10{1'b0}}, xyz};
            else
                assign xyz_fixed = xyz[9:10-BPS];

            genvar i;
            if(COLOUR_PLANES_ARE_IN_PARALLEL) begin
                for(i = 0; i < NUMBER_OF_COLOUR_PLANES; i=i+1) begin : xyz_creation
                    assign flags[(i*BPS)+BPS-1:i*BPS] = xyz_fixed;
                end
            end else begin
                assign flags[BPS-1:0] = xyz_fixed;
            end
            
            assign trs_word2 = (emb_state == S_TRS_WORD2);
            assign trs_word3 = (emb_state == S_TRS_WORD3);
            assign trs_xyz = (emb_state == S_TRS_XYZ);

            case (PIXELS_IN_PARALLEL)
                1 : begin
                    assign trs_data = (vid_trs_int) ? {DATA_WIDTH{1'b1}} :
                                      (trs_word2)   ? {DATA_WIDTH{1'b0}} :
                                      (trs_word3)   ? {DATA_WIDTH{1'b0}} :
                                                      flags;
                    assign trs = vid_trs_int | trs_word2 | trs_word3 | trs_xyz;
                end
                2 : begin
                    assign trs_data = (vid_trs_int) ? {{PIXEL_WIDTH{1'b0}},{PIXEL_WIDTH{1'b1}}} :  // TRS 1+2
                                      (trs_word3)   ? {flags,{PIXEL_WIDTH{1'b0}}}               :  // TRS 3 + xyz
                                                      {DATA_WIDTH{1'b0}};                          // Default assignment
                    assign trs = {{trs_xyz | trs_word3},{trs_word2 | vid_trs_int}};
                  
                end
                4,8 : begin
                    assign trs_data = (vid_trs_int) ? {flags,{PIXEL_WIDTH{1'b0}},{PIXEL_WIDTH{1'b0}},{PIXEL_WIDTH{1'b1}}} :
                                                      {DATA_WIDTH{1'b0}};                        // Default assignment                                                      
                    assign trs = {trs_xyz, trs_word3, trs_word2, vid_trs_int};
                end
            endcase
            
            assign v_count_plus_ap = v_count + ap_line;
            assign v_count_minus_ap = v_count - ap_line_end;
            assign vid_ln = vid_ln_reg;
            assign vid_trs = vid_trs_reg;

            assign vid_v = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_h = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_f = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_v_sync = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_h_sync = {PIXELS_IN_PARALLEL{1'b0}};
            assign vid_datavalid = {PIXELS_IN_PARALLEL{1'b0}};
            
        end else begin
            assign trs = {PIXELS_IN_PARALLEL{1'b0}};
            assign trs_data = {DATA_WIDTH{1'bx}};
            assign vid_ln = 11'd0;
            assign vid_trs = 1'b0;

            assign vid_v = vid_v_gen;
            assign vid_h = vid_h_gen;
            assign vid_f = vid_f_gen;
            assign vid_v_sync = vid_v_sync_gen;
            assign vid_h_sync = vid_h_sync_gen;
            assign vid_datavalid = vid_datavalid_gen;
        end
        
    end
endgenerate

endmodule


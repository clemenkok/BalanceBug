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


module alt_vip_cvo_core(
    rst,
    
    // video
    vid_clk,
    vid_data,
    vid_datavalid,
    
    // optional video ports
    vid_v,
    vid_h,
    vid_f,
    vid_v_sync,
    vid_h_sync,
    vid_ln,
    vid_trs,
    vid_std,
    vid_mode_change,
    vid_sof,
    vid_sof_locked,
    vid_vcoclk_div,
    
    // IS
    is_clk,
    // Video Input Bridge <- -> Stream Marker Interface
    av_st_din_ready,                //is_ready,
    av_st_din_valid,                //is_valid,
    av_st_din_startofpacket,        //is_sop,
    av_st_din_endofpacket,          //is_eop,
    av_st_din_data,                 //is_data,

    // Scheduler -> stream marker
    cmd_mark_ready,
    cmd_mark_valid,
    cmd_mark_startofpacket,
    cmd_mark_endofpacket,
    cmd_mark_data,

    // Control-Slave <- Scheduler -> Mode-Banks Interface
    // From Scheduler
    cmd_mode_banks_ready,
    cmd_mode_banks_valid,
    cmd_mode_banks_data,
    cmd_mode_banks_startofpacket,
    cmd_mode_banks_endofpacket,

    // To scheduler
    resp_mode_banks_ready,
    resp_mode_banks_valid,
    resp_mode_banks_data,
    resp_mode_banks_startofpacket,
    resp_mode_banks_endofpacket,

    // Sync
    sof,
    sof_locked,
    
    // Interrupt
    status_update_int,
    
    // Error
    underflow);

import alt_vip_common_pkg::*;

parameter BPS = 10;
parameter NUMBER_OF_COLOUR_PLANES = 2;
parameter COLOUR_PLANES_ARE_IN_PARALLEL = 1;
parameter FIFO_DEPTH = 1920;
parameter USE_EMBEDDED_SYNCS = 1;
parameter CLOCKS_ARE_SAME = 0;
parameter USE_CONTROL = 1;
parameter Y_C_SWAP = 1;
parameter NO_OF_MODES = 3;
parameter ACCEPT_COLOURS_IN_SEQ = 0;
parameter THRESHOLD = 0;
parameter STD_WIDTH = 3;
parameter GENERATE_SYNC = 1;

parameter INTERLACED = 0;
parameter AP_LINE = 42;

// horizontal parameters in pixels
parameter H_ACTIVE_PIXELS = 1920;
parameter H_SYNC_LENGTH = 112;
parameter H_FRONT_PORCH = 48;
parameter H_BACK_PORCH = 120;
parameter H_OFFSET = 0;
parameter H_BLANK = 280;

// vertical parameters in lines
parameter V_ACTIVE_LINES = 538;
parameter V_SYNC_LENGTH = 3;
parameter V_FRONT_PORCH = 4;
parameter V_BACK_PORCH = 38;
parameter V_OFFSET = 0;
parameter V_BLANK = 45;

parameter F_RISING_EDGE = 564;
parameter F_FALLING_EDGE = 18;
parameter FIELD0_V_RISING_EDGE = 561;
parameter FIELD0_V_SYNC_LENGTH = 3;
parameter FIELD0_V_FRONT_PORCH = 4;
parameter FIELD0_V_BACK_PORCH = 38;
parameter FIELD0_V_BLANK = 45;
parameter ANC_LINE = 10;
parameter FIELD0_ANC_LINE = 562;

parameter PIXELS_IN_PARALLEL = 1;

parameter UHD_MODE = 1; // 1 = DISPLAY_PORT, 0 = SDI

// Standard Avalon-ST message widths. Do not change. Included for completeness :	
parameter  SRC_WIDTH                              = 8;
parameter  DST_WIDTH                              = 8;
parameter  CONTEXT_WIDTH                          = 8;
parameter  TASK_WIDTH                             = 8;

// Controls the width of the input AvSt Video empty signal
localparam EMPTY_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? alt_clogb2_pure((NUMBER_OF_COLOUR_PLANES * PIXELS_IN_PARALLEL) - NUMBER_OF_COLOUR_PLANES) : 1;
// Controls the width of the output AvSt Message start_of_line/packet and end_of_line/packet signals
localparam SOP_EMPTY_WIDTH = alt_clogb2_pure(PIXELS_IN_PARALLEL);
localparam EOP_EMPTY_WIDTH = alt_clogb2_pure(PIXELS_IN_PARALLEL);

localparam ELEMENTS_PER_BEAT = (COLOUR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOUR_PLANES * PIXELS_IN_PARALLEL : 1;
localparam BITS_PER_ELEMENT  = (COLOUR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOUR_PLANES * BPS : BPS;
localparam AV_ST_DATA_CHANNEL_WIDTH = SRC_WIDTH + DST_WIDTH + CONTEXT_WIDTH + TASK_WIDTH + SOP_EMPTY_WIDTH;
localparam DATA_WIDTH = BPS * ELEMENTS_PER_BEAT;
localparam COLOURS_IN_SEQUENCE = (COLOUR_PLANES_ARE_IN_PARALLEL) ? 0 : NUMBER_OF_COLOUR_PLANES - 1;

localparam AV_ST_DATA_DATA_WIDTH  = AV_ST_DATA_CHANNEL_WIDTH + EOP_EMPTY_WIDTH + DATA_WIDTH;

// Avalon-ST messages parameters
localparam AV_ST_CMD_BITS_PER_SYMBOL              = 8;
localparam AV_ST_CMD_SYMBOLS_PER_BEAT             = 4;

// Avalon-ST messages parameters (command ports)
localparam AV_ST_CMD_CHANNEL_WIDTH                = SRC_WIDTH + DST_WIDTH + CONTEXT_WIDTH + TASK_WIDTH;
localparam AV_ST_CMD_DATA_WIDTH                   = AV_ST_CMD_SYMBOLS_PER_BEAT * AV_ST_CMD_BITS_PER_SYMBOL;
localparam AV_ST_CMD_TOTAL_WIDTH                  = AV_ST_CMD_CHANNEL_WIDTH + AV_ST_CMD_DATA_WIDTH;
//localparam DATA_WIDTH                             = AV_ST_CMD_SYMBOLS_PER_BEAT * AV_ST_CMD_BITS_PER_SYMBOL;

// Avalon-ST messages parameters (response ports) (Scheduler defines response ports as same width as cmd ports)
localparam AV_ST_RESP_TOTAL_WIDTH = AV_ST_CMD_TOTAL_WIDTH;

// Avalon-ST messages parameters (data ports)
//localparam AV_ST_DATA_BITS_PER_SYMBOL             = 8;
//localparam AV_ST_DATA_SYMBOLS_PER_BEAT            = 4;
//localparam AV_ST_DATA_DATA_WIDTH                  = AV_ST_DATA_SYMBOLS_PER_BEAT * AV_ST_DATA_BITS_PER_SYMBOL;
localparam AV_ST_DATA_TOTAL_WIDTH                 = AV_ST_DATA_CHANNEL_WIDTH + AV_ST_DATA_DATA_WIDTH;


localparam CONVERT_SEQ_TO_PAR = COLOUR_PLANES_ARE_IN_PARALLEL == 1 && ACCEPT_COLOURS_IN_SEQ != 0 && NUMBER_OF_COLOUR_PLANES > 1;
localparam COLOUR_PLANES_IN_SEQUENCE = (COLOUR_PLANES_ARE_IN_PARALLEL && !CONVERT_SEQ_TO_PAR) ? 1 : NUMBER_OF_COLOUR_PLANES;
//localparam DATA_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? BPS * NUMBER_OF_COLOUR_PLANES * PIXELS_IN_PARALLEL : BPS;
localparam PIXEL_WIDTH = (COLOUR_PLANES_ARE_IN_PARALLEL) ? BPS * NUMBER_OF_COLOUR_PLANES : BPS;
localparam NUMBER_OF_COLOUR_PLANES_IN_PARALLEL = (COLOUR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOUR_PLANES : 1;
localparam READ_LATENCY = 2;
localparam TRS_PARALLEL = 4;
localparam TRS_SEQUENCE = 4 / NUMBER_OF_COLOUR_PLANES;
localparam TRS = (COLOUR_PLANES_ARE_IN_PARALLEL) ? TRS_PARALLEL : TRS_SEQUENCE;

localparam H_BLANK_INT = (USE_EMBEDDED_SYNCS) ? H_BLANK : H_FRONT_PORCH + H_SYNC_LENGTH + H_BACK_PORCH;
localparam V_BLANK_INT = (USE_EMBEDDED_SYNCS) ? V_BLANK : V_FRONT_PORCH + V_SYNC_LENGTH + V_BACK_PORCH;
localparam FIELD0_V_BLANK_INT = (USE_EMBEDDED_SYNCS) ? FIELD0_V_BLANK : FIELD0_V_FRONT_PORCH + FIELD0_V_SYNC_LENGTH + FIELD0_V_BACK_PORCH;
localparam FIELD0_V_RISING_EDGE_INT = FIELD0_V_RISING_EDGE - AP_LINE;

localparam H_TOTAL = H_ACTIVE_PIXELS + H_BLANK_INT; // line length incl. blanking
localparam V_TOTAL = V_ACTIVE_LINES + ((INTERLACED) ? FIELD0_V_BLANK_INT : 0) + V_BLANK_INT; // number of lines incl. blanking
localparam LOG2_H_TOTAL = alt_clogb2(H_TOTAL);
localparam LOG2_V_TOTAL = alt_clogb2(V_TOTAL);
localparam LOG2_COLOUR_PLANES_IN_SEQUENCE = alt_clogb2(COLOUR_PLANES_IN_SEQUENCE);
localparam NO_OF_MODES_INT = (USE_CONTROL) ? NO_OF_MODES : 1;
localparam LOG2_NO_OF_MODES = alt_clogb2(NO_OF_MODES_INT);
localparam COLOUR_PLANES_IN_SEQUENCE_FIFO = (COLOUR_PLANES_ARE_IN_PARALLEL) ? 1 : NUMBER_OF_COLOUR_PLANES;
localparam FIFO_DEPTH_INT = (FIFO_DEPTH * COLOUR_PLANES_IN_SEQUENCE_FIFO) + 4;
localparam THRESHOLD_INT = (THRESHOLD * COLOUR_PLANES_IN_SEQUENCE_FIFO);
localparam USED_WORDS_WIDTH = alt_clogb2(FIFO_DEPTH_INT);

localparam F_RISING_EDGE_INT = F_RISING_EDGE - AP_LINE;
localparam F_FALLING_EDGE_INT = V_TOTAL - (AP_LINE - F_RISING_EDGE);

localparam F0_LINE_COUNT = (INTERLACED) ? FIELD0_V_RISING_EDGE_INT : V_ACTIVE_LINES;
localparam F1_LINE_COUNT = V_ACTIVE_LINES - F0_LINE_COUNT;

localparam BLANKING_SER1 = (BPS < 10) ? 128 : 512;
localparam BLANKING_SER2 = (BPS < 10) ? 16 : 64;
localparam BLANKING_PAR = 66048; // 20'h10200

input rst;

// video
input  vid_clk;
output [DATA_WIDTH-1:0] vid_data;                 // Would this be better as [PIXELS_IN_PARALLEL][PIXEL_WIDTH] vid_data?
output [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid;

// optional video ports
output [PIXELS_IN_PARALLEL - 1 : 0]vid_v;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_h;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_f;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_v_sync;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_h_sync;
output [(PIXELS_IN_PARALLEL*11)-1:0] vid_ln;
output [PIXELS_IN_PARALLEL - 1 : 0]vid_trs;
output reg [STD_WIDTH-1:0]             vid_std;
output                             vid_mode_change;
output                             vid_sof;
output                             vid_sof_locked;
output                             vid_vcoclk_div;

// IS
input is_clk;

input  wire                               cmd_mark_valid;
output wire                               cmd_mark_ready;
input  wire [AV_ST_CMD_TOTAL_WIDTH - 1:0] cmd_mark_data;
input  wire                               cmd_mark_startofpacket;
input  wire                               cmd_mark_endofpacket;

output wire                               av_st_din_ready;
input  wire                               av_st_din_valid;
input  wire                               av_st_din_startofpacket;
input  wire                               av_st_din_endofpacket;
input  wire [AV_ST_DATA_TOTAL_WIDTH - 1:0] av_st_din_data;

// From Scheduler
output wire cmd_mode_banks_ready;
input  wire cmd_mode_banks_valid;
input  wire [AV_ST_CMD_TOTAL_WIDTH - 1:0]  cmd_mode_banks_data;
input  wire cmd_mode_banks_startofpacket;
input  wire cmd_mode_banks_endofpacket;

// From control
input  wire resp_mode_banks_ready;
output wire resp_mode_banks_valid;
output wire [AV_ST_RESP_TOTAL_WIDTH - 1:0]  resp_mode_banks_data;
output wire resp_mode_banks_startofpacket;
output wire resp_mode_banks_endofpacket;

// Sync
input sof;
input sof_locked;

// Interrupt
output wire status_update_int;

// Error
output underflow;

reg [DATA_WIDTH-1:0] vid_data;

// optional video ports
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_f;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_v_sync;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_h_sync;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_trs;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid;
wire                             vid_sof;
wire                             vid_sof_locked;

wire vid_f_nxt;
wire vid_v_nxt;

wire [READ_LATENCY-1:0] vid_v_pipeline;
//wire [READ_LATENCY-1:0] vid_v_sync_pipeline;
wire [PIXELS_IN_PARALLEL - 1 : 0]vid_datavalid_pipeline;  // pipeline implemented in cvo_sync_conditioner
wire [PIXELS_IN_PARALLEL - 1 : 0]anc_valid_word_pipeline; // pipeline implemented in cvo_sync_conditioner

wire rdreq;
wire rdreq_pre_swap;
//wire wrreq;
reg  is_ready_reg;
wire is_valid_qualified;
wire [DATA_WIDTH-1:0] q_data;
wire [DATA_WIDTH-1:0] q_post_swap;
wire empty;
wire [USED_WORDS_WIDTH-1:0] usedw;
wire [USED_WORDS_WIDTH-1:0] rdusedw;
wire enable;
wire [15:0] h_count;
wire [15:0] v_count;
wire v_enable;
//wire request_data_nxt;
reg request_data;
reg request_data_valid;
wire [PIXELS_IN_PARALLEL - 1 : 0]trs;
wire [DATA_WIDTH-1:0] trs_data;
wire ap;
wire [DATA_WIDTH-1:0] vid_data_pre_ln;
wire [DATA_WIDTH:0] q;
wire [DATA_WIDTH:0] writedata;
wire sop;
reg sop_reg;

wire sof_cvi_sync1;
wire sof_cvi_locked_sync1;
wire enable_sync1;
wire enable_synced;
wire enable_threshold;
wire threshold_reached;
reg reset_counters;
wire enable_synced_nxt;
wire ap_synched;

wire underflow_nxt;
wire anc_underflow_nxt;
reg underflow_reg;

localparam [3:0] IDLE            = 4'd0;
localparam [3:0] FIND_SOP        = 4'd1;
localparam [3:0] WIDTH_3         = 4'd2;
localparam [3:0] WIDTH_2         = 4'd3;
localparam [3:0] WIDTH_1         = 4'd4;
localparam [3:0] WIDTH_0         = 4'd5;
localparam [3:0] DUMMY_STATE_0   = 4'd6;
localparam [3:0] DUMMY_STATE_1   = 4'd7;
localparam [3:0] FINISH_FRAME    = 4'd8;

localparam [3:0] HEIGHT_0        = 4'd9;
localparam [3:0] INTERLACING     = 4'd10;
localparam [3:0] FIND_MODE       = 4'd11;
localparam [3:0] SYNCHED         = 4'd12;
localparam [3:0] WAIT_FOR_SYNCH  = 4'd13;
localparam [3:0] WAIT_FOR_ANC    = 4'd14;
localparam [3:0] INSERT_ANC      = 4'd15;

localparam       H_WORD_LENGTH   = 15;
localparam       V_WORD_LENGTH   = 14;
wire [3:0] state_next, state;
reg [3:0] interlaced_field;
reg field_prediction;
wire field_prediction_nxt;
wire field_prediction_sync;
reg start_of_ap;
wire start_of_ap_nxt;

//wire clear_underflow;
wire clear_underflow_sticky;
wire clear_underflow_sticky_sync1;

wire vid_clk_int;
wire rst_vid_clk;

wire [PIXELS_IN_PARALLEL-1:0] blank_lane;
wire [DATA_WIDTH-1:0] blanking_value;
wire start_of_cp;
wire start_of_frame, vid_datavalid_nxt;
wire anc_datavalid_nxt;

wire [PIXELS_IN_PARALLEL-1:0]p_in_p_anc_datavalid_nxt;
wire [PIXELS_IN_PARALLEL-1:0]p_in_p_vid_datavalid_nxt;

wire find_mode_nxt, find_mode_nxt_sync;
wire finish_frame_nxt;
wire wait_for_anc_nxt;
wire mode_change, mode_change_resync;
wire dirty_modes;
wire vid_mode_change_ack;

wire [1:0] genlock_enable;
wire [1:0] genlock_enable_sync1;
wire genlocked;
wire genlocked_sync1;
wire sync_lines;
wire sync_samples;
wire remove_repeatn;
wire [15:0] sync_compare_h_reset;
wire [15:0] sync_compare_v_reset;

wire interlaced;
wire serial_output;
wire [15:0] h_total_minus_one, h_total_minus_two;
wire [15:0] h_total;
wire [15:0] h_total_check;
wire [15:0] v_total_minus_one;
wire [15:0] v_total;
wire [15:0] ap_line;
wire [15:0] ap_line_end;
wire [15:0] h_blank;
wire [15:0] sav;
wire [15:0] h_sync_start;
wire [15:0] h_sync_end;
wire [15:0] f2_v_start;
wire [15:0] f1_v_start;
wire [15:0] f1_v_end;
wire [15:0] f2_v_sync_start;
wire [15:0] f2_v_sync_end;
wire [15:0] f1_v_sync_start;
wire [15:0] f1_v_sync_end;
wire [15:0] f_rising_edge;
wire [15:0] f_falling_edge;
wire [15:0] f1_v_end_nxt;
wire [13:0] sof_sample;
wire [12:0] sof_line;
wire [1:0] sof_subsample;
wire [13:0] vcoclk_divider_value;
wire [15:0] f2_anc_v_start;
wire [15:0] f1_anc_v_start;
wire        h_sync_polarity;
wire        v_sync_polarity;

// new for 4k
bit h_enable_step;
bit [15:0] h_step_size; 
bit [15:0] h_step_size_x3; 
bit v_enable_step;
bit [15:0] v_step_size; 
bit frame_complete;
const bit [LOG2_COLOUR_PLANES_IN_SEQUENCE-1:0] serial_cp_frame_complete_point = NUMBER_OF_COLOUR_PLANES - 3;
bit h_frame_complete_point;

// Stream Marker internal interface
wire is_sop;
wire [DATA_WIDTH - 1 :0] is_data;
wire is_valid;
wire is_ready;


generate
     if(CLOCKS_ARE_SAME) begin
         assign rst_vid_clk = rst;
         assign vid_clk_int = is_clk;
     end else begin
         reg rst_vid_clk_reg;
         reg rst_vid_clk_reg2;
         
         always @ (posedge rst or posedge vid_clk_int) begin
             if(rst) begin
                rst_vid_clk_reg <= 1'b1;
                rst_vid_clk_reg2 <= 1'b1;
             end else begin
                rst_vid_clk_reg <= 1'b0;
                rst_vid_clk_reg2 <= rst_vid_clk_reg;
             end
         end
         assign rst_vid_clk = rst_vid_clk_reg2;
         assign vid_clk_int = vid_clk;
     end
endgenerate

wire enable_resync1;
wire underflow_sticky_sync1;

alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) enable_resync_sync(
    .rst(rst),
    .sync_clock(is_clk),
    .data_in(enable_synced),
    .data_out(enable_resync1));
        
alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) underflow_sync(
    .rst(rst),
    .sync_clock(is_clk),
    .data_in(underflow),
    .data_out(underflow_sticky_sync1));

alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) fp_sync(
    .rst(rst),
    .sync_clock(is_clk),
    .data_in(field_prediction_nxt),
    .data_out(field_prediction_sync));
    
// resync mode_change to the vid_clk to indicate to the control block when it is safe to change the mode registers
// saves having to re-synchronise the entire mode_bank set of outputs    
alt_vip_common_trigger_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) mode_change_trigger_sync(
    .input_rst(rst),
    .input_clock(is_clk),
    .rst(rst_vid_clk),
    .sync_clock(vid_clk_int),
    
    .trigger_in(mode_change),
    .ack_in(1'b0),
    .trigger_out(mode_change_resync));

alt_vip_common_trigger_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) mode_change_ack_trigger_sync(
    .input_rst(rst_vid_clk),
    .input_clock(vid_clk_int),
    .rst(rst),
    .sync_clock(is_clk),
    
    .trigger_in(mode_change_resync),
    .ack_in(1'b0),
    .trigger_out(vid_mode_change_ack));

// TODO : This re-sync guarantees that mode_banks are held long enough to be safely registered in the vid_clk domain.
// Before being read in the is_clk domain, shouldn't it be re-synchronised otherwise it's timing relative to is_clk can't be guaranteed.
    
alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) genlocked_sync(
    .rst(rst),
    .sync_clock(is_clk),
    .data_in(genlocked),
    .data_out(genlocked_sync1));

// Stream marker receives comands from scheduler to insert a marker on the FIFO to demark Ancillary and Video packets
// It is then set to stream av-st-data through to the FIFO
alt_vip_cvo_stream_marker stream_marker(
    .clk(is_clk),
    .reset(rst),
    
    // Avalon-ST Event Cmd 0 (From Scheduler)
    .cmd_mark_ready(cmd_mark_ready),
    .cmd_mark_valid(cmd_mark_valid),
    .cmd_mark_startofpacket(cmd_mark_startofpacket),
    .cmd_mark_endofpacket(cmd_mark_endofpacket),
    .cmd_mark_data(cmd_mark_data),             

    // Avalon-ST Data (From VIB)
    .av_st_din_ready(av_st_din_ready),
    .av_st_din_valid(av_st_din_valid),
    .av_st_din_startofpacket(av_st_din_startofpacket),
    .av_st_din_endofpacket(av_st_din_endofpacket),
    .av_st_din_data(av_st_din_data),
       

    // Interface to the FIFO
    .sop(is_sop),
    .data(is_data),
    .data_valid(is_valid),
    .data_rdy(is_ready)
    ); 
defparam stream_marker.SRC_WIDTH = SRC_WIDTH,
    stream_marker.DST_WIDTH = DST_WIDTH,
    stream_marker.CONTEXT_WIDTH = CONTEXT_WIDTH,
    stream_marker.TASK_WIDTH = TASK_WIDTH,
    stream_marker.PIXELS_IN_PARALLEL = PIXELS_IN_PARALLEL,
    stream_marker.BITS_PER_SYMBOL = BPS,
    stream_marker.COLOR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
    stream_marker.NUMBER_OF_COLOR_PLANES = NUMBER_OF_COLOUR_PLANES;


alt_vip_cvo_mode_banks mode_banks(
    .rst(rst),
    .clk(is_clk),
    
    .vid_clk(vid_clk_int),
    .vid_rst(rst_vid_clk),
    .mode_change_resync(mode_change_resync),

    .cmd_mode_banks_ready(cmd_mode_banks_ready),
    .cmd_mode_banks_valid(cmd_mode_banks_valid),
    .cmd_mode_banks_data(cmd_mode_banks_data),
    .cmd_mode_banks_startofpacket(cmd_mode_banks_startofpacket),
    .cmd_mode_banks_endofpacket(cmd_mode_banks_endofpacket),

    .resp_mode_banks_ready(resp_mode_banks_ready),
    .resp_mode_banks_valid(resp_mode_banks_valid),
    .resp_mode_banks_data(resp_mode_banks_data),
    .resp_mode_banks_startofpacket(resp_mode_banks_startofpacket),
    .resp_mode_banks_endofpacket(resp_mode_banks_endofpacket),

    .underflow(underflow_sticky_sync1),
    .clear_underflow(clear_underflow_sticky),
    // From control
    .find_mode_nxt(find_mode_nxt_sync),
    
    // To control
    .dirty_modes(dirty_modes),		
    .mode_change(mode_change),	
    .enable(enable),	
    .genlock_enable(genlock_enable),	
    
    // To video output
    .vid_std(vid_std),
    .vid_mode_change(vid_mode_change),
    .interlaced_field(interlaced_field),
    .genlocked(genlocked_sync1),
    .enable_resync(enable_resync1),
    // From video output
    .vid_mode_change_ack(vid_mode_change_ack),
    .field_prediction(field_prediction_sync),
    
    // To video output
    .interlaced(interlaced),
    .serial_output(serial_output),
    .h_total_minus_one(h_total_minus_one),
    .v_total_minus_one(v_total_minus_one),
    .ap_line(ap_line),
    .ap_line_end(ap_line_end),
    .h_blank(h_blank),
    .sav(sav),
    .h_sync_start(h_sync_start),
    .h_sync_end(h_sync_end),
    .f2_v_start(f2_v_start),
    .f1_v_start(f1_v_start),
    .f1_v_end(f1_v_end),
    .f2_v_sync_start(f2_v_sync_start),
    .f2_v_sync_end(f2_v_sync_end),
    .f1_v_sync_start(f1_v_sync_start),
    .f1_v_sync_end(f1_v_sync_end),
    .f_rising_edge(f_rising_edge),
    .f_falling_edge(f_falling_edge),
    .f1_v_end_nxt(f1_v_end_nxt),
    .sof_sample(sof_sample),
    .sof_line(sof_line),
    .sof_subsample(sof_subsample),
    .vcoclk_divider_value(vcoclk_divider_value),
    .f2_anc_v_start(f2_anc_v_start),
    .f1_anc_v_start(f1_anc_v_start),
    .h_sync_polarity(h_sync_polarity),
    .v_sync_polarity(v_sync_polarity),
    .status_update_int(status_update_int)
);

defparam mode_banks.USE_CONTROL = USE_CONTROL,
         mode_banks.NO_OF_MODES_INT = NO_OF_MODES_INT,
         mode_banks.LOG2_NO_OF_MODES = LOG2_NO_OF_MODES,
         mode_banks.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
         mode_banks.TRS = TRS,
         mode_banks.INTERLACED = INTERLACED,
         mode_banks.H_ACTIVE_PIXELS = H_ACTIVE_PIXELS,
         mode_banks.F0_LINE_COUNT = F0_LINE_COUNT,
         mode_banks.F1_LINE_COUNT = F1_LINE_COUNT,
         mode_banks.H_FRONT_PORCH = H_FRONT_PORCH,
         mode_banks.H_SYNC_LENGTH = H_SYNC_LENGTH,
         mode_banks.H_BLANK_INT = H_BLANK_INT,
         mode_banks.V_FRONT_PORCH = V_FRONT_PORCH,
         mode_banks.V_SYNC_LENGTH = V_SYNC_LENGTH,
         mode_banks.V_BLANK_INT = V_BLANK_INT,
         mode_banks.FIELD0_V_FRONT_PORCH = FIELD0_V_FRONT_PORCH,
         mode_banks.FIELD0_V_SYNC_LENGTH = FIELD0_V_SYNC_LENGTH,
         mode_banks.FIELD0_V_BLANK_INT = FIELD0_V_BLANK_INT,
         mode_banks.AP_LINE = AP_LINE,
         mode_banks.FIELD0_V_RISING_EDGE = FIELD0_V_RISING_EDGE,
         mode_banks.F_RISING_EDGE = F_RISING_EDGE,
         mode_banks.F_FALLING_EDGE = F_FALLING_EDGE,
         mode_banks.CONVERT_SEQ_TO_PAR = CONVERT_SEQ_TO_PAR,
         mode_banks.TRS_SEQUENCE = TRS_SEQUENCE,
         mode_banks.TRS_PARALLEL = TRS_PARALLEL,
         mode_banks.STD_WIDTH = STD_WIDTH,
         mode_banks.ANC_LINE = ANC_LINE,
         mode_banks.FIELD0_ANC_LINE = FIELD0_ANC_LINE,
         mode_banks.SRC_WIDTH = SRC_WIDTH,
         mode_banks.DST_WIDTH = DST_WIDTH,
         mode_banks.CONTEXT_WIDTH = CONTEXT_WIDTH,
         mode_banks.TASK_WIDTH = TASK_WIDTH,
         mode_banks.CLOCKS_ARE_SAME = CLOCKS_ARE_SAME;


//assign av_write_ack = mode_write; // TODO : mode_banks is being moved from vid_clk to is_clk domain. Check mode_banks/control for logic that can be removed as a result

wire enable_vcount;
wire [LOG2_COLOUR_PLANES_IN_SEQUENCE-1:0] cp_ticks;
wire repeat_reset_point;
wire remove_reset_point;
wire repeat_lines_reset;
wire remove_lines_reset;
wire repeat_samples_reset;
wire remove_samples_reset;
wire lines_reset;
wire samples_reset;
wire clear_enable;
wire restart_sample_count;
//wire restart_lines_count;
wire [15:0] v_reset_value;
wire restart_line_count;

localparam integer v_offset_const = V_OFFSET;
localparam integer h_offset_const = H_OFFSET;
assign repeat_reset_point = !remove_repeatn && h_count == sync_compare_h_reset && v_count == sync_compare_v_reset;
assign remove_reset_point = remove_repeatn && h_count == 16'd0 && v_count == 16'd0;

assign repeat_lines_reset = sync_lines & repeat_reset_point;
assign remove_lines_reset = sync_lines & remove_reset_point;
assign repeat_samples_reset = sync_samples & repeat_reset_point;
assign remove_samples_reset = sync_samples & remove_reset_point;

assign lines_reset = (repeat_lines_reset || remove_lines_reset) && ((cp_ticks == NUMBER_OF_COLOUR_PLANES - 1) || ~serial_output);
assign samples_reset = (repeat_samples_reset || remove_samples_reset) && ((cp_ticks == NUMBER_OF_COLOUR_PLANES - 1) || ~serial_output);

assign clear_enable = mode_change_resync | reset_counters;
assign restart_line_count = clear_enable | lines_reset;
assign restart_sample_count = clear_enable | samples_reset;

assign v_reset_value = (genlock_enable_sync1[0]) ? (remove_repeatn) ? sync_compare_v_reset : v_offset_const[15:0] :
                                                   (interlaced_field[3] & field_prediction) ? f1_v_end_nxt : v_offset_const[15:0];

//////////////////////////////////////////////////////////////
//
// Horizontal and vertical counters track position of the frame being output
// ticks are used when colour-space samples are output serially
// steps are used for pixels in parallel where each clock tick outputs multiple pixels
//
// DP1.2 output 4 pixels from the same row so h-step = PIXELS_IN_PARALLEL, v-step = 1
//
// SDI4k outputs 2 pixels from 2 lines simulataneously so h-step - PIXELS_IN_PARALLEL/2 as does v-step
//
//////////////////////////////////////////////////////////////
// TODO : when in SDI output mode, v-step-size = 2, step enabled
//        when in DP output mode, h-step-size = 4, step enabled

assign h_enable_step = 1'b1;
//assign h_step_size   = {{H_WORD_LENGTH-1{1'b0}},1'b1};
assign v_enable_step = 1'b0;
assign v_step_size   = {16'b0};

assign h_step_size = (UHD_MODE) ? PIXELS_IN_PARALLEL : 1;
assign h_step_size_x3 = h_step_size + {h_step_size[14:0],1'b0};
assign h_total_minus_two = h_total_minus_one - 1;
assign h_total = h_total_minus_one + 1;
assign v_total = v_total_minus_one + 1;

always @ * begin
    // Want to flag frame completion to mode_registers 3 clock cycles before transition to allow for resync of mode-change
    // This point varies according to how the pixels and colour planes are being counted 
    if (serial_output) begin
       if (COLOUR_PLANES_IN_SEQUENCE == 2) begin
           h_frame_complete_point = (h_count == h_total_minus_two && cp_ticks == {{LOG2_COLOUR_PLANES_IN_SEQUENCE-1{1'b0}},1'b1});
       end else begin
          h_frame_complete_point = (h_count == h_total_minus_one && cp_ticks == serial_cp_frame_complete_point);
       end
       
    end else begin
       h_frame_complete_point = (h_total_minus_one - h_step_size_x3 <= h_count);
    end
end

alt_vip_common_generic_step_count #(
    .WORD_LENGTH (16),
    //.MAX_COUNT (2200),
    .RESET_VALUE (H_OFFSET),
    .TICKS_WORD_LENGTH (LOG2_COLOUR_PLANES_IN_SEQUENCE),
    .TICKS_PER_COUNT (COLOUR_PLANES_IN_SEQUENCE)
    //.COUNT_STEP_SIZE (4)
) h_counter (
    .clk           (vid_clk_int),
    .reset_n       (~rst_vid_clk),
    .enable        (enable_synced_nxt),
    .enable_ticks  (serial_output),
    .enable_step   (h_enable_step),
    .step_size     (h_step_size), 
    .max_count     (h_total),
    .count         (h_count),
    .restart_count (restart_sample_count),
    .reset_value   ((remove_repeatn) ? sync_compare_h_reset : H_OFFSET),
    .enable_count  (enable_vcount),
    .start_count   (start_of_cp),
    .cp_ticks      (cp_ticks)
);

// count lines per frame
// Variable step is provided for if SDI output style is changed. Currently requirement is that 
// SDI parameters divide by PinP so a single set of syncs can be generated and each pixel output
// to a seperate SDI core using the same syncs.
alt_vip_common_generic_step_count #(
    .WORD_LENGTH(16),
    //.MAX_COUNT (1280),
    .RESET_VALUE(V_OFFSET)
) v_counter (
    .clk           (vid_clk_int),
    .reset_n       (~rst_vid_clk),
    .enable        (v_enable),
    .enable_step   (v_enable_step),
    .step_size     (v_step_size), 
    .max_count     (v_total),
    .count         (v_count),
    .restart_count (restart_line_count),
    .reset_value   (v_reset_value)
);

assign start_of_frame = (start_of_cp && h_count == H_OFFSET) && ((interlaced && v_count == f1_v_end) || v_count == V_OFFSET);

// Frame Complete changes state which can trigger a mode_change from mode_banks
// the mode_change signal takes 2 vid_clk cycles to resync so flag frame complete two cycles early
assign frame_complete = (v_count == v_total_minus_one) && h_frame_complete_point; //(h_total_minus_one - h_step_size_x3 <= h_count);
// TODO : the h_count checks need modifying for non-modulo values. For example with a PinP=4, de_rising = 17 then
// when h_count = 16, then bits 17,18 and 19 are also being output
// relevant sync signals need generating and outputting on correct lanes.
assign h_total_check = (UHD_MODE) ? h_total_minus_one - (PIXELS_IN_PARALLEL - 1) : h_total_minus_one;
assign v_enable = enable_synced_nxt && enable_vcount && h_count >= h_total_check;
assign ap = h_count >= h_blank && ~vid_v_nxt;



// The sticky underflow output is set when the video interface attempts to 
// read data when the fifo is empty. 
assign underflow = underflow_reg;
assign underflow_nxt = vid_datavalid_nxt & empty;
assign anc_underflow_nxt = anc_datavalid_nxt & empty;

always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if (rst_vid_clk) begin
        underflow_reg <= 1'b0;
    end else begin
        underflow_reg <= (underflow_nxt | underflow_reg) & ~clear_underflow_sticky_sync1;
    end
end

alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) clear_underflow_sticky_sync(
    .rst(rst_vid_clk),
    .sync_clock(vid_clk_int),
    .data_in(clear_underflow_sticky),
    .data_out(clear_underflow_sticky_sync1));


assign threshold_reached = rdusedw >= THRESHOLD_INT;
assign enable_synced_nxt = (start_of_frame) ? enable_threshold : enable_synced;

// Enable is now registered in mode_banks so doesn't require resync
alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) enable_sync(
    .rst(rst_vid_clk),
    .sync_clock(vid_clk_int),
    .data_in(enable),
    .data_out(enable_sync1));
  
    
// Genlock is now registered in mode_bnaks so doesn't require resync
alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) genlock_enable_sync(
    .rst(rst_vid_clk),
    .sync_clock(vid_clk_int),
    .data_in(genlock_enable),
    .data_out(genlock_enable_sync1));

    
// Insert a constant blanking value during the blanking period
// sop is fed directly in for ancillary packets as we don't know their size so
// they could end at any time
// TODO : each lane will need to be individually assigned for DP when frame parameters aren't modulo4
generate
    genvar i;
    for(i = 0; i < PIXELS_IN_PARALLEL; i=i+1) begin : pixel_lane_assignments
        assign blank_lane[i] = (~vid_datavalid_pipeline[i] & ~(anc_valid_word_pipeline[i] & ~(sop | sop_reg)));
        assign vid_data_pre_ln[((i+1)*PIXEL_WIDTH)-1:i*PIXEL_WIDTH] = (trs[i])        ? trs_data[((i+1)*PIXEL_WIDTH)-1:i*PIXEL_WIDTH]       : 
                                                                      (blank_lane[i]) ? blanking_value                                      : 
                                                                                        q_post_swap[((i+1)*PIXEL_WIDTH)-1:i*PIXEL_WIDTH];
    end
endgenerate

always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if (rst_vid_clk)
        vid_data <= {DATA_WIDTH{1'b0}};
    else
        vid_data <= vid_data_pre_ln;
end

generate
    if(CONVERT_SEQ_TO_PAR) begin
        reg stall_req;
        reg [LOG2_COLOUR_PLANES_IN_SEQUENCE-1:0] cp_ticks_pipeline[READ_LATENCY-1:0];
        wire [LOG2_COLOUR_PLANES_IN_SEQUENCE-1:0] cp_ticks_delayed;
        
        wire [BPS-1:0] q_mux[NUMBER_OF_COLOUR_PLANES-1:0];
        genvar i;
        for(i = 0; i < NUMBER_OF_COLOUR_PLANES; i=i+1) begin : q_mux_generation
            assign q_mux[i] = q_data[(i*BPS)+(BPS-1):(i*BPS)];
        end
        
        for(i = 0; i < (READ_LATENCY-1); i=i+1) begin : cp_ticks_pipeline_generation
            always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
                if (rst_vid_clk) begin
                    cp_ticks_pipeline[i+1] <= {LOG2_COLOUR_PLANES_IN_SEQUENCE{1'b0}};
                end else begin
                    if(serial_output && state_next == INSERT_ANC) begin
                        cp_ticks_pipeline[i+1] <= 1;    // take the ancilliary data from the Y stream
                    end else begin
                        cp_ticks_pipeline[i+1] <= cp_ticks_pipeline[i];
                    end
                end
            end
        end
        
        assign cp_ticks_delayed = cp_ticks_pipeline[READ_LATENCY-1];
        assign q_post_swap = {q_data[DATA_WIDTH-1:BPS], q_mux[cp_ticks_delayed]};        
        assign rdreq_pre_swap = rdreq & ~stall_req;
        
        // mux the parallel data onto a signal sequential symbol
        always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
            if (rst_vid_clk) begin
                cp_ticks_pipeline[0] <= {LOG2_COLOUR_PLANES_IN_SEQUENCE{1'b0}};
                stall_req <= 1'b0;
            end else begin
                cp_ticks_pipeline[0] <= cp_ticks;
                if(serial_output && state == SYNCHED) begin
                    if(cp_ticks_delayed == NUMBER_OF_COLOUR_PLANES - 2) begin
                        stall_req <= 1'b0;
                    end else begin
                        stall_req <= 1'b1;
                    end
                end else begin
                    stall_req <= 1'b0;
                end  
            end
        end
    end else begin
        assign q_post_swap = q_data;
        assign rdreq_pre_swap = rdreq;
    end
endgenerate

// Fifo depth is 3 less than max due to synchronisation issues potentially
// causing the last 3 words to be unavailable when using a dcfifo.
//
// Ready latency of 1 so we pull the ready low 1 cycle early.
assign is_ready = ~(usedw >= (FIFO_DEPTH_INT - 4));


// Register the is_ready signal so that sample arriving after is_ready removal is captured in FIFO
// TODO : if cvo has moved to 0 ready latency this will need removing
always@(posedge rst or posedge is_clk)
begin
    if (rst) begin
        is_ready_reg <= 1'b0;
    end else begin
        is_ready_reg <= is_ready;
    end
end
// alt_vip_common_fifo does nto set overflow protection circuitry so must not write to FIFO when it is full
//assign is_valid_qualified = is_valid & (is_ready || is_ready_reg);
assign is_valid_qualified = is_valid & is_ready;
assign {q_data, sop} = q;
assign writedata = {is_data, is_sop};

alt_vip_common_fifo input_fifo(
    .wrclk(is_clk),
    .rdreq(rdreq_pre_swap),
    .aclr(rst),
    .rdclk(vid_clk_int),
    .wrreq(is_valid_qualified),
    .data(writedata),
    .rdempty(empty),
    .rdusedw(rdusedw),
    .q(q),
    .wrusedw(usedw));

defparam
    input_fifo.DATA_WIDTH = DATA_WIDTH + 1,
    input_fifo.CLOCKS_ARE_SAME = CLOCKS_ARE_SAME,
    input_fifo.FIFO_DEPTH = FIFO_DEPTH_INT;

/*generate
    if (CLOCKS_ARE_SAME) begin
	alt_vip_common_fifo input_fifo(
	    .wrclk(is_clk),
	    .rdreq(rdreq_pre_swap),
	    .aclr(rst),
	    .rdclk(vid_clk_int),
	    .wrreq(is_valid_qualified),
	    .data(writedata),
	    .rdempty(empty),
	    .rdusedw(rdusedw),
	    .q(q),
	    .wrusedw(usedw));

	defparam
	    input_fifo.DATA_WIDTH = DATA_WIDTH + 1,
	    input_fifo.CLOCKS_ARE_SAME = CLOCKS_ARE_SAME,
	    input_fifo.FIFO_DEPTH = FIFO_DEPTH_INT;
    
    end else begin
	alt_vip_common_dc_fifo input_fifo(
	  .wr_clk(is_clk),
	  .wr_rst(rst),
	  .din(writedata),
	  .write(is_valid_qualified),
	  .full(),
	  .nearly_full(),
	  .wr_used_w(usedw),

	  .rd_clk(vid_clk_int),
	  .rd_rst(rst_vid_clk),
	  .dout(q),
	  .read(rdreq_pre_swap),
	  .empty(empty),
	  .nearly_empty(),
	  .rd_used_w(rdusedw)
      );  
      
      defparam 
	  input_fifo.DATA_WIDTH = DATA_WIDTH + 1,
	  input_fifo.CLOCKS_ARE_SAME = CLOCKS_ARE_SAME,
	  input_fifo.FIFO_DEPTH = FIFO_DEPTH_INT;
       
    end
endgenerate*/
        alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) sof_cvi_sync(
                    .rst(rst_vid_clk),
                    .sync_clock(vid_clk_int),
                    .data_in(sof),
                    .data_out(sof_cvi_sync1));
                    
        alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) sof_cvi_locked_sync(
                    .rst(rst_vid_clk),
                    .sync_clock(vid_clk_int),
                    .data_in(sof_locked),
                    .data_out(sof_cvi_locked_sync1));
        
alt_vip_cvo_sync_conditioner pixel_channel_sync_conditioner(
    .rst(rst_vid_clk),			// rst
    .clk(vid_clk_int),			// clk

    // Sync
    .sof(sof_cvi_sync1),
    .sof_locked(sof_cvi_locked_sync1),

    // optional video ports
    .vid_v(vid_v),
    .vid_h(vid_h),
    .vid_f(vid_f),
    .vid_v_sync(vid_v_sync),
    .vid_h_sync(vid_h_sync),
    .vid_datavalid(vid_datavalid),

    .vid_ln(vid_ln),
    .vid_trs(vid_trs),
    .vid_sof(vid_sof),
    .vid_sof_locked(vid_sof_locked),
    .vid_vcoclk_div(vid_vcoclk_div ),

    // sync generation control
    .restart_sample_count(restart_sample_count),
    .restart_line_count(restart_line_count),
    .serial_output(serial_output),
    .field_prediction(field_prediction),
    .interlaced(interlaced),
    .h_total_minus_one(h_total_minus_one),
    .v_total_minus_one(v_total_minus_one),
    .enable_synced_nxt(enable_synced_nxt),
    .vcoclk_divider_value(vcoclk_divider_value),
    .sof_sample(sof_sample),
    .sof_line(sof_line),
    .sof_subsample(sof_subsample),    
    .genlock_enable(genlock_enable_sync1),
    .ap(ap),
    .state_next(state_next),
    .clear_enable(clear_enable),

    .sync_lines(sync_lines),
    .sync_samples(sync_samples),
    .remove_repeatn(remove_repeatn),
    .sync_compare_h_reset(sync_compare_h_reset),
    .sync_compare_v_reset(sync_compare_v_reset),
    .genlocked(genlocked),
    .vid_datavalid_nxt(p_in_p_vid_datavalid_nxt),
    .anc_datavalid_nxt(p_in_p_anc_datavalid_nxt),
    .vid_v_nxt(vid_v_nxt),
    .vid_f_nxt(vid_f_nxt),

    // Counter inputs
    .h_count(h_count),
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
    .vid_h_sync_polarity(h_sync_polarity),
    .vid_v_sync_polarity(v_sync_polarity),
    .f2_anc_v_start(f2_anc_v_start),
    .f1_anc_v_start(f1_anc_v_start),
    .f_rising_edge(f_rising_edge),
    .f_falling_edge(f_falling_edge),
    .sav(sav),
    .ap_line(ap_line),
    .ap_line_end(ap_line_end),

    // Synchronisation control
    .enable_threshold(enable_threshold),
    .enable_synced(enable_synced),
    .vid_v_pipeline(vid_v_pipeline),
    .vid_datavalid_pipeline(vid_datavalid_pipeline),
    .anc_valid_word_pipeline(anc_valid_word_pipeline),

    .threshold_reached(threshold_reached),
    .enable_sync1(enable_sync1),
    .start_of_frame(start_of_frame),
    .cp_ticks(cp_ticks),

    // Optional embedded sync signals
    .start_of_cp(start_of_cp),
    .trs(trs),
    .trs_data(trs_data)

);
defparam 
    pixel_channel_sync_conditioner.GENERATE_SYNC                 = GENERATE_SYNC,
    pixel_channel_sync_conditioner.BPS                           = BPS,
    pixel_channel_sync_conditioner.NUMBER_OF_COLOUR_PLANES       = NUMBER_OF_COLOUR_PLANES,
    pixel_channel_sync_conditioner.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
    pixel_channel_sync_conditioner.PIXELS_IN_PARALLEL            = PIXELS_IN_PARALLEL,
    pixel_channel_sync_conditioner.STD_WIDTH                     = STD_WIDTH,
    pixel_channel_sync_conditioner.USE_EMBEDDED_SYNCS            = USE_EMBEDDED_SYNCS,
    pixel_channel_sync_conditioner.ACCEPT_COLOURS_IN_SEQ         = ACCEPT_COLOURS_IN_SEQ,
    pixel_channel_sync_conditioner.INSERT_ANC                    = INSERT_ANC, 
    pixel_channel_sync_conditioner.H_OFFSET                      = H_OFFSET,
    pixel_channel_sync_conditioner.V_OFFSET                      = V_OFFSET,
    pixel_channel_sync_conditioner.UHD_MODE                      = UHD_MODE;

// Assuming modulo 4 frame parameters, select a single bit of the vid/anc_datavalid signals
assign vid_datavalid_nxt = p_in_p_vid_datavalid_nxt[PIXELS_IN_PARALLEL-1];
assign anc_datavalid_nxt = p_in_p_anc_datavalid_nxt[PIXELS_IN_PARALLEL-1];

// Blanking values are not moved into the sync-gen block as only one is required irrespective of PIXELS_IN_PARALLEL
generate
    if(USE_EMBEDDED_SYNCS) begin
        wire [BPS-1:0] blanking_serial;
        wire [PIXEL_WIDTH-1:0] blanking_parallel;
        
        assign blanking_serial = (cp_ticks == 0) ? BLANKING_SER1 :
                                 (cp_ticks == 1) ? BLANKING_SER2 :
                                 (cp_ticks == 2) ? BLANKING_SER1 :
                                                   BLANKING_SER2;
        
        if(NUMBER_OF_COLOUR_PLANES_IN_PARALLEL > 1) begin
            genvar i;
            for(i = 0; i < NUMBER_OF_COLOUR_PLANES; i=i+1) begin : xyz_creation
                if(i % 2 == 0)
                    assign blanking_parallel[(i*BPS)+BPS-1:i*BPS] = BLANKING_SER1;
                else
                    assign blanking_parallel[(i*BPS)+BPS-1:i*BPS] = BLANKING_SER2;
                
                assign blanking_value[(i*BPS)+BPS-1:i*BPS] = (serial_output) ? blanking_serial : blanking_parallel[(i*BPS)+BPS-1:i*BPS];
            end
        end else
            assign blanking_value[PIXEL_WIDTH-1:0] = blanking_serial;
    end else
        assign blanking_value = {PIXEL_WIDTH{1'b0}};
endgenerate


// The fifo read latency is one, so the valid is a registered version of the 
// read request.
reg request_data_stalled;
reg sync_lost;
reg interlaced_field_valid;
wire interlaced_field_valid_nxt;
wire lost_field_sync;

assign lost_field_sync = genlock_enable_sync1[0] & (vid_f_nxt ^ field_prediction);
assign ap_synched = start_of_ap_nxt & ~lost_field_sync;
assign rdreq = request_data & ~empty;
assign start_of_ap_nxt = ap & ~start_of_ap;
assign interlaced_field_valid_nxt = (state == WIDTH_3 || interlaced_field_valid) && 
                                    !(state == SYNCHED && state_next != SYNCHED); // interlaced field is valid until the end of ap
assign field_prediction_nxt = (interlaced_field_valid_nxt) ? interlaced_field[2] :
                              (state == SYNCHED && state_next != SYNCHED) ? ~field_prediction & interlaced_field[3] : 
                                                                            field_prediction & interlaced_field[3];

always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if(rst_vid_clk) begin
        start_of_ap <= 1'b0;
        request_data <= 1'b0;
        request_data_stalled <= 1'b0;
        request_data_valid <= 1'b0;
        sync_lost <= 1'b0;
        reset_counters <= 1'b0;
        interlaced_field_valid <= 1'b0;
        field_prediction <= 1'b0;
        sop_reg <= 1'b0;
    end else begin
        start_of_ap <= (start_of_frame | vid_v_nxt | reset_counters) ? 1'b0 : ap | start_of_ap;
        request_data <= ~(find_mode_nxt ||
                         wait_for_anc_nxt ||
			 finish_frame_nxt ||
                         state == FIND_MODE ||
			 state == FINISH_FRAME  ||
                         state == WAIT_FOR_SYNCH ||
                         state == WAIT_FOR_ANC ||
                         (state == SYNCHED && ~vid_datavalid_nxt) ||
                         (state == INSERT_ANC && ~anc_datavalid_nxt)) ||
                         (request_data_stalled && ~rdreq);
        request_data_stalled <= ((state != state_next && (state_next == WAIT_FOR_ANC || state == FIND_SOP)) || request_data_stalled) && ~rdreq;
        request_data_valid <= rdreq;
        sync_lost <= (( (state != FIND_MODE && state != WAIT_FOR_SYNCH && start_of_ap_nxt)                                               // late sop
                     || (state == SYNCHED && request_data_valid && sop && !vid_v_pipeline[READ_LATENCY-2])                               // early sop
                     || (underflow_nxt)                                                                                                  // underflow
                     || (state == SYNCHED && interlaced_field_valid && interlaced_field[3] && (field_prediction != vid_f_nxt))            // interlaced fields have got out of sync
                     || sync_lost) && !reset_counters && !mode_change_resync) && !genlock_enable_sync1[0];
        reset_counters <= sync_lost && (state_next == WAIT_FOR_SYNCH);
        interlaced_field_valid <= interlaced_field_valid_nxt;
        field_prediction <= field_prediction_nxt;
        sop_reg <= sop;
    end
end

assign finish_frame_nxt = state_next == FINISH_FRAME;
assign find_mode_nxt = state_next == FIND_MODE;
assign wait_for_anc_nxt = state_next == WAIT_FOR_ANC;

alt_vip_common_sync #(.CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),.DEPTH(3)) find_mode_sync(
            .rst(rst_vid_clk),
            .sync_clock(vid_clk_int),
            .data_in(find_mode_nxt),
            .data_out(find_mode_nxt_sync));
        

alt_vip_cvo_statemachine #(
   .USE_EMBEDDED_SYNCS(USE_EMBEDDED_SYNCS),
   .NUMBER_OF_COLOUR_PLANES_IN_PARALLEL(NUMBER_OF_COLOUR_PLANES_IN_PARALLEL),
   .PIXELS_IN_PARALLEL(PIXELS_IN_PARALLEL),
   .IDLE(IDLE),
   .FIND_SOP(FIND_SOP),
   .WIDTH_3(WIDTH_3),
   .WIDTH_2(WIDTH_2),
   .WIDTH_1(WIDTH_1),
   .WIDTH_0(WIDTH_0),
   .DUMMY_STATE_0(DUMMY_STATE_0), 
   .DUMMY_STATE_1(DUMMY_STATE_1),
   .FINISH_FRAME(FINISH_FRAME),
   .HEIGHT_0(HEIGHT_0),
   .INTERLACING(INTERLACING),
   .FIND_MODE(FIND_MODE),
   .SYNCHED(SYNCHED),
   .WAIT_FOR_SYNCH(WAIT_FOR_SYNCH),
   .WAIT_FOR_ANC(WAIT_FOR_ANC),
   .INSERT_ANC(INSERT_ANC)
)
statemachine(
   .rst(rst_vid_clk),
   .clk(vid_clk_int),
   
   .request_data_valid(request_data_valid),
   .sop(sop),
   .frame_complete(frame_complete),
   .vid_v_nxt(vid_v_nxt),
   .anc_datavalid_nxt(anc_datavalid_nxt),
   .q_data(q_data[3:0]),
   .sync_lost(sync_lost),
   .anc_underflow_nxt(anc_underflow_nxt),
   .ap_synched(ap_synched),
   .enable_synced_nxt(enable_synced_nxt),
   .state_next(state_next),
   .state(state));



endmodule

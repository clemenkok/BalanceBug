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


module alt_vip_cvo_stream_marker (
    clk,
    reset,
    
    // Avalon-ST Event Cmd 0 (From Scheduler)
    cmd_mark_ready,
    cmd_mark_valid,
    cmd_mark_startofpacket,
    cmd_mark_endofpacket,
    cmd_mark_data,             

    // Avalon-ST Data (From VIB)
    av_st_din_ready,
    av_st_din_valid,
    av_st_din_startofpacket,
    av_st_din_endofpacket,
    av_st_din_data,
       

    // Interface to the FIFO
    sop,
    data,
    data_valid,
    data_rdy
    
);

import alt_vip_common_pkg::*;
   
    // Standard Avalon-ST message widths. Do not change. Included for completeness :	
    parameter  SRC_WIDTH                              = 8;
    parameter  DST_WIDTH                              = 8;
    parameter  CONTEXT_WIDTH                          = 8;
    parameter  TASK_WIDTH                             = 8;


    // Parameters for Scheduler interface
    //following parameters determine the positioning of the Event Header signals in the channel
    //these may change in the future so they are parameters that may be overridden if necessary
    localparam DST_BASE = 0;
    localparam SRC_BASE = DST_BASE + DST_WIDTH;
    localparam TASK_BASE = SRC_BASE + SRC_WIDTH;
    localparam CONTEXT_BASE = TASK_BASE + TASK_WIDTH;
    //the user control field is used for the sop empty
    localparam USER_BASE = CONTEXT_BASE + CONTEXT_WIDTH;
    //new fields may added later so the overall control word length may increase
    //for now we set it to the width of what we expect, but it may be overridden later
    localparam CONTROL_WORD_WIDTH = SRC_WIDTH + DST_WIDTH + TASK_WIDTH + CONTEXT_WIDTH;

   // parameters defining Avalon-ST data input and output
   parameter BITS_PER_SYMBOL = 8;
   parameter NUMBER_OF_COLOR_PLANES = 3;
   parameter COLOR_PLANES_ARE_IN_PARALLEL = 1;
   parameter PIXELS_IN_PARALLEL = 1;
   
   // Controls the width of the input AvSt Video empty signal
   localparam EMPTY_WIDTH = (COLOR_PLANES_ARE_IN_PARALLEL) ? alt_clogb2_pure((NUMBER_OF_COLOR_PLANES * PIXELS_IN_PARALLEL) - NUMBER_OF_COLOR_PLANES) : 1;
   // Controls the width of the output AvSt Message start_of_line/packet and end_of_line/packet signals
   localparam SOP_EMPTY_WIDTH = alt_clogb2_pure(PIXELS_IN_PARALLEL);
   localparam EOP_EMPTY_WIDTH = alt_clogb2_pure(PIXELS_IN_PARALLEL);
   
   localparam ELEMENTS_PER_BEAT = (COLOR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOR_PLANES * PIXELS_IN_PARALLEL : 1;
   localparam BITS_PER_ELEMENT  = (COLOR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOR_PLANES * BITS_PER_SYMBOL : BITS_PER_SYMBOL;
   localparam CHANNEL_WIDTH = SRC_WIDTH + DST_WIDTH + CONTEXT_WIDTH + TASK_WIDTH + SOP_EMPTY_WIDTH;
   localparam DATA_WIDTH = BITS_PER_SYMBOL * ELEMENTS_PER_BEAT;
   localparam COLOURS_IN_SEQUENCE = (COLOR_PLANES_ARE_IN_PARALLEL) ? 0 : NUMBER_OF_COLOR_PLANES - 1;

   localparam AV_ST_DATA_DATA_WIDTH  = CHANNEL_WIDTH + EOP_EMPTY_WIDTH + DATA_WIDTH;
    // Avalon-ST messages parameters
    localparam AV_ST_CMD_BITS_PER_SYMBOL              = 8;
    localparam AV_ST_CMD_SYMBOLS_PER_BEAT             = 4;

    // Avalon-ST messages parameters (command ports)
    localparam AV_ST_CMD_CHANNEL_WIDTH                = SRC_WIDTH + DST_WIDTH + CONTEXT_WIDTH + TASK_WIDTH;
    localparam AV_ST_CMD_DATA_WIDTH                   = AV_ST_CMD_SYMBOLS_PER_BEAT * AV_ST_CMD_BITS_PER_SYMBOL;
    localparam AV_ST_CMD_TOTAL_WIDTH                  = AV_ST_CMD_CHANNEL_WIDTH + AV_ST_CMD_DATA_WIDTH;
    //localparam DATA_WIDTH                             = AV_ST_CMD_SYMBOLS_PER_BEAT * AV_ST_CMD_BITS_PER_SYMBOL;

    // Avalon-ST messages parameters (data ports)
    //localparam AV_ST_DATA_BITS_PER_SYMBOL              = 8;
    //localparam AV_ST_DATA_SYMBOLS_PER_BEAT             = 4;
    //localparam AV_ST_DATA_DATA_WIDTH                   = AV_ST_DATA_SYMBOLS_PER_BEAT * AV_ST_DATA_BITS_PER_SYMBOL;
    localparam AV_ST_DATA_TOTAL_WIDTH                  = CHANNEL_WIDTH + AV_ST_DATA_DATA_WIDTH;

    localparam VIP_CL_VIDEO_CVO_CMD_NUM_ARGS           = 1;


    // Parameters for VIB interface
    //parameter PIXELS_IN_PARALLEL = 1;
    //localparam EOP_EMPTY_WIDTH = alt_clogb2_pure(PIXELS_IN_PARALLEL);
    //parameter VIB_BITS_PER_SYMBOL = 8;
    //parameter COLOR_PLANES_ARE_IN_PARALLEL = 1;
    //parameter NUMBER_OF_COLOR_PLANES = 3;
    //localparam VIB_ELEMENTS_PER_BEAT = (COLOR_PLANES_ARE_IN_PARALLEL) ? NUMBER_OF_COLOR_PLANES * PIXELS_IN_PARALLEL : 1;
    //localparam DATA_WIDTH = VIB_BITS_PER_SYMBOL * VIB_ELEMENTS_PER_BEAT;
    //localparam VIB_AV_ST_DATA_WIDTH  = CHANNEL_WIDTH + EOP_EMPTY_WIDTH + DATA_WIDTH;
input  clk;
input  reset;

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

output wire sop;
output wire [DATA_WIDTH - 1 :0] data;
output wire data_valid;
input  wire data_rdy;

logic [3:0]marker;
logic [DATA_WIDTH - 1 :0]ext_marker;
logic [DATA_WIDTH - 1 :0]pixel_data;

// Scheduler packet_decode
wire  [AV_ST_CMD_DATA_WIDTH - 1 : 0] mark_args_out[0:VIP_CL_VIDEO_CVO_CMD_NUM_ARGS-1];
wire                                 mark_command_valid;
logic                                mark_command_ready;
logic [TASK_WIDTH-1:0]               mark_command;   

// State register
reg enable_stream_output; // Demands that the scheduler issue a STREAM_MARKER_CMD_RCV_STREAM command before VIB can output to FIFO
//logic clear_enable_stream;
logic set_enable_stream;
logic mark_stream;
///////////////////////////////////////////////////////////////////
// This block provides an interface for the scheduler to insert a marker 
// on the Fifo before the VIB writes the data stream to it.
//
// The vid-clk side state machine requires markers so it knows where 
// in the stream it is.
//
// The block simply switches whether scheduler or VIB see the FIFO rdy signal active
// 
// This presumes that the scheduler doesn't assert mark_valid while waiting for 
// the VIB to complete writing to the FIFO. This could create deadlock.
//
///////////////////////////////////////////////////////////////////

    // ***  Scheduler Command Decoder  ***
    alt_vip_common_event_packet_decode # (
	.BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
	.ELEMENTS_PER_BEAT(1),    
	.NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_CVO_CMD_NUM_ARGS), // Have to specify one as minimum
	.SRC_WIDTH(SRC_WIDTH),
	.DST_WIDTH(DST_WIDTH),
	.CONTEXT_WIDTH(CONTEXT_WIDTH),
	.TASK_WIDTH(TASK_WIDTH),
	.DST_BASE(DST_BASE), 
	.SRC_BASE(SRC_BASE), 
	.TASK_BASE(TASK_BASE), 
	.CONTEXT_BASE(CONTEXT_BASE), 
	.USER_BASE(USER_BASE), 
	.USER_WIDTH(0)
    ) cmd_decoder (
	.clock (clk),
	.reset(reset),

	.av_st_din_ready(cmd_mark_ready),
	.av_st_din_valid(cmd_mark_valid),
	.av_st_din_startofpacket(cmd_mark_startofpacket),
	.av_st_din_endofpacket(cmd_mark_endofpacket),
	.av_st_din_data(cmd_mark_data),

	.dout_ready(), 
	.dout_valid(),
	.dout_startofpacket(),
	.dout_endofpacket(),
	.dout_data(),
	.dout_eop_empty(),
	.dout_sop_empty(),

	.arguments_out(mark_args_out),
	.arguments_ready (mark_command_ready), 
	.arguments_valid (mark_command_valid),
	.source_out(),
	.destination_out(),
	.context_out(), 
	.task_out(mark_command), // The "task" is the response
	.user_out()

    );

// Decode scheduler commands
assign marker = (mark_args_out[0][3:0] == 'hc) ? 'h0 : mark_args_out[0][3:0]; // Switch line packet marker back to frame marker
assign mark_stream = (mark_command == STREAM_MARKER_CMD_MARK_STREAM && mark_command_valid);
assign mark_command_ready = (mark_stream) ? data_rdy : 1'b1; // Accept RCV_STREAM cmd unconditionally

//assign clear_enable_stream = (mark_stream && mark_command_valid); // Each time the stream is marked, clear the enable so scheduler must explicitly enable it
assign set_enable_stream = (mark_command == STREAM_MARKER_CMD_RCV_STREAM && mark_command_valid);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        enable_stream_output <= 1'b0;
    end else begin
        //if (clear_enable_stream) begin
        if (mark_stream) begin
	    enable_stream_output <= 1'b0;
	end else if (set_enable_stream) begin
	    enable_stream_output <= 1'b1;
	end
    end
end

// VIB Control
assign av_st_din_ready = (enable_stream_output) ? data_rdy : 1'b0; // Don't allow VIB to write to FIFO unless scheduler has enabled it
assign pixel_data = av_st_din_data[DATA_WIDTH - 1 :0];             // Extract pixel data and discard AV-ST command info from data line

// FIFO Control
assign data_valid = (mark_stream && mark_command_valid) || (enable_stream_output && av_st_din_valid);
assign ext_marker = {{DATA_WIDTH-4{1'b0}}, marker};                 // Extend the marker to data size
assign data = (mark_stream && mark_command_valid) ? ext_marker : pixel_data;
assign sop  = (mark_stream && mark_command_valid) ? 1'b1 : 1'b0; 
// SOP needs to align with the FIFO packet marker being inserted : assign sop = av_st_din_startofpacket;
endmodule

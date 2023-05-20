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


module alt_vip_cvo_scheduler (
    clock,
    reset,
    
       // Avalon-ST Event Cmd 0 (To video input bridge)
       cmd_vib_ready,
       cmd_vib_valid,
       cmd_vib_startofpacket,
       cmd_vib_endofpacket,
       cmd_vib_data,             

       // Avalon-ST Event Cmd 1 (To video stream marker)
       cmd_mark_ready,
       cmd_mark_valid, 
       cmd_mark_startofpacket,
       cmd_mark_endofpacket,
       cmd_mark_data,             

       // Avalon-ST Event Cmd 2 (To Mode Register Banks)
       cmd_mode_banks_ready,
       cmd_mode_banks_valid, 
       cmd_mode_banks_startofpacket,
       cmd_mode_banks_endofpacket,
       cmd_mode_banks_data,             

       // Avalon-ST Event Cmd 3 (To Control Slave)
       cmd_control_slave_ready,
       cmd_control_slave_valid, 
       cmd_control_slave_startofpacket,
       cmd_control_slave_endofpacket,
       cmd_control_slave_data,             

       // Avalon-ST Event Resp 0 (From the video input bridge)
       resp_vib_ready,
       resp_vib_valid,
       resp_vib_startofpacket,
       resp_vib_endofpacket,
       resp_vib_data,
                        
       // Avalon-ST Event Resp 1 (From the control slave)
       resp_control_slave_ready,
       resp_control_slave_valid,
       resp_control_slave_startofpacket,
       resp_control_slave_endofpacket,
       resp_control_slave_data,
       
       // Avalon-ST Event Resp 2 (From the Mode Banks)
       resp_mode_banks_ready,
       resp_mode_banks_valid,
       resp_mode_banks_startofpacket,
       resp_mode_banks_endofpacket,
       resp_mode_banks_data
       
                        
   ); 

    import alt_vip_common_pkg::*;

    // Standard Avalon-ST message widths. Do not change. Included for completeness :	
    parameter  SRC_WIDTH                              = 8;
    parameter  DST_WIDTH                              = 8;
    parameter  CONTEXT_WIDTH                          = 8;
    parameter  TASK_WIDTH                             = 8;

    //following parameters determine the positioning of the Event Header signals in the channel
    //these may change in the future so they are parameters that may be overridden if necessary
    parameter DST_BASE = 0;
    parameter SRC_BASE = DST_BASE + DST_WIDTH;
    parameter TASK_BASE = SRC_BASE + SRC_WIDTH;
    parameter CONTEXT_BASE = TASK_BASE + TASK_WIDTH;
    //the user control field is used for the sop empty
    parameter USER_BASE = CONTEXT_BASE + CONTEXT_WIDTH;
    //new fields may added later so the overall control word length may increase
    //for now we set it to the width of what we expect, but it may be overridden later
    parameter CONTROL_WORD_WIDTH = SRC_WIDTH + DST_WIDTH + TASK_WIDTH + CONTEXT_WIDTH;

    // Avalon-ST messages parameters
    localparam AV_ST_CMD_BITS_PER_SYMBOL              = 8;
    localparam AV_ST_CMD_SYMBOLS_PER_BEAT             = 4;

    // Avalon-ST messages parameters (command ports)
    localparam CHANNEL_WIDTH                          = SRC_WIDTH + DST_WIDTH + CONTEXT_WIDTH + TASK_WIDTH;
    localparam DATA_WIDTH                             = AV_ST_CMD_SYMBOLS_PER_BEAT * AV_ST_CMD_BITS_PER_SYMBOL;
    localparam AV_ST_DATA_WIDTH                       = CHANNEL_WIDTH + DATA_WIDTH;

    // There are NUMBER_CMD_INTERFACES is used for control of VIB and STREAM_MARKER
    // ctrl_slave/mode_regs are controlled seperately from the main state machine and are excluded
    localparam NUMBER_CMD_INTERFACES                  = 2;

    // Addressing of components for command/response interfaces :
    localparam VIP_CL_VIDEO_INPUT_BRIDGE_CMD          = 0;
    localparam VIP_CL_STREAM_MARKER_CMD               = 1;    
    localparam VIP_CL_MODE_BANKS_CMD                  = 2;
    localparam VIP_CL_CONTROL_SLAVE_CMD               = 3;
    localparam VIP_CL_VIDEO_INPUT_BRIDGE_RESP         = 4;
    localparam VIP_CL_CONTROL_SLAVE_RESP              = 5;

       // Commands parameters
    localparam VIP_CL_VIDEO_VIB_CMD_NUM_ARGS           = 1;
    localparam VIP_CL_VIDEO_STREAM_MARKER_CMD_NUM_ARGS = 1;
    localparam VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS    = 2;
    localparam VIP_CL_CONTROL_SLAVE_CMD_NUM_ARGS       = 2;

    // Width of the number_arguments ports
    localparam NUM_ARGS_IN_WIDTH_VIDEO_INPUT_BRIDGE   = alt_clogb2(VIP_CL_VIDEO_VIB_CMD_NUM_ARGS);
    localparam NUM_ARGS_IN_WIDTH_STREAM_MARKER        = alt_clogb2(VIP_CL_VIDEO_STREAM_MARKER_CMD_NUM_ARGS);
    localparam NUM_ARGS_IN_WIDTH_MODE_BANKS           = alt_clogb2(VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS);
    localparam NUM_ARGS_IN_WIDTH_CONTROL_SLAVE        = alt_clogb2(VIP_CL_CONTROL_SLAVE_CMD_NUM_ARGS);

    // Response parameters :   
    localparam VIP_CL_VIDEO_VIB_RESP_NUM_ARGS         = 2;
    localparam VIP_CL_CONTROL_SLAVE_RESP_NUM_ARGS     = 2;
    localparam VIP_CL_MODE_BANKS_RESP_NUM_ARGS        = 1;

    input   wire                                     clock;
    input   wire                                     reset;

    output  wire                                     cmd_vib_valid;
    input   wire                                     cmd_vib_ready;
    output  wire   [AV_ST_DATA_WIDTH - 1 : 0]        cmd_vib_data;
    output  wire                                     cmd_vib_startofpacket;
    output  wire                                     cmd_vib_endofpacket;

    output  wire                                     cmd_mark_valid;
    input   wire                                     cmd_mark_ready;
    output  wire   [AV_ST_DATA_WIDTH - 1 : 0]        cmd_mark_data;
    output  wire                                     cmd_mark_startofpacket;
    output  wire                                     cmd_mark_endofpacket;

    output  wire                                     cmd_mode_banks_valid;
    input   wire                                     cmd_mode_banks_ready;
    output  wire   [AV_ST_DATA_WIDTH - 1 : 0]        cmd_mode_banks_data;
    output  wire                                     cmd_mode_banks_startofpacket;
    output  wire                                     cmd_mode_banks_endofpacket;

    output  wire                                     cmd_control_slave_valid;
    input   wire                                     cmd_control_slave_ready;
    output  wire   [AV_ST_DATA_WIDTH - 1 : 0]        cmd_control_slave_data;
    output  wire                                     cmd_control_slave_startofpacket;
    output  wire                                     cmd_control_slave_endofpacket;

    input   wire                                     resp_vib_valid;
    output  wire                                     resp_vib_ready;  
    input   wire   [AV_ST_DATA_WIDTH - 1 : 0]        resp_vib_data; 
    input   wire                                     resp_vib_startofpacket;
    input   wire                                     resp_vib_endofpacket;

    input   wire                                     resp_control_slave_valid;
    output  wire                                     resp_control_slave_ready;  
    input   wire   [AV_ST_DATA_WIDTH - 1 : 0]        resp_control_slave_data; 
    input   wire                                     resp_control_slave_startofpacket;
    input   wire                                     resp_control_slave_endofpacket;

    input   wire                                     resp_mode_banks_valid;
    output  wire                                     resp_mode_banks_ready;  
    input   wire   [AV_ST_DATA_WIDTH - 1 : 0]        resp_mode_banks_data; 
    input   wire                                     resp_mode_banks_startofpacket;
    input   wire                                     resp_mode_banks_endofpacket;

    // Command arguments
    logic [DATA_WIDTH - 1 : 0]                       cmd_vib_args_in  [0:VIP_CL_VIDEO_VIB_CMD_NUM_ARGS-1]; 
    logic [DATA_WIDTH - 1 : 0]                       cmd_mark_args_in  [0:VIP_CL_VIDEO_STREAM_MARKER_CMD_NUM_ARGS-1]; 
    logic [DATA_WIDTH - 1 : 0]                       cmd_mode_banks_args_in  [0:VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS-1]; 
    logic [DATA_WIDTH - 1 : 0]                       cmd_control_slave_args_in  [0:VIP_CL_CONTROL_SLAVE_CMD_NUM_ARGS-1]; 

    // Number of arguments for the command packets
    logic [NUM_ARGS_IN_WIDTH_VIDEO_INPUT_BRIDGE-1:0]    cmd_vib_arg_count;
    logic [VIP_CL_VIDEO_STREAM_MARKER_CMD_NUM_ARGS-1:0] cmd_stream_marker_arg_count;
    logic [VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS-1:0]    cmd_mode_banks_arg_count;
    logic [VIP_CL_CONTROL_SLAVE_CMD_NUM_ARGS-1:0]       cmd_control_slave_arg_count;

    // We assign a command channel to each block, we share the sop/eop and command id signals for all command ports
    // Ctrl slave/mode banks can be driven at the same time and are excluded from the "cmd_" ports
    wire  [NUMBER_CMD_INTERFACES-1:0]                 cmd_ready;
    reg   [NUMBER_CMD_INTERFACES-1:0]                 cmd_valid;

    reg   [TASK_WIDTH-1:0]                            cmd_send;



    // Automatically deduce the number of arguments using the command code sent
    assign cmd_vib_arg_count            = video_input_bridge_cmd_arg_count_func(VidInputBridgeCmd_t'(cmd_send));
    assign cmd_stream_marker_arg_count  = stream_marker_cmd_arg_count_func(StreamMarkerCmd_t'(cmd_send));

    wire                                             vib_response_valid;
    logic                                            vib_response_ready;
    logic [TASK_WIDTH-1:0]                           vib_response;   

    wire                                             control_slave_response_valid;
    logic                                            control_slave_response_ready;
    logic [TASK_WIDTH-1:0]                           control_slave_response;   

    logic                                            control_slave_cmd_valid;
    wire                                             control_slave_cmd_ready;
    logic [TASK_WIDTH-1:0]                           control_slave_cmd;   

    wire                                             mode_banks_response_valid;
    logic                                            mode_banks_response_ready;
    logic [TASK_WIDTH-1:0]                           mode_banks_response;   

    reg                                              mode_banks_cmd_valid;
    logic                                            mode_banks_cmd_ready;
    logic [TASK_WIDTH-1:0]                           mode_banks_cmd;   

    wire  [DATA_WIDTH - 1 : 0]                       resp_vib_args_out[0:VIP_CL_VIDEO_VIB_RESP_NUM_ARGS-1];
    wire  [DATA_WIDTH - 1 : 0]                       resp_control_slave_out[0:VIP_CL_CONTROL_SLAVE_RESP_NUM_ARGS-1];
    wire  [DATA_WIDTH - 1 : 0]                       resp_mode_banks_out[0:VIP_CL_MODE_BANKS_RESP_NUM_ARGS-1];

    reg   [CONTEXT_WIDTH-1:0]                        context_r;
    logic [CONTEXT_WIDTH-1:0]                        next_context;

    reg [15:0]                                       video_input_height;
    reg [15:0]                                       video_input_width;
    reg [3:0]                                        video_input_interlaced;
    reg [3:0]                                        marker;

    reg [15:0]                                       lines_sent;

    reg                                              user_packet_detected;     
    reg [3:0]                                        user_packet_type;         
   
          
    // control slave response arguments
    reg [15:0] control_slave_reg_addr;
    reg [15:0] control_slave_reg_data;
    reg mode_bank_rsp_ready_control_slave_wr_readyn;

    // Mode bank response arguments
    reg [15:0] mode_bank_byte_enables;
    reg [15:0] mode_bank_reg_addr;
    reg [31:0] mode_bank_reg_data;
    reg [31:0] mode_bank_write_select; // 14 max

    reg control_slave_rsp_ready_mode_banks_wr_readyn; // Indicate if we can receive a control write from ctrl slave or have item to feed to mode banks

    // VIB response arguments
    logic [3:0] packet_type;
    
    // Function to send a command
    function bit command( input logic[7:0] component, input logic[7:0] cmd );
    begin
       command    = 1'b0;
       cmd_valid  = {NUMBER_CMD_INTERFACES{1'b0}} | (1'b1 << component);
       cmd_send   = cmd;
       if (cmd_ready[component])
       begin
          command       = 1'b1;
          next_context  = context_r + {{CONTEXT_WIDTH-1{1'b0}},1'b1};
       end
    end
    endfunction   


    //////////////////////////////////////////////////////////////////////////////
    // The State Machine
    //////////////////////////////////////////////////////////////////////////////
    typedef enum int unsigned {
	INIT__WAIT_FOR_FIRST_CTRL,   // Discard video packets until the first control packet is seen.
	INIT__DISCARD_PACKET,        // Issue a discard instruction to the VIB
	INIT__DISCARD_PACKET_WAIT,   // Wait for the discard to complete
	MAIN__IDLE,                  // Wait for VIB response packet
	MAIN__UPDATE_CTRL,           // Send next frame parameters to mode-banks
	MAIN__INSERT_STREAM_MARKER,  // Check non control packets for type; Push packet type onto head of FIFO stream
	MAIN__SET_STREAM_RECV,       // Set the stream marker to receive data packets from the VIB
	MAIN__OUTPUT_PKT,            // Issue the send_pkt cmd to the VIB to send data packets to the FIFO
	MAIN__WAIT_RSP               // Wait for end of packet response from single issue packets before returning to IDLE
	//MAIN__VID_IDLE,              // Since VIB breaks frames down to lines, register that a vid pkt has been recvd to skip placing further vid identifiers onto FIFO
	//MAIN__VID_USER_PKT,          // Same function as FIRST_USER_PKT but if pkt type is a video line, doesn't place another header on the FIFO
	//MAIN__VID_WAIT_RSP,          // Wait for the VIB to indicate that vid line has been output
	//EXCEPTION__EARLY_EOP,        // Handle EOP arriving early
	//EXCEPTION__LATE_EOP          // Handle EOP arriving late

    }  state_t;

    state_t state;  
    state_t next_state;   
    // ***  Video Input Bridge Encoder  ***
    alt_vip_common_event_packet_encode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),   
       .NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_VIB_CMD_NUM_ARGS), // Have to specify one as minimum
       .SRC_WIDTH(SRC_WIDTH),
       .DST_WIDTH(DST_WIDTH),
       .CONTEXT_WIDTH(CONTEXT_WIDTH),
       .TASK_WIDTH(TASK_WIDTH),
       .PIPELINE_READY(1),
       .COMB_OUTPUT(0),
       .REGISTER_ARGUMENTS_READY(0),
       .DST_BASE(DST_BASE), 
       .SRC_BASE(SRC_BASE), 
       .TASK_BASE(TASK_BASE), 
       .CONTEXT_BASE(CONTEXT_BASE), 
       .USER_BASE(USER_BASE), 
       .USER_WIDTH(0) 
    ) cmd_vib_encoder (
       .clock (clock),
       .reset(reset),

       .din_ready(),
       .din_valid(1'b0),
       .din_startofpacket(1'b0),
       .din_endofpacket(1'b0),
       .din_data(1'b0),
       .din_eop_empty(1'b0),
       .din_sop_empty(1'b0),

       .av_st_dout_ready(cmd_vib_ready), 
       .av_st_dout_valid(cmd_vib_valid),
       .av_st_dout_startofpacket(cmd_vib_startofpacket),
       .av_st_dout_endofpacket(cmd_vib_endofpacket),
       .av_st_dout_data(cmd_vib_data),

       .arguments_in(cmd_vib_args_in),
       .arguments_ready (cmd_ready[VIP_CL_VIDEO_INPUT_BRIDGE_CMD]),
       .arguments_valid (cmd_valid[VIP_CL_VIDEO_INPUT_BRIDGE_CMD]),
       .number_of_arguments(cmd_vib_arg_count), 
       .source_in(0), // Irrelevant with point to point routing
       .destination_in(8'h0), // The command encoder is only connected to the destination component
       .context_in(context_r), 
       .task_in(cmd_send),
       .user_in()
    );

    // ***  Stream Marker Encoder  ***
    alt_vip_common_event_packet_encode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_STREAM_MARKER_CMD_NUM_ARGS), // Have to specify one as minimum
       .SRC_WIDTH(SRC_WIDTH),
       .DST_WIDTH(DST_WIDTH),
       .CONTEXT_WIDTH(CONTEXT_WIDTH),
       .TASK_WIDTH(TASK_WIDTH),
       .PIPELINE_READY(1),
       .COMB_OUTPUT(0),
       .REGISTER_ARGUMENTS_READY(0), // Is this correct?
       .DST_BASE(DST_BASE), 
       .SRC_BASE(SRC_BASE), 
       .TASK_BASE(TASK_BASE), 
       .CONTEXT_BASE(CONTEXT_BASE), 
       .USER_BASE(USER_BASE), 
       .USER_WIDTH(0)
    ) cmd_mark_encoder (
       .clock (clock),
       .reset(reset),

       .din_ready(),
       .din_valid(1'b0),
       .din_startofpacket(1'b0),
       .din_endofpacket(1'b0),
       .din_data(1'b0),
       .din_eop_empty(1'b0),
       .din_sop_empty(1'b0),

       .av_st_dout_ready(cmd_mark_ready), 
       .av_st_dout_valid(cmd_mark_valid),
       .av_st_dout_startofpacket(cmd_mark_startofpacket),
       .av_st_dout_endofpacket(cmd_mark_endofpacket),
       .av_st_dout_data(cmd_mark_data),      

       .arguments_in(cmd_mark_args_in),  
       .arguments_ready (cmd_ready[VIP_CL_STREAM_MARKER_CMD]),
       .arguments_valid (cmd_valid[VIP_CL_STREAM_MARKER_CMD]),
       .number_of_arguments(cmd_stream_marker_arg_count), 
       .source_in(8'h0), // Irrelevant with point to point routing
       .destination_in(8'h0), // The command encoder is only connected to the destination component
       .context_in(context_r), 
       .task_in(cmd_send),
       .user_in()
    );     

    // ***  Mode Regs Encoder  ***
    alt_vip_common_event_packet_encode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS), // Have to specify one as minimum
       .SRC_WIDTH(SRC_WIDTH),
       .DST_WIDTH(DST_WIDTH),
       .CONTEXT_WIDTH(CONTEXT_WIDTH),
       .TASK_WIDTH(TASK_WIDTH),
       .PIPELINE_READY(1),
       .COMB_OUTPUT(0),
       .REGISTER_ARGUMENTS_READY(0), // Is this correct?
       .DST_BASE(DST_BASE), 
       .SRC_BASE(SRC_BASE), 
       .TASK_BASE(TASK_BASE), 
       .CONTEXT_BASE(CONTEXT_BASE), 
       .USER_BASE(USER_BASE), 
       .USER_WIDTH(0)
    ) cmd_mode_banks_encoder (
       .clock (clock),
       .reset(reset),

       .din_ready(),
       .din_valid(1'b0),
       .din_startofpacket(1'b0),
       .din_endofpacket(1'b0),
       .din_data(1'b0),
       .din_eop_empty(1'b0),
       .din_sop_empty(1'b0),

       .av_st_dout_ready(cmd_mode_banks_ready), 
       .av_st_dout_valid(cmd_mode_banks_valid),
       .av_st_dout_startofpacket(cmd_mode_banks_startofpacket),
       .av_st_dout_endofpacket(cmd_mode_banks_endofpacket),
       .av_st_dout_data(cmd_mode_banks_data),      

       .arguments_in(cmd_mode_banks_args_in),  
       .arguments_ready (mode_banks_cmd_ready),
       .arguments_valid (mode_banks_cmd_valid),
       .number_of_arguments(cmd_mode_banks_arg_count), 
       .source_in(8'h0), // Irrelevant with point to point routing
       .destination_in(8'h0), // The command encoder is only connected to the destination component
       .context_in(context_r), 
       .task_in(mode_banks_cmd),
       .user_in()
    );     

    // ***  Control Slave Encoder  ***
    alt_vip_common_event_packet_encode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_CONTROL_SLAVE_CMD_NUM_ARGS), // Have to specify one as minimum
       .SRC_WIDTH(SRC_WIDTH),
       .DST_WIDTH(DST_WIDTH),
       .CONTEXT_WIDTH(CONTEXT_WIDTH),
       .TASK_WIDTH(TASK_WIDTH),
       .PIPELINE_READY(1),
       .COMB_OUTPUT(0),
       .REGISTER_ARGUMENTS_READY(0), // Is this correct?
       .DST_BASE(DST_BASE), 
       .SRC_BASE(SRC_BASE), 
       .TASK_BASE(TASK_BASE), 
       .CONTEXT_BASE(CONTEXT_BASE), 
       .USER_BASE(USER_BASE), 
       .USER_WIDTH(0)
    ) cmd_control_slave_encoder (
       .clock (clock),
       .reset(reset),

       .din_ready(),
       .din_valid(1'b0),
       .din_startofpacket(1'b0),
       .din_endofpacket(1'b0),
       .din_data(1'b0),
       .din_eop_empty(1'b0),
       .din_sop_empty(1'b0),

       .av_st_dout_ready(cmd_control_slave_ready), 
       .av_st_dout_valid(cmd_control_slave_valid),
       .av_st_dout_startofpacket(cmd_control_slave_startofpacket),
       .av_st_dout_endofpacket(cmd_control_slave_endofpacket),
       .av_st_dout_data(cmd_control_slave_data),      

       .arguments_in(cmd_control_slave_args_in),  
       .arguments_ready (control_slave_cmd_ready),
       .arguments_valid (control_slave_cmd_valid),
       .number_of_arguments(cmd_control_slave_arg_count), 
       .source_in(8'h0), // Irrelevant with point to point routing
       .destination_in(8'h0), // The command encoder is only connected to the destination component
       .context_in(context_r), 
       .task_in(control_slave_cmd),
       .user_in()
    );    

    // ***  Video Input Bridge Response Decoder  ***
    alt_vip_common_event_packet_decode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_VIB_RESP_NUM_ARGS), // Have to specify one as minimum
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
    ) resp_vib_decoder (
       .clock (clock),
       .reset(reset),

       .av_st_din_ready(resp_vib_ready),
       .av_st_din_valid(resp_vib_valid),
       .av_st_din_startofpacket(resp_vib_startofpacket),
       .av_st_din_endofpacket(resp_vib_endofpacket),
       .av_st_din_data(resp_vib_data),

       .dout_ready(), 
       .dout_valid(),
       .dout_startofpacket(),
       .dout_endofpacket(),
       .dout_data(),
       .dout_eop_empty(),
       .dout_sop_empty(),

       .arguments_out(resp_vib_args_out),
       .arguments_ready (vib_response_ready ), 
       .arguments_valid (vib_response_valid),
       .source_out(),
       .destination_out(),
       .context_out(), 
       .task_out(vib_response), // The "task" is the response
       .user_out()

    );

    // ***  Control Slave Response Decoder  ***
    alt_vip_common_event_packet_decode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_CONTROL_SLAVE_RESP_NUM_ARGS), // Have to specify one as minimum
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
    ) resp_control_slave_decoder (
       .clock (clock),
       .reset(reset),

       .av_st_din_ready(resp_control_slave_ready),
       .av_st_din_valid(resp_control_slave_valid),
       .av_st_din_startofpacket(resp_control_slave_startofpacket),
       .av_st_din_endofpacket(resp_control_slave_endofpacket),
       .av_st_din_data(resp_control_slave_data),

       .dout_ready(), 
       .dout_valid(),
       .dout_startofpacket(),
       .dout_endofpacket(),
       .dout_data(),
       .dout_eop_empty(),
       .dout_sop_empty(),

       .arguments_out(resp_control_slave_out),
       .arguments_ready (control_slave_response_ready ), 
       .arguments_valid (control_slave_response_valid),
       .source_out(),
       .destination_out(),
       .context_out(), 
       .task_out(control_slave_response), // The "task" is the response
       .user_out()

    );

    // ***  Mode Banks Response Decoder  ***
    alt_vip_common_event_packet_decode # (
       .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
       .ELEMENTS_PER_BEAT(1),    
       .NUMBER_OF_ARGUMENTS(VIP_CL_MODE_BANKS_RESP_NUM_ARGS), // Have to specify one as minimum
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
    ) resp_mode_banks_decoder (
       .clock (clock),
       .reset(reset),

       .av_st_din_ready(resp_mode_banks_ready),
       .av_st_din_valid(resp_mode_banks_valid),
       .av_st_din_startofpacket(resp_mode_banks_startofpacket),
       .av_st_din_endofpacket(resp_mode_banks_endofpacket),
       .av_st_din_data(resp_mode_banks_data),

       .dout_ready(), 
       .dout_valid(),
       .dout_startofpacket(),
       .dout_endofpacket(),
       .dout_data(),
       .dout_eop_empty(),
       .dout_sop_empty(),

       .arguments_out(resp_mode_banks_out),
       .arguments_ready (mode_banks_response_ready ), 
       .arguments_valid (mode_banks_response_valid),
       .source_out(),
       .destination_out(),
       .context_out(), 
       .task_out(mode_banks_response), // The "task" is the response
       .user_out()

    );

    //////////////////////////////////////////////////////////////////////////////
    // Set up the arguments for the command interfaces
    //////////////////////////////////////////////////////////////////////////////
    
    // Discard bit should be set for late EOP
    logic vib_discard = 0;
    assign cmd_vib_args_in[0] = {15'h0, vib_discard, 16'h0};    // Using point to point so address isn't important

    // Send the AV-ST Video packet type to be used as the marker
    assign cmd_mark_args_in[0] = (cmd_send == STREAM_MARKER_CMD_MARK_STREAM) ? {28'h0, marker} : 32'h0;
    assign cmd_mode_banks_arg_count = mode_banks_cmd_arg_count_func(ModeBanksCmd_t'(mode_banks_cmd));

    // Mode Banks Command Interface
    always @* begin
        cmd_mode_banks_args_in[0] = 32'h0;
        cmd_mode_banks_args_in[1] = 32'h0;
	mode_banks_cmd_valid      = 1'b0;
	mode_banks_cmd            = ModeBanksCmd_t'(0);
	
	if (state == MAIN__UPDATE_CTRL) begin
	    mode_banks_cmd = MODE_BANKS_CMD_SEND_CTRL_PKT;
	    cmd_mode_banks_args_in[0] = {video_input_height, video_input_width} ; 
	    cmd_mode_banks_args_in[1] = {28'b0, video_input_interlaced[3:0]  };
	    mode_banks_cmd_valid = 1'b1;
	end
	else if (!control_slave_rsp_ready_mode_banks_wr_readyn) begin
	    mode_banks_cmd = MODE_BANKS_CMD_SEND_MODE_REG;
	    cmd_mode_banks_args_in[0] = {mode_bank_byte_enables,mode_bank_reg_addr} ; 
	    cmd_mode_banks_args_in[1] = {mode_bank_reg_data};
	    mode_banks_cmd_valid = 1'b1;
	end
	
        //cmd_mode_banks_arg_count = mode_banks_cmd_arg_count_func(ModeBanksCmd_t(mode_banks_cmd));
        //cmd_mode_banks_arg_count = mode_banks_cmd_arg_count_func(mode_banks_cmd);
    end
    
    // Control Slave Command Interface - This is only ever updated by a register write from the Mode Banks RSP interface
    assign control_slave_cmd            = CONTROL_SLAVE_CMD_REGISTER_UPDATE;
    assign cmd_control_slave_args_in[0] = {16'b0, control_slave_reg_addr};
    assign cmd_control_slave_args_in[1] = control_slave_reg_data;
    assign cmd_control_slave_arg_count  = control_slave_cmd_arg_count_func(ControlSlaveCmd_t'(control_slave_cmd));
    assign control_slave_cmd_valid      = !mode_bank_rsp_ready_control_slave_wr_readyn;
    
    //////////////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////
    // Extract arguments from the VIB response interface
    //////////////////////////////////////////////////////////////////////////////
    assign packet_type = resp_vib_args_out[0][3:0];// VID_INPUT_BRIDGE_RSP_NEW_PACKET    
    
    // 3)VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL
    logic eop_flag;
    assign eop_flag = resp_vib_args_out[0][0];
         
    always @(posedge clock or posedge reset) begin

	if (reset) begin
	    video_input_height     <= 'h0;
	    video_input_width      <= 'h0; 
	    video_input_interlaced <= 4'b0010;

	    user_packet_detected   <= 1'b0;
	    user_packet_type       <= 4'b0;
	    lines_sent             <= 16'h0;
	    
	    marker                 <= 4'b0;
	end else begin

	    if (vib_response_valid && vib_response_ready) 
	    begin

                marker <= packet_type; // stream_marker shouldn't ever use control markers but set it for debug 
		if (Response_t'(vib_response) == VID_INPUT_BRIDGE_RSP_NEW_CTRL_PACKET) 
		begin
		    video_input_width      <= resp_vib_args_out[0][15:0];
		    video_input_height     <= resp_vib_args_out[0][31:16];
		    video_input_interlaced <= resp_vib_args_out[1][3:0]; 
		end 

		else 
		if (Response_t'(vib_response) == VID_INPUT_BRIDGE_RSP_NEW_PACKET) 
		begin
		    user_packet_detected   <= packet_type != 'hC;               
		    user_packet_type       <= packet_type; // valid only if user_packet_detected == 1;
		end 

		else 
		if (Response_t'(vib_response) == VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL) 
		begin
        	    lines_sent             <= resp_vib_args_out[0][0] ? 16'h0 : lines_sent + 'd1;                                                                      
		end
	    end  
	end
    end

    reg frame_in_progress;
    wire set_frame_in_progress;
    wire clear_frame_in_progress;
    // VIB changes Frame packet type ('h0) to line packet type ('hC)
    assign set_frame_in_progress = (state == MAIN__INSERT_STREAM_MARKER && user_packet_type == 'hC);
    //assign clear_frame_in_progress = (Response_t'(vib_response) == VID_INPUT_BRIDGE_RSP_NEW_CTRL_PACKET && vib_response_valid) || user_packet_detected;
    assign clear_frame_in_progress = (Response_t'(vib_response) == VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL && vib_response_valid && eop_flag) || user_packet_detected;
    
    //////////////////////////////////////////////////////////////////////////////
    // Extract arguments from the Mode Bank response interface
    // These are status updates to pass back to the ctrl slave
    //////////////////////////////////////////////////////////////////////////////
    always @(posedge clock or posedge reset) begin
	if (reset) begin
   	    mode_bank_rsp_ready_control_slave_wr_readyn <= 1'b1;
	    control_slave_reg_addr <= 16'b0;
	    control_slave_reg_data <= 16'b0;
	end else begin
	    if (mode_banks_response_valid && mode_bank_rsp_ready_control_slave_wr_readyn) begin
   	        mode_bank_rsp_ready_control_slave_wr_readyn <= 1'b0;
		control_slave_reg_addr <= resp_mode_banks_out[0][15:0];
		control_slave_reg_data <= resp_mode_banks_out[0][31:16];
	    end else if (control_slave_cmd_ready && control_slave_cmd_valid) begin
	        mode_bank_rsp_ready_control_slave_wr_readyn <= 1'b1;
	    end
	end
	
    end
    
    assign mode_banks_response_ready = mode_bank_rsp_ready_control_slave_wr_readyn;
    
    //////////////////////////////////////////////////////////////////////////////
    // Extract arguments from the Control Slave response interface
    // NOTE : because there is only one response type for ctrl_slave, control_slave_response isn't read
    //////////////////////////////////////////////////////////////////////////////
    always @(posedge clock or posedge reset) begin
	if (reset) begin
	    control_slave_rsp_ready_mode_banks_wr_readyn <= 1'b1;
	    mode_bank_byte_enables <= 16'b0;
	    mode_bank_reg_addr     <= 16'b0;
	    mode_bank_reg_data     <= 32'b0;
	end else begin
	    if ((state != MAIN__UPDATE_CTRL) &&(next_state != MAIN__UPDATE_CTRL) && control_slave_rsp_ready_mode_banks_wr_readyn && control_slave_response_valid) begin
	    // Only accept a mode_bank update from ctrl_slave if state machine isn't making, or about to make a ctrl update
	        control_slave_rsp_ready_mode_banks_wr_readyn <= 1'b0;
		mode_bank_byte_enables <= resp_control_slave_out[0][31:16];
		mode_bank_reg_addr     <= resp_control_slave_out[0][15:0];
		mode_bank_reg_data     <= resp_control_slave_out[1];
	    end else if ((mode_banks_cmd_ready && mode_banks_cmd_valid && !control_slave_rsp_ready_mode_banks_wr_readyn ) )begin
	        // Check for control_slave_rsp_ready_mode_banks_wr_readyn so that state UPDATE_CTRL doesn't reset control_slave_rsp_ready
	        control_slave_rsp_ready_mode_banks_wr_readyn <= 1'b1;
	    end
	end
    end
   
    assign control_slave_response_ready = control_slave_rsp_ready_mode_banks_wr_readyn;
    
    //////////////////////////////////////////////////////////////////////////////
    // Issue Commands to Mode Banks
    //////////////////////////////////////////////////////////////////////////////
    
    always @(posedge clock or posedge reset)
    begin

	if (reset)
	begin               
            context_r    <= {CONTEXT_WIDTH{1'b0}};
            state        <= INIT__WAIT_FOR_FIRST_CTRL;         
	    frame_in_progress <= 1'b0;
	end

	else
	begin           
            context_r    <= next_context;         
            state        <= next_state;
	    if(set_frame_in_progress) 
	    begin
		frame_in_progress <= 1'b1;
	    end 
	    
	    else if (clear_frame_in_progress) 
	    begin
		frame_in_progress <= 1'b0;
	    end
	end

    end
         
    always @(*)
    begin
	// Defaults
	cmd_valid                 = {NUMBER_CMD_INTERFACES{1'b0}};
	cmd_send                  = 8'h0;
	next_context              = context_r;                
	next_state                = state;

	// By default we are not ready for the VIB's resopnses :
	vib_response_ready        = 1'b0;

        // The state machine
        case (state)
	    // Initialisation discards packets until a control packet has been received 
	    INIT__WAIT_FOR_FIRST_CTRL : begin
                vib_response_ready = 1'b1;
                next_state = state; // default 
	        if (vib_response_valid) begin
		    case (vib_response)
		        VID_INPUT_BRIDGE_RSP_NEW_CTRL_PACKET : begin
			    // Can now go to the MAIN loop as long as there isn't a modeBank register write in flight
			    next_state = (control_slave_rsp_ready_mode_banks_wr_readyn) ? MAIN__UPDATE_CTRL : state;
			end
			VID_INPUT_BRIDGE_RSP_NEW_PACKET : begin
			    // Discard packets until we find a valid control packet
			    next_state = INIT__DISCARD_PACKET;
			end
			VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL : begin
			    // When a discard completes continue waiting for a control packet
			    next_state = state;
			end
			default : begin
			    next_state = state;
			end
		    endcase
		end
	    end  
	    INIT__DISCARD_PACKET : begin
	        next_state = command(VIP_CL_VIDEO_INPUT_BRIDGE_CMD, VID_INPUT_BRIDGE_CMD_SEND_PACKET) ? INIT__DISCARD_PACKET_WAIT : state;
	    end
	    INIT__DISCARD_PACKET_WAIT : begin
	        next_state = (vib_response_valid && vib_response == VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL) ? INIT__WAIT_FOR_FIRST_CTRL : state;
	    end

            // The main loop 
	    //              - Receives Control Packets and sends the frame parameters to the mode_banks (this can be stalled if ctrl slave is writing to regs)
	    //              - Instructs the stream_marker to place markers in the FIFO to seperate individual video frames and user data
	    //              - Instructs the VIB to issue its data to the FIFO
	    MAIN__IDLE : begin                  // Wait for User Packets response packet
                vib_response_ready = 1'b1;
                next_state = state; // default 
	        if (vib_response_valid) begin
		    case (vib_response)
		        VID_INPUT_BRIDGE_RSP_NEW_CTRL_PACKET : begin
			    // Can update control whenever control slave isn't
			    next_state = (control_slave_rsp_ready_mode_banks_wr_readyn) ? MAIN__UPDATE_CTRL : state;
			end
			VID_INPUT_BRIDGE_RSP_NEW_PACKET : begin
			    // If response is first line of a new frame, insert a frame marker on the FIFO, otherwise go straight to issuing line to the fifo
			    next_state = (!frame_in_progress) ? MAIN__INSERT_STREAM_MARKER : MAIN__OUTPUT_PKT;
			end
			default : begin
			    next_state = state;
			end
		    endcase
		end
	    end
	    MAIN__UPDATE_CTRL : begin           
	        // Issue the frame parameters to the mode_banks 
                next_state = (mode_banks_cmd_valid && mode_banks_cmd_ready) ? MAIN__IDLE : state;
            end
	    MAIN__INSERT_STREAM_MARKER : begin        
	        // For Ancillary packets and First Video packet, push an identifier onto the FIFO
        	// This state is used to indicate to the cvo_stream marker that the user_packet_type needs to be placed on the FIFO to 
		// mark the data stream for the receiving side.
		next_state = command(VIP_CL_STREAM_MARKER_CMD, STREAM_MARKER_CMD_MARK_STREAM) ? MAIN__SET_STREAM_RECV : state;
            end
	    MAIN__SET_STREAM_RECV : begin
	        // Once Marker has been set (requires space in the FIFO) instruct stream_marker to switch the FIFO rdy signal to the VIB
	        next_state = command(VIP_CL_STREAM_MARKER_CMD, STREAM_MARKER_CMD_RCV_STREAM) ? MAIN__OUTPUT_PKT : state;
	    end
	    MAIN__OUTPUT_PKT : begin            
	        // Issue the send_pkt cmd to the VIB to place ANC data onto FIFO
        	next_state = command(VIP_CL_VIDEO_INPUT_BRIDGE_CMD, VID_INPUT_BRIDGE_CMD_SEND_PACKET) ? MAIN__WAIT_RSP : state;
            end
	    MAIN__WAIT_RSP : begin              
	        // Wait for end of packet response from single issue packets before returning to IDLE
                vib_response_ready = 1'b1;
        	next_state = (vib_response_valid && (vib_response == VID_INPUT_BRIDGE_RSP_SEND_PACKET_CMPL)) ? MAIN__IDLE : state;
            end



            // EXCEPTION MARKERS ARE LEFT AS PLACEHOLDERS. THE STATEMACHINE IN THE IS_CLK DOMAIN (OTHER SIDE OF THE FIFO)
	    // HANDLES LACK OF DATA FROM EARLY EOP AND EXCESS DATA FROM LATE EOP 
	    // COULD POTENTIALLY ADD THESE STATES AND CREATE SOME REGISTERS TO FLAG THE EVENTS
	    //EXCEPTION__EARLY_EOP : begin              // Handle exceptions
            //
	    //end
	    //EXCEPTION__LATE_EOP : begin              // Handle exceptions
            //
	    //end
            
        endcase
    end
    
    

endmodule

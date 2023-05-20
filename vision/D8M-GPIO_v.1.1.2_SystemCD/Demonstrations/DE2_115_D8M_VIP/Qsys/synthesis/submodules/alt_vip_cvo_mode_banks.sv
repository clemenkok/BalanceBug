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


module alt_vip_cvo_mode_banks
    #(parameter
        USE_CONTROL = 0,
        NO_OF_MODES_INT = 0,
        LOG2_NO_OF_MODES = 0,
        COLOUR_PLANES_ARE_IN_PARALLEL = 0,
        TRS = 0,
        INTERLACED = 0,
        H_ACTIVE_PIXELS = 0,
        F0_LINE_COUNT = 0,
        F1_LINE_COUNT = 0,
        H_FRONT_PORCH = 0,
        H_SYNC_LENGTH = 0,
        H_BLANK_INT = 0,
        V_FRONT_PORCH = 0,
        V_SYNC_LENGTH = 0,
        V_BLANK_INT = 0,
        FIELD0_V_FRONT_PORCH = 0,
        FIELD0_V_SYNC_LENGTH = 0,
        FIELD0_V_BLANK_INT = 0,
        AP_LINE = 0,
        FIELD0_V_RISING_EDGE = 0,
        F_RISING_EDGE = 0,
        F_FALLING_EDGE = 0,
        CONVERT_SEQ_TO_PAR = 0,
        TRS_SEQUENCE = 0,
        TRS_PARALLEL = 0,
        STD_WIDTH = 1,
        ANC_LINE = 0,
        FIELD0_ANC_LINE = 0,
        H_SYNC_POLARITY = 1,
        V_SYNC_POLARITY = 1,
        SRC_WIDTH = 8,
        DST_WIDTH = 8,
        CONTEXT_WIDTH = 8,
        TASK_WIDTH = 8,
        CLOCKS_ARE_SAME = 1

)
    (
    rst,
    clk,
    
    vid_clk,
    vid_rst,
    mode_change_resync, 
    
    // Control writes forwarded from scheduler
    cmd_mode_banks_ready,
    cmd_mode_banks_valid,
    cmd_mode_banks_data,
    cmd_mode_banks_startofpacket,
    cmd_mode_banks_endofpacket,

    // STatus updates returned to control slave via scheduler
    resp_mode_banks_ready,
    resp_mode_banks_valid,
    resp_mode_banks_data,
    resp_mode_banks_startofpacket,
    resp_mode_banks_endofpacket,

    underflow,
    clear_underflow,
    genlocked,
    enable_resync,
        
    //input  wire mode_write,
    find_mode_nxt,
    //input  wire [7:0] reg_address,
    //input  wire [15:0] av_writedata,
    
    // To control
    mode_match_safe,
    dirty_modes,
    mode_change,
    enable, 
    genlock_enable,
    
    // To video output
    vid_std,
    vid_mode_change,
    interlaced_field,
    
    // From video output
    vid_mode_change_ack,
    field_prediction,
    //input  wire [15:0] samples,
    //input  wire [15:0] lines,
    
    // To video output
    interlaced,
    serial_output,
    h_total_minus_one,
    v_total_minus_one,
    ap_line,
    ap_line_end,
    h_blank,
    sav,
    h_sync_start,
    h_sync_end,
    f2_v_start,
    f1_v_start,
    f1_v_end,
    f2_v_sync_start,
    f2_v_sync_end,
    f1_v_sync_start,
    f1_v_sync_end,
    f_rising_edge,
    f_falling_edge,
    f1_v_end_nxt,
    sof_sample,
    sof_line,
    sof_subsample,
    vcoclk_divider_value,
    f2_anc_v_start,
    f1_anc_v_start,
    h_sync_polarity,
    v_sync_polarity,
    status_update_int);
    
localparam REGISTERS_PER_MODE = 26;
    
function integer get_register_address;
    input integer mode;
    input integer register_no;
    begin
        get_register_address = (mode*REGISTERS_PER_MODE)+5+register_no;
    end
endfunction

wire interlaced_rst;
wire serial_output_rst;
wire [15:0] h_total_minus_one_rst;
wire [15:0] v_total_minus_one_rst;
wire [15:0] ap_line_rst;
wire [15:0] ap_line_end_rst;
wire [15:0] h_blank_rst;
wire [15:0] sav_rst;
wire [15:0] h_sync_start_rst;
wire [15:0] h_sync_end_rst;
wire [15:0] f2_v_start_rst;
wire [15:0] f1_v_start_rst;
wire [15:0] f1_v_end_rst;
wire [15:0] f2_v_sync_start_rst;
wire [15:0] f2_v_sync_end_rst;
wire [15:0] f1_v_sync_start_rst;
wire [15:0] f1_v_sync_end_rst;
wire [15:0] f_rising_edge_rst;
wire [15:0] f_falling_edge_rst;
wire [15:0] f2_anc_v_start_rst;
wire [15:0] f1_anc_v_start_rst;
wire h_sync_polarity_rst;
wire v_sync_polarity_rst;
reg [15:0] samples, lines;
reg [3:0] interlaced_field_reg;
wire [15:0] reg_address;
wire [31:0] reg_write_data;
reg clear_underflow_reg;

   import alt_vip_common_pkg::*;

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
   //localparam VIP_CL_VIDEO_INPUT_BRIDGE_CMD          = 0;
   //localparam VIP_CL_STREAM_MARKER_CMD               = 1;    
   //localparam VIP_CL_MODE_BANKS_CMD                  = 2;
   //localparam VIP_CL_CONTROL_SLAVE_CMD               = 3;
   //localparam VIP_CL_VIDEO_INPUT_BRIDGE_RESP         = 4;
   //localparam VIP_CL_CONTROL_SLAVE_RESP              = 5;
   
    // Commands parameters
   localparam VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS    = 2;
   // Response parameters :   
   localparam VIP_CL_MODE_BANKS_RESP_NUM_ARGS        = 1;
   
   // Width of the number_arguments ports
   localparam NUM_ARGS_IN_WIDTH_MODE_BANKS           = alt_clogb2(VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS);

    input   wire rst;
    input   wire clk;
    
    input   wire vid_clk;
    input   wire vid_rst;
    input   wire mode_change_resync;

    // From Scheduler
    output wire cmd_mode_banks_ready;
    input  wire cmd_mode_banks_valid;
    input  wire [AV_ST_DATA_WIDTH - 1:0]  cmd_mode_banks_data;
    input  wire cmd_mode_banks_startofpacket;
    input  wire cmd_mode_banks_endofpacket;

    // From control
    input  wire resp_mode_banks_ready;
    output wire resp_mode_banks_valid;
    output wire [AV_ST_DATA_WIDTH - 1:0]  resp_mode_banks_data;
    output wire resp_mode_banks_startofpacket;
    output wire resp_mode_banks_endofpacket;

    input   wire underflow;
    output  wire clear_underflow;
    input   wire genlocked;
    input   wire enable_resync;
        
    //input  wire mode_write;
    input  wire find_mode_nxt;
    //input  wire [7:0] reg_address;
    //input  wire [15:0] av_writedata;
    
    // To control
    output wire [NO_OF_MODES_INT-1:0] mode_match_safe;
    output wire dirty_modes;
    output wire mode_change;
    output wire enable;
    output wire genlock_enable;
    
    // To video output
    output wire [STD_WIDTH-1:0] vid_std;
    output wire vid_mode_change;
    output wire [3:0] interlaced_field;
    
    // From video output
    input  wire vid_mode_change_ack;
    input  wire field_prediction;
    //input  wire [15:0] samples;
    //input  wire [15:0] lines;
    
    // To video output
    output wire interlaced;
    output wire serial_output;
    output wire [15:0] h_total_minus_one;
    output wire [15:0] v_total_minus_one;
    output wire [15:0] ap_line;
    output wire [15:0] ap_line_end;
    output wire [15:0] h_blank;
    output wire [15:0] sav;
    output wire [15:0] h_sync_start;
    output wire [15:0] h_sync_end;
    output wire [15:0] f2_v_start;
    output wire [15:0] f1_v_start;
    output wire [15:0] f1_v_end;
    output wire [15:0] f2_v_sync_start;
    output wire [15:0] f2_v_sync_end;
    output wire [15:0] f1_v_sync_start;
    output wire [15:0] f1_v_sync_end;
    output wire [15:0] f_rising_edge;
    output wire [15:0] f_falling_edge;
    output wire [15:0] f1_v_end_nxt;
    output wire [13:0] sof_sample;
    output wire [12:0] sof_line;
    output wire [1:0] sof_subsample;
    output wire [13:0] vcoclk_divider_value;
    output wire [15:0] f2_anc_v_start;
    output wire [15:0] f1_anc_v_start;
    output wire  h_sync_polarity;
    output wire  v_sync_polarity;
    output wire  status_update_int;

    wire [15:0] is_f1_v_end_nxt;

// default mode values
alt_vip_cvo_calculate_mode u_calculate_mode(
    .trs(TRS),
    .is_interlaced(INTERLACED),
    .is_serial_output(!COLOUR_PLANES_ARE_IN_PARALLEL),
    .is_sample_count_f0(H_ACTIVE_PIXELS),
    .is_line_count_f0(F0_LINE_COUNT),
    .is_sample_count_f1(H_ACTIVE_PIXELS),
    .is_line_count_f1(F1_LINE_COUNT),
    .is_h_front_porch(H_FRONT_PORCH),
    .is_h_sync_length(H_SYNC_LENGTH),
    .is_h_blank(H_BLANK_INT),
    .is_v_front_porch(V_FRONT_PORCH),
    .is_v_sync_length(V_SYNC_LENGTH),
    .is_v_blank(V_BLANK_INT),
    .is_v1_front_porch(FIELD0_V_FRONT_PORCH),
    .is_v1_sync_length(FIELD0_V_SYNC_LENGTH),
    .is_v1_blank(FIELD0_V_BLANK_INT),
    .is_ap_line(AP_LINE),
    .is_v1_rising_edge(FIELD0_V_RISING_EDGE),
    .is_f_rising_edge(F_RISING_EDGE),
    .is_f_falling_edge(F_FALLING_EDGE),
    .is_anc_line(ANC_LINE),
    .is_v1_anc_line(FIELD0_ANC_LINE),
    .is_h_sync_polarity(H_SYNC_POLARITY),
    .is_v_sync_polarity(V_SYNC_POLARITY),
    
    .interlaced_nxt(interlaced_rst),
    .serial_output_nxt(serial_output_rst),
    .h_total_minus_one_nxt(h_total_minus_one_rst),
    .v_total_minus_one_nxt(v_total_minus_one_rst),
    .ap_line_nxt(ap_line_rst),
    .ap_line_end_nxt(ap_line_end_rst),
    .h_blank_nxt(h_blank_rst),
    .sav_nxt(sav_rst),
    .h_sync_start_nxt(h_sync_start_rst),
    .h_sync_end_nxt(h_sync_end_rst),
    .f2_v_start_nxt(f2_v_start_rst),
    .f1_v_start_nxt(f1_v_start_rst),
    .f1_v_end_nxt(f1_v_end_rst),
    .f2_v_sync_start_nxt(f2_v_sync_start_rst),
    .f2_v_sync_end_nxt(f2_v_sync_end_rst),
    .f1_v_sync_start_nxt(f1_v_sync_start_rst),
    .f1_v_sync_end_nxt(f1_v_sync_end_rst),
    .f_rising_edge_nxt(f_rising_edge_rst),
    .f_falling_edge_nxt(f_falling_edge_rst),
    .f2_anc_v_start_nxt(f2_anc_v_start_rst),
    .f1_anc_v_start_nxt(f1_anc_v_start_rst),
    .total_line_count_f0_nxt(),
    .total_line_count_f1_nxt(),
    .h_sync_polarity(h_sync_polarity_rst),
    .v_sync_polarity(v_sync_polarity_rst));
    
// The control interface has one register bit 0 of which (when set to a 1) 
// enables the ImageStream output.
   // ***  CVO scheduler response Encoder  ***
   logic [DATA_WIDTH - 1 : 0]                       resp_mode_banks_args_in  [0:VIP_CL_MODE_BANKS_RESP_NUM_ARGS -1]; 
   //wire [VIP_CL_MODE_BANKS_RESP_NUM_ARGS-1:0]       resp_mode_banks_arg_count;
   logic                                            mode_banks_resp_valid;
   logic                                            mode_banks_resp_ready;
   logic [TASK_WIDTH-1:0]                           mode_banks_resp;
   
   logic [DATA_WIDTH - 1 : 0]                       cmd_mode_banks_args_out  [0:VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS-1]; 
   wire [VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS-1:0]  cmd_mode_banks_arg_count;
   wire                                             mode_banks_cmd_valid;
   logic                                            mode_banks_cmd_ready;
   logic [TASK_WIDTH-1:0]                           mode_banks_cmd;
   
      
   alt_vip_common_event_packet_encode # (
      .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
      .ELEMENTS_PER_BEAT(1),   
      .NUMBER_OF_ARGUMENTS(VIP_CL_MODE_BANKS_RESP_NUM_ARGS), // Have to specify one as minimum
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
   ) cmd_cvo_scheduler_encoder (
      .clock (clk),
      .reset(rst),
      
      .din_ready(),
      .din_valid(1'b0),
      .din_startofpacket(1'b0),
      .din_endofpacket(1'b0),
      .din_data(1'b0),
      .din_eop_empty(1'b0),
      .din_sop_empty(1'b0),
      
      .av_st_dout_ready(resp_mode_banks_ready), 
      .av_st_dout_valid(resp_mode_banks_valid),
      .av_st_dout_startofpacket(resp_mode_banks_startofpacket),
      .av_st_dout_endofpacket(resp_mode_banks_endofpacket),
      .av_st_dout_data(resp_mode_banks_data),
      
      .arguments_in(resp_mode_banks_args_in),
      .arguments_ready (mode_banks_resp_ready),
      .arguments_valid (mode_banks_resp_valid),
      .number_of_arguments(1'b0), 
      .source_in(8'h0), // Irrelevant with point to point routing
      .destination_in(8'h0), // The command encoder is only connected to the destination component
      .context_in(8'h0), 
      .task_in(8'h0),
      .user_in()
   );

   // ***  Mode Banks Command Decoder  ***
   alt_vip_common_event_packet_decode # (
      .BITS_PER_ELEMENT(AV_ST_CMD_BITS_PER_SYMBOL * AV_ST_CMD_SYMBOLS_PER_BEAT),
      .ELEMENTS_PER_BEAT(1),    
      .NUMBER_OF_ARGUMENTS(VIP_CL_VIDEO_MODE_BANKS_CMD_NUM_ARGS), // Have to specify one as minimum
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
      .clock (clk),
      .reset(rst),

      .av_st_din_ready(cmd_mode_banks_ready),
      .av_st_din_valid(cmd_mode_banks_valid),
      .av_st_din_startofpacket(cmd_mode_banks_startofpacket),
      .av_st_din_endofpacket(cmd_mode_banks_endofpacket),
      .av_st_din_data(cmd_mode_banks_data),

      .dout_ready(), 
      .dout_valid(),
      .dout_startofpacket(),
      .dout_endofpacket(),
      .dout_data(),
      .dout_eop_empty(),
      .dout_sop_empty(),

      .arguments_out(cmd_mode_banks_args_out),
      .arguments_ready (mode_banks_cmd_ready ), 
      .arguments_valid (mode_banks_cmd_valid),
      .source_out(),
      .destination_out(),
      .context_out(), 
      .task_out(mode_banks_cmd), // The "task" is the response
      .user_out()

   );


        logic mode_banks_write;
        //logic clear_interrupts;
        
        assign mode_banks_cmd_ready = 1'b1; // Always ready to receive a register write
        assign mode_banks_write = mode_banks_cmd_ready && mode_banks_cmd_valid;
        assign reg_address = cmd_mode_banks_args_out[0][15:0];
        assign reg_write_data = cmd_mode_banks_args_out[1];
        //assign clear_interrupts = mode_banks_write && (reg_address == 8'd2);

generate
    if(USE_CONTROL) begin
        reg is_valid_mode[NO_OF_MODES_INT-1:0];
        reg is_interlaced[NO_OF_MODES_INT-1:0];
        reg is_serial_output[NO_OF_MODES_INT-1:0];
        reg [15:0] is_sample_count[NO_OF_MODES_INT-1:0];
        reg [15:0] is_line_count_f0[NO_OF_MODES_INT-1:0];
        reg [15:0] is_line_count_f1[NO_OF_MODES_INT-1:0];
        reg [15:0] is_h_front_porch[NO_OF_MODES_INT-1:0];
        reg [15:0] is_h_sync_length[NO_OF_MODES_INT-1:0];
        reg [15:0] is_h_blank[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v_front_porch[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v_sync_length[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v_blank[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v1_front_porch[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v1_sync_length[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v1_blank[NO_OF_MODES_INT-1:0];
        reg [15:0] is_ap_line[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v1_rising_edge[NO_OF_MODES_INT-1:0];
        reg [15:0] is_f_rising_edge[NO_OF_MODES_INT-1:0];
        reg [15:0] is_f_falling_edge[NO_OF_MODES_INT-1:0];
        reg [STD_WIDTH-1:0] is_standard[NO_OF_MODES_INT-1:0];
        reg [13:0] is_sof_sample[NO_OF_MODES_INT-1:0];
        reg [1:0]  is_sof_subsample[NO_OF_MODES_INT-1:0];
        reg [12:0] is_sof_line[NO_OF_MODES_INT-1:0];
        reg [13:0] is_vcoclk_divider_value[NO_OF_MODES_INT-1:0];
        reg [15:0] is_anc_line[NO_OF_MODES_INT-1:0];
        reg [15:0] is_v1_anc_line[NO_OF_MODES_INT-1:0];
        reg is_h_sync_polarity[NO_OF_MODES_INT-1:0];
        reg is_v_sync_polarity[NO_OF_MODES_INT-1:0];
        reg [NO_OF_MODES_INT-1:0] dirty_mode;
        reg [NO_OF_MODES_INT-1:0] mode_match;
        reg [NO_OF_MODES_INT-1:0] mode_match_reg;
        reg find_mode;
        reg dirty_modes_reg;
        
        reg enable_reg;
        
        reg [1:0] interrupt_enable;
        reg status_update_int_reg;
        reg genlocked_reg;
        reg genlocked_int_reg;
        reg [1:0] genlock_enable_reg;
        //reg [NO_OF_MODES_INT-1:0] is_mode_match;
        reg [NO_OF_MODES_INT-1:0]mode_bank_select;
        
        // Changes to the status registers need to be reflected back to the control_slave via the scheduler
        // Status Register             : genlocked,underflow,'b0,enable_resync
        // Interrupt Register          : genlocked_int_reg, status_update_int_reg 'b0;
        // Matched Video Mode Register : mode_match_reg

        // When a status update is completed, store the value for comparison
        // This allows local updates to complete simultaneously when only one register can be updated at a time.
        reg ctrl_slave_genlocked;
        reg ctrl_slave_underflow;
        reg ctrl_slave_enable_resync;
        reg ctrl_slave_genlocked_int_reg;
        reg ctrl_slave_status_update_int_reg;
        reg [NO_OF_MODES_INT-1:0] ctrl_slave_mode_match_reg;

        logic update_ctrl_slave_genlocked;
        logic update_ctrl_slave_underflow;
        logic update_ctrl_slave_enable_resync;
        logic update_ctrl_slave_genlocked_int_reg;
        logic update_ctrl_slave_status_update_int_reg;
        logic update_ctrl_slave_mode_match_reg;

        logic next_ctrl_slave_genlocked;
        logic next_ctrl_slave_underflow;
        logic next_ctrl_slave_enable_resync;
        logic next_ctrl_slave_genlocked_int_reg;
        logic next_ctrl_slave_status_update_int_reg;
        logic next_ctrl_slave_mode_match_reg;

        logic update_ctrl_slave_status;
        logic update_ctrl_slave_interrupt;
        logic update_ctrl_slave_mode_matched;

        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                find_mode <= 1'b0;
                dirty_modes_reg <= 1'b0;
            end else begin
                find_mode <= find_mode_nxt;
                dirty_modes_reg <= |dirty_mode;
            end
        end

        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                // Video Stream Parameters
                samples <= 16'b0; 
                lines <= 16'b0;
                interlaced_field_reg <= 4'b0;
                    // Mode Control Registers
                genlock_enable_reg <= 2'b0;
                interrupt_enable <= 2'b0;
                enable_reg <= 1'b0;
                status_update_int_reg <= 1'b0;
                genlocked_int_reg <= 1'b0;

                //is_mode_match <= {NO_OF_MODES_INT{1'b0}};
                genlocked_reg <= 1'b0;
                clear_underflow_reg <= 1'b0;
                mode_bank_select <= {15'b0, 1'b1};    
            end else begin
                if (mode_banks_write && (mode_banks_cmd == MODE_BANKS_CMD_SEND_MODE_REG)) begin
                    // Common Control registers can be written to irrepsective of selected mode bank
                    {genlock_enable_reg, interrupt_enable, enable_reg} <= (reg_address == 16'd0) ? reg_write_data[15:0] : {genlock_enable_reg, interrupt_enable, enable_reg};
                     clear_underflow_reg   <= ((reg_address == 16'd1 && reg_write_data[2] | clear_underflow_reg) && underflow);
                     status_update_int_reg <= (reg_address == 16'd2 && reg_write_data[1]) ? 1'b0 : ((mode_change | status_update_int_reg) & interrupt_enable[0]);
                     genlocked_int_reg     <= (reg_address == 16'd2 && reg_write_data[2]) ? 1'b0 : (((genlocked ^ genlocked_reg) | genlocked_int_reg)& interrupt_enable[1]);
                     // No writes to 'd3 allowed 
                    mode_bank_select <= (reg_address == 16'd4) ? reg_write_data[15:0] : mode_bank_select;
                end else if (mode_banks_write && (mode_banks_cmd == MODE_BANKS_CMD_SEND_CTRL_PKT)) begin
                    lines   <= cmd_mode_banks_args_out[0][31:16]; 
                    samples <= cmd_mode_banks_args_out[0][15:0]; 
                    interlaced_field_reg <= cmd_mode_banks_args_out[1][3:0];

                end
                genlocked_reg <= genlocked;
                //is_mode_match <= (mode_change) ? mode_match_safe : is_mode_match; // Can use mode_match_reg since already in is_domain
            end    
        end    

        assign status_update_int = status_update_int_reg | genlocked_int_reg;

        //assign samples = cmd_mode_banks_args_out[0][15:0]; 

        genvar i;
        for(i = 0; i < NO_OF_MODES_INT; i = i + 1) begin : is_registers
            always @ (posedge rst or posedge clk) begin
                if(rst) begin
                    // Mode Registers
                    is_valid_mode[i] <= 1'b0;
                    is_interlaced[i] <= 1'b0;
                    is_serial_output[i] <= 1'b0;
                    is_sample_count[i] <= 16'd0;
                    is_line_count_f0[i] <= 16'd0;
                    is_line_count_f1[i] <= 16'd0;
                    is_h_front_porch[i] <= 16'd0;
                    is_h_sync_length[i] <= 16'd0;
                    is_h_blank[i] <= 16'd0;
                    is_v_front_porch[i] <= 16'd0;
                    is_v_sync_length[i] <= 16'd0;
                    is_v_blank[i] <= 16'd0;
                    is_v1_front_porch[i] <= 16'd0;
                    is_v1_sync_length[i] <= 16'd0;
                    is_v1_blank[i] <= 16'd0;
                    is_ap_line[i] <= 16'd0;
                    is_v1_rising_edge[i] <= 16'd0;
                    is_f_rising_edge[i] <= 16'd0;
                    is_f_falling_edge[i] <= 16'd0;
                    is_standard[i] <= {STD_WIDTH{1'b0}};
                    is_sof_sample[i] <= 14'd0;
                    is_sof_subsample[i] <= 2'd0;
                    is_sof_line[i] <= 13'd0;
                    is_vcoclk_divider_value[i] <= 14'd0;
                    is_anc_line[i] <= 16'd0;
                    is_v1_anc_line[i] <= 16'd0;
                    is_h_sync_polarity[i] <= 1'b1;
                    is_v_sync_polarity[i] <= 1'b1;
                    dirty_mode[i] <= 1'b0;
                    mode_match[i] <= 1'b0;
                end else begin
                    if (mode_banks_write && (mode_banks_cmd == MODE_BANKS_CMD_SEND_MODE_REG)) begin
                        // Mode Bank Registers can only be written to when that bank has been selected with a write to the mode_bank_select register
                        // Because the mode banks are selected by mode_bank_select, the get_register_address mod eparameter has been fixed to 0
                        // The registers may be returned to full address map style addressing so the call is left for quick re-deployment.
                        if (mode_bank_select[i] == 1'b1) begin
                            if(~is_valid_mode[i]) begin
                                if(reg_address == get_register_address(0, 0)) begin
                                    is_interlaced[i] <= reg_write_data[0];
                                    if(CONVERT_SEQ_TO_PAR)
                                        is_serial_output[i] <= reg_write_data[1];
                                    else
                                        is_serial_output[i] <= serial_output_rst;
                                end
                                is_sample_count[i] <= (reg_address == get_register_address(0, 1)) ? reg_write_data : is_sample_count[i];
                                is_line_count_f0[i] <= (reg_address == get_register_address(0, 2)) ? reg_write_data : is_line_count_f0[i];
                                is_line_count_f1[i] <= (reg_address == get_register_address(0, 3)) ? reg_write_data : is_line_count_f1[i];
                                is_h_front_porch[i] <= (reg_address == get_register_address(0, 4)) ? reg_write_data : is_h_front_porch[i];
                                is_h_sync_length[i] <= (reg_address == get_register_address(0, 5)) ? reg_write_data : is_h_sync_length[i];
                                is_h_blank[i] <= (reg_address == get_register_address(0, 6)) ? reg_write_data : is_h_blank[i];
                                is_v_front_porch[i] <= (reg_address == get_register_address(0, 7)) ? reg_write_data : is_v_front_porch[i];
                                is_v_sync_length[i] <= (reg_address == get_register_address(0, 8)) ? reg_write_data : is_v_sync_length[i];
                                is_v_blank[i] <= (reg_address == get_register_address(0, 9)) ? reg_write_data : is_v_blank[i];
                                is_v1_front_porch[i] <= (reg_address == get_register_address(0, 10)) ? reg_write_data : is_v1_front_porch[i];
                                is_v1_sync_length[i] <= (reg_address == get_register_address(0, 11)) ? reg_write_data : is_v1_sync_length[i];
                                is_v1_blank[i] <= (reg_address == get_register_address(0, 12)) ? reg_write_data : is_v1_blank[i];
                                is_ap_line[i] <= (reg_address == get_register_address(0, 13)) ? reg_write_data : is_ap_line[i];
                                is_v1_rising_edge[i] <= (reg_address == get_register_address(0, 14)) ? reg_write_data : is_v1_rising_edge[i];
                                is_f_rising_edge[i] <= (reg_address == get_register_address(0, 15)) ? reg_write_data : is_f_rising_edge[i];
                                is_f_falling_edge[i] <= (reg_address == get_register_address(0, 16)) ? reg_write_data : is_f_falling_edge[i];
                                is_standard[i] <= (reg_address == get_register_address(0, 17)) ? reg_write_data[STD_WIDTH-1:0] : is_standard[i];
                                if(reg_address == get_register_address(0, 18)) begin
                                    is_sof_sample[i] <= reg_write_data[15:2];
                                    is_sof_subsample[i] <= reg_write_data[1:0];
                                end
                                is_sof_line[i] <= (reg_address == get_register_address(0, 19)) ? reg_write_data[12:0] : is_sof_line[i];
                                is_vcoclk_divider_value[i] <= (reg_address == get_register_address(0, 20)) ? reg_write_data[13:0] : is_vcoclk_divider_value[i];
                                is_anc_line[i] <= (reg_address == get_register_address(0, 21)) ? reg_write_data[15:0] : is_anc_line[i];
                                is_v1_anc_line[i] <= (reg_address == get_register_address(0, 22)) ? reg_write_data[15:0] : is_v1_anc_line[i];
                                is_h_sync_polarity[i] <= (reg_address == get_register_address(0, 23)) ? reg_write_data[0] : is_h_sync_polarity[i];
                                is_v_sync_polarity[i] <= (reg_address == get_register_address(0, 24)) ? reg_write_data[0] : is_v_sync_polarity[i];

                            end
                            is_valid_mode[i] <= (reg_address == get_register_address(0, 25)) ? reg_write_data[0] : is_valid_mode[i];
                        end
                    end 

                    dirty_mode[i] <= (mode_banks_write && reg_address == get_register_address(0, 25) && reg_write_data[0]) || (dirty_mode[i] && ~mode_change);
                    
                    mode_match[i] <= ({interlaced_field_reg[3], field_prediction} == 2'b11) ? is_valid_mode[i] & is_interlaced[i] & samples == is_sample_count[i] & lines == is_line_count_f1[i] : // f1
                                     ({interlaced_field_reg[3], field_prediction} == 2'b10) ? is_valid_mode[i] & is_interlaced[i] & samples == is_sample_count[i] & lines == is_line_count_f0[i] : // f0
                                                                        is_valid_mode[i] & samples == is_sample_count[i] & lines == is_line_count_f0[i]; // progressive
                end
            end
        end
        
        assign dirty_modes = dirty_modes_reg;
        assign clear_underflow = clear_underflow_reg;
        
        wire interlaced_nxt;
        wire serial_output_nxt;
        wire [15:0] h_total_minus_one_nxt;
        wire [15:0] v_total_minus_one_nxt;
        wire [15:0] ap_line_nxt;
        wire [15:0] ap_line_end_nxt;
        wire [15:0] h_blank_nxt;
        wire [15:0] sav_nxt;
        wire [15:0] h_sync_start_nxt;
        wire [15:0] h_sync_end_nxt;
        wire [15:0] f2_v_start_nxt;
        wire [15:0] f1_v_start_nxt;
        wire [15:0] f2_v_sync_start_nxt;
        wire [15:0] f2_v_sync_end_nxt;
        wire [15:0] f1_v_sync_start_nxt;
        wire [15:0] f1_v_sync_end_nxt;
        wire [15:0] f_rising_edge_nxt;
        wire [15:0] f_falling_edge_nxt;
        wire [15:0] f2_anc_v_start_nxt;
        wire [15:0] f1_anc_v_start_nxt;
        wire h_sync_polarity_nxt;
        wire v_sync_polarity_nxt;
        
        reg interlaced_reg;
        reg serial_output_reg;
        reg [15:0] h_total_minus_one_reg;
        reg [15:0] v_total_minus_one_reg;
        reg [15:0] ap_line_reg;
        reg [15:0] ap_line_end_reg;
        reg [15:0] h_blank_reg;
        reg [15:0] sav_reg;
        reg [15:0] h_sync_start_reg;
        reg [15:0] h_sync_end_reg;
        reg [15:0] f2_v_start_reg;
        reg [15:0] f1_v_start_reg;
        reg [15:0] f1_v_end_reg;
        reg [15:0] f2_v_sync_start_reg;
        reg [15:0] f2_v_sync_end_reg;
        reg [15:0] f1_v_sync_start_reg;
        reg [15:0] f1_v_sync_end_reg;
        reg [15:0] f_rising_edge_reg;
        reg [15:0] f_falling_edge_reg;
        reg [STD_WIDTH-1:0] standard_reg;
        reg [13:0] sof_sample_reg;
        reg [1:0]  sof_subsample_reg;
        reg [12:0] sof_line_reg;
        reg [13:0] vcoclk_divider_value_reg;
        reg [15:0] f2_anc_v_start_reg;
        reg [15:0] f1_anc_v_start_reg;
        reg h_sync_polarity_reg;
        reg v_sync_polarity_reg;
        
        wire [LOG2_NO_OF_MODES-1:0] mode;
        reg mode_change_reg;
        
        if(NO_OF_MODES_INT > 1) begin
            // If more than 1 mode matches the lowest indexed takes precidence
            assign mode_match_safe[0] = mode_match[0];
            for(i = 1; i < NO_OF_MODES_INT; i = i + 1) begin : is_registers
                assign mode_match_safe[i] = mode_match[i] & ~|mode_match[i-1:0];
            end
            
            alt_vip_common_to_binary u_to_binary(
                .one_hot(mode_match_safe[NO_OF_MODES_INT-1:1]),
                .binary(mode)
            );

                        defparam u_to_binary.NO_OF_MODES = NO_OF_MODES_INT - 1,
                                 u_to_binary.LOG2_NO_OF_MODES = LOG2_NO_OF_MODES;
        end else begin
            assign mode = 1'b0;
            assign mode_match_safe = mode_match;
        end
        
        assign mode_change = find_mode & |mode_match_safe & (|(mode_match_safe ^ mode_match_reg) | dirty_mode[mode]);
        assign enable = enable_reg;
        assign genlock_enable = genlock_enable_reg;
        assign vid_mode_change = mode_change_reg;
        
        wire [3:0] trs_mux;
        assign trs_mux = (is_serial_output[mode]) ? TRS_SEQUENCE : TRS_PARALLEL;
        
        alt_vip_cvo_calculate_mode u_calculate_mode_dynamic(
            .trs(trs_mux),
            .is_interlaced(is_interlaced[mode]),
            .is_serial_output(is_serial_output[mode]),
            .is_sample_count_f0(is_sample_count[mode]),
            .is_line_count_f0(is_line_count_f0[mode]),
            .is_sample_count_f1(is_sample_count[mode]),
            .is_line_count_f1(is_line_count_f1[mode]),
            .is_h_front_porch(is_h_front_porch[mode]),
            .is_h_sync_length(is_h_sync_length[mode]),
            .is_h_blank(is_h_blank[mode]),
            .is_v_front_porch(is_v_front_porch[mode]),
            .is_v_sync_length(is_v_sync_length[mode]),
            .is_v_blank(is_v_blank[mode]),
            .is_v1_front_porch(is_v1_front_porch[mode]),
            .is_v1_sync_length(is_v1_sync_length[mode]),
            .is_v1_blank(is_v1_blank[mode]),
            .is_ap_line(is_ap_line[mode]),
            .is_v1_rising_edge(is_v1_rising_edge[mode]),
            .is_f_rising_edge(is_f_rising_edge[mode]),
            .is_f_falling_edge(is_f_falling_edge[mode]),
            .is_anc_line(is_anc_line[mode]),
            .is_v1_anc_line(is_v1_anc_line[mode]),
            .is_h_sync_polarity(is_h_sync_polarity[mode]),
            .is_v_sync_polarity(is_v_sync_polarity[mode]),
            
        
            .interlaced_nxt(interlaced_nxt),
            .serial_output_nxt(serial_output_nxt),
            .h_total_minus_one_nxt(h_total_minus_one_nxt),
            .v_total_minus_one_nxt(v_total_minus_one_nxt),
            .ap_line_nxt(ap_line_nxt),
            .ap_line_end_nxt(ap_line_end_nxt),
            .h_blank_nxt(h_blank_nxt),
            .sav_nxt(sav_nxt),
            .h_sync_start_nxt(h_sync_start_nxt),
            .h_sync_end_nxt(h_sync_end_nxt),
            .f2_v_start_nxt(f2_v_start_nxt),
            .f1_v_start_nxt(f1_v_start_nxt),
            .f1_v_end_nxt(is_f1_v_end_nxt),
            .f2_v_sync_start_nxt(f2_v_sync_start_nxt),
            .f2_v_sync_end_nxt(f2_v_sync_end_nxt),
            .f1_v_sync_start_nxt(f1_v_sync_start_nxt),
            .f1_v_sync_end_nxt(f1_v_sync_end_nxt),
            .f_rising_edge_nxt(f_rising_edge_nxt),
            .f_falling_edge_nxt(f_falling_edge_nxt),
            .f2_anc_v_start_nxt(f2_anc_v_start_nxt),
            .f1_anc_v_start_nxt(f1_anc_v_start_nxt),
            .h_sync_polarity(h_sync_polarity_nxt),
            .v_sync_polarity(v_sync_polarity_nxt));

        // Clock Crossing Handshake
        // Registers may only change on rising edge of mode-change
        // mode_change is resynchronised to vid_clock domain to enable safe registering in vid domain
        // The vid_mode_change is then resynchronised to the is-domain and passed back as vid_mode_change_ack
        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                mode_change_reg <= 1'b0;
            end else begin
                if (mode_change) begin
                    mode_change_reg <= mode_change;
                end else if(vid_mode_change_ack) begin
                    mode_change_reg <= 1'b0;
                end
            end
        end
        
        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                mode_match_reg <= {NO_OF_MODES_INT{1'b0}};
                interlaced_reg <= interlaced_rst;
                serial_output_reg <= serial_output_rst;
                h_total_minus_one_reg <= h_total_minus_one_rst;
                v_total_minus_one_reg <= v_total_minus_one_rst;
                ap_line_reg <= ap_line_rst;
                ap_line_end_reg <= ap_line_end_rst;
                h_blank_reg <= h_blank_rst;
                sav_reg <= sav_rst;
                h_sync_start_reg <= h_sync_start_rst;
                h_sync_end_reg <= h_sync_end_rst;
                f2_v_start_reg <= f2_v_start_rst;
                f1_v_start_reg <= f1_v_start_rst;
                f1_v_end_reg <= f1_v_end_rst;
                f2_v_sync_start_reg <= f2_v_sync_start_rst;
                f2_v_sync_end_reg <= f2_v_sync_end_rst;
                f1_v_sync_start_reg <= f1_v_sync_start_rst;
                f1_v_sync_end_reg <= f1_v_sync_end_rst;
                f_rising_edge_reg <= f_rising_edge_rst;
                f_falling_edge_reg <= f_falling_edge_rst;
                standard_reg <= {STD_WIDTH{1'b0}};
                sof_sample_reg <= 14'd0;
                sof_subsample_reg <= 2'd0;
                sof_line_reg <= 13'd0;
                vcoclk_divider_value_reg <= 14'd0;
                f2_anc_v_start_reg <= f2_anc_v_start_rst;
                f1_anc_v_start_reg <= f1_anc_v_start_rst;
                h_sync_polarity_reg <= h_sync_polarity_rst;
                v_sync_polarity_reg <= v_sync_polarity_rst;
                
            end else begin
                mode_match_reg <= (mode_change) ? mode_match_safe : mode_match_reg;
                
                
                
                // Registers are only updated on the rising edge of mode_change
                // This is to ensure they are held steady long enough for the clock crossing into the video domain
                if(mode_change && !mode_change_reg) begin
                    interlaced_reg <= interlaced_nxt;
                    serial_output_reg = serial_output_nxt;

                    // counter wrapping
                    h_total_minus_one_reg <= h_total_minus_one_nxt;
                    v_total_minus_one_reg <= v_total_minus_one_nxt;

                    // line numbering
                    ap_line_reg <= ap_line_nxt;
                    ap_line_end_reg <= ap_line_end_nxt;

                    // horizontal blanking end
                    h_blank_reg <= h_blank_nxt;
                    sav_reg <= sav_nxt;

                    // horizontal sync start & end
                    h_sync_start_reg <= h_sync_start_nxt;
                    h_sync_end_reg <= h_sync_end_nxt;

                    // f2 vertical blanking start
                    f2_v_start_reg <= f2_v_start_nxt;

                    // f1 vertical blanking start & end
                    f1_v_start_reg <= f1_v_start_nxt;
                    f1_v_end_reg <= is_f1_v_end_nxt;

                    // f2 vertical sync start & end
                    f2_v_sync_start_reg <= f2_v_sync_start_nxt;
                    f2_v_sync_end_reg <= f2_v_sync_end_nxt;

                    // f1 vertical sync start and end
                    f1_v_sync_start_reg <= f1_v_sync_start_nxt;
                    f1_v_sync_end_reg <= f1_v_sync_end_nxt;

                    // f rising edge
                    f_rising_edge_reg <= f_rising_edge_nxt;
                    f_falling_edge_reg <= f_falling_edge_nxt;
                    
                    // for sync generation
                    standard_reg <= is_standard[mode];
                    sof_sample_reg <= is_sof_sample[mode];
                    sof_subsample_reg <= is_sof_subsample[mode];
                    sof_line_reg <= is_sof_line[mode];
                    vcoclk_divider_value_reg <= is_vcoclk_divider_value[mode];
                    
                    // ancilliary data position
                    f2_anc_v_start_reg <= f2_anc_v_start_nxt;
                    f1_anc_v_start_reg <= f1_anc_v_start_nxt;

                    // sync polarity
                    h_sync_polarity_reg <= h_sync_polarity_nxt;
                    v_sync_polarity_reg <= v_sync_polarity_nxt;
                end
            end
        end
        
        assign update_ctrl_slave_genlocked_int_reg = ctrl_slave_genlocked_int_reg ^ genlocked_int_reg;
        assign update_ctrl_slave_status_update_int_reg = ctrl_slave_status_update_int_reg ^ status_update_int_reg;
        assign update_ctrl_slave_mode_match_reg = ctrl_slave_mode_match_reg ^ mode_match_reg;

        assign update_ctrl_slave_status = update_ctrl_slave_genlocked | update_ctrl_slave_underflow | update_ctrl_slave_enable_resync;
        assign update_ctrl_slave_interrupt = update_ctrl_slave_genlocked_int_reg | update_ctrl_slave_status_update_int_reg;
        assign update_ctrl_slave_mode_matched = |update_ctrl_slave_mode_match_reg;
 
        // Check for differences between local reg value and value sent to control slave
        assign update_ctrl_slave_genlocked = ctrl_slave_genlocked ^ genlocked;
        assign update_ctrl_slave_underflow = ctrl_slave_underflow ^ underflow;
        assign update_ctrl_slave_enable_resync = ctrl_slave_enable_resync ^ enable_resync;
        
        // Generate responses for scheduler and updates for local store of ctrl_slave registers
        always @* begin
            // Default assignments to hold value
            next_ctrl_slave_genlocked <= ctrl_slave_genlocked;
            next_ctrl_slave_underflow <= ctrl_slave_underflow;
            next_ctrl_slave_enable_resync <= ctrl_slave_enable_resync;
            next_ctrl_slave_genlocked_int_reg <= ctrl_slave_genlocked_int_reg;
            next_ctrl_slave_status_update_int_reg <= ctrl_slave_status_update_int_reg;
            next_ctrl_slave_mode_match_reg <= ctrl_slave_mode_match_reg;
            mode_banks_resp_valid <= 1'b0;
            resp_mode_banks_args_in[0] <= 32'b0; // NOTE : If VIP_CL_MODE_BANKS_RESP_NUM_ARGS is increased from 1, this array should be assigned in a loop
            
            // Issue status updates in simple register order priority
            if (update_ctrl_slave_status) begin
                resp_mode_banks_args_in[0][15:0] <= 16'd1; // Addr
                resp_mode_banks_args_in[0][31:16] <= {{12{1'b0}}, genlocked,
                                                                 underflow,
                                                                 1'b0,
                                                                 enable_resync};
                mode_banks_resp_valid <= 1'b1;

                next_ctrl_slave_genlocked <= genlocked;
                next_ctrl_slave_underflow <= underflow;
                next_ctrl_slave_enable_resync <= enable_resync;
            end else 
            if (update_ctrl_slave_interrupt) begin 
                resp_mode_banks_args_in[0][15:0] <= 16'd2; // Addr
                resp_mode_banks_args_in[0][31:16] <= {{13{1'b0}}, genlocked_int_reg,status_update_int_reg, 1'b0};       
                mode_banks_resp_valid <= 1'b1;

                next_ctrl_slave_genlocked_int_reg <= genlocked_int_reg;
                next_ctrl_slave_status_update_int_reg <= status_update_int_reg;
            end else 
            if (update_ctrl_slave_mode_matched) begin
                resp_mode_banks_args_in[0][15:0] <= 16'd3; // Addr
                resp_mode_banks_args_in[0][31:16] <= mode_match_reg;
                mode_banks_resp_valid <= 1'b1;

                next_ctrl_slave_mode_match_reg <= mode_match_reg;
            end
        end

         always @ (posedge rst or posedge clk) begin
             if(rst) begin
                 ctrl_slave_genlocked <= 1'b0;
                 ctrl_slave_underflow <= 1'b0;
                 ctrl_slave_enable_resync <= 1'b0;
                 ctrl_slave_genlocked_int_reg <= 1'b0;
                 ctrl_slave_status_update_int_reg <= 1'b0;
                 ctrl_slave_mode_match_reg <= 'b0;
             end else begin
                 // Only register changes to the ctrl_slave registers when scheduler accepts response
                 if (mode_banks_resp_ready && mode_banks_resp_valid) begin
                     ctrl_slave_genlocked <= next_ctrl_slave_genlocked;
                     ctrl_slave_underflow <= next_ctrl_slave_underflow;
                     ctrl_slave_enable_resync <= next_ctrl_slave_enable_resync;
                     ctrl_slave_genlocked_int_reg <= next_ctrl_slave_genlocked_int_reg;
                     ctrl_slave_status_update_int_reg <= next_ctrl_slave_status_update_int_reg;
                     ctrl_slave_mode_match_reg <= next_ctrl_slave_mode_match_reg;                
                 end
             end
         end
     //assign resp_mode_banks_arg_count  <= mode_banks_rsp_arg_count_func(ModeBanksRsp_t(MODE_BANKS_RSP_UPDATE_STATUS));
     
        if (CLOCKS_ARE_SAME == 0) begin
            // Clock crossing registers
            reg [STD_WIDTH-1:0] vid_standard;
            reg [3:0] vid_interlaced_field;
            reg vid_interlaced;
            reg vid_serial_output;
            reg [15:0] vid_h_total_minus_one, vid_h_total_minus_two;
            reg [15:0] vid_h_total;
            reg [15:0] vid_h_total_check;
            reg [15:0] vid_v_total_minus_one;
            reg [15:0] vid_v_total;
            reg [15:0] vid_ap_line;
            reg [15:0] vid_ap_line_end;
            reg [15:0] vid_h_blank;
            reg [15:0] vid_sav;
            reg [15:0] vid_h_sync_start;
            reg [15:0] vid_h_sync_end;
            reg [15:0] vid_f2_v_start;
            reg [15:0] vid_f1_v_start;
            reg [15:0] vid_f1_v_end;
            reg [15:0] vid_f2_v_sync_start;
            reg [15:0] vid_f2_v_sync_end;
            reg [15:0] vid_f1_v_sync_start;
            reg [15:0] vid_f1_v_sync_end;
            reg [15:0] vid_f_rising_edge;
            reg [15:0] vid_f_falling_edge;
            reg [15:0] vid_f1_v_end_nxt;
            reg [13:0] vid_sof_sample;
            reg [12:0] vid_sof_line;
            reg [1:0]  vid_sof_subsample;
            reg [13:0] vid_vcoclk_divider_value;
            reg [15:0] vid_f2_anc_v_start;
            reg [15:0] vid_f1_anc_v_start;
            reg        vid_h_sync_polarity;
            reg        vid_v_sync_polarity;
            reg        mode_change_resync_reg;

            // Resynchronise the mode bank registers into the vid clock domain where they are used
            // The single bit mode change is resynchronised and used to enable registering
            // This should guarantee that the mode registers have settled for sampling
            // The mode change is then fed back to the is_clk domain and resynchronised to 
            // enable the next change
            always @ (posedge vid_rst or posedge vid_clk) begin
                if(vid_rst) begin
                    vid_standard             <= {STD_WIDTH{1'b0}};
                    vid_interlaced_field     <= 4'b0;
                    vid_interlaced           <= interlaced_rst;
                    vid_serial_output        <= serial_output_rst;
                    vid_h_total_minus_one    <= h_total_minus_one_rst;
                    vid_v_total_minus_one    <= v_total_minus_one_rst;
                    vid_ap_line              <= ap_line_rst;
                    vid_ap_line_end          <= ap_line_end_rst;
                    vid_h_blank              <= h_blank_rst;
                    vid_sav                  <= sav_rst;
                    vid_h_sync_start         <= h_sync_start_rst;
                    vid_h_sync_end           <= h_sync_end_rst;
                    vid_f2_v_start           <= f2_v_start_rst;
                    vid_f1_v_start           <= f1_v_start_rst;
                    vid_f1_v_end             <= f1_v_end_rst;
                    vid_f2_v_sync_start      <= f2_v_sync_start_rst;
                    vid_f2_v_sync_end        <= f2_v_sync_end_rst;
                    vid_f1_v_sync_start      <= f1_v_sync_start_rst;
                    vid_f1_v_sync_end        <= f1_v_sync_end_rst;
                    vid_f_rising_edge        <= f_rising_edge_rst;
                    vid_f_falling_edge       <= f_falling_edge_rst;
                    vid_f1_v_end_nxt         <= f1_v_end_rst;
                    vid_sof_sample           <= 14'd0;
                    vid_sof_line             <= 13'd0;
                    vid_sof_subsample        <= 2'd0;
                    vid_vcoclk_divider_value <= 14'd0;
                    vid_f2_anc_v_start       <= f2_anc_v_start_rst;
                    vid_f1_anc_v_start       <= f1_anc_v_start_rst;
                    vid_h_sync_polarity      <= h_sync_polarity_rst;
                    vid_v_sync_polarity      <= v_sync_polarity_rst;                     

                    mode_change_resync_reg <= 1'b0;

                end else begin
                    // Rising edge of mode_change_resync indicates registers are steady and not about to change
                    if (mode_change_resync && !mode_change_resync_reg) begin
                        vid_standard             <= standard_reg;
                        vid_interlaced_field     <= interlaced_field_reg;
                        vid_interlaced           <= interlaced_reg;
                        vid_serial_output        <= serial_output_reg;
                        vid_h_total_minus_one    <= h_total_minus_one_reg;
                        vid_v_total_minus_one    <= v_total_minus_one_reg;
                        vid_ap_line              <= ap_line_reg;
                        vid_ap_line_end          <= ap_line_end_reg;
                        vid_h_blank              <= h_blank_reg;
                        vid_sav                  <= sav_reg;
                        vid_h_sync_start         <= h_sync_start_reg;
                        vid_h_sync_end           <= h_sync_end_reg;
                        vid_f2_v_start           <= f2_v_start_reg;
                        vid_f1_v_start           <= f1_v_start_reg;
                        vid_f1_v_end             <= f1_v_end_reg;
                        vid_f2_v_sync_start      <= f2_v_sync_start_reg;
                        vid_f2_v_sync_end        <= f2_v_sync_end_reg;
                        vid_f1_v_sync_start      <= f1_v_sync_start_reg;
                        vid_f1_v_sync_end        <= f1_v_sync_end_reg;
                        vid_f_rising_edge        <= f_rising_edge_reg;
                        vid_f_falling_edge       <= f_falling_edge_reg;
                        vid_f1_v_end_nxt         <= is_f1_v_end_nxt;
                        vid_sof_sample           <= sof_sample_reg;
                        vid_sof_line             <= sof_line_reg;
                        vid_sof_subsample        <= sof_subsample_reg;
                        vid_vcoclk_divider_value <= vcoclk_divider_value_reg;
                        vid_f2_anc_v_start       <= f2_anc_v_start_reg;
                        vid_f1_anc_v_start       <= f1_anc_v_start_reg;
                        vid_h_sync_polarity      <= h_sync_polarity_reg;
                        vid_v_sync_polarity      <= v_sync_polarity_reg;                     
                    end

                    mode_change_resync_reg <= mode_change_resync;

                end
            end

            assign f1_v_end_nxt = vid_f1_v_end_nxt;
            assign vid_std = vid_standard;
            assign interlaced_field = vid_interlaced_field;
            
            assign interlaced = vid_interlaced;
            assign serial_output = vid_serial_output;

            // counter wrapping
            assign h_total_minus_one = vid_h_total_minus_one;
            assign v_total_minus_one = vid_v_total_minus_one;

            // line numbering
            assign ap_line = vid_ap_line;
            assign ap_line_end = vid_ap_line_end;

            // horizontal blanking end
            assign h_blank = vid_h_blank;
            assign sav = vid_sav;

            // horizontal sync start & end
            assign h_sync_start = vid_h_sync_start;
            assign h_sync_end = vid_h_sync_end;

            // f2 vertical blanking start
            assign f2_v_start = vid_f2_v_start;

            // f1 vertical blanking start & end
            assign f1_v_start = vid_f1_v_start;
            assign f1_v_end = vid_f1_v_end;

            // f2 vertical sync start & end
            assign f2_v_sync_start = vid_f2_v_sync_start;
            assign f2_v_sync_end = vid_f2_v_sync_end;

            // f1 vertical blanking start and end
            assign f1_v_sync_start = vid_f1_v_sync_start;
            assign f1_v_sync_end = vid_f1_v_sync_end;

            // f rising edge
            assign f_rising_edge = vid_f_rising_edge;
            assign f_falling_edge = vid_f_falling_edge;

            // for sync generation
            assign sof_sample = vid_sof_sample;
            assign sof_subsample = vid_sof_subsample;
            assign sof_line = vid_sof_line;
            assign vcoclk_divider_value = vid_vcoclk_divider_value;

            // ancilliary data position
            assign f2_anc_v_start = vid_f2_anc_v_start;
            assign f1_anc_v_start = vid_f1_anc_v_start;

            // sync polarity 
            assign h_sync_polarity = vid_h_sync_polarity;
            assign v_sync_polarity = vid_v_sync_polarity;

        end else begin
            // No clock crossing so output selected mode bank directly.
            assign f1_v_end_nxt = is_f1_v_end_nxt;
            assign vid_std = standard_reg;
            assign interlaced_field = interlaced_field_reg;

            assign interlaced = interlaced_reg;
            assign serial_output = serial_output_reg;

            // counter wrapping
            assign h_total_minus_one = h_total_minus_one_reg;
            assign v_total_minus_one = v_total_minus_one_reg;

            // line numbering
            assign ap_line = ap_line_reg;
            assign ap_line_end = ap_line_end_reg;

            // horizontal blanking end
            assign h_blank = h_blank_reg;
            assign sav = sav_reg;

            // horizontal sync start & end
            assign h_sync_start = h_sync_start_reg;
            assign h_sync_end = h_sync_end_reg;

            // f2 vertical blanking start
            assign f2_v_start = f2_v_start_reg;

            // f1 vertical blanking start & end
            assign f1_v_start = f1_v_start_reg;
            assign f1_v_end = f1_v_end_reg;

            // f2 vertical sync start & end
            assign f2_v_sync_start = f2_v_sync_start_reg;
            assign f2_v_sync_end = f2_v_sync_end_reg;

            // f1 vertical blanking start and end
            assign f1_v_sync_start = f1_v_sync_start_reg;
            assign f1_v_sync_end = f1_v_sync_end_reg;

            // f rising edge
            assign f_rising_edge = f_rising_edge_reg;
            assign f_falling_edge = f_falling_edge_reg;

            // for sync generation
            assign sof_sample = sof_sample_reg;
            assign sof_subsample = sof_subsample_reg;
            assign sof_line = sof_line_reg;
            assign vcoclk_divider_value = vcoclk_divider_value_reg;

            // ancilliary data position
            assign f2_anc_v_start = f2_anc_v_start_reg;
            assign f1_anc_v_start = f1_anc_v_start_reg;

            // sync polarity 
            assign h_sync_polarity = h_sync_polarity_reg;
            assign v_sync_polarity = v_sync_polarity_reg;

        end     
     
    end else begin // USE_CONTROL Not set
        assign mode_change = 1'b0;
        assign enable = 1'b1;
        assign genlock_enable = 2'b00;
        assign vid_std = {STD_WIDTH{1'b0}};
        assign vid_mode_change = 1'b0;
        assign interlaced_field = 4'b0;
        assign dirty_modes = 1'b0;
        assign clear_underflow = 1'b0;
        
        assign interlaced = interlaced_rst;
        assign serial_output = serial_output_rst;

        // counter wrapping
        assign h_total_minus_one = h_total_minus_one_rst;
        assign v_total_minus_one = v_total_minus_one_rst;

        // line numbering
        assign ap_line = ap_line_rst;
        assign ap_line_end = ap_line_end_rst;

        // horizontal blanking end
        assign h_blank = h_blank_rst;
        assign sav = sav_rst;

        // horizontal sync start & end
        assign h_sync_start = h_sync_start_rst;
        assign h_sync_end = h_sync_end_rst;

        // f2 vertical blanking start
        assign f2_v_start = f2_v_start_rst;

        // f1 vertical blanking start & end
        assign f1_v_start = f1_v_start_rst;
        assign f1_v_end = f1_v_end_rst;
        assign f1_v_end_nxt = f1_v_end_rst;

        // f2 vertical sync start & end
        assign f2_v_sync_start = f2_v_sync_start_rst;
        assign f2_v_sync_end = f2_v_sync_end_rst;

        // f1 vertical blanking start and end
        assign f1_v_sync_start = f1_v_sync_start_rst;
        assign f1_v_sync_end = f1_v_sync_end_rst;

        // f rising edge
        assign f_rising_edge = f_rising_edge_rst;
        assign f_falling_edge = f_falling_edge_rst;
        
        // for sync generation
        assign sof_sample = 14'd0;
        assign sof_subsample = 2'd0;
        assign sof_line = 13'd0;
        assign vcoclk_divider_value = 14'd0;
        
        // ancilliary data position
        assign f2_anc_v_start = f2_anc_v_start_rst;
        assign f1_anc_v_start = f1_anc_v_start_rst;
        
        // sync polarity 
        assign h_sync_polarity = h_sync_polarity_rst;
        assign v_sync_polarity = v_sync_polarity_rst;
        
        // this signal is not used in this mode
        assign mode_match_safe = {NO_OF_MODES_INT{1'b0}};
        
        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                // Video Stream Parameters
                //samples <= 16'b0; 
                lines <= 16'b0;
                interlaced_field_reg <= 4'b0;
            end else begin
                if (mode_banks_write && (mode_banks_cmd == MODE_BANKS_CMD_SEND_CTRL_PKT)) begin
                    lines   <= cmd_mode_banks_args_out[0][31:16]; 
                    //samples <= cmd_mode_banks_args_out[0][15:0]; 
                    interlaced_field_reg <= cmd_mode_banks_args_out[1][3:0];
                end
            end
        end

        assign status_update_int = 1'b0;

    end
            
endgenerate


endmodule

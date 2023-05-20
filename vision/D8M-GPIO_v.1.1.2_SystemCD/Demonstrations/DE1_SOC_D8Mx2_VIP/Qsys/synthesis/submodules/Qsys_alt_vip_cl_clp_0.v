// Qsys_alt_vip_cl_clp_0.v

// This file was auto-generated from alt_vip_cl_clp_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 15.0 145

`timescale 1 ps / 1 ps
module Qsys_alt_vip_cl_clp_0 #(
		parameter MAX_IN_WIDTH                 = 1920,
		parameter MAX_IN_HEIGHT                = 1080,
		parameter BITS_PER_SYMBOL              = 8,
		parameter PIXELS_IN_PARALLEL           = 1,
		parameter NUMBER_OF_COLOR_PLANES       = 3,
		parameter COLOR_PLANES_ARE_IN_PARALLEL = 1,
		parameter CLIPPING_METHOD              = "RECTANGLE",
		parameter LEFT_OFFSET                  = 0,
		parameter RIGHT_OFFSET                 = 10,
		parameter TOP_OFFSET                   = 0,
		parameter BOTTOM_OFFSET                = 10,
		parameter RUNTIME_CONTROL              = 0
	) (
		input  wire        main_clock,         // main_clock.clk
		input  wire        main_reset,         // main_reset.reset
		input  wire [23:0] din_data,           //        din.data
		input  wire        din_valid,          //           .valid
		input  wire        din_startofpacket,  //           .startofpacket
		input  wire        din_endofpacket,    //           .endofpacket
		output wire        din_ready,          //           .ready
		output wire [23:0] dout_data,          //       dout.data
		output wire        dout_valid,         //           .valid
		output wire        dout_startofpacket, //           .startofpacket
		output wire        dout_endofpacket,   //           .endofpacket
		input  wire        dout_ready          //           .ready
	);

	wire          video_in_av_st_dout_valid;                         // video_in:av_st_dout_valid -> user_packet_demux:av_st_din_valid
	wire   [55:0] video_in_av_st_dout_data;                          // video_in:av_st_dout_data -> user_packet_demux:av_st_din_data
	wire          video_in_av_st_dout_ready;                         // user_packet_demux:av_st_din_ready -> video_in:av_st_dout_ready
	wire          video_in_av_st_dout_startofpacket;                 // video_in:av_st_dout_startofpacket -> user_packet_demux:av_st_din_startofpacket
	wire          video_in_av_st_dout_endofpacket;                   // video_in:av_st_dout_endofpacket -> user_packet_demux:av_st_din_endofpacket
	wire          user_packet_demux_av_st_dout_1_valid;              // user_packet_demux:av_st_dout_valid_1 -> user_packet_mux:av_st_din_valid_1
	wire   [55:0] user_packet_demux_av_st_dout_1_data;               // user_packet_demux:av_st_dout_data_1 -> user_packet_mux:av_st_din_data_1
	wire          user_packet_demux_av_st_dout_1_ready;              // user_packet_mux:av_st_din_ready_1 -> user_packet_demux:av_st_dout_ready_1
	wire          user_packet_demux_av_st_dout_1_startofpacket;      // user_packet_demux:av_st_dout_startofpacket_1 -> user_packet_mux:av_st_din_startofpacket_1
	wire          user_packet_demux_av_st_dout_1_endofpacket;        // user_packet_demux:av_st_dout_endofpacket_1 -> user_packet_mux:av_st_din_endofpacket_1
	wire          user_packet_demux_av_st_dout_0_valid;              // user_packet_demux:av_st_dout_valid_0 -> clipper_core:av_st_din_valid
	wire   [55:0] user_packet_demux_av_st_dout_0_data;               // user_packet_demux:av_st_dout_data_0 -> clipper_core:av_st_din_data
	wire          user_packet_demux_av_st_dout_0_ready;              // clipper_core:av_st_din_ready -> user_packet_demux:av_st_dout_ready_0
	wire          user_packet_demux_av_st_dout_0_startofpacket;      // user_packet_demux:av_st_dout_startofpacket_0 -> clipper_core:av_st_din_startofpacket
	wire          user_packet_demux_av_st_dout_0_endofpacket;        // user_packet_demux:av_st_dout_endofpacket_0 -> clipper_core:av_st_din_endofpacket
	wire          user_packet_mux_av_st_dout_valid;                  // user_packet_mux:av_st_dout_valid -> video_out:av_st_din_valid
	wire   [55:0] user_packet_mux_av_st_dout_data;                   // user_packet_mux:av_st_dout_data -> video_out:av_st_din_data
	wire          user_packet_mux_av_st_dout_ready;                  // video_out:av_st_din_ready -> user_packet_mux:av_st_dout_ready
	wire          user_packet_mux_av_st_dout_startofpacket;          // user_packet_mux:av_st_dout_startofpacket -> video_out:av_st_din_startofpacket
	wire          user_packet_mux_av_st_dout_endofpacket;            // user_packet_mux:av_st_dout_endofpacket -> video_out:av_st_din_endofpacket
	wire          scheduler_av_st_cmd_video_in_valid;                // scheduler:av_st_cmd_video_in_valid -> video_in:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_video_in_data;                 // scheduler:av_st_cmd_video_in_data -> video_in:av_st_cmd_data
	wire          scheduler_av_st_cmd_video_in_ready;                // video_in:av_st_cmd_ready -> scheduler:av_st_cmd_video_in_ready
	wire          scheduler_av_st_cmd_video_in_startofpacket;        // scheduler:av_st_cmd_video_in_startofpacket -> video_in:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_video_in_endofpacket;          // scheduler:av_st_cmd_video_in_endofpacket -> video_in:av_st_cmd_endofpacket
	wire          scheduler_av_st_cmd_core_valid;                    // scheduler:av_st_cmd_core_valid -> clipper_core:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_core_data;                     // scheduler:av_st_cmd_core_data -> clipper_core:av_st_cmd_data
	wire          scheduler_av_st_cmd_core_ready;                    // clipper_core:av_st_cmd_ready -> scheduler:av_st_cmd_core_ready
	wire          scheduler_av_st_cmd_core_startofpacket;            // scheduler:av_st_cmd_core_startofpacket -> clipper_core:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_core_endofpacket;              // scheduler:av_st_cmd_core_endofpacket -> clipper_core:av_st_cmd_endofpacket
	wire          video_in_av_st_resp_valid;                         // video_in:av_st_resp_valid -> scheduler:av_st_resp_video_in_valid
	wire   [63:0] video_in_av_st_resp_data;                          // video_in:av_st_resp_data -> scheduler:av_st_resp_video_in_data
	wire          video_in_av_st_resp_ready;                         // scheduler:av_st_resp_video_in_ready -> video_in:av_st_resp_ready
	wire          video_in_av_st_resp_startofpacket;                 // video_in:av_st_resp_startofpacket -> scheduler:av_st_resp_video_in_startofpacket
	wire          video_in_av_st_resp_endofpacket;                   // video_in:av_st_resp_endofpacket -> scheduler:av_st_resp_video_in_endofpacket
	wire          clipper_core_av_st_dout_valid;                     // clipper_core:av_st_dout_valid -> user_packet_mux:av_st_din_valid_0
	wire   [55:0] clipper_core_av_st_dout_data;                      // clipper_core:av_st_dout_data -> user_packet_mux:av_st_din_data_0
	wire          clipper_core_av_st_dout_ready;                     // user_packet_mux:av_st_din_ready_0 -> clipper_core:av_st_dout_ready
	wire          clipper_core_av_st_dout_startofpacket;             // clipper_core:av_st_dout_startofpacket -> user_packet_mux:av_st_din_startofpacket_0
	wire          clipper_core_av_st_dout_endofpacket;               // clipper_core:av_st_dout_endofpacket -> user_packet_mux:av_st_din_endofpacket_0
	wire          scheduler_av_st_cmd_video_out_valid;               // scheduler:av_st_cmd_video_out_valid -> video_out:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_video_out_data;                // scheduler:av_st_cmd_video_out_data -> video_out:av_st_cmd_data
	wire          scheduler_av_st_cmd_video_out_ready;               // video_out:av_st_cmd_ready -> scheduler:av_st_cmd_video_out_ready
	wire          scheduler_av_st_cmd_video_out_startofpacket;       // scheduler:av_st_cmd_video_out_startofpacket -> video_out:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_video_out_endofpacket;         // scheduler:av_st_cmd_video_out_endofpacket -> video_out:av_st_cmd_endofpacket
	wire          scheduler_av_st_cmd_user_packet_mux_valid;         // scheduler:av_st_cmd_user_packet_mux_valid -> user_packet_mux:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_user_packet_mux_data;          // scheduler:av_st_cmd_user_packet_mux_data -> user_packet_mux:av_st_cmd_data
	wire          scheduler_av_st_cmd_user_packet_mux_ready;         // user_packet_mux:av_st_cmd_ready -> scheduler:av_st_cmd_user_packet_mux_ready
	wire          scheduler_av_st_cmd_user_packet_mux_startofpacket; // scheduler:av_st_cmd_user_packet_mux_startofpacket -> user_packet_mux:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_user_packet_mux_endofpacket;   // scheduler:av_st_cmd_user_packet_mux_endofpacket -> user_packet_mux:av_st_cmd_endofpacket
	wire  [111:0] user_packet_demux_av_st_dout_data;                 // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_valid;                // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_startofpacket;        // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_endofpacket;          // port fragment
	wire    [1:0] user_packet_mux_av_st_din_ready;                   // port fragment

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (MAX_IN_WIDTH != 1920)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					max_in_width_check ( .error(1'b1) );
		end
		if (MAX_IN_HEIGHT != 1080)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					max_in_height_check ( .error(1'b1) );
		end
		if (BITS_PER_SYMBOL != 8)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bits_per_symbol_check ( .error(1'b1) );
		end
		if (PIXELS_IN_PARALLEL != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					pixels_in_parallel_check ( .error(1'b1) );
		end
		if (NUMBER_OF_COLOR_PLANES != 3)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					number_of_color_planes_check ( .error(1'b1) );
		end
		if (COLOR_PLANES_ARE_IN_PARALLEL != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					color_planes_are_in_parallel_check ( .error(1'b1) );
		end
		if (CLIPPING_METHOD != "RECTANGLE")
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					clipping_method_check ( .error(1'b1) );
		end
		if (LEFT_OFFSET != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					left_offset_check ( .error(1'b1) );
		end
		if (RIGHT_OFFSET != 10)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					right_offset_check ( .error(1'b1) );
		end
		if (TOP_OFFSET != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					top_offset_check ( .error(1'b1) );
		end
		if (BOTTOM_OFFSET != 10)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bottom_offset_check ( .error(1'b1) );
		end
		if (RUNTIME_CONTROL != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					runtime_control_check ( .error(1'b1) );
		end
	endgenerate

	alt_vip_video_input_bridge #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.DEFAULT_LINE_LENGTH          (1920),
		.VIDEO_PROTOCOL_NO            (1),
		.RESP_SRC_ADDRESS             (0),
		.RESP_DST_ADDRESS             (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) video_in (
		.clock                       (main_clock),                                 //    main_clock.clk
		.reset                       (main_reset),                                 //    main_reset.reset
		.av_st_cmd_valid             (scheduler_av_st_cmd_video_in_valid),         //     av_st_cmd.valid
		.av_st_cmd_startofpacket     (scheduler_av_st_cmd_video_in_startofpacket), //              .startofpacket
		.av_st_cmd_endofpacket       (scheduler_av_st_cmd_video_in_endofpacket),   //              .endofpacket
		.av_st_cmd_data              (scheduler_av_st_cmd_video_in_data),          //              .data
		.av_st_cmd_ready             (scheduler_av_st_cmd_video_in_ready),         //              .ready
		.av_st_resp_valid            (video_in_av_st_resp_valid),                  //    av_st_resp.valid
		.av_st_resp_startofpacket    (video_in_av_st_resp_startofpacket),          //              .startofpacket
		.av_st_resp_endofpacket      (video_in_av_st_resp_endofpacket),            //              .endofpacket
		.av_st_resp_data             (video_in_av_st_resp_data),                   //              .data
		.av_st_resp_ready            (video_in_av_st_resp_ready),                  //              .ready
		.av_st_dout_valid            (video_in_av_st_dout_valid),                  //    av_st_dout.valid
		.av_st_dout_startofpacket    (video_in_av_st_dout_startofpacket),          //              .startofpacket
		.av_st_dout_endofpacket      (video_in_av_st_dout_endofpacket),            //              .endofpacket
		.av_st_dout_data             (video_in_av_st_dout_data),                   //              .data
		.av_st_dout_ready            (video_in_av_st_dout_ready),                  //              .ready
		.av_st_vid_din_data          (din_data),                                   // av_st_vid_din.data
		.av_st_vid_din_valid         (din_valid),                                  //              .valid
		.av_st_vid_din_startofpacket (din_startofpacket),                          //              .startofpacket
		.av_st_vid_din_endofpacket   (din_endofpacket),                            //              .endofpacket
		.av_st_vid_din_ready         (din_ready)                                   //              .ready
	);

	alt_vip_packet_demux #(
		.DATA_WIDTH         (24),
		.NUM_OUTPUTS        (2),
		.CLIP_ADDRESS_BITS  (0),
		.REGISTER_OUTPUT    (1),
		.PIPELINE_READY     (0),
		.PIXELS_IN_PARALLEL (1),
		.SRC_WIDTH          (8),
		.DST_WIDTH          (8),
		.CONTEXT_WIDTH      (8),
		.TASK_WIDTH         (8),
		.USER_WIDTH         (0)
	) user_packet_demux (
		.clock                    (main_clock),                                                                  //   main_clock.clk
		.reset                    (main_reset),                                                                  //   main_reset.reset
		.av_st_dout_valid         (user_packet_demux_av_st_dout_valid),                                          // av_st_dout_0.valid
		.av_st_dout_ready         ({user_packet_demux_av_st_dout_1_ready,user_packet_demux_av_st_dout_0_ready}), // av_st_dout_0.ready
		.av_st_dout_startofpacket (user_packet_demux_av_st_dout_startofpacket),                                  // av_st_dout_0.startofpacket
		.av_st_dout_endofpacket   (user_packet_demux_av_st_dout_endofpacket),                                    // av_st_dout_0.endofpacket
		.av_st_dout_data          (user_packet_demux_av_st_dout_data),                                           // av_st_dout_0.data
		.av_st_din_valid          (video_in_av_st_dout_valid),                                                   //    av_st_din.valid
		.av_st_din_startofpacket  (video_in_av_st_dout_startofpacket),                                           //             .startofpacket
		.av_st_din_endofpacket    (video_in_av_st_dout_endofpacket),                                             //             .endofpacket
		.av_st_din_data           (video_in_av_st_dout_data),                                                    //             .data
		.av_st_din_ready          (video_in_av_st_dout_ready)                                                    //             .ready
	);

	alt_vip_clipper_alg_core #(
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.BITS_PER_SYMBOL              (8),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.PIXELS_IN_PARALLEL           (1),
		.DATA_SRC_ADDRESS             (2),
		.PIPELINE_DATA_OUTPUT         (0),
		.MAX_IN_WIDTH                 (1920),
		.LEFT_OFFSET                  (0),
		.RIGHT_OFFSET                 (640)
	) clipper_core (
		.clock                    (main_clock),                                   // main_clock.clk
		.reset                    (main_reset),                                   // main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_core_valid),               //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_core_startofpacket),       //           .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_core_endofpacket),         //           .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_core_data),                //           .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_core_ready),               //           .ready
		.av_st_din_valid          (user_packet_demux_av_st_dout_0_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (user_packet_demux_av_st_dout_0_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (user_packet_demux_av_st_dout_0_endofpacket),   //           .endofpacket
		.av_st_din_data           (user_packet_demux_av_st_dout_0_data),          //           .data
		.av_st_din_ready          (user_packet_demux_av_st_dout_0_ready),         //           .ready
		.av_st_dout_valid         (clipper_core_av_st_dout_valid),                // av_st_dout.valid
		.av_st_dout_startofpacket (clipper_core_av_st_dout_startofpacket),        //           .startofpacket
		.av_st_dout_endofpacket   (clipper_core_av_st_dout_endofpacket),          //           .endofpacket
		.av_st_dout_data          (clipper_core_av_st_dout_data),                 //           .data
		.av_st_dout_ready         (clipper_core_av_st_dout_ready)                 //           .ready
	);

	alt_vip_packet_mux #(
		.DATA_WIDTH         (24),
		.NUM_INPUTS         (2),
		.REGISTER_OUTPUT    (0),
		.PIPELINE_READY     (0),
		.NAME               ("undefined"),
		.PIXELS_IN_PARALLEL (1),
		.SRC_WIDTH          (8),
		.DST_WIDTH          (8),
		.CONTEXT_WIDTH      (8),
		.TASK_WIDTH         (8),
		.USER_WIDTH         (0)
	) user_packet_mux (
		.clock                    (main_clock),                                                                           //  main_clock.clk
		.reset                    (main_reset),                                                                           //  main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_user_packet_mux_valid),                                            //   av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_user_packet_mux_startofpacket),                                    //            .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_user_packet_mux_endofpacket),                                      //            .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_user_packet_mux_data),                                             //            .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_user_packet_mux_ready),                                            //            .ready
		.av_st_din_valid          ({user_packet_demux_av_st_dout_1_valid,clipper_core_av_st_dout_valid}),                 // av_st_din_0.valid
		.av_st_din_ready          (user_packet_mux_av_st_din_ready),                                                      // av_st_din_0.ready
		.av_st_din_startofpacket  ({user_packet_demux_av_st_dout_1_startofpacket,clipper_core_av_st_dout_startofpacket}), // av_st_din_0.startofpacket
		.av_st_din_endofpacket    ({user_packet_demux_av_st_dout_1_endofpacket,clipper_core_av_st_dout_endofpacket}),     // av_st_din_0.endofpacket
		.av_st_din_data           ({user_packet_demux_av_st_dout_1_data[55:0],clipper_core_av_st_dout_data[55:0]}),       // av_st_din_0.data
		.av_st_dout_valid         (user_packet_mux_av_st_dout_valid),                                                     //  av_st_dout.valid
		.av_st_dout_startofpacket (user_packet_mux_av_st_dout_startofpacket),                                             //            .startofpacket
		.av_st_dout_endofpacket   (user_packet_mux_av_st_dout_endofpacket),                                               //            .endofpacket
		.av_st_dout_data          (user_packet_mux_av_st_dout_data),                                                      //            .data
		.av_st_dout_ready         (user_packet_mux_av_st_dout_ready)                                                      //            .ready
	);

	alt_vip_video_output_bridge #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.VIDEO_PROTOCOL_NO            (1),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.LOW_LATENCY_COMMAND_MODE     (0)
	) video_out (
		.clock                        (main_clock),                                  //     main_clock.clk
		.reset                        (main_reset),                                  //     main_reset.reset
		.av_st_cmd_valid              (scheduler_av_st_cmd_video_out_valid),         //      av_st_cmd.valid
		.av_st_cmd_startofpacket      (scheduler_av_st_cmd_video_out_startofpacket), //               .startofpacket
		.av_st_cmd_endofpacket        (scheduler_av_st_cmd_video_out_endofpacket),   //               .endofpacket
		.av_st_cmd_data               (scheduler_av_st_cmd_video_out_data),          //               .data
		.av_st_cmd_ready              (scheduler_av_st_cmd_video_out_ready),         //               .ready
		.av_st_din_valid              (user_packet_mux_av_st_dout_valid),            //      av_st_din.valid
		.av_st_din_startofpacket      (user_packet_mux_av_st_dout_startofpacket),    //               .startofpacket
		.av_st_din_endofpacket        (user_packet_mux_av_st_dout_endofpacket),      //               .endofpacket
		.av_st_din_data               (user_packet_mux_av_st_dout_data),             //               .data
		.av_st_din_ready              (user_packet_mux_av_st_dout_ready),            //               .ready
		.av_st_vid_dout_data          (dout_data),                                   // av_st_vid_dout.data
		.av_st_vid_dout_valid         (dout_valid),                                  //               .valid
		.av_st_vid_dout_startofpacket (dout_startofpacket),                          //               .startofpacket
		.av_st_vid_dout_endofpacket   (dout_endofpacket),                            //               .endofpacket
		.av_st_vid_dout_ready         (dout_ready)                                   //               .ready
	);

	alt_vip_clipper_scheduler #(
		.BITS_PER_SYMBOL    (8),
		.MAX_IN_WIDTH       (1920),
		.MAX_IN_HEIGHT      (1080),
		.RECTANGLE_MODE     (1),
		.LEFT_OFFSET        (0),
		.RIGHT_OFFSET       (640),
		.TOP_OFFSET         (0),
		.BOTTOM_OFFSET      (480),
		.PIXELS_IN_PARALLEL (1),
		.RUNTIME_CONTROL    (0)
	) scheduler (
		.clock                                   (main_clock),                                        //                main_clock.clk
		.reset                                   (main_reset),                                        //                main_reset.reset
		.av_st_cmd_video_in_valid                (scheduler_av_st_cmd_video_in_valid),                //        av_st_cmd_video_in.valid
		.av_st_cmd_video_in_startofpacket        (scheduler_av_st_cmd_video_in_startofpacket),        //                          .startofpacket
		.av_st_cmd_video_in_endofpacket          (scheduler_av_st_cmd_video_in_endofpacket),          //                          .endofpacket
		.av_st_cmd_video_in_data                 (scheduler_av_st_cmd_video_in_data),                 //                          .data
		.av_st_cmd_video_in_ready                (scheduler_av_st_cmd_video_in_ready),                //                          .ready
		.av_st_cmd_core_valid                    (scheduler_av_st_cmd_core_valid),                    //            av_st_cmd_core.valid
		.av_st_cmd_core_startofpacket            (scheduler_av_st_cmd_core_startofpacket),            //                          .startofpacket
		.av_st_cmd_core_endofpacket              (scheduler_av_st_cmd_core_endofpacket),              //                          .endofpacket
		.av_st_cmd_core_data                     (scheduler_av_st_cmd_core_data),                     //                          .data
		.av_st_cmd_core_ready                    (scheduler_av_st_cmd_core_ready),                    //                          .ready
		.av_st_cmd_video_out_valid               (scheduler_av_st_cmd_video_out_valid),               //       av_st_cmd_video_out.valid
		.av_st_cmd_video_out_startofpacket       (scheduler_av_st_cmd_video_out_startofpacket),       //                          .startofpacket
		.av_st_cmd_video_out_endofpacket         (scheduler_av_st_cmd_video_out_endofpacket),         //                          .endofpacket
		.av_st_cmd_video_out_data                (scheduler_av_st_cmd_video_out_data),                //                          .data
		.av_st_cmd_video_out_ready               (scheduler_av_st_cmd_video_out_ready),               //                          .ready
		.av_st_cmd_user_packet_mux_valid         (scheduler_av_st_cmd_user_packet_mux_valid),         // av_st_cmd_user_packet_mux.valid
		.av_st_cmd_user_packet_mux_startofpacket (scheduler_av_st_cmd_user_packet_mux_startofpacket), //                          .startofpacket
		.av_st_cmd_user_packet_mux_endofpacket   (scheduler_av_st_cmd_user_packet_mux_endofpacket),   //                          .endofpacket
		.av_st_cmd_user_packet_mux_data          (scheduler_av_st_cmd_user_packet_mux_data),          //                          .data
		.av_st_cmd_user_packet_mux_ready         (scheduler_av_st_cmd_user_packet_mux_ready),         //                          .ready
		.av_st_resp_video_in_valid               (video_in_av_st_resp_valid),                         //       av_st_resp_video_in.valid
		.av_st_resp_video_in_startofpacket       (video_in_av_st_resp_startofpacket),                 //                          .startofpacket
		.av_st_resp_video_in_endofpacket         (video_in_av_st_resp_endofpacket),                   //                          .endofpacket
		.av_st_resp_video_in_data                (video_in_av_st_resp_data),                          //                          .data
		.av_st_resp_video_in_ready               (video_in_av_st_resp_ready)                          //                          .ready
	);

	assign user_packet_demux_av_st_dout_1_valid = { user_packet_demux_av_st_dout_valid[1] };

	assign user_packet_demux_av_st_dout_1_data = { user_packet_demux_av_st_dout_data[111:56] };

	assign user_packet_demux_av_st_dout_1_ready = { user_packet_mux_av_st_din_ready[1] };

	assign user_packet_demux_av_st_dout_1_startofpacket = { user_packet_demux_av_st_dout_startofpacket[1] };

	assign user_packet_demux_av_st_dout_1_endofpacket = { user_packet_demux_av_st_dout_endofpacket[1] };

	assign user_packet_demux_av_st_dout_0_valid = { user_packet_demux_av_st_dout_valid[0] };

	assign user_packet_demux_av_st_dout_0_data = { user_packet_demux_av_st_dout_data[55:0] };

	assign user_packet_demux_av_st_dout_0_startofpacket = { user_packet_demux_av_st_dout_startofpacket[0] };

	assign user_packet_demux_av_st_dout_0_endofpacket = { user_packet_demux_av_st_dout_endofpacket[0] };

	assign clipper_core_av_st_dout_ready = { user_packet_mux_av_st_din_ready[0] };

endmodule

// (C) 1992-2018 Intel Corporation.                            
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words    
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.  
// and/or other countries. Other marks and brands may be claimed as the property  
// of others. See Trademarks on intel.com for full list of Intel trademarks or    
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera) 
// Your use of Intel Corporation's design tools, logic functions and other        
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Intel MegaCore Function License Agreement, or other applicable      
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Intel and sold by    
// Intel or its authorized distributors.  Please refer to the applicable          
// agreement for further details.                                                 


module hls_sim_component_dpi_controller
#(
    parameter RETURN_DATAWIDTH            = 64,
    parameter COMPONENT_NAME              = "",
    parameter COMPONENT_NUM_SLAVES        =  0,
    parameter COMPONENT_HAS_SLAVE_RETURN  =  0,
    parameter COMPONENT_NUM_OUTPUT_STREAMS =  0
    )
    (
        input                         busy,
        output                        start,

        input [RETURN_DATAWIDTH-1:0]  returndata,
        output                        stall,
        input                         done,
        input                         done_irq,

        output                                    read_implicit_streams,
        output logic                              readback_from_slaves,
        input  [COMPONENT_NUM_SLAVES-1:0]         slaves_ready,
        input  [COMPONENT_NUM_SLAVES-1:0]         slaves_done,
        input  [COMPONENT_NUM_OUTPUT_STREAMS-1:0] stream_writes_active,

        output  logic   bind_interfaces,
        output  logic   enable_interfaces,

        input           component_enabled,
        output  logic   component_done,
        output  logic   component_wait_for_stream_writes,

        input           clock,
        input           resetn,
        input           clock2x
    );
   
    import "DPI-C" context function void __ihc_hls_dbgs(string msg);
    import "DPI-C" context function void __ihc_hls_register_component_invocation_info(string component_name, longint unsigned start_time, longint unsigned end_time, longint unsigned  concurrent_threads, longint unsigned first_in_set);

    // stat tracking
    typedef struct {
      time start_time;
      longint unsigned  concurrent_threads;
      longint unsigned first_in_set;
    } invocation_stats;
    invocation_stats queue[$] = {};

    string message;
    logic enable_implicit_input_interface;
    logic return_ready;
    logic do_start;

    logic slaves_ready_stable;
    logic slaves_done_stable;

    hls_sim_stream_source_dpi_bfm
    #(  .STREAM_DATAWIDTH   (64),
        .COMPONENT_NAME     (COMPONENT_NAME),
        .INTERFACE_NAME     ("$do"))
    implicit_input_stream
    (
        .source_data    (),
        .source_ready   (~busy & slaves_ready_stable),
        .source_valid   (do_start),

        .do_bind        (bind_interfaces),
        .enable         (enable_implicit_input_interface),

        .clock          (clock),
        .resetn         (resetn),
        .clock2x        (clock2x)

    );

    generate
      if (COMPONENT_HAS_SLAVE_RETURN == 0) begin
        hls_sim_stream_sink_dpi_bfm
        #(  .STREAM_DATAWIDTH   (RETURN_DATAWIDTH),
            .COMPONENT_NAME     (COMPONENT_NAME),
            .INTERFACE_NAME     ("$return"))
        implicit_output_stream
        (
            .sink_data    (returndata),
            .sink_ready   (return_ready),
            .sink_valid   (done),

            .do_bind        (bind_interfaces),
            .enable         (enable_interfaces),

            .clock          (clock),
            .resetn         (resetn),
            .clock2x        (clock2x)
        );
      end else begin
        assign return_ready = 1'b1;
      end
    endgenerate

    initial
    begin
        $sformat(message, "[%7t][msim][component_dpi_controller][%s] sim start", $time, COMPONENT_NAME);
        __ihc_hls_dbgs(message);
        $sformat(message, "[%7t][msim][component_dpi_controller] enable_interfaces=%d", $time, enable_interfaces);
        __ihc_hls_dbgs(message);
        bind_interfaces = 0;
        enable_interfaces = 0;
        enable_implicit_input_interface = 0;

        forever
        begin
            @(posedge component_enabled);
            $sformat(message, "[%7t][msim][component_dpi_controller][%s] seen component_enabled", $time, COMPONENT_NAME);
            __ihc_hls_dbgs(message);

            @(posedge clock) bind_interfaces   <= 1; 
            @(posedge clock) bind_interfaces   <= 0; 
            @(posedge clock) enable_interfaces <= 1; 

            //delay the implicit input interface by 1 cycle to allow for buffered explicit streams to set up the initial data
            @(posedge clock) enable_implicit_input_interface <= 1;
            
            wait(read_implicit_streams);
            $sformat(message, "[%7t][msim][component_dpi_controller][%s] implicit input stream read", $time, COMPONENT_NAME);
            __ihc_hls_dbgs(message);

            @(negedge component_enabled);
            @(posedge clock) begin
                enable_interfaces <= 0;
                enable_implicit_input_interface <= 0;
            end
            @(posedge clock);
        end
    end

    // slaves are only read back once per a set of enqueued component invocatins
    generate
      if (COMPONENT_NUM_SLAVES > 0) begin
        logic [COMPONENT_NUM_SLAVES-1:0] slaves_done_r;
        always @(posedge clock or negedge resetn) begin
          if (!resetn) begin
            slaves_done_r  <= {COMPONENT_NUM_SLAVES{1'b0}};
          end else begin
            if (bind_interfaces) begin
              slaves_done_r  <= {COMPONENT_NUM_SLAVES{1'b0}};
            end else begin
              slaves_done_r  <= (slaves_done | slaves_done_r);
            end
          end
        end

        assign slaves_ready_stable = (&slaves_ready);
        assign slaves_done_stable  = (&slaves_done_r);
      end else begin
        assign slaves_ready_stable = 1;
        assign slaves_done_stable  = 1;
      end
    endgenerate

    // if there are stalls or FIFOs on the explicit output streams, wait until the valid data is consumed
    assign component_wait_for_stream_writes = (COMPONENT_NUM_OUTPUT_STREAMS > 0) ? (|stream_writes_active | ~slaves_done_stable) : 1'b0;

    // in the case of slave interfaces, we first signal them to readback data, 
    //    and then pass the done on the the main dpi controller
    logic is_done;
    assign is_done = (COMPONENT_HAS_SLAVE_RETURN == 1) ? done_irq : (done & ~stall);

    assign start = do_start & slaves_ready_stable;
    assign stall = ~return_ready & enable_implicit_input_interface;
    assign read_implicit_streams = start & ~busy;

    logic done_irq_r;
    always @(posedge clock or negedge resetn) begin
      if (!resetn) begin
        done_irq_r <= 0;
      end else begin
        done_irq_r <= done_irq;
      end
    end

    // stat tracking
    longint unsigned first_in_set;
    longint unsigned num_threads_in_component;
    invocation_stats istat_in, istat_out;
    always @(posedge clock or negedge resetn) begin
      if (!resetn) begin
        num_threads_in_component = 0;
        first_in_set = 1;
        readback_from_slaves <= 1'b0;
      end else begin
        if (!component_enabled) begin
          first_in_set = 1;
          readback_from_slaves <= 1'b0;
        end else begin
          // save start info
          if (read_implicit_streams) begin
            istat_in.start_time         = $time;
            istat_in.concurrent_threads = num_threads_in_component;
            istat_in.first_in_set       = first_in_set;
            queue.push_back(istat_in);
            num_threads_in_component = num_threads_in_component + 1;
            first_in_set = 0;
          end

          // register info for this invocation
          if (is_done & ~done_irq_r) begin
            istat_out = queue.pop_front();
            __ihc_hls_register_component_invocation_info(COMPONENT_NAME, istat_out.start_time, $time, istat_out.concurrent_threads, istat_out.first_in_set);
            num_threads_in_component = num_threads_in_component - 1;
          end

          readback_from_slaves <= (num_threads_in_component == 0) & ~do_start;
        end
      end
    end

    // pulse done once per set of enqueued invocations
    logic component_done_r;
    always @(posedge clock or negedge resetn) begin
      if (!resetn) begin
        component_done_r <= 1'b0;
      end else begin
        if (bind_interfaces) begin
          component_done_r <= 1'b0;
        end else if (!component_done_r) begin
          component_done_r <= component_done;
        end
      end
    end
    
    assign component_done =   slaves_done_stable                 // wait for all slave interfaces to be written and read back
                            & ~first_in_set                      // need at least one start
                            & ~do_start                          // wait for all starts
                            & (num_threads_in_component == 0)    // wait for all executing threads within the component to complete
                            & ~component_wait_for_stream_writes  // wait for stream writes, which may lag component done if stalled
                            & ~component_done_r;                 // only pulse done for one cycle per set of enqueued invocations
endmodule

// vim:set filetype=verilog:


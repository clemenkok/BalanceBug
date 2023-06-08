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


module hls_sim_main_dpi_controller
#(
    parameter NUM_COMPONENTS                    = 1,
    parameter COMPONENT_NAMES_STR               = "dut",
    parameter CMAIN_START_CYCLE                 = 10
    )
    (
        output  logic   [NUM_COMPONENTS-1:0] component_enabled,
        input           [NUM_COMPONENTS-1:0] component_done,
        input           [NUM_COMPONENTS-1:0] component_wait_for_stream_writes,

        output  logic   trigger_reset,

        input           clock,
        input           resetn,
        input           clock2x
    );

    localparam NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE=4;

    export "DPI-C" task __ihc_hls_reset_sim_task;
    export "DPI-C" task __ihc_hls_component_start_sim_task;
    export "DPI-C" task __ihc_hls_component_wait_sim_task;
    export "DPI-C" task __ihc_hls_stream_sink_wait_sim_task;
    export "DPI-C" function ihc_hls_get_sim_time;
    export "DPI-C" function __ihc_hls_get_clock_period_ps;
    export "DPI-C" function __ihc_hls_get_cosim_added_latency;
    import "DPI-C" context task automatic __ihc_hls_run_tb();
    import "DPI-C" context function int __ihc_hls_stream_empty(chandle obj_ptr);
    import "DPI-C" context function void __ihc_hls_dbgs(string msg);

    string message;
    time clk_period_ps;
    string component_names_arr[0:NUM_COMPONENTS-1];
    int component_name_to_index_map[ string ];

    function longint ihc_hls_get_sim_time();
        return $time;
    endfunction

    function int __ihc_hls_get_cosim_added_latency();
        return (6 + (2*NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE) + 1);
        // Breakdown of cycles:
        // before the component starts
        // 0: initial run_all_enqueued takes NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE cycles assuming that all component invocations are completed already
        // 1: assert component_enabled to hls_sim_component_dpi_controller                      (in hls_sim_main_dpi_controller)
        // 2,3,4: assert bind_interfaces, deassert bind_interfaces, assert enable interfaces    (in hls_sim_component_dpi_controller)
        // 5: assert enable_implicit_input_interface                                            (in hls_sim_component_dpi_controller)
        // 6: assert start                                                                      (in hls_sim_component_dpi_controller)
        // after the component finishes
        // 1 cycle for component done signal
        // wait NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE cycles
    endfunction

    function int __ihc_hls_get_clock_period_ps();
        return clk_period_ps;
    endfunction

    function automatic int str_find_chr(int offset, string s, byte c);
        int i;
        for (i = offset; i < s.len(); i=i+1)
            if (s.getc(i) == c) return i;

        return i;
    endfunction

    function automatic void parse_component_names();
        string s = COMPONENT_NAMES_STR;
        int str_len;
        int comma_offset = -1;
        int new_comma_offset = -1;
        int i=0;

        str_len=s.len();
        do
        begin
            new_comma_offset = str_find_chr(comma_offset+1,s,",");
            component_names_arr[i] = s.substr(comma_offset+1, new_comma_offset-1);
            comma_offset = new_comma_offset;
            component_name_to_index_map[ component_names_arr[i] ] = i;
            i=i+1;
        end
        while (comma_offset < str_len);

        assert (i == NUM_COMPONENTS) else $fatal(1, "[sim] Component names parsing failed!");

    endfunction

    initial
    begin
        automatic int i;
        string s;
        time clk_period_start_time_ps, clk_period_end_time_ps;

        assert (CMAIN_START_CYCLE>=2) else $fatal(1, "[sim] Minimum allowed value for CMAIN_START_CYCLE is 2");

        parse_component_names();
        for (i=0;i<NUM_COMPONENTS;i++)
        begin
            $sformat(message, "[%7t][msim][main_dpi_ctrl] component_names_arr[%0d] = %s",$time, i,component_names_arr[i]);
            __ihc_hls_dbgs(message);
        end

        if (component_name_to_index_map.first(s))
            do begin
                $sformat(message, "[%7t][msim][main_dpi_ctrl] component_name_to_index_map %s : %0d", $time, s, component_name_to_index_map[s]);
                __ihc_hls_dbgs(message);
            end while (component_name_to_index_map.next(s));

        component_enabled = '0;
        $sformat(message, "[%7t][msim][main_dpi_ctrl] sim start", $time);
        __ihc_hls_dbgs(message);

        @(negedge resetn)
        $sformat(message, "[%7t][msim][main_dpi_ctrl] reset asserted", $time);
        __ihc_hls_dbgs(message);
        @(posedge resetn)
        $sformat(message, "[%7t][msim][main_dpi_ctrl] reset deasserted", $time);
        __ihc_hls_dbgs(message);


        @(posedge clock);
        clk_period_start_time_ps    = $time;
        @(posedge clock);
        clk_period_end_time_ps      = $time;
        clk_period_ps = clk_period_end_time_ps - clk_period_start_time_ps;

        for (i=0;i<CMAIN_START_CYCLE-2;i++)
        begin
            @(posedge clock);
        end

        $sformat(message, "[%7t][msim][main_dpi_ctrl] before the call to run_tb task", $time);
        __ihc_hls_dbgs(message);
        __ihc_hls_run_tb();
        $sformat(message, "[%7t][msim][main_dpi_ctrl] after the call to run_tb task", $time);
        __ihc_hls_dbgs(message);

        $finish;
    end

    //called once per set of enqueue calls with the same set of explicit streams
    // a regular call to the component from the TB is a single call
    task automatic __ihc_hls_component_start_sim_task(string component_name);
        int component_index;

        $sformat(message, "[%7t][msim][dut_task] entered, component_name=%s", $time, component_name);
        __ihc_hls_dbgs(message);
        assert (component_name_to_index_map.exists(component_name)) else $fatal(1, "[sim] Cannot find component name in map.");
        component_index = component_name_to_index_map[component_name];
        $sformat(message, "[%7t][msim][dut_task] component_index=%0d", $time, component_index);
        __ihc_hls_dbgs(message);

        @(posedge clock);
        component_enabled[component_index] = 1;
        $sformat(message, "[%7t][msim][dut_task] asserting component_enabled", $time);
        __ihc_hls_dbgs(message);

        @(posedge clock);
    endtask

    task automatic __ihc_hls_component_wait_sim_task(string component_name);
        int i;
        int component_index;

        $sformat(message, "[%7t][msim][dut_task] entered, component_name=%s", $time, component_name);
        __ihc_hls_dbgs(message);
        assert (component_name_to_index_map.exists(component_name)) else $fatal(1, "[sim] Cannot find component name in map.");
        component_index = component_name_to_index_map[component_name];
        $sformat(message, "[%7t][msim][dut_task] component_index=%0d", $time, component_index);
        __ihc_hls_dbgs(message);

        $sformat(message, "[%7t][msim][dut_task] waiting for component_done", $time);
        __ihc_hls_dbgs(message);

        wait( component_done[component_index] == 1'b1 );

        // wait for the component's streams to complete all outstanding writes
        wait(component_wait_for_stream_writes[component_index] == 1'b0);
        component_enabled[component_index] = 0;

        $sformat(message, "[%7t][msim][dut_task] seen all component_done, waiting for %0d clock cycles", $time, NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE);
        __ihc_hls_dbgs(message);

        for (i=0;i<NUM_WAIT_CYCLES_AFTER_COMPONENT_DONE;i++)
        begin
            @(posedge clock);
        end
        $sformat(message, "[%7t][msim][dut_task] end", $time);
        __ihc_hls_dbgs(message);
    endtask

    task automatic __ihc_hls_stream_sink_wait_sim_task(chandle obj_ptr);
        automatic int empty;

        $sformat(message, "[%7t][msim][dut_task] run sim until stream data is produced", $time);
        __ihc_hls_dbgs(message);

        // run the simulation until the given stream has produced valid output
        empty = 1;
        while (empty) begin
          @(posedge clock)
              empty = __ihc_hls_stream_empty(obj_ptr);
        end

        $sformat(message, "[%7t][msim][dut_task] stream data produced", $time);
        __ihc_hls_dbgs(message);
    endtask

    initial begin
        trigger_reset = 0;
    end

    task automatic __ihc_hls_reset_sim_task();
        @(posedge clock);
        trigger_reset = 1;
        @(posedge clock);
        trigger_reset = 0;
        @(posedge clock);
    endtask
endmodule

// vim:set filetype=verilog:


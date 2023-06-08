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


module hls_sim_clock_reset
  #( 
    parameter integer CLK_PERIOD_PS = 1000, // CLK period in picoseconds (an integer)
    parameter integer RESET_CYCLE_HOLD = 4  // Number of cycles to hold RESET low
  )(
    input  logic trigger_reset,
    output logic clock,
    output logic resetn,
    output logic clock2x
  );

  timeunit 1ns;
  timeprecision 1ps;

  localparam  real CLK_PERIOD_NS       = real'(CLK_PERIOD_PS)/1000.0;
  localparam  real CLK_HALF_PERIOD_NS     = CLK_PERIOD_NS/2;
  localparam  real CLK2X_PERIOD_NS        = CLK_PERIOD_NS/2;
  localparam  real CLK2X_HALF_PERIOD_NS   = CLK2X_PERIOD_NS/2;

  import "DPI-C" context function void __ihc_hls_dbgs(string msg);
  string message;

  // Dump some debug info
  initial begin
    assert (CLK_PERIOD_PS>=4) else $fatal("[sim] Minimum allowed clock period is 4ps; CLK_PERIOD_PS>=4");
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] start", $time);
    __ihc_hls_dbgs(message);
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] CLK_PERIOD_PS            = %0d", $time, CLK_PERIOD_PS);
    __ihc_hls_dbgs(message);
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] CLK_PERIOD_NS            = %0f", $time, CLK_PERIOD_NS);
    __ihc_hls_dbgs(message);
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] CLK_HALF_PERIOD_NS       = %0f", $time, CLK_HALF_PERIOD_NS);
    __ihc_hls_dbgs(message);
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] CLK2X_PERIOD_NS          = %0f", $time, CLK2X_PERIOD_NS);
    __ihc_hls_dbgs(message);
    $sformat(message, "[%7t][msim][hls_sim_clock_reset] CLK2X_HALF_PERIOD_NS     = %0f", $time, CLK2X_HALF_PERIOD_NS);
    __ihc_hls_dbgs(message);
  end

  // The 2x clock
  initial begin
    clock2x <= 1'b0;
    forever #CLK2X_HALF_PERIOD_NS clock2x = ~clock2x;
  end

  // The 1x clock
  initial begin
    clock <= 1'b0;
    forever @(posedge clock2x) clock = ~clock;
  end

  // The reset
  initial begin
    resetn <= 1'b0;
    repeat(RESET_CYCLE_HOLD) @(posedge clock);
    resetn <= 1'b1;
    forever begin
      // Asynchronous assertion
      @(posedge trigger_reset);
      #(CLK_HALF_PERIOD_NS/3);
      resetn = 1'b0;
      // Hold for RESET_CYCLE_HOLD cycles and synchronously de-assert
      repeat(RESET_CYCLE_HOLD) @(posedge clock);
      resetn <= 1'b1;
    end
  end
endmodule
// vim:set filetype=verilog:

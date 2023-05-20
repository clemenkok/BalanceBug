//Legal Notice: (C)2015 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Qsys_fifo_0_single_clock_fifo (
                                       // inputs:
                                        aclr,
                                        clock,
                                        data,
                                        rdreq,
                                        wrreq,

                                       // outputs:
                                        empty,
                                        full,
                                        q,
                                        usedw
                                     )
;

  output           empty;
  output           full;
  output  [ 27: 0] q;
  output  [ 10: 0] usedw;
  input            aclr;
  input            clock;
  input   [ 27: 0] data;
  input            rdreq;
  input            wrreq;

  wire             empty;
  wire             full;
  wire    [ 27: 0] q;
  wire    [ 10: 0] usedw;
  scfifo single_clock_fifo
    (
      .aclr (aclr),
      .clock (clock),
      .data (data),
      .empty (empty),
      .full (full),
      .q (q),
      .rdreq (rdreq),
      .usedw (usedw),
      .wrreq (wrreq)
    );

  defparam single_clock_fifo.add_ram_output_register = "OFF",
           single_clock_fifo.intended_device_family = "CYCLONEV",
           single_clock_fifo.lpm_numwords = 2048,
           single_clock_fifo.lpm_showahead = "OFF",
           single_clock_fifo.lpm_type = "scfifo",
           single_clock_fifo.lpm_width = 28,
           single_clock_fifo.lpm_widthu = 11,
           single_clock_fifo.overflow_checking = "ON",
           single_clock_fifo.underflow_checking = "ON",
           single_clock_fifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Qsys_fifo_0_scfifo_with_controls (
                                          // inputs:
                                           clock,
                                           data,
                                           rdreq,
                                           reset_n,
                                           wrreq,

                                          // outputs:
                                           empty,
                                           full,
                                           level,
                                           q
                                        )
;

  output           empty;
  output           full;
  output  [ 11: 0] level;
  output  [ 27: 0] q;
  input            clock;
  input   [ 27: 0] data;
  input            rdreq;
  input            reset_n;
  input            wrreq;

  wire             empty;
  wire             full;
  wire    [ 11: 0] level;
  wire    [ 27: 0] q;
  wire    [ 10: 0] usedw;
  wire             wrreq_valid;
  //the_scfifo, which is an e_instance
  Qsys_fifo_0_single_clock_fifo the_scfifo
    (
      .aclr  (~reset_n),
      .clock (clock),
      .data  (data),
      .empty (empty),
      .full  (full),
      .q     (q),
      .rdreq (rdreq),
      .usedw (usedw),
      .wrreq (wrreq_valid)
    );

  assign level = {full,
    usedw};

  assign wrreq_valid = wrreq & ~full;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Qsys_fifo_0 (
                     // inputs:
                      avalonst_sink_data,
                      avalonst_sink_empty,
                      avalonst_sink_endofpacket,
                      avalonst_sink_startofpacket,
                      avalonst_sink_valid,
                      avalonst_source_ready,
                      reset_n,
                      wrclock,

                     // outputs:
                      avalonst_sink_ready,
                      avalonst_source_data,
                      avalonst_source_empty,
                      avalonst_source_endofpacket,
                      avalonst_source_startofpacket,
                      avalonst_source_valid
                   )
;

  output           avalonst_sink_ready;
  output  [ 23: 0] avalonst_source_data;
  output  [  1: 0] avalonst_source_empty;
  output           avalonst_source_endofpacket;
  output           avalonst_source_startofpacket;
  output           avalonst_source_valid;
  input   [ 23: 0] avalonst_sink_data;
  input   [  1: 0] avalonst_sink_empty;
  input            avalonst_sink_endofpacket;
  input            avalonst_sink_startofpacket;
  input            avalonst_sink_valid;
  input            avalonst_source_ready;
  input            reset_n;
  input            wrclock;

  wire             avalonst_sink_ready;
  wire    [ 27: 0] avalonst_sink_signals;
  wire    [ 23: 0] avalonst_source_data;
  wire    [  1: 0] avalonst_source_empty;
  wire             avalonst_source_endofpacket;
  wire    [ 27: 0] avalonst_source_signals;
  wire             avalonst_source_startofpacket;
  reg              avalonst_source_valid;
  wire             clock;
  wire    [ 27: 0] data;
  wire             empty;
  wire             full;
  wire    [ 11: 0] level;
  wire             no_stop_write;
  reg              no_stop_write_d1;
  wire    [ 27: 0] q;
  wire             rdreq;
  wire             ready_0;
  wire             ready_1;
  wire             ready_selector;
  wire             wrreq;
  //the_scfifo_with_controls, which is an e_instance
  Qsys_fifo_0_scfifo_with_controls the_scfifo_with_controls
    (
      .clock   (clock),
      .data    (data),
      .empty   (empty),
      .full    (full),
      .level   (level),
      .q       (q),
      .rdreq   (rdreq),
      .reset_n (reset_n),
      .wrreq   (wrreq)
    );

  //in, which is an e_atlantic_slave
  //out, which is an e_atlantic_master
  assign avalonst_sink_signals = {avalonst_sink_startofpacket,
    avalonst_sink_endofpacket,
    avalonst_sink_empty,
    avalonst_sink_data};

  assign {avalonst_source_startofpacket,
avalonst_source_endofpacket,
avalonst_source_empty,
avalonst_source_data} = avalonst_source_signals;
  assign no_stop_write = (ready_selector & ready_1) | (!ready_selector & ready_0);
  assign wrreq = avalonst_sink_valid & no_stop_write_d1;
  assign ready_1 = !full;
  assign ready_0 = !full & !avalonst_sink_valid;
  assign ready_selector = level < 2047;
  always @(posedge clock or negedge reset_n)
    begin
      if (reset_n == 0)
          no_stop_write_d1 <= 0;
      else 
        no_stop_write_d1 <= no_stop_write;
    end


  assign data = avalonst_sink_signals;
  assign avalonst_source_signals = q;
  assign clock = wrclock;
  assign avalonst_sink_ready = no_stop_write;
  always @(posedge clock or negedge reset_n)
    begin
      if (reset_n == 0)
          avalonst_source_valid <= 0;
      else 
        avalonst_source_valid <= avalonst_source_ready & !empty;
    end


  assign rdreq = avalonst_source_ready & !empty;

endmodule


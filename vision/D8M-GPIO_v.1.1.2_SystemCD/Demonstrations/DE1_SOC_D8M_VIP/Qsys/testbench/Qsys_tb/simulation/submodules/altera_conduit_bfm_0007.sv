// (C) 2001-2014 Altera Corporation. All rights reserved.
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


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0007
// role:width:direction:                              vid_clk:1:output,vid_data:24:input,underflow:1:input,vid_datavalid:1:input,vid_v_sync:1:input,vid_h_sync:1:input,vid_f:1:input,vid_h:1:input,vid_v:1:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0007
(
   sig_vid_clk,
   sig_vid_data,
   sig_underflow,
   sig_vid_datavalid,
   sig_vid_v_sync,
   sig_vid_h_sync,
   sig_vid_f,
   sig_vid_h,
   sig_vid_v
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output sig_vid_clk;
   input [23 : 0] sig_vid_data;
   input sig_underflow;
   input sig_vid_datavalid;
   input sig_vid_v_sync;
   input sig_vid_h_sync;
   input sig_vid_f;
   input sig_vid_h;
   input sig_vid_v;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_vid_clk_t;
   typedef logic [23 : 0] ROLE_vid_data_t;
   typedef logic ROLE_underflow_t;
   typedef logic ROLE_vid_datavalid_t;
   typedef logic ROLE_vid_v_sync_t;
   typedef logic ROLE_vid_h_sync_t;
   typedef logic ROLE_vid_f_t;
   typedef logic ROLE_vid_h_t;
   typedef logic ROLE_vid_v_t;

   reg vid_clk_temp;
   reg vid_clk_out;
   logic [23 : 0] vid_data_in;
   logic [23 : 0] vid_data_local;
   logic [0 : 0] underflow_in;
   logic [0 : 0] underflow_local;
   logic [0 : 0] vid_datavalid_in;
   logic [0 : 0] vid_datavalid_local;
   logic [0 : 0] vid_v_sync_in;
   logic [0 : 0] vid_v_sync_local;
   logic [0 : 0] vid_h_sync_in;
   logic [0 : 0] vid_h_sync_local;
   logic [0 : 0] vid_f_in;
   logic [0 : 0] vid_f_local;
   logic [0 : 0] vid_h_in;
   logic [0 : 0] vid_h_local;
   logic [0 : 0] vid_v_in;
   logic [0 : 0] vid_v_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_vid_data_change;
   event signal_input_underflow_change;
   event signal_input_vid_datavalid_change;
   event signal_input_vid_v_sync_change;
   event signal_input_vid_h_sync_change;
   event signal_input_vid_f_change;
   event signal_input_vid_h_change;
   event signal_input_vid_v_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "14.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // vid_clk
   // -------------------------------------------------------

   function automatic void set_vid_clk (
      ROLE_vid_clk_t new_value
   );
      // Drive the new value to vid_clk.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      vid_clk_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // vid_data
   // -------------------------------------------------------
   function automatic ROLE_vid_data_t get_vid_data();
   
      // Gets the vid_data input value.
      $sformat(message, "%m: called get_vid_data");
      print(VERBOSITY_DEBUG, message);
      return vid_data_in;
      
   endfunction

   // -------------------------------------------------------
   // underflow
   // -------------------------------------------------------
   function automatic ROLE_underflow_t get_underflow();
   
      // Gets the underflow input value.
      $sformat(message, "%m: called get_underflow");
      print(VERBOSITY_DEBUG, message);
      return underflow_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_datavalid
   // -------------------------------------------------------
   function automatic ROLE_vid_datavalid_t get_vid_datavalid();
   
      // Gets the vid_datavalid input value.
      $sformat(message, "%m: called get_vid_datavalid");
      print(VERBOSITY_DEBUG, message);
      return vid_datavalid_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_v_sync
   // -------------------------------------------------------
   function automatic ROLE_vid_v_sync_t get_vid_v_sync();
   
      // Gets the vid_v_sync input value.
      $sformat(message, "%m: called get_vid_v_sync");
      print(VERBOSITY_DEBUG, message);
      return vid_v_sync_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_h_sync
   // -------------------------------------------------------
   function automatic ROLE_vid_h_sync_t get_vid_h_sync();
   
      // Gets the vid_h_sync input value.
      $sformat(message, "%m: called get_vid_h_sync");
      print(VERBOSITY_DEBUG, message);
      return vid_h_sync_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_f
   // -------------------------------------------------------
   function automatic ROLE_vid_f_t get_vid_f();
   
      // Gets the vid_f input value.
      $sformat(message, "%m: called get_vid_f");
      print(VERBOSITY_DEBUG, message);
      return vid_f_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_h
   // -------------------------------------------------------
   function automatic ROLE_vid_h_t get_vid_h();
   
      // Gets the vid_h input value.
      $sformat(message, "%m: called get_vid_h");
      print(VERBOSITY_DEBUG, message);
      return vid_h_in;
      
   endfunction

   // -------------------------------------------------------
   // vid_v
   // -------------------------------------------------------
   function automatic ROLE_vid_v_t get_vid_v();
   
      // Gets the vid_v input value.
      $sformat(message, "%m: called get_vid_v");
      print(VERBOSITY_DEBUG, message);
      return vid_v_in;
      
   endfunction

   assign sig_vid_clk = vid_clk_temp;
   assign vid_data_in = sig_vid_data;
   assign underflow_in = sig_underflow;
   assign vid_datavalid_in = sig_vid_datavalid;
   assign vid_v_sync_in = sig_vid_v_sync;
   assign vid_h_sync_in = sig_vid_h_sync;
   assign vid_f_in = sig_vid_f;
   assign vid_h_in = sig_vid_h;
   assign vid_v_in = sig_vid_v;


   always @(vid_data_in) begin
      if (vid_data_local != vid_data_in)
         -> signal_input_vid_data_change;
      vid_data_local = vid_data_in;
   end
   
   always @(underflow_in) begin
      if (underflow_local != underflow_in)
         -> signal_input_underflow_change;
      underflow_local = underflow_in;
   end
   
   always @(vid_datavalid_in) begin
      if (vid_datavalid_local != vid_datavalid_in)
         -> signal_input_vid_datavalid_change;
      vid_datavalid_local = vid_datavalid_in;
   end
   
   always @(vid_v_sync_in) begin
      if (vid_v_sync_local != vid_v_sync_in)
         -> signal_input_vid_v_sync_change;
      vid_v_sync_local = vid_v_sync_in;
   end
   
   always @(vid_h_sync_in) begin
      if (vid_h_sync_local != vid_h_sync_in)
         -> signal_input_vid_h_sync_change;
      vid_h_sync_local = vid_h_sync_in;
   end
   
   always @(vid_f_in) begin
      if (vid_f_local != vid_f_in)
         -> signal_input_vid_f_change;
      vid_f_local = vid_f_in;
   end
   
   always @(vid_h_in) begin
      if (vid_h_local != vid_h_in)
         -> signal_input_vid_h_change;
      vid_h_local = vid_h_in;
   end
   
   always @(vid_v_in) begin
      if (vid_v_local != vid_v_in)
         -> signal_input_vid_v_change;
      vid_v_local = vid_v_in;
   end
   


// synthesis translate_on

endmodule


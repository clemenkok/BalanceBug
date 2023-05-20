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
// output_name:                                       altera_conduit_bfm
// role:width:direction:                              scl_pad_io:1:bidir,sda_pad_io:1:bidir
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm
(
   sig_scl_pad_io,
   sig_sda_pad_io
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   inout wire sig_scl_pad_io;
   inout wire sig_sda_pad_io;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_scl_pad_io_t;
   typedef logic ROLE_sda_pad_io_t;

   logic scl_pad_io_oe;
   logic scl_pad_io_oe_temp = 0;
   reg scl_pad_io_temp;
   reg scl_pad_io_out;
   logic [0 : 0] scl_pad_io_in;
   logic [0 : 0] scl_pad_io_local;
   logic sda_pad_io_oe;
   logic sda_pad_io_oe_temp = 0;
   reg sda_pad_io_temp;
   reg sda_pad_io_out;
   logic [0 : 0] sda_pad_io_in;
   logic [0 : 0] sda_pad_io_local;

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
   
   event signal_input_scl_pad_io_change;
   event signal_input_sda_pad_io_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "14.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // scl_pad_io
   // -------------------------------------------------------
   function automatic ROLE_scl_pad_io_t get_scl_pad_io();
   
      // Gets the scl_pad_io input value.
      $sformat(message, "%m: called get_scl_pad_io");
      print(VERBOSITY_DEBUG, message);
      return scl_pad_io_in;
      
   endfunction

   function automatic void set_scl_pad_io (
      ROLE_scl_pad_io_t new_value
   );
      // Drive the new value to scl_pad_io.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      scl_pad_io_temp = new_value;
   endfunction
   
   function automatic void set_scl_pad_io_oe (
      bit enable
   );
      // bidir port scl_pad_io will work as output port when set to 1.
      // bidir port scl_pad_io will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      scl_pad_io_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // sda_pad_io
   // -------------------------------------------------------
   function automatic ROLE_sda_pad_io_t get_sda_pad_io();
   
      // Gets the sda_pad_io input value.
      $sformat(message, "%m: called get_sda_pad_io");
      print(VERBOSITY_DEBUG, message);
      return sda_pad_io_in;
      
   endfunction

   function automatic void set_sda_pad_io (
      ROLE_sda_pad_io_t new_value
   );
      // Drive the new value to sda_pad_io.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sda_pad_io_temp = new_value;
   endfunction
   
   function automatic void set_sda_pad_io_oe (
      bit enable
   );
      // bidir port sda_pad_io will work as output port when set to 1.
      // bidir port sda_pad_io will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sda_pad_io_oe_temp = enable;
   endfunction

   assign scl_pad_io_oe = scl_pad_io_oe_temp;
   assign sig_scl_pad_io = (scl_pad_io_oe == 1)? scl_pad_io_temp:'z;
   assign scl_pad_io_in = (scl_pad_io_oe == 0)? sig_scl_pad_io:'z;
   assign sda_pad_io_oe = sda_pad_io_oe_temp;
   assign sig_sda_pad_io = (sda_pad_io_oe == 1)? sda_pad_io_temp:'z;
   assign sda_pad_io_in = (sda_pad_io_oe == 0)? sig_sda_pad_io:'z;


   always @(scl_pad_io_in) begin
      if (scl_pad_io_oe == 0) begin
         if (scl_pad_io_local != scl_pad_io_in)
            -> signal_input_scl_pad_io_change;
         scl_pad_io_local = scl_pad_io_in;
      end
   end
   
   always @(sda_pad_io_in) begin
      if (sda_pad_io_oe == 0) begin
         if (sda_pad_io_local != sda_pad_io_in)
            -> signal_input_sda_pad_io_change;
         sda_pad_io_local = sda_pad_io_in;
      end
   end
   


// synthesis translate_on

endmodule


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
// output_name:                                       altera_conduit_bfm_0006
// role:width:direction:                              D:12:output,FVAL:1:output,LVAL:1:output,PIXCLK:1:output
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0006
(
   sig_D,
   sig_FVAL,
   sig_LVAL,
   sig_PIXCLK
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output [11 : 0] sig_D;
   output sig_FVAL;
   output sig_LVAL;
   output sig_PIXCLK;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [11 : 0] ROLE_D_t;
   typedef logic ROLE_FVAL_t;
   typedef logic ROLE_LVAL_t;
   typedef logic ROLE_PIXCLK_t;

   reg [11 : 0] D_temp;
   reg [11 : 0] D_out;
   reg FVAL_temp;
   reg FVAL_out;
   reg LVAL_temp;
   reg LVAL_out;
   reg PIXCLK_temp;
   reg PIXCLK_out;

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
   
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "14.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // D
   // -------------------------------------------------------

   function automatic void set_D (
      ROLE_D_t new_value
   );
      // Drive the new value to D.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      D_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // FVAL
   // -------------------------------------------------------

   function automatic void set_FVAL (
      ROLE_FVAL_t new_value
   );
      // Drive the new value to FVAL.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      FVAL_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // LVAL
   // -------------------------------------------------------

   function automatic void set_LVAL (
      ROLE_LVAL_t new_value
   );
      // Drive the new value to LVAL.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      LVAL_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // PIXCLK
   // -------------------------------------------------------

   function automatic void set_PIXCLK (
      ROLE_PIXCLK_t new_value
   );
      // Drive the new value to PIXCLK.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      PIXCLK_temp = new_value;
   endfunction

   assign sig_D = D_temp;
   assign sig_FVAL = FVAL_temp;
   assign sig_LVAL = LVAL_temp;
   assign sig_PIXCLK = PIXCLK_temp;




// synthesis translate_on

endmodule


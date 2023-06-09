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



// $Id: avalon_split_multibit_conduit.sv.terp#1 $
// $Revision: #1 $
// $Date: 2014/07/17 $


// --------------------------------------------------------------------------------
//| Avalon Split Multi-bit Conduit
// --------------------------------------------------------------------------------

// ------------------------------------------
// Generation parameters:
//   output_name:       tb_split_component_start_inst
//   multibit_width:    1
//
// ------------------------------------------

module tb_split_component_start_inst
#(
    parameter MULTIBIT_WIDTH = 1
)
(

// Interface: out_conduit_0
 output                    out_conduit_0,

// Interface: in_conduit
 input    [MULTIBIT_WIDTH-1:0]               in_conduit

);

   assign  out_conduit_0 = in_conduit[0];

endmodule //


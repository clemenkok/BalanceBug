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



// $Id: avalon_concatenate_singlebit_conduits.sv.terp#1 $
// $Revision: #1 $
// $Date: 2014/07/17 $


// --------------------------------------------------------------------------------
//| Avalon Concatenate Single-bit Conduits into a Multi-bit Conduit
// --------------------------------------------------------------------------------

// ------------------------------------------
// Generation parameters:
//   output_name:       tb_concatenate_component_done_inst
//   multibit_width:    1
//
// ------------------------------------------

module tb_concatenate_component_done_inst
#(
    parameter MULTIBIT_WIDTH = 1
)
(

// Interface: in_conduit_0
 input                    in_conduit_0,

// Interface: out_conduit
 output    [MULTIBIT_WIDTH-1:0]               out_conduit

);

   assign  out_conduit[0] = in_conduit_0;

endmodule //


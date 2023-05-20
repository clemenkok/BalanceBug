
# (C) 2001-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 15.1 193 win32 2016.05.25.09:41:50
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script can be used to simulate the following IP:
#     Qsys
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "aldec.do", run it as:
# #   vsim -c -do aldec.do
# #
# # Source the generated sim script
# source rivierapro_setup.tcl
# # Compile eda/sim_lib contents first
# dev_com
# # Override the top-level name (so that elab is useful)
# set TOP_LEVEL_NAME top
# # Compile the standalone IP.
# com
# # Compile the user top-level
# vlog -sv2k5 ../../top.sv
# # Elaborate the design.
# elab
# # Run the simulation
# run
# # Report success to the shell
# exit -code 0
# # End of template
# ----------------------------------------
# If Qsys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "Qsys"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "E:/altera/15.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.mif ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.mif ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.mif ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.mif ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cycloneive_ver  
vmap       cycloneive_ver   ./libraries/cycloneive_ver  
ensure_lib                                            ./libraries/error_adapter_0                           
vmap       error_adapter_0                            ./libraries/error_adapter_0                           
ensure_lib                                            ./libraries/rsp_mux                                   
vmap       rsp_mux                                    ./libraries/rsp_mux                                   
ensure_lib                                            ./libraries/rsp_demux                                 
vmap       rsp_demux                                  ./libraries/rsp_demux                                 
ensure_lib                                            ./libraries/cmd_mux                                   
vmap       cmd_mux                                    ./libraries/cmd_mux                                   
ensure_lib                                            ./libraries/cmd_demux                                 
vmap       cmd_demux                                  ./libraries/cmd_demux                                 
ensure_lib                                            ./libraries/sdram_s1_burst_adapter                    
vmap       sdram_s1_burst_adapter                     ./libraries/sdram_s1_burst_adapter                    
ensure_lib                                            ./libraries/router_002                                
vmap       router_002                                 ./libraries/router_002                                
ensure_lib                                            ./libraries/router                                    
vmap       router                                     ./libraries/router                                    
ensure_lib                                            ./libraries/avalon_st_adapter                         
vmap       avalon_st_adapter                          ./libraries/avalon_st_adapter                         
ensure_lib                                            ./libraries/crosser                                   
vmap       crosser                                    ./libraries/crosser                                   
ensure_lib                                            ./libraries/rsp_mux_001                               
vmap       rsp_mux_001                                ./libraries/rsp_mux_001                               
ensure_lib                                            ./libraries/rsp_demux_005                             
vmap       rsp_demux_005                              ./libraries/rsp_demux_005                             
ensure_lib                                            ./libraries/rsp_demux_004                             
vmap       rsp_demux_004                              ./libraries/rsp_demux_004                             
ensure_lib                                            ./libraries/cmd_mux_004                               
vmap       cmd_mux_004                                ./libraries/cmd_mux_004                               
ensure_lib                                            ./libraries/cmd_demux_001                             
vmap       cmd_demux_001                              ./libraries/cmd_demux_001                             
ensure_lib                                            ./libraries/nios2_gen2_data_master_limiter            
vmap       nios2_gen2_data_master_limiter             ./libraries/nios2_gen2_data_master_limiter            
ensure_lib                                            ./libraries/router_006                                
vmap       router_006                                 ./libraries/router_006                                
ensure_lib                                            ./libraries/router_001                                
vmap       router_001                                 ./libraries/router_001                                
ensure_lib                                            ./libraries/jtag_uart_avalon_jtag_slave_agent_rsp_fifo
vmap       jtag_uart_avalon_jtag_slave_agent_rsp_fifo ./libraries/jtag_uart_avalon_jtag_slave_agent_rsp_fifo
ensure_lib                                            ./libraries/jtag_uart_avalon_jtag_slave_agent         
vmap       jtag_uart_avalon_jtag_slave_agent          ./libraries/jtag_uart_avalon_jtag_slave_agent         
ensure_lib                                            ./libraries/nios2_gen2_data_master_agent              
vmap       nios2_gen2_data_master_agent               ./libraries/nios2_gen2_data_master_agent              
ensure_lib                                            ./libraries/jtag_uart_avalon_jtag_slave_translator    
vmap       jtag_uart_avalon_jtag_slave_translator     ./libraries/jtag_uart_avalon_jtag_slave_translator    
ensure_lib                                            ./libraries/nios2_gen2_data_master_translator         
vmap       nios2_gen2_data_master_translator          ./libraries/nios2_gen2_data_master_translator         
ensure_lib                                            ./libraries/cpu                                       
vmap       cpu                                        ./libraries/cpu                                       
ensure_lib                                            ./libraries/rst_controller                            
vmap       rst_controller                             ./libraries/rst_controller                            
ensure_lib                                            ./libraries/irq_mapper                                
vmap       irq_mapper                                 ./libraries/irq_mapper                                
ensure_lib                                            ./libraries/mm_interconnect_1                         
vmap       mm_interconnect_1                          ./libraries/mm_interconnect_1                         
ensure_lib                                            ./libraries/mm_interconnect_0                         
vmap       mm_interconnect_0                          ./libraries/mm_interconnect_0                         
ensure_lib                                            ./libraries/timer                                     
vmap       timer                                      ./libraries/timer                                     
ensure_lib                                            ./libraries/sysid_qsys                                
vmap       sysid_qsys                                 ./libraries/sysid_qsys                                
ensure_lib                                            ./libraries/sw                                        
vmap       sw                                         ./libraries/sw                                        
ensure_lib                                            ./libraries/sdram                                     
vmap       sdram                                      ./libraries/sdram                                     
ensure_lib                                            ./libraries/onchip_memory2_0                          
vmap       onchip_memory2_0                           ./libraries/onchip_memory2_0                          
ensure_lib                                            ./libraries/nios2_gen2                                
vmap       nios2_gen2                                 ./libraries/nios2_gen2                                
ensure_lib                                            ./libraries/mipi_pwdn_n                               
vmap       mipi_pwdn_n                                ./libraries/mipi_pwdn_n                               
ensure_lib                                            ./libraries/led                                       
vmap       led                                        ./libraries/led                                       
ensure_lib                                            ./libraries/key                                       
vmap       key                                        ./libraries/key                                       
ensure_lib                                            ./libraries/jtag_uart                                 
vmap       jtag_uart                                  ./libraries/jtag_uart                                 
ensure_lib                                            ./libraries/i2c_opencores_camera                      
vmap       i2c_opencores_camera                       ./libraries/i2c_opencores_camera                      
ensure_lib                                            ./libraries/altpll_0                                  
vmap       altpll_0                                   ./libraries/altpll_0                                  
ensure_lib                                            ./libraries/alt_vip_vfb_0                             
vmap       alt_vip_vfb_0                              ./libraries/alt_vip_vfb_0                             
ensure_lib                                            ./libraries/alt_vip_itc_0                             
vmap       alt_vip_itc_0                              ./libraries/alt_vip_itc_0                             
ensure_lib                                            ./libraries/TERASIC_CAMERA_0                          
vmap       TERASIC_CAMERA_0                           ./libraries/TERASIC_CAMERA_0                          
ensure_lib                                            ./libraries/TERASIC_AUTO_FOCUS_0                      
vmap       TERASIC_AUTO_FOCUS_0                       ./libraries/TERASIC_AUTO_FOCUS_0                      

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_rsp_mux.sv"                           -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_rsp_demux.sv"                         -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_cmd_mux.sv"                           -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_cmd_demux.sv"                         -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                              -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                       -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                         -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                          -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                              -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                              -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                           -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                          -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                          -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_router_002.sv"                        -work router_002                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_router.sv"                            -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                  -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                            -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                             -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_mux_001.sv"                       -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux_005.sv"                     -work rsp_demux_005                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux_004.sv"                     -work rsp_demux_004                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux_004                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_mux_004.sv"                       -work cmd_mux_004                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_demux_001.sv"                     -work cmd_demux_001                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                            -work nios2_gen2_data_master_limiter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                             -work nios2_gen2_data_master_limiter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                     -work nios2_gen2_data_master_limiter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work nios2_gen2_data_master_limiter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_006.sv"                        -work router_006                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_002.sv"                        -work router_002                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_001.sv"                        -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router.sv"                            -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                     -work jtag_uart_avalon_jtag_slave_agent_rsp_fifo
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                -work jtag_uart_avalon_jtag_slave_agent         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                         -work jtag_uart_avalon_jtag_slave_agent         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                               -work nios2_gen2_data_master_agent              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                           -work jtag_uart_avalon_jtag_slave_translator    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                          -work nios2_gen2_data_master_translator         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu.vo"                                      -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_sysclk.v"                    -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_tck.v"                       -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_wrapper.v"                   -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_mult_cell.v"                             -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_test_bench.v"                            -work cpu                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                   -work rst_controller                            
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                 -work rst_controller                            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/Qsys_irq_mapper.sv"                                          -work irq_mapper                                
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1.v"                                    -work mm_interconnect_1                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0.v"                                    -work mm_interconnect_0                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_timer.v"                                                -work timer                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_sysid_qsys.vo"                                          -work sysid_qsys                                
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_sw.v"                                                   -work sw                                        
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_sdram.v"                                                -work sdram                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_sdram_test_component.v"                                 -work sdram                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_onchip_memory2_0.v"                                     -work onchip_memory2_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2.v"                                           -work nios2_gen2                                
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mipi_pwdn_n.v"                                          -work mipi_pwdn_n                               
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_led.v"                                                  -work led                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_key.v"                                                  -work key                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_jtag_uart.v"                                            -work jtag_uart                                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/i2c_opencores.v"                                             -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/i2c_master_top.v"                                            -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/i2c_master_defines.v"                                        -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/i2c_master_byte_ctrl.v"                                      -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/i2c_master_bit_ctrl.v"                                       -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/timescale.v"                                                 -work i2c_opencores_camera                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_altpll_0.vo"                                            -work altpll_0                                  
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_alt_vip_vfb_0.vo"                                       -work alt_vip_vfb_0                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid.sv"                                     -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_sync_compare.v"                         -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_calculate_mode.v"                       -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_control.v"                              -work alt_vip_itc_0                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_mode_banks.sv"                          -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_statemachine.v"                         -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_fifo.v"                                 -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_generic_count.v"                        -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_to_binary.v"                            -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sync.v"                                 -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_trigger_sync.v"                         -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sync_generation.v"                      -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_frame_counter.v"                        -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sample_counter.v"                       -work alt_vip_itc_0                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/TERASIC_CAMERA.v"                                            -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/CAMERA_RGB.v"                                                -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/CAMERA_Bayer.v"                                              -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Bayer2RGB.v"                                                 -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Bayer_LineBuffer.v"                                          -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/rgb_fifo.v"                                                  -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/add2.v"                                                      -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/add4.v"                                                      -work TERASIC_CAMERA_0                          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/TERASIC_AUTO_FOCUS.v"                                        -work TERASIC_AUTO_FOCUS_0                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/F_VCM.v"                                                     -work TERASIC_AUTO_FOCUS_0                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/I2C_VCM_Config.v"                                            -work TERASIC_AUTO_FOCUS_0                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/I2C_VCM_Controller.v"                                        -work TERASIC_AUTO_FOCUS_0                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/VCM_CTRL_P.v"                                                -work TERASIC_AUTO_FOCUS_0                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/Qsys.v"                                                                                                                 
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L sdram_s1_burst_adapter -L router_002 -L router -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_demux_005 -L rsp_demux_004 -L cmd_mux_004 -L cmd_demux_001 -L nios2_gen2_data_master_limiter -L router_006 -L router_001 -L jtag_uart_avalon_jtag_slave_agent_rsp_fifo -L jtag_uart_avalon_jtag_slave_agent -L nios2_gen2_data_master_agent -L jtag_uart_avalon_jtag_slave_translator -L nios2_gen2_data_master_translator -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L timer -L sysid_qsys -L sw -L sdram -L onchip_memory2_0 -L nios2_gen2 -L mipi_pwdn_n -L led -L key -L jtag_uart -L i2c_opencores_camera -L altpll_0 -L alt_vip_vfb_0 -L alt_vip_itc_0 -L TERASIC_CAMERA_0 -L TERASIC_AUTO_FOCUS_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L sdram_s1_burst_adapter -L router_002 -L router -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_demux_005 -L rsp_demux_004 -L cmd_mux_004 -L cmd_demux_001 -L nios2_gen2_data_master_limiter -L router_006 -L router_001 -L jtag_uart_avalon_jtag_slave_agent_rsp_fifo -L jtag_uart_avalon_jtag_slave_agent -L nios2_gen2_data_master_agent -L jtag_uart_avalon_jtag_slave_translator -L nios2_gen2_data_master_translator -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L timer -L sysid_qsys -L sw -L sdram -L onchip_memory2_0 -L nios2_gen2 -L mipi_pwdn_n -L led -L key -L jtag_uart -L i2c_opencores_camera -L altpll_0 -L alt_vip_vfb_0 -L alt_vip_itc_0 -L TERASIC_CAMERA_0 -L TERASIC_AUTO_FOCUS_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h

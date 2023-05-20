
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
# vcsmx - auto-generated simulation script

# ----------------------------------------
# This script can be used to simulate the following IP:
#     Qsys
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "vcsmx_sim.sh", run it as:
# #   ./vcsmx_sim.sh
# #
# # Do the file copy, dev_com and com steps
# source vcsmx_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1
# 
# # Compile the top level module
# vlogan +v2k +systemverilogext+.sv "$QSYS_SIMDIR/../top.sv"
# 
# # Do the elaboration and sim steps
# # Override the top-level name
# # Override the user-defined sim options, so the simulation runs 
# # forever (until $finish()).
# source vcsmx_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME="'-top top'" \
# USER_DEFINED_SIM_OPTIONS=""
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
# ACDS 15.1 193 win32 2016.05.25.09:41:50
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="Qsys"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="E:/altera/15.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/sdram_s1_burst_adapter/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_demux_005/
mkdir -p ./libraries/rsp_demux_004/
mkdir -p ./libraries/cmd_mux_004/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/nios2_gen2_data_master_limiter/
mkdir -p ./libraries/router_006/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_agent_rsp_fifo/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_agent/
mkdir -p ./libraries/nios2_gen2_data_master_agent/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_translator/
mkdir -p ./libraries/nios2_gen2_data_master_translator/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/timer/
mkdir -p ./libraries/sysid_qsys/
mkdir -p ./libraries/sw/
mkdir -p ./libraries/sdram/
mkdir -p ./libraries/onchip_memory2_0/
mkdir -p ./libraries/nios2_gen2/
mkdir -p ./libraries/mipi_pwdn_n/
mkdir -p ./libraries/led/
mkdir -p ./libraries/key/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/i2c_opencores_camera/
mkdir -p ./libraries/altpll_0/
mkdir -p ./libraries/alt_vip_vfb_0/
mkdir -p ./libraries/alt_vip_itc_0/
mkdir -p ./libraries/TERASIC_CAMERA_0/
mkdir -p ./libraries/TERASIC_AUTO_FOCUS_0/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_bht_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_dc_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ic_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_rf_ram_b.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                           
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_rsp_mux.sv"                           -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_rsp_demux.sv"                         -work rsp_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_cmd_mux.sv"                           -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_cmd_demux.sv"                         -work cmd_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                              -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                       -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                         -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                          -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                              -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                              -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                           -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                          -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                          -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_router_002.sv"                        -work router_002                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1_router.sv"                            -work router                                    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                  -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                            -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                             -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_mux_001.sv"                       -work rsp_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux_005.sv"                     -work rsp_demux_005                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux_004.sv"                     -work rsp_demux_004                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux_004                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_mux_004.sv"                       -work cmd_mux_004                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                 -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_demux_001.sv"                     -work cmd_demux_001                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                            -work nios2_gen2_data_master_limiter            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                             -work nios2_gen2_data_master_limiter            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                     -work nios2_gen2_data_master_limiter            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                            -work nios2_gen2_data_master_limiter            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_006.sv"                        -work router_006                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_002.sv"                        -work router_002                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router_001.sv"                        -work router_001                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0_router.sv"                            -work router                                    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                     -work jtag_uart_avalon_jtag_slave_agent_rsp_fifo
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                -work jtag_uart_avalon_jtag_slave_agent         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                         -work jtag_uart_avalon_jtag_slave_agent         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                               -work nios2_gen2_data_master_agent              
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                           -work jtag_uart_avalon_jtag_slave_translator    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                          -work nios2_gen2_data_master_translator         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu.vo"                                      -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_sysclk.v"                    -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_tck.v"                       -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_debug_slave_wrapper.v"                   -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_mult_cell.v"                             -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2_cpu_test_bench.v"                            -work cpu                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                   -work rst_controller                            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                 -work rst_controller                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/Qsys_irq_mapper.sv"                                          -work irq_mapper                                
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_1.v"                                    -work mm_interconnect_1                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_mm_interconnect_0.v"                                    -work mm_interconnect_0                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_timer.v"                                                -work timer                                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_sysid_qsys.vo"                                          -work sysid_qsys                                
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_sw.v"                                                   -work sw                                        
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_sdram.v"                                                -work sdram                                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_sdram_test_component.v"                                 -work sdram                                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_onchip_memory2_0.v"                                     -work onchip_memory2_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_nios2_gen2.v"                                           -work nios2_gen2                                
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_mipi_pwdn_n.v"                                          -work mipi_pwdn_n                               
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_led.v"                                                  -work led                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_key.v"                                                  -work key                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_jtag_uart.v"                                            -work jtag_uart                                 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/i2c_opencores.v"                                             -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/i2c_master_top.v"                                            -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/i2c_master_defines.v"                                        -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/i2c_master_byte_ctrl.v"                                      -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/i2c_master_bit_ctrl.v"                                       -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/timescale.v"                                                 -work i2c_opencores_camera                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_altpll_0.vo"                                            -work altpll_0                                  
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Qsys_alt_vip_vfb_0.vo"                                       -work alt_vip_vfb_0                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid.sv"                                     -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_sync_compare.v"                         -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_calculate_mode.v"                       -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_control.v"                              -work alt_vip_itc_0                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_mode_banks.sv"                          -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_IS2Vid_statemachine.v"                         -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_fifo.v"                                 -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_generic_count.v"                        -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_to_binary.v"                            -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sync.v"                                 -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_trigger_sync.v"                         -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sync_generation.v"                      -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_frame_counter.v"                        -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/alt_vipitc131_common_sample_counter.v"                       -work alt_vip_itc_0                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/TERASIC_CAMERA.v"                                            -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/CAMERA_RGB.v"                                                -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/CAMERA_Bayer.v"                                              -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Bayer2RGB.v"                                                 -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/Bayer_LineBuffer.v"                                          -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/rgb_fifo.v"                                                  -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/add2.v"                                                      -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/add4.v"                                                      -work TERASIC_CAMERA_0                          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/TERASIC_AUTO_FOCUS.v"                                        -work TERASIC_AUTO_FOCUS_0                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/F_VCM.v"                                                     -work TERASIC_AUTO_FOCUS_0                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/I2C_VCM_Config.v"                                            -work TERASIC_AUTO_FOCUS_0                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/I2C_VCM_Controller.v"                                        -work TERASIC_AUTO_FOCUS_0                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/VCM_CTRL_P.v"                                                -work TERASIC_AUTO_FOCUS_0                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/Qsys.v"                                                                                                                 
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi

onerror {abort all; puts stderr "The simulation process encountered an error and has aborted."; exit -code 1;}
set VSIM_VERSION_STR "Model Technology ModelSim ALTERA STARTER EDITION vsim 10.5b Simulator 2016.10 Oct  5 2016"
set QSYS_SIMDIR tb/simulation
source tb/simulation/mentor/msim_setup.tcl
# Suppress warnings from the std arithmetic libraries
set StdArithNoWarnings 1
set ELAB_OPTIONS "+nowarnTFMPC -dpioutoftheblue 1 -sv_lib \"C:/intelFPGA_lite/18.1/hls/windows64/bin/hls_cosim_msim32\" -nodpiexports"
elab
onfinish {stop}
run -all
set failed [expr [coverage attribute -name TESTSTATUS -concise] > 1]
if {${failed} != 0} { puts stderr "The simulation process encountered an error and has been terminated."; }
exit -code ${failed}

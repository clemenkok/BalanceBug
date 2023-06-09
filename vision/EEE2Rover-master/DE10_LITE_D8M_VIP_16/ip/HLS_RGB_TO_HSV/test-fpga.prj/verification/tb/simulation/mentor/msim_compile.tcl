onerror {abort all; exit -code 1;}
set VSIM_VERSION_STR "Model Technology ModelSim ALTERA STARTER EDITION vsim 10.5b Simulator 2016.10 Oct  5 2016"
set QSYS_SIMDIR tb/simulation
source tb/simulation/mentor/msim_setup.tcl
set ELAB_OPTIONS "+nowarnTFMPC -nodpiexports"
dev_com
com
elab
exit -code 0

### Quartus Version: Quartus Prime Lite 18.1
### FPGA: DE10-Lite

# Setting Up VGA output to Monitor

Follow README in folder DE10_LITE_D8M_VIP.

NOTE: WILL NOT WORK WITH QUARTUS 19 AND ABOVE. For those versions:
- Nios® II EDS on Windows requires Ubuntu 18.04 LTS on Windows Subsystem for Linux (WSL), which requires a manual installation.
- Nios® II EDS requires you to install an Eclipse IDE manually.

# D8M Manual and Datasheet

In folder D8M-GPIO_v.1.1.2_SystemCD.

# DE10-Lite Manual and Datasheet

In folder DE10-Lite_v.2.1.0_SystemCD.

# Opening an Existing Workspace in NIOS II

https://community.intel.com/t5/Nios-II-Embedded-Design-Suite/How-do-you-open-a-project-in-NIOS-II-Eclipse/m-p/180653

You need to do this in a few steps as dalon mentioned above. 

1. Start NIOS and select workspace to 'software' folder 

2. Import project code. Select folder for this, and make sure name of project matches folder. 

3. Import BSP files. Select folder for this and again make sure name matches folder. 
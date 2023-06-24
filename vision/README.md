### Quartus Version: Quartus Prime Lite 18.1
### FPGA: DE10-Lite

# Running Generic Monitor Demo

Follow README in folder DE10_LITE_D8M_VIP.

NOTE: WILL NOT WORK WITH QUARTUS 19 AND ABOVE. For those versions:
- Nios® II EDS on Windows requires Ubuntu 18.04 LTS on Windows Subsystem for Linux (WSL), which requires a manual installation.
- Nios® II EDS requires you to install an Eclipse IDE manually.

# Running Software + Hardware

1. Programme the .sof file onto the FPGA using Quartus
2. Build the .elf file
    - Run -> Run Configurations -> NiosII Hardware
    - Select the .elf file and click Run

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

# Notes for myself (Messy)

NIOS II Project Structure and Notes:

1. Design the different hardware components in Verilog
    - Define read and write registers within the component (These are what the C code accesses and read/write to control or trigger things to happen in the verilog code)
    - In verilog, to check if a register has been written/read: do eg:
        - if      (s_chipselect & s_read)
        - if      (s_address == `REG_STATUS)
        - Put these address checks in positive-edge-clocked ff
2. Connect the inputs and outputs of the different hardware components to each other using Qsys. 
3. Use Qsys to generate BSP and System.h in Eclipse SBT
4. Have two separate projects in the NIOS workspace for the C code and the bsp

How is the C code written?
- Header files, C files etc as usual. Main.c as usual.
- The C code reads and writes to registers in the verilog files to control/trigger logic. The logic itself is written in the verilog files.

5. Build project into an ELF file

My suspicion:
- Pixel data comes in packets of 24 bits:
    - source_data: 24 bits, 8 for R, 8 for G, and 8 for B if it is not a sop or eop
- sop: start of packet (1 for true)
- eop: end of packet (1 for true)
- 1 packet per positive clock edge
- packet_video: 1 if current data packet is a packet that carries video info (?)
- Pixel data is serial

# Implementing 3x3 Gaussian Kernel

- Implement 4 line buffers
    - 3 previous line + 1 current line being filled
    - Each line buffer is an array of size 24 bits (8x3colors) times 640 pixels, so a total of 15360 (parameterisable)
- Using 3x3 kernal means we will need to store a minimum of 2 full rows of pixels + 3 extra pixels (This is a total of 1283 pixels = 30792 bits


http://www.hlam.ece.ufl.edu/EEL4712/LectureNotes/MAX10-EmbeddedMemory.pdf

# SQUEEZING OUT EXTRA RAM FROM THE START CODE
- ON CHIP MEMORY CHANGED FROM SIZE OF 131072 BYTES TO 120000 BYTES

# Steps to flash the fpga permanently so that it continues to have the prior programmed after power off

1. push quartus project and meminit to public github repo
2. from ssh, clone the repo using https
3. open qsys and follow the instructions to enable initialise memory content
4. compile fpga project
5. Quartus will not permit you to program the flash memory with certain IP blocks without a licence. These include the NIOS II CPU core and video IP blocks. You will need to compile the project on the departmental server to use the IP licences. In Quartus, open Tools → License Setup and check that the License file includes 7193@ee-lic01.ee.ic.uk

You need to change the configuration mode to permit the inclusion of your NIOS II code in the configuration. Open Assignments → Device and Device and Pin Options. Set the configuration mode to 'Single Compressed Image with Memory Initialization'

6. compile
7. download the POF from the VPN
8. Run quartus programmer diretly from local computer by typing "quartus_pgmw" in windows search
9. In the programmer, tick program/configure and start























)



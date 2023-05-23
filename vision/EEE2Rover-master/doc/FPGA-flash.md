 # Flashing the FPGA
 
 During development you configure the FPGA with a `.sof` file. The configuration is volatile and the FPGA reverts to its original configuration when power is removed.
 
 You need to program a flash memory inside the FPGA if you want your FPGA configuration to persist when power is reapplied. That is done with a `.pof` file.
 
 ## Quartus Licence and Project Setup
 
 Quartus will not permit you to program the flash memory with certain IP blocks without a licence. These include the NIOS II CPU core and video IP blocks.
 You will need to compile the project on the departmental server to use the IP licences.
 In Quartus, open Tools → License Setup and check that the License file includes `7193@ee-lic01.ee.ic.uk`
 
 You need to change the configuration mode to permit the inclusion of your NIOS II code in the configuration.
 Open Assignments → Device and Device and Pin Options. Set the configuration mode to 'Single Compressed Image with Memory Initialization'
 
 ## Adding NIOS II code to the FPGA configuration
 
 You will want the NIOS II to run automatically on power up and this requires your NIOS II code to be included in the flash memory.
 First, make your NIOS II project in the correct format in Eclipse for NIOS II.
 Right click on the main project (not the BSP project) in the Project Explorer and choose Make Targets → Build. Select mem_init_generate and click Build.
 If that is successful you will have some new files in `DE10_LITE_D8M_VIP_16/software/D8M_Camera_Test/mem_init/`
 
 Open Qsys (Platform Designer) in Quartus and open your system configuration.
 Select the On-Chip Memory block - this is the memory for the CPU and it is where your NIOS II binary will be stored.
 In the configuration window on the right, enable 'Initialize memory content' and 'Enable non-default initialization file'.
 Select the .hex file that was created by Eclipse as 'User created initialization file'
 Generate the Qsys system and compile the FPGA project.
 
 ## Flashing the FPGA
 
 Open Quartus Programmer and connect to your FPGA board.
 You can run the programmer on your own computer, or you can run it on the departmental server and connect to a JTAG server running on your own computer.
 Select the line for the 10M50DAF484 device and select 'Change File', or double-click the device.
 Choose `EEE2Rover/DE10_LITE_D8M_VIP_16/output_files/DE10_LITE_D8M_VIP.pof` and tick 'Program/Configure' on the top line, which will also enable the lower lines.
 Click 'Start' and wait for programming to complete. Disconnect and reconnect power to the FPGA board.
 Now the FPGA will start up in your configuration and the NIOS II will automatically run your firmware.
 
 If the licence does not work your project will build in 'Opencores plus' mode.
 You will have seen that before - the only output file is `DE10_LITE_D8M_VIP_time_limited.sof`.
 There is more information about licensed IP blocks in the compilation report, under Assembler → Encrypted IP Cores Summary.
 
 ## Running NIOS II direct from Flash
 
 You may find that you run out of memory (M9K blocks) on your FPGA, either because you need to increase the size of the on-chip memory to support more code, or because you need more memory to buffer pixels in the image processor.
 The NIOS II can be configured to run code directly from the flash memory, avoiding the need to store the program in RAM and reducing the required size of the on-chip memory.
 I haven't tried this, but you can find documentation here: https://www.intel.com/content/www/us/en/docs/programmable/683689/current/processor-booting-from-on-chip-flash-ufm.html

A downside of this approach is that the flash will need reprogramming whenever you change your code. That may slow your development process and it might not be possible without the IP licences.

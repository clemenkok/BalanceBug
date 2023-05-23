# Getting started: FPGA starter project

  ## Running Quartus on your own computer
  
  You can install Quartus Prime Lite 18.1 from the [Intel website](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html). If you already have version 18.0 installed from your lab work then that should work too. Clone this repository onto your computer and open the project `EEE2Rover/DE10_LITE_D8M_VIP_16/DE10_LITE_D8M_VIP_16.qpf`
  
  Running Quartus on your own computer will not give you full access to the NIOS II and video processing libraries. That means your project will compile using 'OpenCore Plus' and you won't be able to disconnect the host PC or flash the FPGA board so it boots into your configuration.
  
  ## Running Quartus on EEE Department server ee-mill1

  You can compile your FPGA project on the EEE department application server. The server is powerful and it can compile projects quickly, but you might find the graphical interface to be laggy and hard to use. The servers have access to the licence for NIOS II and the licence for the video IP blocks is currently on order.
 
   ### Log in
    
  You'll need to start a SSH session with X window forwarding to allow you to use the graphical interface.
      
   #### Windows
        
  1. Install [MobaXterm software](https://mobaxterm.mobatek.net/)
  2. Connect to [Imperial College VPN](https://www.imperial.ac.uk/admin-services/ict/self-service/connect-communicate/remote-access/virtual-private-network-vpn/)
  3. Run MobaXterm and start a new session
  4. Choose SSH, enter the hostname `ee-mill2.ee.ic.ac.uk` and your College username
  5. Click OK and enter your College password when prompted

   #### macOS
  1. Install [XQuartz](https://www.xquartz.org/)
  2. Start a terminal
  3. Start an SSH session with `ssh -X <username>@ee-mill2.ee.ic.ac.uk`

  Once you have logged in, test window forwarding by running `gedit &`. You should see a text editor window.
     
   ### Build the starter project
   
 Clone the starter project to your nfshome network drive:
 `cd ~/nfshome`
 `git clone git@github.com:edstott/EEE2Rover.git`

 `nfshome` is a network drive similar to your main College home directory (H:), which is mounted at `~/homedir`. However, Quartus doesn't work with projects stored in your home directory so you must use nfshome. You can access nfshome from other devices by mapping the network location `\\icnfs-ee.cc.ic.ac.uk\<username>`

 Run Quartus with the command `Quartus &` and open the project at `~/nfshome/EEE2Rover/DE10_LITE_D8M_VIP_16/DE10_LITE_D8M_VIP_16.qpf`. Run a full compilation
    
  ## Download the bitstream and firmware to the FPGA
  
  Fit the camera module on the DE10-Lite FPGA board. Connect the FPGA to your computer with the USB cable and run the Quartus programming utlity on your local machine. You will need Quartus Lite installed locally or in a virtual machine, like you used for the FPGA lab work. You can run the programmer utlity independently of the Quartus IDE by running the executable `quartus_pgmw`

  ### Programming the FPGA from ee-mill1
  If you are using Quartus on ee-mill1 you can copy the generated bitstream `EEE2Rover/DE10_LITE_D8M_VIP_16/output_files/DE10_LITE_D8M_VIP_16_time_limited.sof` to your local computer using the file explorer on MobaXterm. You can also connect Quartus to your local programmer with the following steps:
  1. In the Programmer window on your local computer, select 'Hardware Setup', switch to the tab for 'JTAG settings' and click 'Configure Local JTAG Server'
  2. Enable the server and enter a password. It can be anything.
  3. Click 'OK' and close the Hardware Setup window.
  4. Connect the computer or virtual machine running the Programmer to the Imperial College VPN
  5. Find the IP address of the computer's VPN interface. Run `ipconfig` in Windows or `ip addr` in Linux. Look for an IP address under an entry like `PPP adapter Imperial College` - the exact name may depend on how you named the VPN connection.
  6. Run the Programmer on ee-mill1 by clicking the programmer button in Quartus IDE or running `quartus_pgmw`.
  7. Select 'Hardware Setup', switch to the tab for 'JTAG settings'. Click 'Add Server' and enter the VPN IP address of the computer connected to the FPGA. Use the password you set in step 2.
  8. You should now be able to configure the FPGA directly from Quartus on ee-mill1
  9. The JTAG server on the FPGA-connected computer does not require the Programmer tool to be running once it is set up. However, you may need to start and enable the jtag server using `jtagserver --start` and `jtagconfig --enableremote <password>`

  ### Download and run the firmware
  The FPGA configuration requires firmware for the NIOS II soft processor. The firmware manages configuration of the camera and its bridge device so there will be no video data until the firmware is started. Source code and a pre-built firmware binary are included in the repository.
  
  Download the firmware to the FPGA by running:
  `nios2_command_shell.sh nios2-download EEE2Rover/DE10_LITE_D8M_VIP_16/software/D8M_Camera_Test/D8M_Camera_Test.elf -c 1 -g`
  `nios2_command_shell.sh` may not be found in the PATH variable for your system. It is located in the Quartus installation in `nios2eds` (`/usr/local/altera/18.1/nios2eds` on the EEE deparmental servers)
  You can download the firmware from your local machine or VM, or from ee-mill1 once you have set up the JTAG server. The parameter `-c 1` is the 'cable number' and you may need to change it if more than one item appears in the list of available hardware in the Quartus programmer. If the cable number is wrong you may get the misleading message `There is a problem with the Quartus Prime installation on your computer`.
  
  On downloading the firmware you will see progress and status messages showing that it was successful.
  
  ## Observing the camera feed
  The starter system includes a VGA video output so you can view the camera stream and any annotations you might apply for debugging purposes. Connect the 15-pin VGA port on the FPGA board to your computer using the VGA to USB adapter module. The adapter module enumerates as a camera device so you can see the video stream by opening the camera app on your computer and selecting the 'AFN_Cap' camera.
  
  If the FPGA has the default power-on configuration (counting digits) then the video stream will show a blue Altera/Terasic splash screen. If the FPGA has been configured with the starter project and the firmware has been downloaded, you will see the camera feed. Toggling switch SW0 will switch between raw camera data and a basic image processor output that highlights red pixels.
  
![WIN_20210513_11_03_10_Pro](https://user-images.githubusercontent.com/4660308/118118469-e290fc00-b3e4-11eb-9659-246b53dafe76.jpg)
*Unprocessed Image*

![WIN_20210513_11_03_16_Pro](https://user-images.githubusercontent.com/4660308/118118518-f0df1800-b3e4-11eb-8408-7861ba3cd8ba.jpg)
*Image highlighting red pixels*

The VGA output from the DE10-Lite board has only 4 bits per colour channel and you will notice the limited colour depth in the displayed video stream. The camera produces 8 bits of colour depth per channel, which means that your image processing algorithm will be able to 'see' a higher colour resolution than can be displayed on the video output.
  
  
  
  


    
    

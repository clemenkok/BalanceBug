# FPGA Starter System Documentation

The starter system is based on the demonstrator for the Terasic D8M-GPIO camera module. It consists of a streaming video pipeline with supervisor firmware running on a NIOS II soft processor. 

 ## Streaming video pipeline
  The file Qsys.qsys contains a number of IP blocks connected together in a streaming video pipline.
  
  ![image](https://user-images.githubusercontent.com/4660308/118411031-8cdd7d80-b68a-11eb-8ab2-9c43b0dc87aa.png)


## Demonstration image processor
  The file /ip/EEE_IMGPROC/EEE_IMGPROC.v contains an example of a streaming video processor
  
   ### Input and Output Ports
   The module has the following input and output ports:
   - A video stream sink input
   - A video stream source output
   - A memory-mapped 'slave' interface (the FPGA tool uses outdated terminology here)
   - A switch input

### Streaming interface
  The module works as a component in a video stream - video data passes through the block from the camera to the VGA output. The block supports the Avalon streaming protocol to make sure that data is correctly synchronised. This includes a signal called 'ready' that stalls the streaming pipeline if the output is not able to receive data - a process known as *backpressure*.
  
  - [] TODO: diagram of streaming system
  
  The module contains two pipelinine stages that are implemented as instances of a streaming register submodule `STREAM_REG`. These blocks are analogous to a normal register with `data_in` as D and `data_out` as Q. `in_valid` is the enable signal that is controlled by the previous register in the stream pipeline. `out_valid` is an enable signal that is generated for the subsequent stage. `ready_in` is the backpressure input from the next stage and `ready_out` is the backpressure output to the previous stage - the ready signal passes in the opposite direction to the data.
  
  The implementation allows you to make changes to the video data as it passes between the two streaming registers. That gives you one clock cycle of logic latency (10ns), which is enough for simple annotations like in the example.
  
  You must ensure that the streaming pipeline is preserved, otherwise you won't see the video output and possibly the video input will be blocked too.
  
  Documentation for all the Avalon interfaces is [here](https://www.intel.com/content/www/us/en/programmable/documentation/nik1412467993397.html). Avalon streaming is in Chapter 5.
  The project uses a specialisation of Avalon streaming for sending video frames. You can find information on that [here](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/ug/ug_vip.pdf), in Chapter 2. The document also describes some of the other IP blocks that are used in the video pipeline.
  
  ### Vision example
  The demo uses a very simple threshold to detect pixels with high red content and low green and blue content. It also produces an annotated video stream which converts the image to greyscale and highlights pixels that pass the threshold in bright red.
  
  The demo also finds the bounding box of all the red pixels in the image. When a pixel is red, the x and y coordinates are used to update a bounding box stored in `x_min`, `x_max`, `y_min` and `y_max`. At the start of each frame, these values are copied to registers `left`, `right`, `top` and `bottom`. The output pixel is set to green if the x or y coordinates match either of the relevant registers. Since the overall bounding box is only known once the entire frame has been scanned, note that the displayed bounding box is for the previous frame of video data, not the frame that is displayed.
  
  The video data in the streaming interface does not contain the coordinates of each pixel. Instead, the coordinates are found by counting the pixels. The width of the image is set as a constant so that the y coordinate can be incremented once an entire row of pixels has passed through. The pixel counter is reset when the `sop` (start of packet) flag is set in the streaming data.
  
  ### Memory-mapped interface
  The block has a memory mapped interface for input and output with the NIOS II processor.
  
  Offset | Function
------------ | -------------
0x0 | Status register
0x1 | Read message buffer
0x2 | Block ID
0x3 | Bounding Box Colour

 Status register bits:
 Bits | Function
------------ | -------------
31:16 | Unimplemented
15:8 | Number of words in message buffer (read only)
7:5 | Unused
4 | Flush message buffer (write only)
3:0 | Unused
  
 ## Video processor challenge
  You can add whatever logic is necessary to detect and locate these objects. There are a few options:
 - Transform the video to make it more suitable for object detection. e.g. filtering, colour space conversion
 - Find pixels that could be part of objects
 - Group candidate pixels together to find bounding boxes
 - Use the position, geometry and pattern of objects to determine their relative to the camera in three dimensions
 - (Maybe software) Filter out glitches and erroneous results

  Note that the streaming interface does not give you random access to the image data - you have to process pixels in the order that they arrive. Some processing algorithms require you to directly compare a pixel with the pixel above, for example. To do this you'll need to store an entire row of data in a shift register.
 
## Connecting the FPGA to an ESP32

 The starter project shows you how to get information from your logic into software on the NIOS II processor. From there, it needs to be transferred to the ESP32 microcontroller so that it can be used for obstacle avoidance and uploaded to the remote database.
 
 The Qsys Platform Designer has a library of communication modules, such as UART, that you can connect to the NIOS II via its memory-mapped bus. Instantiating these modules will create handlers in the board support package that allow you to access these modules in software. You can also map their I/O pins to physical pins that connect to matching communication ports on the ESP32.
 

module EEE_IMGPROC(
	// global clock & reset
	clk,
	reset_n,
	
	// mm slave
	s_chipselect,
	s_read,
	s_write,
	s_readdata,
	s_writedata,
	s_address,

	// stream sink
	sink_data,
	sink_valid,
	sink_ready,
	sink_sop,
	sink_eop,
	
	// streaming source
	source_data,
	source_valid,
	source_ready,
	source_sop,
	source_eop,
	
	// conduit
	mode
	
);


// global clock & reset
input	clk;
input	reset_n;

// mm slave
input							s_chipselect;
input							s_read;
input							s_write;
output	reg	[31:0]	s_readdata;
input	[31:0]				s_writedata;
input	[2:0]					s_address;


// streaming sink
input	[23:0]            	sink_data;
input								sink_valid;
output							sink_ready;
input								sink_sop;
input								sink_eop;

// streaming source
output	[23:0]			  	   source_data;
output								source_valid;
input									source_ready;
output								source_sop;
output								source_eop;

// conduit export
input                         mode;

////////////////////////////////////////////////////////////////////////
//
parameter IMAGE_W = 11'd640;
parameter IMAGE_H = 11'd480;
parameter MESSAGE_BUF_MAX = 256;
parameter MSG_INTERVAL = 60;
parameter BB_COL_DEFAULT = 24'h00ff00;


wire [7:0]   red, green, blue, grey;
wire [7:0]   red_out, green_out, blue_out;

wire         sop, eop, in_valid, out_ready;
////////////////////////////////////////////////////////////////////////
reg [10:0] x, y;
reg packet_video;

wire [27:0] hsv_rgb;
wire [7:0] value;
wire [18:0] hue;
wire saturation;
wire saturation_out;

assign value = hsv_rgb[7:0];
assign hue = hsv_rgb[26:8];
assign saturation_out = hsv_rgb[27];

// Turn RGB into HSV
// Conversions from the 56 bit HSV value to normal HSV range
// Hue is given by hue/393222*360 degrees
// Saturation is given by saturation/2**16
// Value is given by value/2**8

SATURATION sat(
	.r(red),
	.g(green),
	.b(blue),
	.s(saturation)
);

rgb_to_hsv rgb_hsv(
	.clock(clk),
	.resetn(1'b1), // this should be 1
	.returndata(hsv_rgb),
	.red(red),
	.green(green),
	.blue(blue),
	.s(saturation)
);


reg color_detect;
reg [26:0] color_id;

// Highlight detected areas
reg [23:0] color_high;
assign grey = green[7:1] + red[7:2] + blue[7:2]; //Grey = green/2 + red/4 + blue/4

// Show bounding box
wire [23:0] new_image;
wire bb_active;
assign bb_active = (x == left) | (x == right) | (y == top) | (y == bottom);
assign new_image = bb_active ? bb_col : color_high;

// State machine to change between colors for detection on consecutive frames
reg [1:0] curr_color; // 0 for red, 1 for blue, 2 for yellow
reg [1:0] next_color;

//color_detect = (hue > 0) & (hue < 32768) & saturation_out & (value > 64);
//color_high  =  color_detect ? {8'hff, 8'h00, 8'h00} : {grey, grey, grey};


always@(*) begin
	case(curr_color)
		2'b0: begin // curr color is red 0 to 20
			next_color = 2'b1;
			color_detect = (hue > 0) & (hue < 21845) & saturation_out & (value > 128);
			color_high  =  color_detect ? {8'hff, 8'h00, 8'h00} : {grey, grey, grey};
			color_id = 1;
		end
		2'b1: begin // curr color is blue
			// for blue, use hue range of 160 to 250, threshold = (207533, 273070)
			// saturation of 70% to 100%, threshold = (45875, 65535)
			// value of 70% to 100%, threshold = (180, 255)
			next_color = 2'b10;
			color_detect = (hue > 174765) & (hue < 273070) & saturation_out & (value > 180);
			color_high  =  color_detect ? {8'h00, 8'h00, 8'hff} : {grey, grey, grey};
			color_id = 2;
		end
		2'b10: begin // curr color is yellow 20 to 70
			next_color = 2'b0;
			color_detect = (hue > 21845) & (hue < 76459) & saturation_out & (value > 180);
			color_high  =  color_detect ? {8'hff, 8'hff, 8'h00} : {grey, grey, grey};
			color_id = 3;
		end
	endcase
end

always@(posedge sop) begin
	if (frame_count == 0) curr_color = next_color;
end



// GAUSSIAN BLUR
/*
wire [23:0] new_image;
wire [7:0] new_red, new_green, new_blue;
GAUSSIAN_BLUR #(
	.LINE_WIDTH(IMAGE_W),
	.PIXEL_DATA_WIDTH(8),
	.NUM_ADDR_BITS_X(11),
	.NUM_ADDR_BITS_Y(11)
)
	GB_RED (
	.clk(clk),
	.x(x),
	.y(y),
	.curr_pixel_data(red),
	.blurred_pixel_data(new_red),
	.in_valid(in_valid)
);


GAUSSIAN_BLUR #(
	.LINE_WIDTH(IMAGE_W),
	.PIXEL_DATA_WIDTH(8),
	.NUM_ADDR_BITS_X(11),
	.NUM_ADDR_BITS_Y(11)
)
	GB_GREEN (
	.clk(clk),
	.x(x),
	.y(y),
	.curr_pixel_data(green),
	.blurred_pixel_data(new_green),
	.in_valid(in_valid)
);

GAUSSIAN_BLUR #(
	.LINE_WIDTH(IMAGE_W),
	.PIXEL_DATA_WIDTH(8),
	.NUM_ADDR_BITS_X(10),
	.NUM_ADDR_BITS_Y(9)
)
	GB_BLUE (
	.clk(clk),
	.x(x),
	.y(y),
	.curr_pixel_data(blue),
	.blurred_pixel_data(new_blue)
);
*/

//assign new_image = {new_red, new_green, new_blue};


// Switch output pixels depending on mode switch
// Don't modify the start-of-packet word - it's a packet discriptor
// Don't modify data in non-video packets
assign {red_out, green_out, blue_out} = (mode & ~sop & packet_video) ? new_image : {red,green,blue};

//Count valid pixels to tget the image coordinates. Reset and detect packet type on Start of Packet.

always@(posedge clk) begin
	if (sop) begin
		x <= 11'h0;
		y <= 11'h0;
		packet_video <= (blue[3:0] == 3'h0);
	end
	else if (in_valid) begin
		if (x == IMAGE_W-1) begin
			x <= 11'h0;
			y <= y + 11'h1;
		end
		else begin
			x <= x + 11'h1;
		end
	end
end

//reg label_control_rst;

//Find first and last red pixels
reg [10:0] x_min, y_min, x_max, y_max;
always@(posedge clk) begin
	if (color_detect & in_valid) begin	//Update bounds when the pixel is red
		if (x < x_min) x_min <= x;
		if (x > x_max) x_max <= x;
		if (y < y_min) y_min <= y;
		y_max <= y;
	end
	if (sop & in_valid) begin	//Reset bounds on start of packet
		x_min <= IMAGE_W-11'h1;
		x_max <= 0;
		y_min <= IMAGE_H-11'h1;
		y_max <= 0;
	end
end

//Process bounding box at the end of the frame.
reg [1:0] msg_state;
reg [10:0] left, right, top, bottom;
reg [7:0] frame_count;
always@(posedge clk) begin
	if (eop & in_valid & packet_video) begin  //Ignore non-video packets
		
		//Latch edges for display overlay on next frame
		left <= x_min;
		right <= x_max;
		top <= y_min;
		bottom <= y_max;
		
		
		//Start message writer FSM once every MSG_INTERVAL frames, if there is room in the FIFO
		frame_count <= frame_count - 1;
		
		if (frame_count == 0 && msg_buf_size < MESSAGE_BUF_MAX - 3) begin
			msg_state <= 2'b01;
			frame_count <= MSG_INTERVAL-1;
		end
	end
	
	//Cycle through message writer states once started
	if (msg_state != 2'b00) msg_state <= msg_state + 2'b01;

end
	
//Generate output messages for CPU
reg [31:0] msg_buf_in; 
wire [31:0] msg_buf_out;
reg msg_buf_wr;
wire msg_buf_rd, msg_buf_flush;
wire [7:0] msg_buf_size;
wire msg_buf_empty;

`define RED_BOX_MSG_ID "RBB"

always@(*) begin	//Write words to FIFO as state machine advances
	case(msg_state)
		2'b00: begin
			msg_buf_in = 32'b0;
			msg_buf_wr = 1'b0;
		end
		2'b01: begin
			//msg_buf_in = `RED_BOX_MSG_ID;	//Message ID
			msg_buf_in = {5'b10100, color_id};
			msg_buf_wr = 1'b1;
		end
		2'b10: begin
			msg_buf_in = {5'b0, x_min, 5'b0, y_min};	//Top left coordinate
			msg_buf_wr = 1'b1;
		end
		2'b11: begin
			msg_buf_in = {5'b11110, x_max, 5'b11110, y_max}; //Bottom right coordinate
			msg_buf_wr = 1'b1;
		end
	endcase
end


//Output message FIFO
MSG_FIFO	MSG_FIFO_inst (
	.clock (clk),
	.data (msg_buf_in),
	.rdreq (msg_buf_rd),
	.sclr (~reset_n | msg_buf_flush),
	.wrreq (msg_buf_wr),
	.q (msg_buf_out),
	.usedw (msg_buf_size),
	.empty (msg_buf_empty)
	);


//Streaming registers to buffer video signal
STREAM_REG #(.DATA_WIDTH(26)) in_reg (
	.clk(clk),
	.rst_n(reset_n),
	.ready_out(sink_ready),
	.valid_out(in_valid),
	.data_out({red,green,blue,sop,eop}),
	.ready_in(out_ready),
	.valid_in(sink_valid),
	.data_in({sink_data,sink_sop,sink_eop})
);

STREAM_REG #(.DATA_WIDTH(26)) out_reg (
	.clk(clk),
	.rst_n(reset_n),
	.ready_out(out_ready),
	.valid_out(source_valid),
	.data_out({source_data,source_sop,source_eop}),
	.ready_in(source_ready),
	.valid_in(in_valid),
	.data_in({red_out, green_out, blue_out, sop, eop})
);


/////////////////////////////////
/// Memory-mapped port		 /////
/////////////////////////////////

// Addresses
`define REG_STATUS    			0
`define READ_MSG    				1
`define READ_ID    				2
`define REG_BBCOL					3

//Status register bits
// 31:16 - unimplemented
// 15:8 - number of words in message buffer (read only)
// 7:5 - unused
// 4 - flush message buffer (write only - read as 0)
// 3:0 - unused


// Process write

reg  [7:0]   reg_status;
reg	[23:0]	bb_col;

always @ (posedge clk)
begin
	if (~reset_n)
	begin
		reg_status <= 8'b0;
		bb_col <= BB_COL_DEFAULT;
	end
	else begin
		if(s_chipselect & s_write) begin
		   if      (s_address == `REG_STATUS)	reg_status <= s_writedata[7:0];
		   if      (s_address == `REG_BBCOL)	bb_col <= s_writedata[23:0];
		end
	end
end


//Flush the message buffer if 1 is written to status register bit 4
assign msg_buf_flush = (s_chipselect & s_write & (s_address == `REG_STATUS) & s_writedata[4]);


// Process reads
reg read_d; //Store the read signal for correct updating of the message buffer

// Copy the requested word to the output port when there is a read.
always @ (posedge clk)
begin
   if (~reset_n) begin
	   s_readdata <= {32'b0};
		read_d <= 1'b0;
	end
	
	else if (s_chipselect & s_read) begin
		if   (s_address == `REG_STATUS) s_readdata <= {16'b0,msg_buf_size,reg_status};
		if   (s_address == `READ_MSG) s_readdata <= {msg_buf_out};
		if   (s_address == `READ_ID) s_readdata <= 32'h1234EEE2;
		if   (s_address == `REG_BBCOL) s_readdata <= {8'h0, bb_col};
	end
	
	read_d <= s_read;
end

//Fetch next word from message buffer after read from READ_MSG
assign msg_buf_rd = s_chipselect & s_read & ~read_d & ~msg_buf_empty & (s_address == `READ_MSG);
						


endmodule


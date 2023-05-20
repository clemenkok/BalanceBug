// Packet: follow video packet of "Avalon-ST Video Protocol" defined VIP spec.



module TERASIC_CAMERA(
	clk,
	reset_n,
	
	// streaming source interface
	st_data,
	st_valid,
	st_sop,
	st_eop,
	st_ready,



	// export
	CAMERA_D,
	CAMERA_FVAL,
	CAMERA_LVAL,
	CAMERA_PIXCLK
	
);



input		clk;
input 	reset_n;


output	  [23:0]	st_data;
output				st_valid;
output				st_sop;
output		 		st_eop;
input				st_ready;



input		      [11:0]		CAMERA_D;
input		            		CAMERA_FVAL;
input		            		CAMERA_LVAL;
input		            		CAMERA_PIXCLK;

////////////////////////////////////////////////
/*  ##lou mod
parameter VIDEO_W	= 800;
parameter VIDEO_H	= 600;
*/

parameter VIDEO_W	= 800;
parameter VIDEO_H	= 480;
`define VIDEO_PIX_NUM	(VIDEO_W * VIDEO_H)

////////////////////////////////////////////////




wire [11:0] RGB_R,RGB_G, RGB_B;
wire [11:0] RGB_X,RGB_Y;
wire		RGB_VALID;

CAMERA_RGB CAMERA_RGB_inst( 
	.reset_n(reset_n),
	
	// Bayer Input
	.CAMERA_D(CAMERA_D),
	.CAMERA_FVAL(CAMERA_FVAL),
	.CAMERA_LVAL(CAMERA_LVAL),
	.CAMERA_PIXCLK(CAMERA_PIXCLK),
	
	// RGB Output
	.RGB_R(RGB_R),
	.RGB_G(RGB_G),
	.RGB_B(RGB_B),
	.RGB_X(RGB_X),
	.RGB_Y(RGB_Y),
	.RGB_VALID(RGB_VALID)
	
);		

defparam CAMERA_RGB_inst.VIDEO_W = VIDEO_W;		
defparam CAMERA_RGB_inst.VIDEO_H = VIDEO_H;
							


/////////////////////////////
// write rgb to fifo

reg [25:0]	 fifo_w_data;  // 1-bit sop + 1-bit eop + 24-bits data
wire fifo_w_full;
wire sop;
wire eop;
wire in_active_area;

assign sop = (RGB_X == 0 && RGB_Y == 0)?1'b1:1'b0;
assign eop = (((RGB_X+1) == VIDEO_W) && ((RGB_Y+1) == VIDEO_H))?1'b1:1'b0;

assign in_active_area = ((RGB_X < VIDEO_W) && (RGB_Y < VIDEO_H))?1'b1:1'b0;

wire [25:0] w_data;
assign w_data = {sop,eop, RGB_B[11:4], RGB_G[11:4], RGB_R[11:4]};


reg fifo_w_write;
always @ (posedge CAMERA_PIXCLK or negedge reset_n)
begin
	if (~reset_n)
	begin
		fifo_w_write <= 1'b0;
		//push_fail <= 1'b0;
	end
	else if (RGB_VALID & in_active_area)
	begin
		
		if (!fifo_w_full)
		begin
	      fifo_w_data <= {sop,eop, RGB_B[11:4], RGB_G[11:4], RGB_R[11:4]};
			fifo_w_write <= 1'b1;
		end
		else
		begin
			fifo_w_write <= 1'b0;
		//	push_fail <= 1'b1; // fifo full !!!!!
		end
	end
	else
		fifo_w_write <= 1'b0;
end



/////////////////////////////
// read from fifo
wire 		fifo_r_empty;
wire [25:0] fifo_r_q;		
wire 		fifo_r_rdreq_ack;





/////////////////////////////
// FIFO
rgb_fifo rgb_fifo_inst(
	// write
	.data(fifo_w_data),
	.wrclk(~CAMERA_PIXCLK),
	.wrreq(fifo_w_write),
	.wrfull(fifo_w_full),
	
	// read
	.rdclk(clk),
	.rdreq(fifo_r_rdreq_ack),
	.q(fifo_r_q),
	.rdempty(fifo_r_empty),
	//
	.aclr(~reset_n)
	
	);	
	
	

///////////////////////////////
wire frame_start;
assign frame_start = fifo_r_q[25] & ~fifo_r_empty;


/////////////////////////////////////
// send control package, id=15
wire send_control_packet;
reg [2:0] control_index;

wire [25:0]control_package[3:0];

wire [15:0] width;
wire [15:0] height;
wire [3:0]  interlacing;
assign width = VIDEO_W;
assign height = VIDEO_H;
assign interlacing = 4'b0011;

assign control_package[0] = {1'b1, 1'b0, 24'd15};
assign control_package[1] = {1'b0, 1'b0, 4'b0,width[7:4], 4'b0, width[11:8], 4'b0, width[15:12]};
assign control_package[2] = {1'b0, 1'b0, 4'b0,height[11:8], 4'b0, height[15:12], 4'b0,width[3:0]};
assign control_package[3] = {1'b0, 1'b1, 4'b0,interlacing, 4'b0,height[3:0], 4'b0,height[7:4]};


assign send_control_packet = frame_start && (control_index < 4);

always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		control_index <= 0;
	else if (~frame_start)
		control_index <= 0;  // reset index
	else if (send_control_packet & st_ready) 
		control_index <= control_index + 1;  // update index
end	


///////////////////////////////////// 
reg first_pix; 
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		first_pix <= 1'b0;
	else if (send_packet_id & st_ready)
		first_pix <= 1'b1;
	else
		first_pix <= 1'b0;
end	


wire send_packet_id;
assign send_packet_id = frame_start & ~send_control_packet & ~first_pix;
//assign send_packet_id = frame_start & ~send_control_packet ;

/////////////////////////////
// flag for ready_latency=1
reg pre_ready;
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		pre_ready <= 0;
	else
		pre_ready <= st_ready;
end

reg [31:0] count;
//debug
always @ (posedge clk or negedge reset_n)
begin
  if(~reset_n)
    count <= 0;
  else if(fifo_r_rdreq_ack)
  begin
    count <= count + 1;
  end
  else if(st_sop)
    count <= 0;
  else if(count == 32'd307200)
    count[24] = 1'b1;
  else
    count <= count;
  
  
end

////////////////////////////////////
assign {st_sop, st_eop, st_data} = send_control_packet?control_package[control_index]:(send_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0,fifo_r_q[24:0]};
//assign {st_sop, st_eop, st_data} = send_control_packet?control_package[control_index]:(send_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0,fifo_r_q[24:0]};
//assign {st_sop, st_eop, st_data} = (send_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0, count};
assign st_valid = send_control_packet?(1'b1):(~fifo_r_empty & pre_ready); 
assign fifo_r_rdreq_ack = st_valid & (~send_packet_id) & (~send_control_packet);




endmodule

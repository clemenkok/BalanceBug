module quartus_compile (
	  input logic resetn
	, input logic clock
	, output logic [27:0] rgb_to_hsv_returndata
	, input logic [7:0] rgb_to_hsv_red
	, input logic [7:0] rgb_to_hsv_green
	, input logic [7:0] rgb_to_hsv_blue
	, input logic [0:0] rgb_to_hsv_s
	);

	logic [27:0] rgb_to_hsv_returndata_reg;
	logic [7:0] rgb_to_hsv_red_reg;
	logic [7:0] rgb_to_hsv_green_reg;
	logic [7:0] rgb_to_hsv_blue_reg;
	logic [0:0] rgb_to_hsv_s_reg;


	always @(posedge clock) begin
		rgb_to_hsv_returndata <= rgb_to_hsv_returndata_reg;
		rgb_to_hsv_red_reg <= rgb_to_hsv_red;
		rgb_to_hsv_green_reg <= rgb_to_hsv_green;
		rgb_to_hsv_blue_reg <= rgb_to_hsv_blue;
		rgb_to_hsv_s_reg <= rgb_to_hsv_s;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	rgb_to_hsv rgb_to_hsv_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .returndata(rgb_to_hsv_returndata_reg)
		, .red(rgb_to_hsv_red_reg)
		, .green(rgb_to_hsv_green_reg)
		, .blue(rgb_to_hsv_blue_reg)
		, .s(rgb_to_hsv_s_reg)
	);



endmodule

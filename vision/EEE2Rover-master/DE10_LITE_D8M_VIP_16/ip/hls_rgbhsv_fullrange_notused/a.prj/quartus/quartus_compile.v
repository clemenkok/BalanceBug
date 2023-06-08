module quartus_compile (
	  input logic resetn
	, input logic clock
	, output logic [55:0] rgb_to_h_returndata
	, input logic [7:0] rgb_to_h_red
	, input logic [7:0] rgb_to_h_green
	, input logic [7:0] rgb_to_h_blue
	, output logic [55:0] rgb_to_s_returndata
	, input logic [7:0] rgb_to_s_red
	, input logic [7:0] rgb_to_s_green
	, input logic [7:0] rgb_to_s_blue
	, output logic [55:0] rgb_to_v_returndata
	, input logic [7:0] rgb_to_v_red
	, input logic [7:0] rgb_to_v_green
	, input logic [7:0] rgb_to_v_blue
	);

	logic [55:0] rgb_to_h_returndata_reg;
	logic [7:0] rgb_to_h_red_reg;
	logic [7:0] rgb_to_h_green_reg;
	logic [7:0] rgb_to_h_blue_reg;
	logic [55:0] rgb_to_s_returndata_reg;
	logic [7:0] rgb_to_s_red_reg;
	logic [7:0] rgb_to_s_green_reg;
	logic [7:0] rgb_to_s_blue_reg;
	logic [55:0] rgb_to_v_returndata_reg;
	logic [7:0] rgb_to_v_red_reg;
	logic [7:0] rgb_to_v_green_reg;
	logic [7:0] rgb_to_v_blue_reg;


	always @(posedge clock) begin
		rgb_to_h_returndata <= rgb_to_h_returndata_reg;
		rgb_to_h_red_reg <= rgb_to_h_red;
		rgb_to_h_green_reg <= rgb_to_h_green;
		rgb_to_h_blue_reg <= rgb_to_h_blue;
	end


	always @(posedge clock) begin
		rgb_to_s_returndata <= rgb_to_s_returndata_reg;
		rgb_to_s_red_reg <= rgb_to_s_red;
		rgb_to_s_green_reg <= rgb_to_s_green;
		rgb_to_s_blue_reg <= rgb_to_s_blue;
	end


	always @(posedge clock) begin
		rgb_to_v_returndata <= rgb_to_v_returndata_reg;
		rgb_to_v_red_reg <= rgb_to_v_red;
		rgb_to_v_green_reg <= rgb_to_v_green;
		rgb_to_v_blue_reg <= rgb_to_v_blue;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	rgb_to_h rgb_to_h_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .returndata(rgb_to_h_returndata_reg)
		, .red(rgb_to_h_red_reg)
		, .green(rgb_to_h_green_reg)
		, .blue(rgb_to_h_blue_reg)
	);



	rgb_to_s rgb_to_s_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .returndata(rgb_to_s_returndata_reg)
		, .red(rgb_to_s_red_reg)
		, .green(rgb_to_s_green_reg)
		, .blue(rgb_to_s_blue_reg)
	);



	rgb_to_v rgb_to_v_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .returndata(rgb_to_v_returndata_reg)
		, .red(rgb_to_v_red_reg)
		, .green(rgb_to_v_green_reg)
		, .blue(rgb_to_v_blue_reg)
	);



endmodule

module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] rgb_to_hv_start
	, output logic [0:0] rgb_to_hv_busy
	, output logic [0:0] rgb_to_hv_done
	, input logic [0:0] rgb_to_hv_stall
	, output logic [26:0] rgb_to_hv_returndata
	, input logic [7:0] rgb_to_hv_red
	, input logic [7:0] rgb_to_hv_green
	, input logic [7:0] rgb_to_hv_blue
	);

	logic [0:0] rgb_to_hv_start_reg;
	logic [0:0] rgb_to_hv_busy_reg;
	logic [0:0] rgb_to_hv_done_reg;
	logic [0:0] rgb_to_hv_stall_reg;
	logic [26:0] rgb_to_hv_returndata_reg;
	logic [7:0] rgb_to_hv_red_reg;
	logic [7:0] rgb_to_hv_green_reg;
	logic [7:0] rgb_to_hv_blue_reg;


	always @(posedge clock) begin
		rgb_to_hv_start_reg <= rgb_to_hv_start;
		rgb_to_hv_busy <= rgb_to_hv_busy_reg;
		rgb_to_hv_done <= rgb_to_hv_done_reg;
		rgb_to_hv_stall_reg <= rgb_to_hv_stall;
		rgb_to_hv_returndata <= rgb_to_hv_returndata_reg;
		rgb_to_hv_red_reg <= rgb_to_hv_red;
		rgb_to_hv_green_reg <= rgb_to_hv_green;
		rgb_to_hv_blue_reg <= rgb_to_hv_blue;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	rgb_to_hv rgb_to_hv_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(rgb_to_hv_start_reg)
		, .busy(rgb_to_hv_busy_reg)
		, .done(rgb_to_hv_done_reg)
		, .stall(rgb_to_hv_stall_reg)
		, .returndata(rgb_to_hv_returndata_reg)
		, .red(rgb_to_hv_red_reg)
		, .green(rgb_to_hv_green_reg)
		, .blue(rgb_to_hv_blue_reg)
	);



endmodule

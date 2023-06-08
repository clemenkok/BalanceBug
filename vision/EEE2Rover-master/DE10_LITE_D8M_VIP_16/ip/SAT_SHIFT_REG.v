module SAT_SHIFT_REG (clk, shift, sr_in, sr_out);
	input clk, shift;
	input sr_in;
	output sr_out;

	reg [53:0] sr;
    initial sr = 0;

	always @ (posedge clk)
	begin
		if (shift == 1'b1)
		begin
			sr[53:1] <= sr[52:0];
			sr[0] <= sr_in;
		end
	end
	assign sr_out = sr[53];
endmodule
module EEE_IMGTEST(
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
	
	// streaming source
	source_data,
	source_valid,
	source_ready,
	source_sop,
	source_eop,
	
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

// streaming source
output	[23:0]			  	   source_data;
output								source_valid;
input									source_ready;
output								source_sop;
output								source_eop;

////////////////////////////////////////////////////////////////////////
//
parameter IMAGE_W = 11'd640;
parameter IMAGE_H = 11'd480;
parameter FRAME_PRD = 32'd1666667;

////////////////////////////////////////////////////////////////////////


//Frame timer
reg [23:0] frameTimer;
always @ (posedge clk)
begin
	if (~reset_n) begin
		frameTimer <= FRAME_PRD;
	end
	else begin
		if (frameTimer == 23'h0) frameTimer <= FRAME_PRD;
		else frameTimer <= frameTimer - 23'h1;
	end
end

//Frame sequencer

always@(posedge clk) begin
	if (~rst_n) begin
	end
	else begin
		ready_in_d <= ready_in;
		if (~data_valid | ready_in_d) begin
			if (idle & (frameTimer == 23'h0)) begin
				idle <= 1'b0;
				x <= 11'h0;
				y <= 11'h0;
				data_valid <= 1'b1;
			end
			if (~idle) begin
				data_valid <= 1'b1;
				if (x == IMAGE_W-1) begin
					if (y == IMAGE_H-1) begin
						idle <= 1'b0;
					end
					y <= y + 11'h1;
					x <= 11'h0;
				end
			end
		end
	end
end


always@(posedge clk) begin
	if (~rst_n) begin
		data_out <= 1'b0;
		data_valid <= 0;
		ready_in_d <= 0;
		end
	else begin
		ready_in_d <= ready_in;
		if (valid_in & (~data_valid | ready_in_d)) begin
			data_out <= data_in;
			data_valid <= 1;
			end
		else if (ready_in_d) begin
			data_valid <= 0;
			end
		end
end

endmodule










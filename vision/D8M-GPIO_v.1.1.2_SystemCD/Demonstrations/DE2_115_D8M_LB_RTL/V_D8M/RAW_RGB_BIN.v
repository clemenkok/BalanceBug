module RAW_RGB_BIN  (
input CLK , 
input RST_N , 
input DATA_EN , 
input [9:0] D0,
input [9:0] D1,
input X,
input Y,

output reg		[9:0]	R,
output reg		[9:0]	G, 
output reg		[9:0]	B
);

reg  [9:0]	rD0;
reg  [9:0]	rD1;

always@(posedge CLK)
begin
	if(!RST_N)
	begin
		R	   <=	0;
		G	   <=	0;
		B	   <=	0;
		rD0	<=	D0;
		rD1	<=	D1;		
	end
	else
	begin
		rD0	<=	D0;
		rD1	<=	D1;
		case ({Y ,X } )
		2: //== 2'b10)
		begin
			R	<=	 D0;
			G	<=  (rD0+D1)/2;
			B	<=	 rD1;
		end	
		3: // else if({Y ,X }== 2'b11)
		begin
			R	<=	rD0;
			G	<=	(D0+rD1)/2;
			B	<=	D1;
		end
		0: // else if({Y ,X }== 2'b00)
		begin
			R	<=	D1;
			G	<=	(D0+rD1)/2;
			B	<=	rD0;
		end
		1: // else if({Y ,X }== 2'b01)
		begin
			R	<=	rD1;
			G	<=	(rD0+D1)/2;
			B	<=	D0;
		end
		endcase 
		
	end
end

endmodule 
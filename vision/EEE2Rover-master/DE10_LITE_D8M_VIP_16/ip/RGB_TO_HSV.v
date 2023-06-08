module RGB_TO_HSV(
    //from SDRAM
			iRed,
			iGreen,
			iBlue,
		//output
			oHue,
			oSat,
			oVal,
		//control signal
			iCLK,
			iRST_N
		);

//from SDRAM
input	[7:0]	iRed;				
input	[7:0]	iGreen;
input	[7:0]	iBlue;

//output
output reg	[7:0]	oHue;
output reg	[7:0]	oSat;
output reg	[7:0]	oVal;

//	Control Signal
input				iCLK;
input				iRST_N;

reg [7+7:0] maxim;
reg [7+7:0] minim;

wire [14:0] red_internal, green_internal, blue_internal;
assign red_internal = iRed;
assign blue_internal = iBlue;
assign green_internal = iGreen;

wire [7+7:0] dif;

//calculate max
always @ (posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		maxim <= 0;
	end
	else
	begin
		if (red_internal >= green_internal && red_internal >= blue_internal)
		begin
			maxim <= red_internal;
		end
      else if (green_internal >= red_internal && green_internal >= blue_internal)
      begin
			maxim <= green_internal;
      end
		else if (blue_internal >= green_internal && blue_internal >= red_internal)
      begin
			maxim <= blue_internal;            
		end
	end
end
        
//calculate min
always @ (posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		minim <= 0;
	end
	else
	begin
		if (red_internal <= green_internal && red_internal <= blue_internal)
		begin
			minim <= red_internal;
      end
		else if (green_internal <= red_internal && green_internal <= blue_internal)
      begin
			minim <= green_internal;
      end
		else if (blue_internal <= green_internal && blue_internal <= red_internal)
      begin
			minim <= blue_internal;            
		end
	end
end 
        
//calculate max-min
assign dif = maxim - minim;
       
//compute for hue

always @ (posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oHue <= 0;
	end
    else
	begin
		if (red_internal >= green_internal && red_internal >= blue_internal)	    
        begin
            oHue <= ((green_internal - blue_internal) * 60)/dif % 360;
        end
		else if (green_internal >= red_internal && green_internal >= blue_internal)
		begin
			oHue <= ((blue_internal - red_internal) * 60)/dif + 120;
        end
		else if (blue_internal >= red_internal && blue_internal >= green_internal)
        begin
            oHue <=(((red_internal-green_internal) * 60)/dif) + 240;
        end
		else
        begin
            oHue <= 0;
        end
	end
end
        
//compute for value
always @ (posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oVal <= 0;
	end
	else
	begin
        oVal <= maxim*100/255;
	end
end
        
//compute for saturation
always @ (posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oSat <= 0;
	end
	else
	begin
        if (maxim == 0)
        begin
			oSat <= 0;
        end
		  else
        begin
			oSat <= dif*100/maxim;
		end
	end
end
endmodule
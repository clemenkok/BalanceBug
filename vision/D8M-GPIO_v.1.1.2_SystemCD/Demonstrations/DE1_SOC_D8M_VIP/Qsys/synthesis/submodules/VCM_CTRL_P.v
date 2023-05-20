module VCM_CTRL_P ( 
input [ 7:0] iR,
input [ 7:0] iG,
input [ 7:0] iB,
input VS,// VS_

input [ 7:0] SCAL,
input [ 7:0] SCAL_F,
input [ 7:0] TH,

input ACTIV_C ,
input ACTIV_V , 

input VIDEO_CLK , 
input AUTO_FOC ,  
input SW_FUC_ALL_CEN ,
output         VCM_END,
output  reg  [17:0] Y ,
output  reg  [7:0] SS ,
output  reg  [7:0] S ,

output  [9:0] END_STEP ,
output   [15:0] VCM_DATA,
output  reg[31:0]  SUM
);// 
 



reg [31:0] rSUM; 
reg [31:0] peakSUM; 


reg  rVS ; 

reg  [15:0] mR,mG,mB;
//reg  [17:0] Y;
reg  [7:0] rY1 , rY2; 
wire [7:0] Y1;
 
reg CounterEn,rCounterEn;

// Y = R *  //.299   = 256 * 0.299 = 77 // + G *  // .587  = 256 * .587  = 150 //+ B *  //.114  =  256 *  .114  = 29
//---RGB2Y--- 
//assign Y = iR * 77 +  iG *150 +  iB*29 ; 
//assign  Y1[7:0]  = Y[15:8] ; 

always @( posedge VIDEO_CLK)begin
   mR <= iR * 77 ;
	mG <= iG * 150;
   mB <= iB * 29 ;
	
	CounterEn <= SW_FUC_ALL_CEN? ACTIV_C : ACTIV_V ;

	Y  <= mR + mG + mB;
	rCounterEn <= CounterEn;

end

assign  Y1[7:0]  = Y[15:8] ; 


// diff calculate
always @( posedge VIDEO_CLK)begin
      rY1 <= Y1 ;
      rY2 <= rY1 ;
		//--DIFF Y1-Y2-Y3 
      if ( Y1 >rY2 ) 
		    SS <= (Y1 - rY2 ) ; 
      else 
		    SS <= (rY2 - Y1 ) ;	 

end

// Counter Ctrl
always @( posedge VIDEO_CLK or negedge AUTO_FOC) begin
	 if ( !AUTO_FOC  )   begin
      	 peakSUM  <=0;  
    end
	 else begin

	   rVS   <= VS ; 
		rGO_F <= GO_F;
		
	   if (  !rGO_F & GO_F )  peakSUM <=0;  

		if  (  !rVS  & VS  )  begin 	
		    SUM <=  rSUM ; 
		    if (( peakSUM <  SUM ) && (!VCM_END))  begin 
			    peakSUM <= SUM ;
			    STEP_UP <= STEP;   
			 end 
		end 	
		
	end
	 
end

wire  vs_pluse;

assign vs_pluse = !rVS  & VS;
//Counter
always @( posedge VIDEO_CLK) begin
		if  (  vs_pluse ) rSUM <=  0;
		else begin
			if( rCounterEn) begin
				if ( SS > TH ) rSUM <= rSUM+1 ; 
				else rSUM <= rSUM;
			end
			else    rSUM <= rSUM;
      end
end



//-------------------VCM STEP ---

reg     [9:0]  STEP_UP ;  
wire    [9:0]  STEP ;  
wire    V_C ; 

assign END_STEP  = ( VCM_END )?  STEP_UP[9:0] :  STEP[9:0]; 
assign VCM_DATA  = {2'b00, END_STEP[9:0]   ,4'b1111 }; // 
wire GO_F ; 
reg  rGO_F ;
F_VCM  f( 
       .RESET_n( AUTO_FOC  ),  
       .CLK ( VIDEO_CLK ), 
		 .VS(vs_pluse),
       .SCAL(SCAL),
       .SCAL_F(SCAL_F),
		 .STEP( STEP),
		 .STEP_UP ( STEP_UP) ,
		 .V_C ( V_C),
		 .GO_F ( GO_F) ,
		 .VCM_END (VCM_END )
		 ) ; 
	 
endmodule 
	 
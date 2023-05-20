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
output  [17:0] Y ,
output  reg  [7:0] SS ,
output  reg  [7:0] S,
output  [9:0] END_STEP ,
output   [15:0] VCM_DATA,
output  reg[31:0]  SUM
);// 
 

// Y = R *  //.299   = 256 * 0.299 = 77 // + G *  // .587  = 256 * .587  = 150 //+ B *  //.114  =  256 *  .114  = 29
//---RGB2Y--- 
assign Y = iR * 77 +  iG *150 +  iB*29 ; 
//----------------------------

reg  [7:0] rY1 , rY2; 
wire [7:0] Y1;


reg [31:0] rSUM; 
reg [31:0] peakSUM; 


reg  rVS ; 
reg  rCH ; 

//assign  TH=5 ;  
assign  Y1[7:0]  = Y[15:8] ; 

//--  
always @( posedge VIDEO_CLK or negedge AUTO_FOC) begin
	 if ( !AUTO_FOC  )   begin
      	 peakSUM  <=0;  
    end
	 else begin

     { rY2, rY1}  <= { rY1 ,Y1 }  ;
	   rVS  <= VS ; 
      S    <= ( SS > TH  )? 8'hff: 0 ;  		
	   
		 
		if  (  !rVS  && VS  )  begin 	
	       rGO_F <= GO_F;
			 
		    { SUM ,  rSUM  } <= { rSUM,32'h0  }  ; 
			      //if ( ( !AUTO_FOC  ) || (  ~rGO_F  & GO_F ) )  peakSUM <=0;  
				   if (  ~rGO_F & GO_F )  peakSUM <=0;  
		    else if (( peakSUM <  SUM ) && (!VCM_END))  begin  peakSUM <= SUM ; STEP_UP <= STEP;   end 
		end 	
	   else if  ( ( SS > TH  )  && ( (SW_FUC_ALL_CEN)? ACTIV_C : ACTIV_V ) )  rSUM <= rSUM+1 ; 
		
		//--DIFF Y1-Y2-Y3 
      if ( Y1 >rY2 ) SS<= (Y1 - rY2 ) ; 
                else SS <= (rY2 - Y1 ) ;	 
					 
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
       .CLK ( VS ), 
       .SCAL(SCAL),
       .SCAL_F(SCAL_F),
		 .STEP( STEP),
		 .STEP_UP ( STEP_UP) ,
		 .V_C ( V_C),
		 .GO_F ( GO_F) ,
		 .VCM_END (VCM_END )
		 ) ; 
	 
endmodule 
	 
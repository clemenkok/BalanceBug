//	Horizontal Parameter	( Pixel )
parameter	H_SYNC_CYC	=	96;
parameter	H_SYNC_BACK	=	48 +15;
parameter	H_SYNC_ACT	=	640;	
parameter	H_SYNC_FRONT=	16 -15;
parameter	H_SYNC_TOTAL=	800;


parameter	V_SYNC_CYC	=	2;
parameter	V_SYNC_BACK	=	33-2;
parameter	V_SYNC_ACT	=	480;	
parameter	V_SYNC_FRONT=	10+2;
parameter	V_SYNC_TOTAL=	525;
//	Start Offset
parameter	X_START		=	H_SYNC_CYC+ H_SYNC_BACK;
parameter	Y_START		=	V_SYNC_CYC+ V_SYNC_BACK;


parameter	H_BLANK	=	H_SYNC_FRONT+H_SYNC_CYC+H_SYNC_BACK;
////////////////////////////////////////////////////////////
parameter	V_BLANK	=	V_SYNC_FRONT+V_SYNC_CYC+V_SYNC_BACK;
////////////////////////////////////////////////////////////

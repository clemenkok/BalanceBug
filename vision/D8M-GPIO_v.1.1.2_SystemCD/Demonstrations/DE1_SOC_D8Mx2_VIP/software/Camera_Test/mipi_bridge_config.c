/*
 * mipi_bridge_config.c
 *
 *  Created on: 2015¦~4¤ë22¤é
 *      Author: Administrator
 */

#include <stdio.h>
#include "I2C_core.h"
#include "terasic_includes.h"
#include "mipi_bridge_config.h"


#define MIPI_REG_PHYClkCtl		0x0056
#define MIPI_REG_PHYData0Ctl	0x0058
#define MIPI_REG_PHYData1Ctl	0x005A
#define MIPI_REG_PHYData2Ctl	0x005C
#define MIPI_REG_PHYData3Ctl	0x005E
#define MIPI_REG_PHYTimDly		0x0060
#define MIPI_REG_PHYSta			0x0062
#define MIPI_REG_CSIStatus		0x0064
#define MIPI_REG_CSIErrEn		0x0066
#define MIPI_REG_MDLSynErr		0x0068
#define MIPI_REG_FrmErrCnt		0x0080
#define MIPI_REG_MDLErrCnt		0x0090

typedef struct{
	alt_u16 Addr;
	alt_u16 Data;
}SZ_MIPI_REG_T;

#define FIFO_LEVEL 8 // try others? [0~511]
#define DATA_FORMAT 0x0010

// REFCLK    20 MHz
// PPIrxCLK  100 MHz
// PCLK      25 MHz
// MCLK      25 MHz


#define PLL_PRD     1  // 0- 15
#define PLL_FBD     39 //0-511
#define PLL_FRS     1 //0-3

#define MCLK_HL     1 // (MCLK_HL+1)+ (MCLK_HL+1)


//2b'00: div 8, 2b'01: div 4, 2b'10: div 2
#define PPICLKDIV   2  // ppi_clk:must between 66~125MHz
#define MCLKREFDIV  2   // mclkref clock:  < 125MHz
#define SCLKDIV     0   // sys_clk clock:  < 100MHz

#define WORDCOUNT   800



static SZ_MIPI_REG_T MipiBridgeReg[] = {

	{0x0002,0x0001}, // System Control Register
	{0xFFFF,10}, // delay
	{0x0002,0x0000}, // System Control Register
	{0x0016,((PLL_PRD <<12) + PLL_FBD)}, //PLL Control Register 0
	{0x0018,((PLL_FRS<<10) +  (0x2<<8) +  (0x1<<1)+ 0x1)}, //PLL Control Register 1
	{0xFFFF,10}, // delay

	{0x0018,((PLL_FRS<<10) +  (0x2<<8) + (0x1<<4) + (0x1<<1)+ 0x1)}, //PLL Control Register 1
	{0x0020,((PPICLKDIV<<4) + (MCLKREFDIV<<2) + SCLKDIV)}, //PLL Control Register 0
	{0x000C,((MCLK_HL<<8) + MCLK_HL)}, //MCLK Control Register
	{0x0060,0x8006},
	{0x0006,FIFO_LEVEL}, // FiFo Control Register   [0~511]
	// when reaches to this level FiFo controller asserts FiFoRdy for Parallel port to start output data
	{0x0008,DATA_FORMAT}, //Data FormatControl Register
//	{0x0022,WORDCOUNT}, //Word Count Register
	{0x0004,0x8047} // Configuration Control Register

};


alt_u16 nSWAP16(alt_u16 x){
	alt_u16 y;
	//y =  (((x) >> 8) & 0xff) | (((x) & 0xff) << 8);

//	y = x;
	y = (x >> 8) & 0x00ff;
	y |= (x << 8) & 0xff00;
	return y;
}


void MipiBridgeRegWrite(config_t *pConfig,alt_u16 Addr, alt_u16 Value){
	const alt_u8 device_address = MIPI_BRIDGE_I2C_ADDR;
	OC_I2CL_Write(pConfig->bridge_i2c_base, device_address, Addr, (alt_u8 *)&Value, sizeof(Value));
}

alt_u16 MipiBridgeRegRead(config_t *pConfig,alt_u16 Addr){
	alt_u16 Value,tValue;
	const alt_u8 device_address = MIPI_BRIDGE_I2C_ADDR;

	OC_I2CL_Read(pConfig->bridge_i2c_base,device_address, Addr,(alt_u8 *)&Value,sizeof(Value));

	tValue = nSWAP16(Value);

	return (tValue);
}




bool MipiBridgeInit(config_t *pConfig){

	alt_u16 data;
    int i, num;
	bool bSuccess;

	printf("\n[%s]: Start MipiBridgeInit!\n",pConfig->str);

	bSuccess = oc_i2c_init_ex(pConfig->bridge_i2c_base, 50*1000*1000,100*1000); //I2C: 100K
	if (!bSuccess)
		printf("failed to init MIPI- Bridge i2c\r\n");

	data = MipiBridgeRegRead(pConfig,0x0000); // read chip and revision id;

	printf("Chip and Revision ID is 0x%04xh(expected: 0x4401);\n",data);


    num = sizeof(MipiBridgeReg)/sizeof(MipiBridgeReg[0]);

    for(i=0;i<num;i++){
   	 if (MipiBridgeReg[i].Addr == 0xFFFF)   usleep(MipiBridgeReg[i].Data*1000);
        else MipiBridgeRegWrite(pConfig,MipiBridgeReg[i].Addr,  MipiBridgeReg[i].Data);
     }

    printf("[%s]: End MipiBridgeInit!\n\n",pConfig->str);

    return bSuccess;

}


void mipi_clear_error(config_t *pConfig){
	MipiBridgeRegWrite(pConfig,MIPI_REG_CSIStatus,0x01FF); // clear error
	MipiBridgeRegWrite(pConfig,MIPI_REG_MDLSynErr,0x0000); // clear error
	MipiBridgeRegWrite(pConfig,MIPI_REG_FrmErrCnt,0x0000); // clear error
	MipiBridgeRegWrite(pConfig,MIPI_REG_MDLErrCnt, 0x0000); // clear error

  	MipiBridgeRegWrite(pConfig,0x0082,0x00);
  	MipiBridgeRegWrite(pConfig,0x0084,0x00);
  	MipiBridgeRegWrite(pConfig,0x0086,0x00);
  	MipiBridgeRegWrite(pConfig,0x0088,0x00);
  	MipiBridgeRegWrite(pConfig,0x008A,0x00);
  	MipiBridgeRegWrite(pConfig,0x008C,0x00);
  	MipiBridgeRegWrite(pConfig,0x008E,0x00);
  	MipiBridgeRegWrite(pConfig,0x0090,0x00);
}

void mipi_show_error_info(config_t *pConfig){

	alt_u16 PHY_status, SCI_status, MDLSynErr, FrmErrCnt, MDLErrCnt;

	PHY_status = MipiBridgeRegRead(pConfig,MIPI_REG_PHYSta);
	SCI_status = MipiBridgeRegRead(pConfig,MIPI_REG_CSIStatus);
	MDLSynErr = MipiBridgeRegRead(pConfig,MIPI_REG_MDLSynErr);
	FrmErrCnt = MipiBridgeRegRead(pConfig,MIPI_REG_FrmErrCnt);
	MDLErrCnt = MipiBridgeRegRead(pConfig,MIPI_REG_MDLErrCnt);
	printf("PHY_status=%xh, CSI_status=%xh, MDLSynErr=%xh, FrmErrCnt=%xh, MDLErrCnt=%xh\r\n", PHY_status, SCI_status, MDLSynErr,FrmErrCnt, MDLErrCnt);
}

void mipi_show_error_info_more(config_t *pConfig){
    printf("FrmErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0080));
    printf("CRCErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0082));
    printf("CorErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0084));
    printf("HdrErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0086));
    printf("EIDErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0088));
    printf("CtlErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x008A));
    printf("SoTErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x008C));
    printf("SynErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x008E));
    printf("MDLErrCnt = %d\n",MipiBridgeRegRead(pConfig,0x0090));
    printf("FIFOSTATUS = %d\n",MipiBridgeRegRead(pConfig,0x00F8));
    printf("DataType = 0x%04x\n",MipiBridgeRegRead(pConfig,0x006A));
    printf("CSIPktLen = %d\n",MipiBridgeRegRead(pConfig,0x006E));
}



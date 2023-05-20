/*
 * mixerii_config.c
 *
 *  Created on: 2016-2-18
 *      Author: Dee Zeng
 */

#include <stdio.h>
#include "terasic_includes.h"


void mixerii_go(int go){
	if(go==0) IOWR(ALT_VIP_CL_MIXER_0_BASE,0,0);
	else      IOWR(ALT_VIP_CL_MIXER_0_BASE,0,1);
}

void mixerii_background_config(alt_u32 width,alt_u32 height){
	 IOWR(ALT_VIP_CL_MIXER_0_BASE,23,height);
	 IOWR(ALT_VIP_CL_MIXER_0_BASE,24,width);
}

void mixerii_layer_enable(alt_u8 channel,alt_u8 enable){
	if(channel >3) return;
	if(enable==0) IOWR(ALT_VIP_CL_MIXER_0_BASE,(channel+1)*5,0);
	else      IOWR(ALT_VIP_CL_MIXER_0_BASE,(channel+1)*5,1);
}

void mixerii_layer_position(alt_u8 channel,alt_u32 x_offset,alt_u32 y_offset){
	if(channel >3) return;

	mixerii_go(0);

	// x offset from left
	IOWR(ALT_VIP_CL_MIXER_0_BASE,channel*5+3,x_offset);
	// y offset from top
	IOWR(ALT_VIP_CL_MIXER_0_BASE,channel*5+4,y_offset);

	mixerii_go(1);

}

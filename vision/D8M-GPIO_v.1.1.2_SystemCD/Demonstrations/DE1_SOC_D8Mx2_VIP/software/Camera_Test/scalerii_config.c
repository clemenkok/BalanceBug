/*
 * scalerii_config.c
 *
 *  Created on: 2016-2-19
 *      Author: Dee Zeng
 */





#include <stdio.h>
#include "terasic_includes.h"
#include "video_parameter.h"

void scalerii_go(config_t *pConfig ,int go){
	if(go==0){
		IOWR(pConfig->scalerii_base,0,0);
		pConfig->scalerii_run = 0;
	}else{
		IOWR(pConfig->scalerii_base,0,1);
		pConfig->scalerii_run = 1;
	}
}

void scalerii_output_size(config_t *pConfig ,alt_u32 width,alt_u32 height){
	 IOWR(pConfig->scalerii_base,3,width);
	 IOWR(pConfig->scalerii_base,4,height);
}

void scalerii_scale(config_t *pConfig ,alt_u32 factor){
	if(VIDEO_WIDTH_FACTOR*factor > CAMERA_WIDTH){
	  printf("[%s]:Scalerii out of range\n",pConfig->str);
	  return;
	}
    scalerii_go(pConfig ,0);
    scalerii_output_size(pConfig, VIDEO_WIDTH_FACTOR*factor,VIDEO_HEIGHT_FACTOR*factor);//4*160,3*160 640x480 max
    scalerii_go(pConfig ,1);
}

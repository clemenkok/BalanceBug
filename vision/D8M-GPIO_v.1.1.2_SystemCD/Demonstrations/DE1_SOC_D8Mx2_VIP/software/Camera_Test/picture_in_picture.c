/*
 * picture_in_picture.c
 *
 *  Created on: 2016Äê3ÔÂ3ÈÕ
 *      Author: Dee Zeng
 */
#include "terasic_includes.h"


#include "mixerii_config.h"
#include "scalerii_config.h"
#include "video_parameter.h"
#include "picture_in_picture.h"

video_t camera0;
video_t camera1;
//////////////////////////////////////////////////////////
// local functions
int camera_out_of_range(int x,int y,int factor){

	if(factor<2)return 1;
	if(factor > CAMERA_WIDTH/VIDEO_WIDTH_FACTOR) return 1;

	if(x<H_START) return 1;
	if((x+factor*VIDEO_WIDTH_FACTOR)> (MIXERII_WIDTH - H_END)) return 1;

	if(y<V_START) return 1;
	if((y+factor*VIDEO_HEIGHT_FACTOR)> (MIXERII_HEIGHT - V_END)) return 1;

   return 0;
}

int camera_scale_down(int camera0_factor,int camera1_factor){
	// if return 1  scale camera0 first else camera1
	int diff_camera0,diff_camera1;

	diff_camera0 = camera0_factor - camera0.scalered_factor;
	diff_camera1 = camera1_factor - camera1.scalered_factor;

	if(diff_camera0 < diff_camera1)return 1;
	return 0;
}
void PinP_position_set(alt_u8 channel,alt_u16 x,alt_u16 y,alt_u16 factor){

	alt_u16 update_x,update_y;

	if((x+factor*VIDEO_WIDTH_FACTOR)>= (MIXERII_WIDTH - H_END))
		 update_x = MIXERII_WIDTH - factor*VIDEO_WIDTH_FACTOR - H_END;
	else if(x<H_START) update_x = H_START;
	else   update_x = x;

	if((y+factor*VIDEO_HEIGHT_FACTOR)>= (MIXERII_HEIGHT - V_END))
		 update_y = MIXERII_HEIGHT - factor*VIDEO_HEIGHT_FACTOR - V_END;
	else if(y<H_START) update_y = V_START;
	else update_y = y;

	// x offset from left
	IOWR(ALT_VIP_CL_MIXER_0_BASE,channel*5+3,update_x);
	// y offset from top
	IOWR(ALT_VIP_CL_MIXER_0_BASE,channel*5+4,update_y);
}




////////////////////////////////////////////////////////////////////////
//////////////////////////
// Major
//
////////////////////////////////////////////////////////////////////////
void PinP_init(void){

    mixerii_background_config(MIXERII_WIDTH,MIXERII_HEIGHT);

   // camera 0 init
	camera0.mixerii_x = H_START;
	camera0.mixerii_y = V_START;
	camera0.mixerii_channel = 0;

	camera0.scalered_factor = FACTOR_SUM_MAX/2;
    camera0.pConfig         = &camera0_config;
	// position: do not move to close to boarder of mixerii, eg: position(0,0) may be no video image.
    mixerii_layer_position(camera0.mixerii_channel,camera0.mixerii_x,camera0.mixerii_y);
	scalerii_scale(camera0.pConfig,camera0.scalered_factor);

   // camera 1 init
	camera1.mixerii_x = H_START+VIDEO_WIDTH_FACTOR*FACTOR_SUM_MAX/2+H_MIDDLE_ADD;
	camera1.mixerii_y = V_START;
	camera1.mixerii_channel = 1;

	camera1.scalered_factor = FACTOR_SUM_MAX/2;
    camera1.pConfig         = &camera1_config;

    mixerii_layer_position(camera1.mixerii_channel,camera1.mixerii_x,camera1.mixerii_y);
	scalerii_scale(camera1.pConfig,camera1.scalered_factor);

	mixerii_layer_enable(camera0.mixerii_channel,1);
	mixerii_layer_enable(camera1.mixerii_channel,1);

}



void PinP_mode(int mode){

	alt_u16 temp_x,temp_y;
	alt_u16 camera0_factor,camera1_factor;

	printf("mode:%d\n",mode);

	// Due to bandwidth of SDRAM
	// Please make sure first scale down ,then scale up

	switch(mode){

	case 0:{
	       /////////////////800/////////////////
	       //		        //                //
	       //   camera1     //    camera0     //
	       //		        //                //
	       //////////////////////////////////600
	       //		                          //
	       //            blank                //
	       //                                 //
	       /////////////////////////////////////

		   temp_x= H_START+VIDEO_WIDTH_FACTOR*FACTOR_SUM_MAX/2+H_MIDDLE_ADD;
		   camera0_factor = FACTOR_SUM_MAX/2;
		   camera1_factor = FACTOR_SUM_MAX/2;

		   // Due to bandwidth of SDRAM
		   	// Please make sure first scale down ,then scale up
           if(camera_scale_down(camera0_factor,camera1_factor)){
   			    PinP_video_change(&camera0,temp_x,V_START,camera0_factor);
		    	PinP_video_change(&camera1,H_START,V_START,camera1_factor);
           }else{
            	PinP_video_change(&camera1,H_START,V_START,camera1_factor);
			    PinP_video_change(&camera0,temp_x,V_START,camera0_factor);
           }

		break;
		}


	case 1:{

       ///////////////800////////////////////
       //		   //                      //
       // camera0  //                      //
       /////////////  ///////////////////////
       //            //                    //
       //		     //                    //
       //            //      camera1       //
       //            //                    //
       //////////////////////////////////////
		temp_x = H_START+VIDEO_WIDTH_FACTOR*(FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR)+H_MIDDLE_ADD;
		temp_y = V_START+VIDEO_HEIGHT_FACTOR*(FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR)+V_MIDDLE_ADD;
		camera0_factor = FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR;
		camera1_factor = CAMERA_WIDTH/VIDEO_WIDTH_FACTOR;

        if(camera_scale_down(camera0_factor,camera1_factor)){
        	PinP_video_change(&camera0,H_START,V_START,camera0_factor);
	    	PinP_video_change(&camera1,temp_x,temp_y,  camera1_factor);
        }else{
	    	PinP_video_change(&camera1,temp_x,temp_y,  camera1_factor);
	    	PinP_video_change(&camera0,H_START,V_START,camera0_factor);
        }

	break;
	}
	case 2:{
       ///////////////800////////////////////
       //		           //              //
       //     camera0      //              //
       //                  //              //
       //                  //              //
       /////////////////////   //////////////
       //                     //		   //
       //                     // camera1   //
       //////////////////////////////////////

		temp_x = H_START+VIDEO_WIDTH_FACTOR*(FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR)+H_MIDDLE_ADD;
		temp_y = V_START+VIDEO_HEIGHT_FACTOR*(FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR)+V_MIDDLE_ADD;
		camera0_factor = CAMERA_WIDTH/VIDEO_WIDTH_FACTOR;
		camera1_factor = FACTOR_SUM_MAX-CAMERA_WIDTH/VIDEO_WIDTH_FACTOR;

        if(camera_scale_down(camera0_factor,camera1_factor)){
        	PinP_video_change(&camera0,temp_x,temp_y,  camera0_factor);
    		PinP_video_change(&camera1,H_START,V_START,camera1_factor);
        }else{
    		PinP_video_change(&camera1,H_START,V_START,camera1_factor);
    		PinP_video_change(&camera0,temp_x,temp_y,  camera0_factor);
        }


	break;
	}
	case 3:{
	       /////////////////800/////////////////
	       //		        //                //
	       //   camera0     //    camera1     //
	       //		        //                //
	       //////////////////////////////////600
	       //		                          //
	       //            blank                //
	       //                                 //
	       /////////////////////////////////////

		    temp_x= H_START+VIDEO_WIDTH_FACTOR*FACTOR_SUM_MAX/2+H_MIDDLE_ADD;
			camera0_factor = FACTOR_SUM_MAX/2;
			camera1_factor = FACTOR_SUM_MAX/2;

	        if(camera_scale_down(camera0_factor,camera1_factor)){
				PinP_video_change(&camera0,H_START,V_START,camera0_factor);
				PinP_video_change(&camera1,temp_x,V_START, camera1_factor);
	        }else{
				PinP_video_change(&camera1,temp_x,V_START, camera1_factor);
				PinP_video_change(&camera0,H_START,V_START,camera0_factor);
	        }

	    break;
		}

	default: break;
	}

}

void PinP_video_change(video_t *pCamera,alt_u16 x,alt_u16 y,alt_u16 factor){

#if 1 // Smoothly move&scale to destination
	alt_u16 step = 4;
	alt_u16 i;

	float delta_x,delta_y,delta_factor;
	alt_u16 temp_x, temp_y,temp_factor;

    delta_factor = (float)(factor - pCamera->scalered_factor)/(float)step;
	delta_x      = (float)(x - pCamera->mixerii_x)/(float)step;
	delta_y      = (float)(y - pCamera->mixerii_y)/(float)step;

    for(i= 1; i< step;i++ ){

      temp_x = (alt_u16)(pCamera->mixerii_x + delta_x*i);
   	  temp_y = (alt_u16)(pCamera->mixerii_y + delta_y*i);
      temp_factor = (int)(pCamera->scalered_factor+i*delta_factor);
      if(camera_out_of_range(temp_x,temp_y,temp_factor)){
        printf("step %d out of range\n",i);
        continue;
      }

      if(factor < pCamera->scalered_factor){
  		scalerii_scale(pCamera->pConfig,temp_factor);
  		usleep(PinP_TIME_DELAY);
  		PinP_position_set(pCamera->mixerii_channel,temp_x,temp_y,temp_factor);
      }
      else{
  		PinP_position_set(pCamera->mixerii_channel,temp_x,temp_y,temp_factor);
  	    usleep(PinP_TIME_DELAY);
  		scalerii_scale(pCamera->pConfig,temp_factor);
     }


   	}
#endif


    if(factor < pCamera->scalered_factor){
		scalerii_scale(pCamera->pConfig,factor);
		usleep(PinP_TIME_DELAY);
		PinP_position_set(pCamera->mixerii_channel,x,y,factor);
    }
    else{
		PinP_position_set(pCamera->mixerii_channel,x,y,factor);
	    usleep(PinP_TIME_DELAY);
		scalerii_scale(pCamera->pConfig,factor);
   }

	pCamera->mixerii_x = x;
	pCamera->mixerii_y = y;
	pCamera->scalered_factor = factor;
}


void PinP_2camera_ajust(int add_or_minus){

   video_t *pCameraL,*pCameraR;

   int factor_step_unit;
   int CmaeraL_factor,CmaeraR_factor;
   int CmaeraR_x,CmaeraR_y;

   factor_step_unit = add_or_minus ? (1):(-1);

   // judge which camera video displayed on left.
   if(camera0.mixerii_x > camera1.mixerii_x){
	   pCameraL = &camera1;
	   pCameraR = &camera0;
   }else{
	   pCameraL = &camera0;
	   pCameraR = &camera1;
   }

   CmaeraL_factor = (alt_u16)((int)pCameraL->scalered_factor + factor_step_unit);
   CmaeraR_factor = (alt_u16)((int)pCameraR->scalered_factor - factor_step_unit);

   if(pCameraL->mixerii_x == pCameraR->mixerii_x)
	    CmaeraR_x = pCameraR->mixerii_x;
   else	CmaeraR_x = pCameraR->mixerii_x + factor_step_unit*VIDEO_WIDTH_FACTOR;

   if(pCameraL->mixerii_y == pCameraR->mixerii_y)
	    CmaeraR_y = pCameraR->mixerii_y;
   else	CmaeraR_y = pCameraR->mixerii_y + factor_step_unit*VIDEO_HEIGHT_FACTOR;

//   printf("fL=%d,xL=%d,yL=%d,fR=%d,xR=%d,yR=%d\n",CmaeraL_factor,pCameraL->mixerii_x,pCameraL->mixerii_y,CmaeraR_factor,CmaeraR_x,CmaeraR_y);

   if(camera_out_of_range(pCameraL->mixerii_x,pCameraL->mixerii_y,CmaeraL_factor)){
//	   printf("Left Video out of range!\n");
	   return;}
   if(camera_out_of_range(CmaeraR_x,CmaeraR_y,CmaeraR_factor)){
//	   printf("Right Video out of range!\n");
	   return;}

    // scale down before move
    if(add_or_minus){
		scalerii_scale(pCameraR->pConfig,CmaeraR_factor);
		usleep(PinP_TIME_DELAY);
		PinP_position_set(pCameraR->mixerii_channel,CmaeraR_x,CmaeraR_y,CmaeraR_factor);
    	scalerii_scale(pCameraL->pConfig,CmaeraL_factor);
    }
    else{
	    PinP_position_set(pCameraR->mixerii_channel,CmaeraR_x,CmaeraR_y,CmaeraR_factor);
        scalerii_scale(pCameraL->pConfig,CmaeraL_factor);
	    usleep(PinP_TIME_DELAY);
    	scalerii_scale(pCameraR->pConfig,CmaeraR_factor);
   }


    pCameraL->scalered_factor = CmaeraL_factor;

    pCameraR->mixerii_x = CmaeraR_x;
    pCameraR->mixerii_y = CmaeraR_y;
    pCameraR->scalered_factor = CmaeraR_factor;

}



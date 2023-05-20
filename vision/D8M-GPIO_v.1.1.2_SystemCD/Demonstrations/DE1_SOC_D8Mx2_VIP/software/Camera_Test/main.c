

#include <stdio.h>
#include "I2C_core.h"
#include "terasic_includes.h"
#include "mipi_camera_config.h"
#include "mipi_bridge_config.h"

#include "auto_focus.h"
#include "mixerii_config.h"
#include "scalerii_config.h"
#include "picture_in_picture.h"
#include "video_parameter.h"

#include <string.h>

#define DEFAULT_LEVEL 2
#define DEFAULT_FOCUS 300

config_t camera0_config;
config_t camera1_config;

void camera_config_init(void){

	camera0_config.bridge_i2c_base = I2C_OPENCORES_MIPI_BASE;
	camera0_config.camera_i2c_base = I2C_OPENCORES_CAMERA_BASE;
	camera0_config.focus_ip_base   = TERASIC_AUTO_FOCUS_0_BASE;
	camera0_config.scalerii_base = ALT_VIP_CL_SCL_0_BASE;
	camera0_config.zoom_level      = DEFAULT_LEVEL;
	camera0_config.focus_level     = DEFAULT_FOCUS;
	camera0_config.scalerii_run          = 1;
	strcpy(camera0_config.str,"Camera 0");

	camera1_config.bridge_i2c_base = I2C_OPENCORES_MIPI_1_BASE;
	camera1_config.camera_i2c_base = I2C_OPENCORES_CAMERA_1_BASE;
	camera1_config.focus_ip_base   = TERASIC_AUTO_FOCUS_1_BASE;
	camera1_config.scalerii_base = ALT_VIP_CL_SCL_1_BASE;
	camera1_config.zoom_level      = DEFAULT_LEVEL;
	camera1_config.focus_level     = DEFAULT_FOCUS;
	camera1_config.scalerii_run          = 1;
	strcpy(camera1_config.str,"Camera 1");

}

void D8Mx2_Init(void){


    IOWR(MIPI_PWDN_N_BASE, 0x00, 0x00);
    IOWR(MIPI_RESET_N_BASE, 0x00, 0x00);
    usleep(200);
    IOWR(MIPI_PWDN_N_BASE, 0x00, 0xFF);
    usleep(200);
    IOWR(MIPI_RESET_N_BASE, 0x00, 0xFF);


    usleep(50*1000);
    MipiBridgeInit(&camera0_config);
    MipiBridgeInit(&camera1_config);

    usleep(500*1000);
    MipiCameraInit(&camera0_config);
    MipiCameraInit(&camera1_config);

    camera_bin_level(&camera0_config,DEFAULT_LEVEL);
    camera_bin_level(&camera1_config,DEFAULT_LEVEL);
 	usleep(1000);


    // status check
 	    mipi_clear_error(&camera0_config);
		mipi_clear_error(&camera1_config);
		usleep(50*1000);
 	    mipi_clear_error(&camera0_config);
		mipi_clear_error(&camera1_config);

	 	usleep(1000*1000); // wait 1s

        printf("\r\nCamera 0 status:\r\n");
	    mipi_show_error_info(&camera0_config);
//	    mipi_show_error_info_more(I2C_OPENCORES_MIPI_BASE);
	    printf("\n");

		printf("\r\nCamera 1 status:\r\n");
		mipi_show_error_info(&camera1_config);
//	    mipi_show_error_info_more(I2C_OPENCORES_MIPI_1_BASE);
	    printf("\n");

	    Focus_Init(&camera0_config);
	    Focus_Init(&camera1_config);


}



int main()
{
    alt_u16 ii = 0;

    printf("DE1-SoC two D8M Demo\n");
    printf("Camera original resolution is %d x %d\n",CAMERA_WIDTH,CAMERA_HEIGHT);
    printf("BackGround(Mixerii) resolution is %d x %d\n",MIXERII_WIDTH,MIXERII_HEIGHT);

	camera_config_init();

    PinP_init();

    D8Mx2_Init();



    printf("After two Camera Configured! PWDN_n low for hardware standby two camera  \n");
    IOWR(MIPI_PWDN_N_BASE, 0x00, 0x00);
    usleep(1000);
    IOWR(MIPI_PWDN_N_BASE, 0x00, 0xFF);
    printf("Then resume for sync two camera!  \n\n\n");



    printf("SW and KEY functions:\n\n");
    printf("SW1 high: Mixerii functions\n");
    printf("  KEY0: Mixerii display mode change\n");
    printf("  KEY1: Scale camera video to right/bottom\n");
    printf("  KEY2: Scale camera video to left/top\n");
    printf("  KEY3: Stop/Run camera0/1\n");
    printf("   (Control camera0 when SW0=low, camera1 when SW0=high)\n\n");
    printf("SW1 low: Camera focus&Zoom function\n");
    printf("(Control camera0 when SW0=low, camera1 when SW0=high)\n");
    printf("  KEY0: Auto Focus\n");
    printf("  KEY1: Manual Focus -\n");
    printf("  KEY2: Manual Focus +\n");
    printf("  KEY3: Zoom mode \n\n\n");

#if 0  //auto display
            alt_u32 time_expected;
		     while(1){
		    	 time_expected = alt_nticks() + alt_ticks_per_second()*0.5;
		    	 while(alt_nticks()<time_expected)ii++;
		    	 PinP_mode(ii%4);
		     }
#endif






		     //////////////////////////////////////////////////////////
		     // for focus settings
		     alt_u8   manual_focus_step = 10;
		     config_t *pConfig;

		     while(1){

		    	 if(IORD(SW_BASE,0)&0x2){ //SW1 high -> Mixerii functions

		    	  // touch KEY0 to trigger mixer mode change
		          if((IORD(KEY_BASE,0)&0x0F) == 0x0E){
		        	 ii++;
			    	 PinP_mode(ii%4);
		             usleep(500000);
		           }

		          // touch KEY1 to trigger scale to right/bottom
		          if((IORD(KEY_BASE,0)&0x0F) == 0x0D) PinP_2camera_ajust(1);

		          // touch KEY2 to trigger scale to left/top
		          if((IORD(KEY_BASE,0)&0x0F) == 0x0B) PinP_2camera_ajust(0);

		          // touch KEY3 to stop or run camera video
		          if((IORD(KEY_BASE,0)&0x0F) == 0x07){

			    		 if(IORD(SW_BASE,0)&0x1){// SW0 high to set camera 1
				    		pConfig     =  &camera1_config;
			    		 }else{// SW0 low  to set camera 0
			    		    pConfig     =  &camera0_config;
			    		 }
                         if(pConfig->scalerii_run == 0) scalerii_go(pConfig ,1);
                         else                       	scalerii_go(pConfig ,0);
    		             usleep(500000);
		          }


		    	 }else{ // SW1 low -> Camera settings functions

		    		 if(IORD(SW_BASE,0)&0x1){// SW0 high to set camera 1
			    		pConfig     =  &camera1_config;
		    		 }else{// SW0 low  to set camera 0
		    		    pConfig     =  &camera0_config;
		    		 }
                     if((IORD(KEY_BASE,0)&0x0F) != 0x0F){
                    	 if(pConfig->scalerii_run == 0){
                    		 printf("[%s]: Please running video frist!\n",pConfig->str);
                    		 printf("set SW1 high,set SW0 %s,then press KEY3 to running %s!\n\n",(pConfig->camera_i2c_base==camera0_config.camera_i2c_base)?"low":"high",pConfig->str);
        		             usleep(500000);
                    		 continue;
                    	 }
                     }

		    	       // touch KEY0 to trigger Auto focus
		    	       if((IORD(KEY_BASE,0)&0x0F) == 0x0E){
		    	    	   pConfig->focus_level = Focus_Window(pConfig,CAMERA_WIDTH/2,CAMERA_HEIGHT/2);
		    	       }

		    	       // touch KEY1 to trigger Manual focus  - step
		    	       if((IORD(KEY_BASE,0)&0x0F) == 0x0D){
		    	    	   if(pConfig->focus_level > manual_focus_step) pConfig->focus_level -= manual_focus_step;
		    	    	   else pConfig->focus_level = 0;
		    	    	   OV8865_FOCUS_Move_to(pConfig,pConfig->focus_level);
		    	       }

		    	       // touch KEY2 to trigger Manual focus  + step
		    	       if((IORD(KEY_BASE,0)&0x0F) == 0x0B){
		    	    	   pConfig->focus_level += manual_focus_step;
		    	    	   if(pConfig->focus_level >1023) pConfig->focus_level = 1023;
		    	    	   OV8865_FOCUS_Move_to(pConfig,pConfig->focus_level);
		    	       }

		    	       // touch KEY3 to ZOOM
		    	       if((IORD(KEY_BASE,0)&0x0F) == 0x07){
		    	    	   if(pConfig->zoom_level == 3 )pConfig->zoom_level = 1;
		    	    	   else pConfig->zoom_level +=1;
		    	    	   camera_bin_level(pConfig,pConfig->zoom_level);
		    	    	   usleep(500000);
		    	       }

		    	       usleep(200000);
		    	 }// end if- SW1 select

//		          usleep(50000);

		      };




  return 0;
}

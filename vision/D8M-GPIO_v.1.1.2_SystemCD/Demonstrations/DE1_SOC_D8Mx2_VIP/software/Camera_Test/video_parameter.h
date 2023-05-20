/*
 * video_parameter.h
 *
 *  Created on: 2016Äê3ÔÂ4ÈÕ
 *      Author: Administrator
 */

#ifndef VIDEO_PARAMETER_H_
#define VIDEO_PARAMETER_H_

#define VIDEO_WIDTH_FACTOR  4
#define VIDEO_HEIGHT_FACTOR 3

#define CAMERA_WIDTH  640
#define CAMERA_HEIGHT 480

#define CMAERA_FPS  15

#define MIXERII_WIDTH  800
#define MIXERII_HEIGHT 600

//////////////////
// two camera arrange
#define FACTOR_SUM_MAX  96*2  //h: 4*96*2= 768 leave 32 13+6+13
                              //v: 3*96*2= 588 leave 24 9+6+9
#define H_START  13
#define H_MIDDLE_ADD 6
#define H_END 13
#define V_START 9
#define V_MIDDLE_ADD 6
#define V_END 9

#define PinP_TIME_DELAY 40000 // do not set too small




typedef struct{
    alt_u32 bridge_i2c_base;
    alt_u32 camera_i2c_base;
    alt_u32 focus_ip_base;
    alt_u32 scalerii_base;

    alt_u8  zoom_level;
    alt_u16 focus_level;
    alt_u8  scalerii_run;

    char    str[32];

}config_t;


typedef struct{
    alt_u16 mixerii_x;
    alt_u16 mixerii_y;
    alt_u8  mixerii_channel;

    alt_u16 scalered_factor;

    config_t *pConfig;
}video_t;

extern config_t camera0_config;
extern config_t camera1_config;


#endif /* VIDEO_PARAMETER_H_ */

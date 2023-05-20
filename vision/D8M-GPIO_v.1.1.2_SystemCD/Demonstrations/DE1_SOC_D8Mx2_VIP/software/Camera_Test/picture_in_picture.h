/*
 * picture_in_picture.h
 *
 *  Created on: 2016Äê3ÔÂ3ÈÕ
 *      Author: Dee Zeng
 */

#ifndef PICTURE_IN_PICTURE_H_
#define PICTURE_IN_PICTURE_H_



void PinP_init(void);
void PinP_mode(int mode);
void PinP_video_change(video_t *pCamera,alt_u16 x,alt_u16 y,alt_u16 factor);
void PinP_2camera_ajust(int add_or_minus); //camera0 as reference




#endif /* PICTURE_IN_PICTURE_H_ */

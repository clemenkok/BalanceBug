/*
 * mixerii_config.h
 *
 *  Created on: 2016-2-18
 *      Author: Dee Zeng
 */

#ifndef MIXERII_CONFIG_H_
#define MIXERII_CONFIG_H_

#include "alt_types.h"  // alt_u32

void mixerii_go(int go);
void mixerii_background_config(alt_u32 width,alt_u32 height);
void mixerii_layer_enable(alt_u8 channel,alt_u8 enable);
void mixerii_layer_position(alt_u8 channel,alt_u32 x_offset,alt_u32 y_offset);

#endif /* MIXERII_CONFIG_H_ */

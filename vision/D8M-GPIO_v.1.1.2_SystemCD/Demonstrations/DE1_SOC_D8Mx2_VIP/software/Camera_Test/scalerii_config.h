/*
 * scalerii_config.h
 *
 *  Created on: 2016-2-19
 *      Author: Dee Zeng
 */

#ifndef SCALERII_CONFIG_H_
#define SCALERII_CONFIG_H_

#include "alt_types.h"  // alt_u32
#include "video_parameter.h"

void scalerii_go(config_t *pConfig ,int go);

void scalerii_output_size(config_t *pConfig ,alt_u32 width,alt_u32 height);

void scalerii_scale(config_t *pConfig ,alt_u32 factor);

#endif /* SCALERII_CONFIG_H_ */

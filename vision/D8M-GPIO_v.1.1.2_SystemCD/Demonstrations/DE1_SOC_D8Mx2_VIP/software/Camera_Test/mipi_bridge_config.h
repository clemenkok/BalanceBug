/*
 * mipi_bridge_config.h
 *
 *  Created on: 2015Äê4ÔÂ22ÈÕ
 *      Author: Administrator
 */

#ifndef MIPI_BRIDGE_CONFIG_H_
#define MIPI_BRIDGE_CONFIG_H_

#include "video_parameter.h"

#define MIPI_BRIDGE_I2C_ADDR   0x1C  // 8'b0001_1100 - 7'b0E + 1'b0 (write bit)


bool MipiBridgeInit(config_t *pConfig);

void MipiBridgeRegWrite(config_t *pConfig,alt_u16 Addr, alt_u16 Value);
alt_u16 MipiBridgeRegRead(config_t *pConfig,alt_u16 Addr);




void mipi_clear_error(config_t *pConfig);
void mipi_show_error_info(config_t *pConfig);
void mipi_show_error_info_more(config_t *pConfig);


#endif /* MIPI_BRIDGE_CONFIG_H_ */

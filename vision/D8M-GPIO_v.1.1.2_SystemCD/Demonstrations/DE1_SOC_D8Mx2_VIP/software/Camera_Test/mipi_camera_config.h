

#ifndef MIPI_CAMERA_CONFIG_H_
#define MIPI_CAMERA_CONFIG_H_


#include "video_parameter.h"

#define MIPI_I2C_ADDR   0x6C
#define MIPI_AF_I2C_ADDR 0x18

#define BYD_MODE_SELECT   0x0100
#define BYD_SOFTWARE_SET  0x0103
#define BYD_STREAMING     0x301A


#define BIN_LEVEL_MAX    3
#define BIN_LEVEL_MIN    1



void OV8865_FOCUS_Move_to(config_t *pConfig,alt_u16 a_u2MovePosition);
void camera_bin_level(config_t *pConfig,alt_u8 level);
void BLC_LEVEL(config_t *pConfig,alt_u8 blc0,alt_u8 blc1);

void MipiCameraInit(config_t *pConfig);


#endif /* MIPI_CAMERA_CONFIG_H_ */

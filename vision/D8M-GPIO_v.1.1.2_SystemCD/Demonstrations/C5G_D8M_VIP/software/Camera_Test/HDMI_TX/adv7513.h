
#include "encoder.h"

#ifndef __ADV7513_INC__
#define __ADV7513_INC__

#define BIT(n)			(1 << (n))

#define ADV7513_REG_CHIP_REVISION				0x00
#define ADV7513_REG_N0							0x01
#define ADV7513_REG_N1							0x02
#define ADV7513_REG_N2							0x03
#define ADV7513_REG_SPDIF_FREQ					0x04
#define ADV7513_REG_CTS_AUTOMATIC1				0x05
#define ADV7513_REG_CTS_AUTOMATIC2				0x06
#define ADV7513_REG_CTS_MANUAL0					0x07
#define ADV7513_REG_CTS_MANUAL1					0x08
#define ADV7513_REG_CTS_MANUAL2					0x09
#define ADV7513_REG_AUDIO_SOURCE				0x0a
#define ADV7513_REG_AUDIO_CONFIG				0x0b
#define ADV7513_REG_I2S_CONFIG					0x0c
#define ADV7513_REG_I2S_WIDTH					0x0d
#define ADV7513_REG_AUDIO_SUB_SRC0				0x0e
#define ADV7513_REG_AUDIO_SUB_SRC1				0x0f
#define ADV7513_REG_AUDIO_SUB_SRC2				0x10
#define ADV7513_REG_AUDIO_SUB_SRC3				0x11
#define ADV7513_REG_AUDIO_CFG1					0x12
#define ADV7513_REG_AUDIO_CFG2					0x13
#define ADV7513_REG_AUDIO_CFG3					0x14
#define ADV7513_REG_I2C_FREQ_ID_CFG				0x15
#define ADV7513_REG_VIDEO_INPUT_CFG1			0x16
#define ADV7513_REG_VIDEO_INPUT_CFG2			0x17
#define ADV7513_REG_CSC_UPPER(x)				(0x18 + (x) * 2)
#define ADV7513_REG_CSC_LOWER(x)				(0x19 + (x) * 2)
#define ADV7513_REG_SYNC_DECODER(x)				(0x30 + (x))
#define ADV7513_REG_DE_GENERATOR				(0x35 + (x))
#define ADV7513_REG_PIXEL_REPETITION			0x3b
#define ADV7513_REG_VIC_MANUAL					0x3c
#define ADV7513_REG_VIC_SEND					0x3d
#define ADV7513_REG_VIC_DETECTED				0x3e
#define ADV7513_REG_AUX_VIC_DETECTED			0x3f
#define ADV7513_REG_PACKET_ENABLE0				0x40
#define ADV7513_REG_POWER						0x41
#define ADV7513_REG_STATUS						0x42
#define ADV7513_REG_EDID_I2C_ADDR				0x43
#define ADV7513_REG_PACKET_ENABLE1				0x44
#define ADV7513_REG_PACKET_I2C_ADDR				0x45
#define ADV7513_REG_DSD_ENABLE					0x46
//#define ADV7513_REG_VIDEO_INPUT_CFG2			0x48
#define ADV7513_REG_INFOFRAME_UPDATE			0x4a
#define ADV7513_REG_GC(x)						(0x4b + (x)) /* 0x4b - 0x51 */
#define ADV7513_REG_AVI_INFOFRAME_VERSION		0x52
#define ADV7513_REG_AVI_INFOFRAME_LENGTH		0x53
#define ADV7513_REG_AVI_INFOFRAME_CHECKSUM		0x54
#define ADV7513_REG_AVI_INFOFRAME(x)			(0x55 + (x)) /* 0x55 - 0x6f */
#define ADV7513_REG_AUDIO_INFOFRAME_VERSION		0x70
#define ADV7513_REG_AUDIO_INFOFRAME_LENGTH		0x71
#define ADV7513_REG_AUDIO_INFOFRAME_CHECKSUM	0x72
#define ADV7513_REG_AUDIO_INFOFRAME(x)			(0x73 + (x)) /* 0x73 - 0x7c */
#define ADV7513_REG_INT_ENABLE(x)				(0x94 + (x))
#define ADV7513_REG_INT(x)						(0x96 + (x))
#define ADV7513_REG_INPUT_CLK_DIV				0x9d
#define ADV7513_REG_PLL_STATUS					0x9e
#define ADV7513_REG_HDMI_POWER					0xa1
#define ADV7513_REG_HDCP_HDMI_CFG				0xaf
#define ADV7513_REG_AN(x)						(0xb0 + (x)) /* 0xb0 - 0xb7 */
#define ADV7513_REG_HDCP_STATUS					0xb8
#define ADV7513_REG_BCAPS						0xbe
#define ADV7513_REG_BKSV(x)						(0xc0 + (x)) /* 0xc0 - 0xc3 */
#define ADV7513_REG_EDID_SEGMENT				0xc4
#define ADV7513_REG_DDC_STATUS					0xc8
#define ADV7513_REG_EDID_READ_CTRL				0xc9
#define ADV7513_REG_BSTATUS(x)					(0xca + (x)) /* 0xca - 0xcb */
#define ADV7513_REG_TIMING_GEN_SEQ				0xd0
#define ADV7513_REG_POWER2						0xd6
#define ADV7513_REG_HSYNC_PLACEMENT_MSB			0xfa

#define ADV7513_REG_SYNC_ADJUSTMENT(x)			(0xd7 + (x)) /* 0xd7 - 0xdc */
#define ADV7513_REG_TMDS_CLOCK_INV				0xde
#define ADV7513_REG_ARC_CTRL					0xdf
#define ADV7513_REG_CEC_I2C_ADDR				0xe1
#define ADV7513_REG_CEC_CTRL					0xe2
#define ADV7513_REG_CHIP_ID_HIGH				0xf5
#define ADV7513_REG_CHIP_ID_LOW					0xf6

#define ADV7513_STATUS_HPD						BIT(6)
#define ADV7513_STATUS_MONITOR_SENSE			BIT(5)

struct adv7513_int_mask
{
	// 0x92
	union {
		struct reg92_bits {
			unsigned int cec_wakeup_op8 : 1;  // [0]
			unsigned int cec_wakeup_op7 : 1;  // [1]
			unsigned int cec_wakeup_op6 : 1;  // [2]
			unsigned int cec_wakeup_op5 : 1;  // [3]
			unsigned int cec_wakeup_op4 : 1;  // [4]
			unsigned int cec_wakeup_op3 : 1;  // [5]
			unsigned int cec_wakeup_op2 : 1;  // [6]
			unsigned int cec_wakeup_op1 : 1;  // [7]
		} reg92_bits;

		unsigned int reg92;
	};

	// 0x94
	union {
		struct reg94_bits {
			unsigned int reserved_0		: 1;  // [0]
			unsigned int hdcp			: 1;  // [1]
			unsigned int edid_ready		: 1;  // [2]
			unsigned int reserved_3		: 1;  // [3]
			unsigned int aud_fifo_full	: 1;  // [4]
			unsigned int vsync			: 1;  // [5]
			unsigned int monitor_sense	: 1;  // [6]
			unsigned int hpd			: 1;  // [7]
		} reg94_bits;

		unsigned int reg94;
	};

	// 0x95
	union {
		struct reg95_bits {
			unsigned int cec_rx_ready1	: 1;  // [0]
			unsigned int cec_rx_ready2	: 1;  // [1]
			unsigned int cec_rx_ready3	: 1;  // [2]
			unsigned int cec_tx_timeout	: 1;  // [3]
			unsigned int cec_tx_lost	: 1;  // [4]
			unsigned int cec_tx_ready	: 1;  // [5]
			unsigned int bksv			: 1;  // [6]
			unsigned int ddc_err		: 1;  // [7]
		} reg95_bits;

		unsigned int reg95;
	};
};

struct adv7513_int_status
{
	// 0x93
	union {
		struct reg93_bits {
			unsigned int cec_wakeup_op8 : 1;  // [0]
			unsigned int cec_wakeup_op7 : 1;  // [1]
			unsigned int cec_wakeup_op6 : 1;  // [2]
			unsigned int cec_wakeup_op5 : 1;  // [3]
			unsigned int cec_wakeup_op4 : 1;  // [4]
			unsigned int cec_wakeup_op3 : 1;  // [5]
			unsigned int cec_wakeup_op2 : 1;  // [6]
			unsigned int cec_wakeup_op1 : 1;  // [7]
		} reg93_bits;

		unsigned int reg93;
	};

	// 0x96
	union {
		struct reg96_bits {
			unsigned int reserved_0		: 1;  // [0]
			unsigned int hdcp			: 1;  // [1]
			unsigned int edid_ready		: 1;  // [2]
			unsigned int reserved_3		: 1;  // [3]
			unsigned int aud_fifo_full	: 1;  // [4]
			unsigned int vsync			: 1;  // [5]
			unsigned int monitor_sense	: 1;  // [6]
			unsigned int hpd			: 1;  // [7]
		} reg96_bits;

		unsigned int reg96;
	};

	// 0x97
	union {
		struct reg97_bits {
			unsigned int cec_rx_ready1	: 1;  // [0]
			unsigned int cec_rx_ready2	: 1;  // [1]
			unsigned int cec_rx_ready3	: 1;  // [2]
			unsigned int cec_tx_timeout	: 1;  // [3]
			unsigned int cec_tx_lost	: 1;  // [4]
			unsigned int cec_tx_ready	: 1;  // [5]
			unsigned int bksv			: 1;  // [6]
			unsigned int ddc_err		: 1;  // [7]
		} reg97_bits;

		unsigned int reg97;
	};
};

static inline unsigned int adv7513_int_mask_to_long(const struct adv7513_int_mask *mask)
{
	return ((unsigned int)(mask->reg92 << 16) | (mask->reg94 << 8) | mask->reg95);
}

static inline void adv7513_long_to_int_mask(struct adv7513_int_mask *mask, unsigned int long_val)
{
	mask->reg92 = (long_val >> 16) & 0xff;
	mask->reg94 = (long_val >> 8) & 0xff;
	mask->reg95 = long_val & 0xff;
}

/**
 * enum adv7513_input_id - Selects the input format id
 * @ADV7513_INPUT_ID_24BIT_RGB444_YCbCr444: Input pixel format is 24-bit 444 RGB
 *					    or 444 YCbCR with separate syncs
 * @ADV7513_INPUT_ID_16_20_24BIT_YCbCr422_SEPARATE_SYNC:
 * @ADV7513_INPUT_ID_16_20_24BIT_YCbCr422_EMBEDDED_SYNC:
 * @ADV7513_INPUT_ID_8_10_12BIT_YCbCr422_SEPARATE_SYNC:
 * @ADV7513_INPUT_ID_8_10_12BIT_YCbCr422_EMBEDDED_SYNC:
 * @ADV7513_INPUT_ID_12_15_16BIT_RGB444_YCbCr444:
 **/
enum adv7513_input_id {
	ADV7513_INPUT_ID_24BIT_RGB444_YCBCR444 = 0,
	ADV7513_INPUT_ID_16_20_24BIT_YCBCR422_SEPARATE_SYNC = 1,
	ADV7513_INPUT_ID_16_20_24BIT_YCBCR422_EMBEDDED_SYNC = 2,
	ADV7513_INPUT_ID_8_10_12BIT_YCBCR422_SEPARATE_SYNC = 3,
	ADV7513_INPUT_ID_8_10_12BIT_YCBCR422_EMBEDDED_SYNC = 4,
	ADV7513_INPUT_ID_12_15_16BIT_RGB444_YCBCR444 = 5,
};

/**
 * enum adv7513_input_color_depth - Selects the input format color depth
 * @ADV7513_INPUT_COLOR_DEPTH_8BIT: Input format color depth is 8 bits per channel
 * @ADV7513_INPUT_COLOR_DEPTH_10BIT: Input format color dpeth is 10 bits per channel
 * @ADV7513_INPUT_COLOR_DEPTH_12BIT: Input format color depth is 12 bits per channel
 **/
enum adv7513_input_color_depth {
	ADV7513_INPUT_COLOR_DEPTH_8BIT  = 3,
	ADV7513_INPUT_COLOR_DEPTH_10BIT = 1,
	ADV7513_INPUT_COLOR_DEPTH_12BIT = 2,
	ADV7513_INPUT_COLOR_DEPTH_INVALID = 0,
};

enum adv7513_input_color_space {
	ADV7513_INPUT_COLOR_SPACE_RGB   = 0,
	ADV7513_INPUT_COLOR_SPACE_YCBCR = 1,
};

enum adv7513_input_aspect_ratio {
	ADV7513_INPUT_ASPECT_4V3  = 0,
	ADV7513_INPUT_ASPECT_16V9 = 1,
};

/**
 * enum adv7513_input_style - Selects the input format style
 * ADV7513_INPUT_STYLE1: Use input style 1
 * ADV7513_INPUT_STYLE2: Use input style 2
 * ADV7513_INPUT_STYLE3: Use input style 3
 **/
enum adv7513_input_style {
	ADV7513_INPUT_STYLE1  = 2,
	ADV7513_INPUT_STYLE2  = 1,
	ADV7513_INPUT_STYLE3  = 3,
	ADV7513_INPUT_INVALID = 0,
};

enum adv7513_output_format {
	ADV7513_OUTPUT_444  = 0,
	ADV7513_OUTPUT_422  = 1,
};

enum adv7513_hdmi_dvi {
	ADV7513_MODE_DVI  = 0,
	ADV7513_MODE_HDMI = 1,
};


/**
 * enum adv7513_sync_polarity - Polarity for the input sync signals
 * ADV7513_SYNC_POLARITY_PASSTHROUGH:  Sync polarity matches that of the currently
 *				    configured mode.
 * ADV7513_SYNC_POLARITY_LOW:	    Sync polarity is low
 * ADV7513_SYNC_POLARITY_HIGH:	    Sync polarity is high
 *
 * If the polarity is set to either ADV7513_SYNC_POLARITY_LOW or
 * ADV7513_SYNC_POLARITY_HIGH the ADV7513 will internally invert the signal if
 * it is required to match the sync polarity setting for the currently selected
 * mode. If the polarity is set to ADV7513_SYNC_POLARITY_PASSTHROUGH, the ADV7513
 * will route the signal unchanged, this is useful if the upstream graphics core
 * will already generate the sync singals with the correct polarity.
 **/
enum adv7513_sync_polarity {
	ADV7513_SYNC_POLARITY_PASSTHROUGH,
	ADV7513_SYNC_POLARITY_LOW,
	ADV7513_SYNC_POLARITY_HIGH,
};





extern const int ADV7513_REG_SPACE_SIZE;
extern const alt_u8 adv7513_register_defaults[];

extern int adv7513_chip_identify(struct hdmi_encoder *ec);
extern int adv7513_hpd_probe(struct hdmi_encoder *ec);
extern int adv7513_do_hpd_powerup(struct hdmi_encoder *ec);
extern int adv7513_do_hpd_powerdown(struct hdmi_encoder *ec);
extern int adv7513_power_state(struct hdmi_encoder *ec, int *state);

extern int adv7513_video_init(struct hdmi_encoder *ec, int dvi);
extern int adv7513_audio_init(struct hdmi_encoder *ec);
extern int adv7513_chip_init(struct hdmi_encoder *ec, int dvi);

extern int adv7513_edid_read(struct hdmi_encoder *ec, void *data, int segment);
extern int adv7513_regmap_dump(struct hdmi_encoder *ec, void *data, int offset);


#endif  // __ADV7513_INC__

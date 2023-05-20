/*
 * edid.h
 *
 *  Created on: 2013/6/24
 *      Author: User
 */

#ifndef __EDID_INC__
#define __EDID_INC__

// EDID Base Definitions
enum eb_video_in_level {
	// video_sync_total (V)
	VIL_0P700_0P300_1P000 = 0,
	VIL_0P714_0P286_1P000 = 1,
	VIL_1P000_0P400_1P400 = 2,
	VIL_0P700_0P000_0P700 = 3,
};

enum eb_video_in_setup {
	VIS_BLANK_LEVEL_EQ_BLACK_LEVEL = 0,
	VIS_BLANK_TO_BLACK_PEDESTAL    = 1,
};

enum eb_video_in_sync_type {
	VIS_SEPERATE_H_V_SYNC = 1,
	VIS_COMPOSITE_H_SYNC  = 2,
	VIS_COMPOSITE_G_VIDEO = 4,
};

enum eb_video_in_serration {
	VISR_VSYNC = 1,
};

enum eb_video_in_depth {
	VID_NOT_DEFINED = 0,
	VID_6BITS       = 1,
	VID_8BITS       = 2,
	VID_10BITS      = 3,
	VID_12BITS      = 4,
	VID_14BITS      = 5,
	VID_16BITS      = 6,
};

enum eb_video_in_interface {
	VII_NOT_DEFINED = 0,
	VII_DVI         = 1,
	VII_HDMI_A      = 2,
	VII_HDMI_B      = 3,
	VII_MDDI        = 4,
	VII_DISPLAYPORT = 5,
};

enum eb_feature_support {
	// power management
	FS_PM_STANDBY   			= 1,
	FS_PM_SUSPEND				= (1 << 1),
	FS_PM_LOW_POWER_ACTIVE_OFF 	= (1 << 2),
	// display color type
	FS_DCT_MONO_GRAY			= (1 << 3),
	FS_DCT_RGB					= (1 << 4),
	FS_DCT_NON_RGB				= (1 << 5),
	// supported color encoding format
	FS_CEF_RGB444				= (1 << 6),
	FS_CEF_YCBCR444				= (1 << 7),
	FS_CEF_YCBCR422				= (1 << 8),
	// other features
	FS_OF_SRGB_DEFAULT			= (1 << 9),
	FS_OF_NATIVE_PREFERRED		= (1 << 10),
	FS_OF_CONTINUOUS_FREQ		= (1 << 11)
};

struct eb_established_timing {
	int valid;
	int width;
	int height;
	int refresh;	// Hz
	int interlaced;
	int rb;			// reduced blanking
};

void eb_establish_timing(struct eb_established_timing *et, int x, int y, int r, int valid)
{
	if (valid) {
		et->valid = 1;
		et->width = x;
		et->height = y;
		et->refresh = r;
		et->interlaced = 0;
		et->rb = 0;
	} else {
		et->valid = 0;
		et->width = 0;
		et->height = 0;
		et->refresh = 0;
		et->interlaced = 0;
		et->rb = 0;
	}
}

void eb_establish_timing_i(struct eb_established_timing *et, int x, int y, int r, int valid)
{
	if (valid) {
		et->valid = 1;
		et->width = x;
		et->height = y;
		et->refresh = r;
		et->interlaced = 1;
		et->rb = 0;
	} else {
		et->valid = 0;
		et->width = 0;
		et->height = 0;
		et->refresh = 0;
		et->interlaced = 0;
		et->rb = 0;
	}
}

void eb_establish_timing_rb(struct eb_established_timing *et, int x, int y, int r, int valid)
{
	if (valid) {
		et->valid = 1;
		et->width = x;
		et->height = y;
		et->refresh = r;
		et->interlaced = 0;
		et->rb = 1;
	} else {
		et->valid = 0;
		et->width = 0;
		et->height = 0;
		et->refresh = 0;
		et->interlaced = 0;
		et->rb = 0;
	}
}

struct eb_standard_timing {
	int horizontal;		// pixels
	int aspect_ratio;	// standard_timing_aspect
	int refresh_rate;	// (Hz)
};

enum eb_standard_timing_aspect {
	ST_AR_16_10		= 0,
	ST_AR_4_3		= 1,
	ST_AR_5_4		= 2,
	ST_AR_16_9		= 3,
};

struct eb_detailed_timing_desc {
    int pixel_clock; 	// (Hz)
    int width;			// active width (pixels)
    int height;			// active height (lines)
    int h_blank;		// (pixels)
    int v_blank;		// (lines)
    int h_fp;			// (pixels)
    int v_fp;			// (lines)
    int h_sync;			// (pixels)
    int v_sync;			// (lines)
    int h_size;			// (mm)
    int v_size;			// (mm)
    int border_lr;		// (pixels)
    int border_tb;		// (lines)
    int interlaced;
    int stereo;			// stereo_support
    int sync;			// sync_definition
};

enum eb_descriptor_type {
	DT_DETAILED_TIMING		= 0,
	DT_DISPLAY_DESCRIPTOR 	= 1,
};

enum eb_descriptor_tag {
	DTAG_PRODUCT_SERIAL			= 0xff,
	DTAG_DATA_STRING 			= 0xfe,
	DTAG_RANGE_LIMIT			= 0xfd,
	DTAG_PRODUCT_NAME			= 0xfc,
	DTAG_COLOR_POINT			= 0xfb,
	DTAG_STANDARD_TIMING		= 0xfa,
	DTAG_DCM_DATA				= 0xf9,		// // display color management data
	DTAG_CVT_TIMING				= 0xf8,
	DTAG_ESTABLISHED_TIMING_III	= 0xf7,
	DTAG_DUMMY					= 0x10,
};

enum eb_stereo_support {
	STEREO_NONE							= 0,
	STEREO_FIELD_SEQUENTIAL_RIGHT_SYNC	= (1 << 1),
	STEREO_FIELD_SEQUENTIAL_LEFT_SYNC	= (1 << 2),
	STEREO_2WAY_INTERLEAVE_RIGHT_EVEN	= (1 << 3),
	STEREO_2WAY_INTERLEAVE_LEFT_EVEN	= (1 << 4),
	STEREO_4WAY_INTERLEAVE				= (1 << 5),
	STEREO_SIDE_BY_SIDE_INTERLEAVE		= (1 << 6),
};

enum eb_sync_definition {
	// analog
	A_COMPOSITE_SYNC				= 1,
	A_BIPOLAR_COMPOSITE_SYNC		= (1 << 1),
	A_BIPOLAR_SERRATION				= (1 << 2),
	A_BIPOLAR_SERRATION_SYNC_G		= (1 << 3),
	A_BIPOLAR_SERRATION_SYNC_RGB	= (1 << 4),
	// digital
	D_COMPOSITE_SYNC				= (1 << 5),
	D_COMPOSITE_SERRATION			= (1 << 6),
	D_SEPERATE_SYNC					= (1 << 7),
	D_SEPERATE_VSYNC_N				= (1 << 8),
	D_SEPERATE_VSYNC_P				= (1 << 9),
	D_SEPERATE_HSYNC_N				= (1 << 10),
	D_SEPERATE_HSYNC_P				= (1 << 11),
};

enum eb_v_rate_offset {
	VRO_ZERO = 0,
	VRO_MAX_255_MIN_ZERO = 1,
	VRO_MAX_255_MIN_255  = 2,
};

enum eb_h_rate_offset {
	HRO_ZERO = 0,
	HRO_MAX_255_MIN_ZERO = 1,
	HRO_MAX_255_MIN_255  = 2,
};

enum eb_timing_flag {
	TF_DEFAULT_GTF  = 0,	// default VESA general timing formula, obsolete in EDID 1.4, maintained for legacy support
	TF_RANGE_LIMITS = 1,
	TF_SECOND_GTF	= 2,	// secondary VESA general timing formula, obsolete in EDID 1.4, maintained for legacy support
	TF_CVT			= 4,	// EDID 1.4 favors VESA CVT standard rather than GTF
};

enum eb_supported_aspect {
	CVT_AR_4_3		= 1,
	CVT_AR_16_9		= 2,
	CVT_AR_16_10	= 4,
	CVT_AR_5_4		= 8,
	CVT_AR_15_9		= 16,
};

enum eb_cvt_blanking {
	CVT_STANDARD_BLANKING	= 1,
	CVT_REDUCED_BLANKING	= 2,
};

enum eb_cvt_scaling {
	CVT_H_SHRINK	= 1,
	CVT_H_STRETCH	= 2,
	CVT_V_SHRINK	= 4,
	CVT_V_STRETCH	= 8,
};

enum eb_cvt_v_rate {
	CVT_V_RATE_50HZ	= (1 << 8),
	CVT_V_RATE_60HZ	= (2 << 8),
	CVT_V_RATE_75HZ	= (4 << 8),
	CVT_V_RATE_85HZ	= (8 << 8),
};

#include "edid_cea.h"

struct base_edid
{
	char id_mfg[4];
	unsigned int id_prod;
	unsigned int id_sn;

	int mfg_week;
	int mfg_year;
	int model_year;

	int ver_mj;
	int ver_mn;

	struct input {

		int digital_if;  // digital or analog interface

		union {
			struct analog {
				int level;			// video_in_level
				int setup;			// video_in_setup
				int sync_type;		// video_in_sync_type
				int serrations;		// video_in_serration
			} analog;

			struct digital {
				int depth;			// video_in_depth
				int interface;		// video_in_interface
			} digital;
		};
	} input;

	struct screen {
		union {
			struct size {
				int defined;
				int horizontal; 	// (cm)
				int vertical;		// (cm)
			} size;

			struct aspect {
				int defined;
				float landscape;
				float portrait;
			} aspect;
		};
	} screen;

	float gamma;

	unsigned int feature;	// feature_support

	struct chromaticity {
		int r_x;
		int r_y;
		int g_x;
		int g_y;
		int b_x;
		int b_y;
		int w_x;
		int w_y;
	} chromaticity;

	struct eb_established_timing timing_1_2[17]; 	// established timing I/II

	struct eb_standard_timing standard_timings[8];	// standard timing

	struct descriptor {

		int type;	// descriptor_type
		int tag;	// descriptor_tag

		union {

			struct eb_detailed_timing_desc detailed_timing;

			char serial[32];
			char string[32];

			struct range_limits {
				int v_offset;		// v_rate_offset
				int h_offset;		// h_rate_offset
				int v_min;			// (Hz)
				int v_max;			// (Hz)
				int h_min;			// (Hz)
				int h_max;			// (Hz)
				int p_max;			// (MHz)
				int timing_flags;	// timing_flag

				union {
					struct gtf_2nd_curve {
						int break_freq;		// (kHz)
						int C;
						int M;
						int K;
						int J;
					} gtf_2nd_curve;

					struct cvt {
						int ver_mj;
						int ver_mn;
						float extra_pclk;	// max pclk = p_max - extra_pclk (MHz)
						int line_max;		// max horizontal active pixels
						int aspect_ratios;	// supported_aspect
						int preferred_ar;	// supported_aspect
						int blanking;		// cvt_blanking
						int scaling;		// cvt_scaling
						int v_refresh;		// preferred vertical refresh rate (Hz)
					} cvt;
				};

			} range_limits;

			char prod_name[32];

			struct white_point {
				int index;
				int x;
				int y;
				float gamma;
			} white_point[2];

		};

		struct eb_standard_timing extra_standard_timings[6];

		struct dcm {	// display color management data
			int ver;
			int r_a2;
			int r_a3;
			int g_a2;
			int g_a3;
			int b_a2;
			int b_a3;
		} dcm;

		struct cvt_timing {
			int lines;
			int aspect;						// supported_aspect
			int preferred_v_rate;			// cvt_v_rate
			int supported_v_rate_blank;		// cvt_v_rate | cvt_blanking
		} cvt[4];

		struct eb_established_timing timing_3[6*8];	// established timing iii

	} descriptors[4];

	int extensions;		// number of extension blocks
	int checksum;

	struct ext_data {
		union {
			struct edid_cea cea_ext;
		};
	} ext_data[8];		// todo: we not supports only 8 extensions in the edid struct
};

extern int edid_decode_v14(struct base_edid *edid, const unsigned char *data);

#endif  // __EDID_INC__



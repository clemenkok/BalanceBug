/*
 * edid_cea.h
 *
 *  Created on: 2013/6/27
 *      Author: User
 */

#ifndef __EDID_CEA_INC__
#define __EDID_CEA_INC__

#define EDID_EXT_TAG_CEA		0x02

enum cea_data_block_tag {
	CEA_DB_AUDIO	= 1,	// audio data block
	CEA_DB_VIDEO	= 2,	// video data block
	CEA_DB_VENDOR	= 3,	// vendor specific
	CEA_DB_SPEAKER	= 4,	// speaker allocation
	CEA_DB_DTC		= 5,	// VESA DTC
	CEA_DB_EXTENDED	= 7,	// use extended tag (cea_data_block_tag_ext)
};

enum cea_data_block_tag_ext {
	CEA_DBE_VIDEO_CAP		= 0,	// video capability
	CEA_DBE_VIDEO_VENDOR	= 1,	// vendor-specific video
	CEA_DBE_VIDEO_DDI		= 2,	// VESA video display device information
	CEA_DBE_VIDEO_VESA		= 3,	// VESA video
	CEA_DBE_VIDEO_HDMI		= 4,	// HDMI video
	CEA_DBE_COLORIMETRY		= 5,	// colorimetry
	CEA_DBE_AUDIO_MISC		= 16,	// CEA misc audio fields
	CEA_DBE_AUDIO_VENDOR	= 17,	// vendor-specific audio
	CEA_DBE_AUDIO_HDMI		= 18,	// HDMI audio
};

// short audio format
enum cea_sad_format {
	CEA_SAD_FMT_LPCM			= 1,	// Linear PCM (IEC 60958)
	CEA_SAD_FMT_AC3				= 2,	// AC-3
	CEA_SAD_FMT_MPEG1			= 3,	// MPEG1 (Layers 1 & 2)
	CEA_SAD_FMT_MP3				= 4,	// MP3 (MPEG1 Layer 3)
	CEA_SAD_FMT_MPEG2			= 5,	// MPEG2 (multichannel)
	CEA_SAD_FMT_AAC				= 6,	// AAC
	CEA_SAD_FMT_DTS				= 7,	// DTS
	CEA_SAD_FMT_ATRAC			= 8,	// ATRAC
	CEA_SAD_FMT_ONEBIT			= 9,	// One Bit Audio
	CEA_SAD_FMT_DOLBY_DIGITAL	= 10,	// Dolby Digital +
	CEA_SAD_FMT_DTS_HD			= 11,	// DTS_HD
	CEA_SAD_FMT_MAT				= 12,	// MAT (MLP)
	CEA_SAD_FMT_DST				= 13,	// DST
	CEA_SAD_FMT_WMA_PRO			= 14,	// WMA Pro
};

enum cea_sad_sample_freq {
	CEA_SAD_SF_192K		= 0x40,
	CEA_SAD_SF_176P4K	= 0x20,
	CEA_SAD_SF_96K		= 0x10,
	CEA_SAD_SF_88P2K	= 0x08,
	CEA_SAD_SF_48K		= 0x04,
	CEA_SAD_SF_44P1K	= 0x02,
	CEA_SAD_SF_32K		= 0x01,
};

enum cea_speaker_designation {
	CEA_SPK_RLC_RRC		= 0x40,
	CEA_SPK_FLC_FRC		= 0x20,
	CEA_SPK_RC			= 0x10,
	CEA_SPK_RL_RR		= 0x08,
	CEA_SPK_FC			= 0x04,
	CEA_SPK_LFE			= 0x02,
	CEA_SPK_FL_FR		= 0x01,
};

// colorimetry IEC-61966-2-4
enum cea_primaries {
	CEA_PRIM_XVYCC601	= 0x01,
	CEA_PRIM_XVYCC709	= 0x02,
};

// gamut related future profile metadata
enum cea_gamut_metadata {
	CEA_META_MD0		= 0x01,
	CEA_META_MD1		= 0x02,
	CEA_META_MD2		= 0x04,
};

// PT overscan/underscan behavior
enum cea_pt_scan_behavior {
	CEA_PTS_NONE		= 0,
	CEA_PTS_OVERSCAN	= 1,	// always overscanned
	CEA_PTS_UNDERSCAN	= 2,	// always underscanned
	CEA_PTS_BOTH		= 3,	// supports both over- and underscan
};

// IT overscan/underscan behavior
enum cea_it_scan_behavior {
	CEA_ITS_NONE		= 0,
	CEA_ITS_OVERSCAN	= 1,	// always overscanned
	CEA_ITS_UNDERSCAN	= 2,	// always underscanned
	CEA_ITS_BOTH		= 3,	// supports both over- and underscan
};

// CE overscan/underscan behavior
enum cea_ce_scan_behavior {
	CEA_CES_NONE		= 0,
	CEA_CES_OVERSCAN	= 1,	// always overscanned
	CEA_CES_UNDERSCAN	= 2,	// always underscanned
	CEA_CES_BOTH		= 3,	// supports both over- and underscan
};

struct edid_cea {

	int rev;	// revision

	struct flags {
		int underscan;	// underscans IT formats by default
		int audio;		// supports basic audio
		int ycbcr444;	// supports YCbCr 4:4:4 in addition to RGB
		int ycbcr422;	// supports YCbCr 4:2:2 in addition to RGB
	} flags;

	int nr_dtd;			// total number of DTDs (detailed timing descriptor)

	// video data block
	struct db_video {
		int nr_svd;		// number of short video descriptors
		struct svd {
			int native;	// native format indicator
			int vic;	// video identification code
		} svd[32];
	} db_video;

	// audio data block
	struct db_audio {
		int nr_sad;		// number of short audio descriptors
		struct sad {
			int format;			// audio SAD format (cea_sad_format)
			int channels;		// max number of channels
			int freq;			// sampling frequency (cea_sad_sample_freq)
			int resolution;		// sampling resolution (bits)
			int bitrate;		// maximum bit rate (kHz)
		} sad[10];
	} db_audio;

	// speaker allocation data block
	struct db_speaker {
		int designation;	// (cea_speaker_designation)
	} db_speaker;

	// vendor specific data block (HDMI)
	struct db_vsdb_hdmi {
		int addr_a;			// source physical address
		int addr_b;			// source physical address
		int addr_c;			// source physical address
		int addr_d;			// source physical address

		// flags
		int ai;				// supports AI (audio-info... ACP, ISRC, ISRC2)
		int bpp30;			// supports 30-bits per pixel
		int bpp36;			// supports 36-bits per pixel
		int bpp48;			// supports 48-bits per pixel
		int ycbcr444;		// supports YCbCr 4:4:4
		int dvi_dual;		// supports DVI-DualLink

		int max_tmds_clk;	// max TMDS clock (MHz)

		int vid_latency_p;	// video latency ms (progressive)
		int aud_latency_p;	// audio latency ms (progressive)
		int vid_latency_i;	// video latency ms (interlaced)
		int aud_latency_i;	// audio latency ms (interlaced)
	} db_vsdb_hdmi;

	// speaker allocation data block (ext)
	struct db_colorimetry {
		int xvYCC;			// (cea_primaries)
		int metadata;		// (cea_gamut_metadata)
	} db_colorimetry;

	// video capability data block (ext)
	struct db_vcdb {
		int quant_range_sel;	// quantization range selectable
		int pt_scan_behavior;	// PT overscan/underscan behavior
		int it_scan_behavior;	// IT overscan/underscan behavior
		int ce_scan_behavior;	// CE overscan/underscan behavior
	} db_vcdb;

	// detailed timing descriptors ...
	struct eb_detailed_timing_desc detailed_timing[8];

};

#endif  // __EDID_CEA_INC__

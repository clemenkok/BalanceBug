
#ifndef __HDMI_ENCODER_INC__
#define __HDMI_ENCODER_INC__

struct adc_encoder {
	int slave_addr;		// i2c address of adc encoder slave device
};

struct avi_infoframe {
	int scan_info;			// s1s0 scan information
	int bar_info;			// b1b0 bar info
	int active_fmt;			// a0 active format information
	int rgb_ycbcr;			// y1y0 rgb or ycbcr
	//int f7;				// future use
	int active_fmt_ar;		// r3r0 active format aspect ratio
	int pict_ar;			// m1m0 picture aspect ratio
	int colorimetry;		// c1c0 colorimetry
	int scaling;			// sc1sc0 non-uniform picture scaling
	int quant;				// q1q0 rgb quantization range
	int colorimetry_ext;	// ec2ec0 extended colorimetry
	int itc;				// it content
	int vic;				// vic6vic0 video identification code
	int pr;					// pr3pr0 pixel repetition factor
	int yq1yq0;				// ??

	struct bar {
		int top_e;		// line number of end of top bar
		int bottom_s;	// line number of start of bottom bar
		int left_e;		// pixel number of end of left bar
		int right_s;	// pixel number of start of right bar
	} bar;
};

struct audio_infoframe {
	int channel_count;	// cc2cc0 channel count
	int coding_type;	// ct3ct0 coding type
	int sample_size;	// ss1ss0 sample size
	int sample_freq;	// sf2sf0 sample frequency
	int spk_alloc;		// ca7ca0 channel/speaker allocation
	int level_shift;	// lsv3lsv0 level shift value
	int downmix;		// dm_inh downmix inhibit
};

struct hdmi_encoder {
	int slave_addr;		// i2c address of encoder slave device
	int edid_addr;		// i2c address of EDID slave address

	int hpd_prev;		// previous hpd status
	int hpd_latest;		// latest hpd status
	int hpd_event;		// hpd state change indicator
	int hpd;			// hpd indicator (stable)

	unsigned int int_mask;		// interrupt enable mask
	//unsigned int int_status;	// current interrupt status

	unsigned char chip_id[4];
	unsigned char chip_rev[4];

	struct avi_infoframe avi_if;		// auxiliary video infoframe
	struct audio_infoframe audio_if;	// audio infoframe

	struct adc_encoder adc;
};

extern int reg_read(struct hdmi_encoder *ec, int reg, void *data);

extern int reg_write(struct hdmi_encoder *ec, int reg, int data);

extern int reg_update_bits(struct hdmi_encoder *ec, int reg, int mask, int data);

extern int reg_or_bits(struct hdmi_encoder *ec, int reg, int data);

extern int reg_clear_bits(struct hdmi_encoder *ec, int reg, int mask);

extern int adc_power(struct hdmi_encoder *ec, int onoff);
extern int adc_reg_read(struct hdmi_encoder *ec, int reg, int *regv);
extern int adc_reg_write(struct hdmi_encoder *ec, int reg, int regv);

#endif  // __HDMI_ENCODER_INC__

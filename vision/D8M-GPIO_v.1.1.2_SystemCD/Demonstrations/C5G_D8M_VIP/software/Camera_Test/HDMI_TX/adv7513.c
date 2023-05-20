
#include "../terasic_includes.h"
#include "../i2c.h"
#include "system.h"
#include "adv7513.h"

const alt_u8 adv7513_register_defaults[] = {
	0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 00 */
	0x00, 0x00, 0x01, 0x0e, 0xbc, 0x18, 0x01, 0x13,
	0x25, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 10 */
	0x46, 0x62, 0x04, 0xa8, 0x00, 0x00, 0x1c, 0x84,
	0x1c, 0xbf, 0x04, 0xa8, 0x1e, 0x70, 0x02, 0x1e, /* 20 */
	0x00, 0x00, 0x04, 0xa8, 0x08, 0x12, 0x1b, 0xac,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 30 */
	0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xb0,
	0x00, 0x50, 0x90, 0x7e, 0x79, 0x70, 0x00, 0x00, /* 40 */
	0x00, 0xa8, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x02, 0x0d, 0x00, 0x00, 0x00, 0x00, /* 50 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 60 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 70 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 80 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, /* 90 */
	0x0b, 0x02, 0x00, 0x18, 0x5a, 0x60, 0x00, 0x00,
	0x00, 0x00, 0x80, 0x80, 0x08, 0x04, 0x00, 0x00, /* a0 */
	0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x40, 0x14,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* b0 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* c0 */
	0x00, 0x03, 0x00, 0x00, 0x02, 0x00, 0x01, 0x04,
	0x30, 0xff, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, /* d0 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x01,
	0x80, 0x75, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, /* e0 */
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x75, 0x11, 0x00, /* f0 */
	0x00, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

const int ADV7513_REG_SPACE_SIZE = sizeof(adv7513_register_defaults) / sizeof(alt_u8);

#if 0
/* ADI recommanded values for proper operation. */
static const struct reg_default adv7513_fixed_registers[] = {
	{ 0x98, 0x03 },
	{ 0x9a, 0xe0 },
	{ 0x9c, 0x30 },
	{ 0x9d, 0x61 },
	{ 0xa2, 0xa4 },
	{ 0xa3, 0xa4 },
	{ 0xe0, 0xd0 },
	{ 0xf9, 0x00 },
	{ 0x55, 0x02 },
};
#endif

int adv7513_chip_identify(struct hdmi_encoder *ec)
{
	bool r = 0;

	r = I2C_Read(I2C_SCL_BASE, I2C_SDA_BASE, ec->slave_addr, ADV7513_REG_CHIP_REVISION, &ec->chip_rev[0]);
	if (!r)
		return -1;

	r = I2C_Read(I2C_SCL_BASE, I2C_SDA_BASE, ec->slave_addr, ADV7513_REG_CHIP_ID_LOW, &ec->chip_id[0]);
	if (!r)
		return -2;

	r = I2C_Read(I2C_SCL_BASE, I2C_SDA_BASE, ec->slave_addr, ADV7513_REG_CHIP_ID_HIGH, &ec->chip_id[1]);
	if (!r)
		return -3;

	return 0;
}

int adv7513_hpd_probe(struct hdmi_encoder *ec)
{
	bool r = 0;
	alt_u8 regv = 0;

	ec->hpd_prev = ec->hpd_latest;

	r = reg_read(ec, ADV7513_REG_STATUS, &regv);
	if (r != 0)
		return -1;

	ec->hpd_latest = regv & ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE));
	ec->hpd_event = ec->hpd_latest ^ ec->hpd_prev;

	ec->hpd = 0;

	if ((ec->hpd_event != 0) && ((ec->hpd_latest & ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE))) == ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE)))) {
		// if hot-plug state changed and both HPD and monitor-sense are asserted
		ec->hpd = 1;
	} else {
		if ((ec->hpd_event & (ADV7513_STATUS_HPD)) && ((ec->hpd_latest & (ADV7513_STATUS_HPD)) == 0)) {
			// if HPD state changed and HPD was de-asserted
			ec->hpd = -1;
		}

		if ((ec->hpd_event & (ADV7513_STATUS_MONITOR_SENSE)) && ((ec->hpd_latest & (ADV7513_STATUS_MONITOR_SENSE)) == 0)) {
			// if monitor-sense state changed and monitor-sense was de-asserted
			ec->hpd = -1;
		}
	}

	// 0xd6[7:6] <- (2 << 6) (HPD from HPD only) & 0xc0
	//r = reg_update_bits(ec, 0xd6, 0xc0 ,0x02 << 6);
	//if (r != 0)
	//	return -1;

	return 0;
}

int adv7513_do_hpd_powerup(struct hdmi_encoder *ec)
{
	printf("adv7513_do_hpd_powerup()\n");

	// power up the encoder
	if (reg_update_bits(ec, 0x41, 0x40, 0) != 0)
		return -1;

	//usleep(150000);

	// table 14 -- fixed registers must be set after power up
	if (reg_write(ec, 0x98, 0x03) != 0)
		return -1;
	if (reg_update_bits(ec, 0x9a, 0xe0, 0x7 << 5) != 0)
		return -1;
	if (reg_write(ec, 0x9c, 0x30) != 0)
		return -1;
	if (reg_update_bits(ec, 0x9d, 0x03, 0x01) != 0)
		return -1;
	if (reg_write(ec, 0xa2, 0xa4) != 0)
		return -1;
	if (reg_write(ec, 0xa3, 0xa4) != 0)
		return -1;
	if (reg_write(ec, 0xe0, 0xd0) != 0)
		return -1;
	//if (reg_write(ec, 0xf9, 0x00) != 0)  // set to a non-conflicting i2c address (suggested addr: 0x00)
	//	return -1;

	// clear hpd interrupts
	// 0x96[7:6] <- 0xc0 & 0xc0
	if (reg_write(ec, 0x96, 0xff) != 0)
		return -1;

	return 0;
}

int adv7513_do_hpd_powerdown(struct hdmi_encoder *ec)
{
	// power down the encoder
	if (reg_update_bits(ec, 0x41, 0x40, 0x40) != 0)
		return -1;

	return 0;
}

int adv7513_power_state(struct hdmi_encoder *ec, int *state)
{
	bool r = 0;
	alt_u8 regv = 0;

	r = reg_read(ec, 0x41, &regv);
	if (r != 0)
		return -1;

	if ((regv & 0x40) == 1)
		*state = 0;
	else
		*state = 1;

	return 0;
}

int adv7513_edid_read(struct hdmi_encoder *ec, void *edid, int segment)
{
	bool r = 0;
	alt_u8 *regv = (alt_u8 *)edid;
	int i;

	for (i = 0 + segment * 256; i < (segment + 1) * 256; ++i, ++regv) {
		r = I2C_Read(I2C_SCL_BASE, I2C_SDA_BASE, ec->edid_addr, i, regv);
		if (!r)
			return -1;
	}

	return 0;
}

int adv7513_regmap_dump(struct hdmi_encoder *ec, void *data, int offset)
{
	bool r = 0;
	alt_u8 *regv = (alt_u8 *)data;
	int i;

	for (i = 0; i < 256; ++i, ++regv) {
		r = I2C_Read(I2C_SCL_BASE, I2C_SDA_BASE, ec->slave_addr, i, regv);
		if (!r)
			return -1;
	}

	return 0;
}

// input video format
//
// id          - adv7513_input_id
// depth       - adv7513_input_color_depth
// color_space - adv7513_input_color_space
// aspect      - adv7513_input_aspect_ratio
// style       - adv7513_input_style
static int adv7513_video_in_format(struct hdmi_encoder *ec, int id, int depth, int color_space, int aspect, int style)
{
	int regv;

	printf("adv7513_video_in_format()\n");

	// 0x15[3:0] <- id
	if (reg_update_bits(ec, 0x15, 0x0f, id) != 0)
		return -1;

	// 0x16[5:4] <- depth
	// 0x16[3:2] <- style
	// 0x16[0] <- color_space
	regv = ((depth & 0x03) << 4) | ((style & 0x03) << 2) | (color_space & 0x01);
	if (reg_update_bits(ec, 0x16, 0x3d, regv) != 0)
		return -1;

	// 0x17[1] <- aspect
	if (reg_update_bits(ec, 0x17, 0x02, (aspect & 0x01) << 1) != 0)
		return -1;

	return 0;
}

// color space converter (section 4.3.8)
static int adv7513_config_csc(struct hdmi_encoder *ec, int enable, void *config)
{
	printf("adv7513_config_csc()\n");

	// 0x18[7] <- enable
	// 0x18[6:5] <- scaling
	// 0x18[4:0] <- csc_a1[4:0]
	int regv = (enable ? 1 : 0) << 7;
	if (reg_update_bits(ec, 0x18, 0x80, regv) != 0)
		return -1;

	// 0x19[7:0] <- csc_a1[12:5]

	// 0x1a[5] <- update

	// 0x1a[4:0] <- csc_a2[4:0]
	// 0x1b[7:0] <- csc_a2[12:5]

	// 0x1c[4:0] <- csc_a3[4:0]
	// 0x1d[7:0] <- csc_a3[12:5]

	// 0x1e[4:0] <- csc_a4[4:0]
	// 0x1f[7:0] <- csc_a4[12:5]

	// 0x20[4:0] <- csc_b1[4:0]
	// 0x21[7:0] <- csc_b1[12:5]

	// 0x22[4:0] <- csc_b2[4:0]
	// 0x23[7:0] <- csc_b2[12:5]

	// 0x24[4:0] <- csc_b3[4:0]
	// 0x25[7:0] <- csc_b3[12:5]

	// 0x26[4:0] <- csc_b4[4:0]
	// 0x27[7:0] <- csc_b4[12:5]

	// 0x28[4:0] <- csc_c1[4:0]
	// 0x29[7:0] <- csc_c1[12:5]

	// 0x2a[4:0] <- csc_c2[4:0]
	// 0x2b[7:0] <- csc_c2[12:5]

	// 0x2c[4:0] <- csc_c3[4:0]
	// 0x2d[7:0] <- csc_c3[12:5]

	// 0x2e[4:0] <- csc_c4[4:0]
	// 0x2f[7:0] <- csc_c4[12:5]

	return 0;
}

// auxiliary video information ...
//   HDMI spec 1.3 -- section 8.2
//   CEA-861-D --section 6.2
//   ADV7513 programmer's manual -- section 4.3.9.1
//
// 0x52 ~ 0x71
static int adv7513_avi_infoframe(struct hdmi_encoder *ec)
{
	struct avi_infoframe *avi = &ec->avi_if;
	int regv;

	printf("adv7513_video_infoframe()\n");

#if 1  // local development defaults
	avi->scan_info = 2;  		// scan
	avi->rgb_ycbcr = 0;			// rgb or ycbcr
	//avi->f7 = 0;				// reserved
	avi->active_fmt = 1;		// active format r3r0 valid
	avi->active_fmt_ar = 8;		// active format aspect ratio
	avi->pict_ar = 1;			// picture aspect ratio
	avi->colorimetry = 0;		// colorimetry
	avi->colorimetry_ext = 0;	// extended colorimetry
	avi->scaling = 0;			// non-uniform scaling
	avi->quant = 0;				// rgb quantization range
	avi->itc = 0;				// it content
	avi->pr = 0;				// pixel repetition factor
	avi->vic = 1;				// video identification code
	avi->yq1yq0 = 0;			// ??

	avi->bar_info = 1;  		// bar fields valid
	avi->bar.top_e = 0;
	avi->bar.bottom_s = 0;
	avi->bar.left_e = 0;
	avi->bar.right_s = 0;
#endif

	// required:
	//   0x55[6:5]
	//   0x56[5:4]

	// 0x44[4] avi infoframe enable 0)disable 1)enable
	// 0x44[3] audio infoframe enable 0)disable 1)enable
	if (reg_update_bits(ec, 0x44, 0x10, 1 << 4) != 0)
		return -1;

	// 0x4a[7] <- auto checksum
	// 0x4a[6] avi infoframe packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	// 0x4a[5] audio infoframe packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	// 0x4a[4] gc packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	if (reg_update_bits(ec, 0x4a, 0xc0, 3 << 6) != 0)
		return -1;

	// 0x55[6:5] <- output format 0)rgb 1)ycbcr422 2)ycbcr444
	// 0x55[4]   <- active format indicator 0)no-data 1)valid (bar, scan, colorimetry, non-uniform-scaling, active-aspect-ratio)
	// 0x55[3:2] <- bar 0)invalid-bar 1)vertical 2)horizontal 3)both
	// 0x55[1:0] <- scan 0)no-data 1)tv 2)pc 3)none
	regv = ((avi->rgb_ycbcr & 0x03) << 5) | ((avi->active_fmt & 0x01) << 4) | ((avi->bar_info & 0x03) << 2) | ((avi->scan_info & 0x03) << 0);
	if (reg_update_bits(ec, 0x55, 0x70, regv) != 0)
		return -1;

	// 0x56[7:6] <- colorimetry 0)no-data 1)ITU601 2)ITU709 3)extended <- 0x57[6:4]
	// 0x56[5:4] <- picture aspect ratio 0)no-data 1)4:3 2)16:9 3)none
	// 0x56[3:0] <- active aspect ratio 8)same as 0x56[5:4] 9)4:3 10)16:0 11)14:9
	regv = ((avi->colorimetry & 0x03) << 6) | ((avi->pict_ar & 0x03) << 4) | ((avi->active_fmt_ar & 0x0f) << 0);
	if (reg_write(ec, 0x56, regv) != 0)
		return -1;

	// 0x57[7] <- itc 0)none 1)available in 0x59[5:4]
	// 0x57[6:4] <- extended colorimetry 0)xvYCC601 1)xvYCC701 2)sYCC601 3)AdobeYCC601 4)AdobeRGB
	// 0x57[3:2] <- rgb quantization range 0)default 1)limited 2)full 11)reserved
	// 0x57[1:0] <- non-uniform picture scaling 0)unknown 1)h-scaling 2) v-scaling 3)h/v scaling
	regv = ((avi->itc & 0x01) << 7) | ((avi->colorimetry_ext & 0x07) << 4) | ((avi->quant & 0x03) << 2) | ((avi->scaling & 0x03) << 0);
	if (reg_write(ec, 0x57, regv) != 0)
		return -1;

	// 0x59[7:4] <- extended colorimetry 0)xvYCC601 1)xvYCC701 2)sYCC601 3)AdobeYCC601 4)AdobeRGB
	regv = ((avi->yq1yq0 & 0x0f) << 4);
	if (reg_write(ec, 0x59, regv) != 0)
		return -1;

	// 0x5a[7:0] <- active line (bar)
	regv = avi->bar.top_e & 0xff;
	if (reg_write(ec, 0x5a, regv) != 0)
		return -1;

	// 0x5b[7:0] <- active line (bar)
	regv = (avi->bar.top_e >> 8) & 0xff;
	if (reg_write(ec, 0x5b, regv) != 0)
		return -1;

	// 0x5c[7:0] <- active line (bar)
	regv = avi->bar.bottom_s & 0xff;
	if (reg_write(ec, 0x5c, regv) != 0)
		return -1;

	// 0x5d[7:0] <- active line (bar)
	regv = (avi->bar.bottom_s >> 8) & 0xff;
	if (reg_write(ec, 0x5d, regv) != 0)
		return -1;

	// 0x5e[7:0] <- active line (bar)
	regv = avi->bar.left_e & 0xff;
	if (reg_write(ec, 0x5e, regv) != 0)
		return -1;

	// 0x5f[7:0] <- active line (bar)
	regv = (avi->bar.left_e >> 8) & 0xff;
	if (reg_write(ec, 0x5f, regv) != 0)
		return -1;

	// 0x60[7:0] <- active line (bar)
	regv = avi->bar.right_s & 0xff;
	if (reg_write(ec, 0x60, regv) != 0)
		return -1;

	// 0x61[7:0] <- active line (bar)
	regv = (avi->bar.right_s >> 8) & 0xff;
	if (reg_write(ec, 0x61, regv) != 0)
		return -1;

	// 0x4a[7] <- auto checksum
	// 0x4a[6] avi infoframe packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	// 0x4a[5] audio infoframe packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	// 0x4a[4] gc packet update 0)locked-by-packet_buffer 1)locked-by-i2c
	if (reg_clear_bits(ec, 0x4a, 0x40) != 0)
		return -1;

	return 0;
}

// out video format
//
// format   - adv7513_output_format
// dvi		- adv7513_hdmi_dvi
static int adv7513_video_out_format(struct hdmi_encoder *ec, int format, int dvi)
{
	int regv;

	printf("adv7513_video_out_format()\n");

	// 0x16[7] <- format
	regv = (format & 0x01) << 7;
	if (reg_update_bits(ec, 0x16, 0x80, regv) != 0)
		return -1;

	// 0x18 ~ 0x2f
	if (adv7513_config_csc(ec, 0, 0) != 0) {
		return -1;
	}

	// 0xaf[7] <- hdcp (enable/disable)
	// 0xaf[1] <- dvi (section 4.2.2)
	if (reg_update_bits(ec, 0xaf, 0x82, (dvi & 0x01) << 1) != 0)
		return -1;

	// general control packet
	// 0x40[7] <- gc (section 4.2.3 && 4.3.3)
	if (dvi == ADV7513_MODE_HDMI) {
		if (reg_update_bits(ec, 0x40, 0x80, (1 & 0x01) << 7) != 0)
			return -1;
	} else {
		if (reg_clear_bits(ec, 0x40, 0x80) != 0)
			return -1;
	}

	// 0x4c[3:0] <- gc_depth (section 4.2.6)
	if (reg_update_bits(ec, 0x4c, 0x0f, 4 & 0x0f) != 0)
		return -1;

	// VIC <- vga 4:3
	// 0x3c[5:0] <- 0x01 & 0x3f
	//if (reg_update_bits(ec, 0x3c, 0x3f, 0x01) != 0)
	//	return -1;


	return 0;
}

// sync adjustment (section 4.3.7)
//
// hfp - hsync placement (front-porch)
// hs  - hsync duration
// vfp - vsync placement (front-porch)
// vs  - vsync duration
// off - vsync placement offset (for interlaced formats)
static int adv7513_sync_adj(struct hdmi_encoder *ec, int enable, int hfp, int hs, int vfp, int vs, int off)
{
	printf("adv7513_sync_adj()\n");

	if (enable == 0) {

		// enable sync adj
		// 0x41[1] <- 0
		if (reg_update_bits(ec, 0x41, 0x02, 0 << 1) != 0)
			return -1;

	} else {

		// 0xd7[7:0] <- hfp[7:0]
		int regv = hfp & 0xff;
		if (reg_write(ec, 0xd7, regv) != 0)
			return -1;

		// 0xd8[7:6] <- hfp[9:8]
		// 0xd8[5:0] <- hs[5:0]
		regv = ((hfp >> 8) << 6) | (hs & 0x3f);
		if (reg_write(ec, 0xd8, regv) != 0)
			return -1;

		// 0xd9[7:4] <- hs[9:6]
		// 0xd9[3:0] <- vfp[3:0]
		regv = ((hs >> 6) << 4) | (vfp & 0x0f);
		if (reg_write(ec, 0xd9, regv) != 0)
			return -1;

		// 0xda[7:2] <- vfp[9:4]
		// 0xda[1:0] <- vs[1:0]
		regv = ((vfp >> 4) << 2) | (vs & 0x03);
		if (reg_write(ec, 0xda, regv) != 0)
			return -1;

		// 0xdb[7:0] <- hfp[9:2]
		regv = vs >> 2;
		if (reg_write(ec, 0xdb, regv) != 0)
			return -1;

		// 0xdc[7:5] <- off[2:0]
		regv = (off & 0x07) << 5;
		if (reg_update_bits(ec, 0xdc, 0xe0, regv) != 0)
			return -1;

		// enable sync adj
		// 0x41[1] <- 1
		if (reg_update_bits(ec, 0x41, 0x02, 1 << 1) != 0)
			return -1;
	}

	return 0;
}

// embedded sync (sav/eav -> de) (h/v sync gen) 0x30~0x34 && 0x17[6:5]
//
// todo


// de-generation (section 4.3.7 figure 6)
//
// hb   - hsync delay (h-blank)
// vb   - vsync delay (v-blank)
// w    - active width
// h    - active height
// ioff - interlace offset
static int adv7513_de_gen(struct hdmi_encoder *ec, int enable, int hb, int w, int vb, int h, int ioff)
{
	int regv = 0;

	printf("adv7513_de_gen()\n");

	if (enable == 0) {

		// 0xd0[1] <- 1  h/v sync in -> adjust de -> adjust new h/v sync out
		//            0  de in -> adjust h/v sync -> adjust new de out
		//if (reg_update_bits(ec, 0xd0, 0x02, 1 << 1) != 0)
		//	return -1;

		// 0x17[6] <- vsync polarity 0)pass-through 1)invert
		// 0x17[5] <- hsync polarity 0)pass-through 1)invert
		// 0x17[0] <- de-gen enable
		if (reg_update_bits(ec, 0x17, 0x61, 0x00) != 0)
			return -1;

	} else {

		// 0x35[7:0] <- hb[9:2]
		if (reg_write(ec, 0x35, hb >> 2) != 0)
			return -1;

		// 0x36[7:6] <- hb[1:0]
		// 0x36[5:0] <- vb[5:0]
		regv = ((hb & 0x03) << 6) | (vb & 0x1f);
		if (reg_write(ec, 0x36, regv) != 0)
			return -1;

		// 0x37[7:5] <- ioff
		// 0x37[4:0] <- w[11:7]
		regv = ((ioff & 0x07) << 5) | ((w >> 7) & 0x1f);
		if (reg_write(ec, 0x37, regv) != 0)
			return -1;

		// 0x38[7:1] <- w[6:0]
		regv = (w & 0x7f) << 1;
		if (reg_update_bits(ec, 0x38, 0xfe, regv) != 0)
			return -1;

		// 0x39[7:0] <- h[11:4]
		regv = (h >> 4);
		if (reg_write(ec, 0x39, regv) != 0)
			return -1;

		// 0x3a[7:4] <- h[3:0]
		regv = (h & 0x0f) << 4;
		if (reg_update_bits(ec, 0x3a, 0xf0, regv) != 0)
			return -1;

		// 0xfb[7]   <- hb[10]
		// 0xfb[6:5] <- vb[7:6]
		// 0xfb[4]   <- w[12]
		// 0xfb[3]   <- h[12]
		regv = (((hb >> 10) << 7) & 0x80) | (((vb >> 6) << 5) & 0x60) |
			   (((w >> 12) << 4) & 0x10) | (((h >> 12) << 3) & 0x08);
		if (reg_update_bits(ec, 0xfb, 0xf8, regv) != 0)
			return -1;

		// 0xd0[1] <- 1  h/v sync in -> adjust de -> adjust new h/v sync out
		//            0  de in -> adjust h/v sync -> adjust new de out
		if (reg_update_bits(ec, 0xd0, 0x02, 1 << 1) != 0)
			return -1;

		// 0x17[6] <- vsync polarity 0)high 1)low
		// 0x17[5] <- hsync polarity 0)high 1)low
		// 0x17[0] <- de-gen enable
		if (reg_update_bits(ec, 0x17, 0x61, 0x61) != 0)
			return -1;
	}

	return 0;
}

static int adv7513_video_misc_config(struct hdmi_encoder *ec)
{
	printf("adv7513_video_config()\n");

	// 0xe2[0] <- CEC power down 0)power_down 1)power_up
	if (reg_update_bits(ec, 0xe2, 0x01, 0) != 0)
		return -1;

	// 0x48 <- 0x10
	if (reg_update_bits(ec, 0x48, 0xff, 0x10) != 0)
		return -1;

	// 0x49 <- 0xa0
	if (reg_update_bits(ec, 0x49, 0xff, 0xa0) != 0)
		return -1;

	// 0x55 <- 0x00
	if (reg_update_bits(ec, 0x55, 0xff, 0x00) != 0)
		return -1;

	// 0x56 <- 0x08
	if (reg_update_bits(ec, 0x56, 0xff, 0x08) != 0)
		return -1;

	// 0x99 <- 0x02
	if (reg_update_bits(ec, 0x99, 0xff, 0x02) != 0)
		return -1;

	// 0xa5 <- 0x04
	if (reg_update_bits(ec, 0xa5, 0xff, 0x04) != 0)
		return -1;

	// 0xab <- 0x40
	if (reg_update_bits(ec, 0xab, 0xff, 0x40) != 0)
		return -1;

	// 0xba <- 0x60
	if (reg_update_bits(ec, 0xba, 0xff, 0x60) != 0)
		return -1;

	// 0xd1 <- 0xff
	if (reg_update_bits(ec, 0xd1, 0xff, 0xff) != 0)
		return -1;

	// 0xde <- 0x10
	if (reg_update_bits(ec, 0xde, 0xff, 0xd8) != 0)
		return -1;

	// 0xe4 <- 0x60
	if (reg_update_bits(ec, 0xe4, 0xff, 0x60) != 0)
		return -1;

	// 0xfa <- 0x7d
	if (reg_update_bits(ec, 0xfa, 0xff, 0x7d) != 0)
		return -1;

	return 0;
}

int adv7513_video_init(struct hdmi_encoder *ec, int dvi)
{
	printf("adv7513_video_init()\n");

	//if (dvi == 0) {
	//	if (adv7513_video_misc_config(ec) != 0)
	//		return -1;
	//}

	// 0x15 0x16 0x17
	if (adv7513_video_in_format(ec, ADV7513_INPUT_ID_24BIT_RGB444_YCBCR444, ADV7513_INPUT_COLOR_DEPTH_8BIT, ADV7513_INPUT_COLOR_SPACE_RGB, ADV7513_INPUT_ASPECT_4V3, ADV7513_INPUT_INVALID) != 0)
		return -1;

	// 0x16 0x18 0xaf 0x40 0x4c 0x3c
	if (dvi != 0) {
		if (adv7513_video_out_format(ec, ADV7513_OUTPUT_444, ADV7513_MODE_DVI) != 0)
			return -1;
	} else {
		if (adv7513_video_out_format(ec, ADV7513_OUTPUT_444, ADV7513_MODE_HDMI) != 0)
			return -1;
	}

	// 0xd7 ~ 0xdc
	//if (adv7513_sync_adj(ec, 0, 40, 48, 13, 3, 0) != 0)
	//	return -1;

	//if (adv7513_de_gen(ec, 0, 40 + 48 + 40, 640, 13 + 3 + 29, 480, 0) != 0)
	//	return -1;

	if (adv7513_avi_infoframe(ec) != 0)
		return -1;

	return 0;
}

int adv7513_audio_init(struct hdmi_encoder *ec)
{
	printf("adv7513_audio_init()\n");

	// 0x0a[6:4] <- audio select 0b000)i2s 0b001)spdif 0b010)DSO 0b011)HBR 0b100)DST 0b101)n/a 0b110)n/a 0b111)n/a
	// 0x0a[3:2] <- audio select mode
	//regv = (((hb >> 10) << 7) & 0x80) | (((vb >> 6) << 5) & 0x60) |
	//	   (((w >> 12) << 4) & 0x10) | (((h >> 12) << 3) & 0x08);
	//if (reg_update_bits(ec, 0xfb, 0xf8, regv) != 0)
	//	return -1;

	if (reg_update_bits(ec, 0x01, 0xff, 0x00) != 0)
		return -1;

	if (reg_update_bits(ec, 0x02, 0xff, 0x18) != 0)
		return -1;

	if (reg_update_bits(ec, 0x03, 0xff, 0x00) != 0)
		return -1;

	return 0;
}

int adv7513_chip_init(struct hdmi_encoder *ec, int dvi)
{
	if (adv7513_video_init(ec, dvi) != 0)
		return -1;

	//if (adv7513_audio_init(ec) != 0)
	//	return -1;

	return 0;
}

/*
 * c5g_hdmi local test code
 *
 */


#include "../terasic_includes.h"
#include "../i2c.h"
#include "system.h"

#include "encoder.h"
#include "adv7513.h"

#define ADV7341_SALVE_ADDR7		0x2a
#define ADV7341_SALVE_ADDR8		((alt_u8)(ADV7341_SALVE_ADDR7) << 1)

#define ADV7511_SALVE_ADDR7		0x39										// 0x39)PD-low 0x3D)PD-high
#define ADV7511_SALVE_ADDR8		((alt_u8)(ADV7513_SALVE_ADDR7) << 1)		// 0x72)PD-low 0x7A)PD-high

#define ADV7513_SALVE_ADDR7		0x39										// 0x39)PD-low 0x3D)PD-high
#define ADV7513_SALVE_ADDR8		((alt_u8)(ADV7513_SALVE_ADDR7) << 1)		// 0x72)PD-low 0x7A)PD-high

#define ADV7513_EDID_ADDR8		0x7e

struct hdmi_encoder encoder = {
	.slave_addr = ADV7513_SALVE_ADDR8,
	.edid_addr = ADV7513_EDID_ADDR8,
	.hpd = 0,
	.chip_id = {0},
	.chip_rev = {0},

	.adc = {
		.slave_addr = ADV7341_SALVE_ADDR8,
	},

};

static int bin_dump(const alt_u8 *buf, int len)
{
	int r, c;
	const alt_u8 *p = buf;

	int rows = len / 16;
	int cols = len % 16;

	if (len <= 0)
		return 0;

	for (r = 0; r < rows; ++r, p += 16) {
		printf("%04x | %02x %02x %02x %02x %02x %02x %02x %02x - ",
				r * 16, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);

		printf("%02x %02x %02x %02x %02x %02x %02x %02x\n",
				p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
	}

	if (cols > 0) {
		printf("%04x | ", (rows - 1) * 16);
		for (c = 0; c < cols; ++c, ++p) {
			if (c == 8) {
				printf("- %02x ", *p);
			} else {
				printf("%02x ", *p);
			}
		}
		printf("\n");
	}

	return len;
}

#define HDMI_TX_INT_MASK			0x01

// warning: for simplicity, we handle-time consuming tasks this ISR ...
//  - use printf() (normally you should not)
//  - handle hot-plug events (usually it should be deferred to application level rather than in interrupt level)
static void adv7513_int_handler(void *context)
{
	struct hdmi_encoder *ec = (struct hdmi_encoder *)&encoder;
	alt_u32 irq_status;
	alt_u8 regv;
	struct adv7513_int_mask int_mask;
	struct adv7513_int_status int_status;
	int r;

	// get system irq status
	irq_status = IORD_ALTERA_AVALON_PIO_EDGE_CAP(HDMI_TX_INT_N_BASE) & HDMI_TX_INT_MASK;
	//if (irq_status == 0)
	//	return;

	// clear system irq flag
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(HDMI_TX_INT_N_BASE, 0x00);

	// reload adv7513 int mask value
	adv7513_long_to_int_mask(&int_mask, ec->int_mask);

	// get adv7513 int status
	r = reg_read(ec, 0x93, &regv);
	if (r != 0)
		return;
	int_status.reg93 = regv;

	r = reg_read(ec, 0x96, &regv);
	if (r != 0)
		return;
	int_status.reg96 = regv;

	r = reg_read(ec, 0x97, &regv);
	if (r != 0)
		return;
	int_status.reg97 = regv;

	// disable adv7513 int
	reg_write(ec, 0x92, 0);
	reg_write(ec, 0x94, 0);
	reg_write(ec, 0x95, 0);

	// clear adv7513 int status
	if (int_status.reg93 != 0) {
		reg_write(ec, 0x93, 0xff);
	}

	if (int_status.reg96 != 0) {
		reg_write(ec, 0x96, 0xff);
	}

	if (int_status.reg97 != 0) {
		reg_write(ec, 0x97, 0xff);
	}

	// -------------------------------------------------------
	// handle adv7513 interrupt events
	// WARNING: this should be an application level task ...
	//
	if (int_status.reg96_bits.monitor_sense || int_status.reg96_bits.hpd) {

		alt_u8 edid[256];
		int dvi_mode = 0;
		int pwr_state = 0;
		int pwron_retry_count = 200;
		int m_sense_retry_count = 30;

		while (m_sense_retry_count-- > 0) {
			r = reg_read(ec, ADV7513_REG_STATUS, &regv);
			if (r != 0)
				goto __unplugged_iret;

			if ((regv & ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE))) == ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE)))
				break;
		}

		if ((regv & ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE))) != ((ADV7513_STATUS_HPD) | (ADV7513_STATUS_MONITOR_SENSE)))
			goto __unplugged_iret;

		// now we have both HPD and monitor-sense signal asserted

		// power up the hdmi-encoder ...
		r = adv7513_do_hpd_powerup(ec);
		if (r != 0)
			goto __unplugged_iret;

		// readback edid data
		r = adv7513_edid_read(ec, edid, 0);
		if (r != 0)
			dvi_mode = 1;

		if (edid[0x7e] == 0)
			dvi_mode = 1;

		// configure the hdmi-encoder ...
		while (pwron_retry_count > 0) {
			r = adv7513_chip_init(ec, dvi_mode);
			if (r != 0)
				goto __unplugged_iret;

			r = adv7513_power_state(ec, &pwr_state);
			if (r != 0)
				goto __unplugged_iret;

			if (pwr_state != 0)
				break;
			--pwron_retry_count;
		}

		r = adv7513_power_state(ec, &pwr_state);
		if (r != 0)
			goto __unplugged_iret;

		if (pwr_state == 0)
			goto __unplugged_iret;

		goto __plugged_iret;
	}

__unplugged_iret:

	// enable interrupts
	reg_write(ec, 0x92, int_mask.reg92);
	reg_write(ec, 0x94, int_mask.reg94);
	reg_write(ec, 0x95, int_mask.reg95);

	return;

__plugged_iret:

	// enable interrupts
	reg_write(ec, 0x92, int_mask.reg92);
	reg_write(ec, 0x94, int_mask.reg94 & 0xbf);
	reg_write(ec, 0x95, int_mask.reg95);

	return;
}

int adv7513_int_setup(struct hdmi_encoder *ec, const struct adv7513_int_mask *mask, alt_isr_func isr)
{
	int r = 0;

	printf("adv7513_int_setup()\n");

	ec->int_mask = adv7513_int_mask_to_long(mask);

	// disable HDMI_TX_INT
	alt_ic_irq_disable(HDMI_TX_INT_N_IRQ_INTERRUPT_CONTROLLER_ID, HDMI_TX_INT_N_IRQ);

	r = reg_write(ec, 0x92, 0);
	if (r != 0)
		return -1;

	r = reg_write(ec, 0x94, 0);
	if (r != 0)
		return -1;

	r = reg_write(ec, 0x95, 0);
	if (r != 0)
		return -1;

	// clear int flags
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(HDMI_TX_INT_N_BASE, 0x00);

	r = reg_write(ec, 0x93, 0xff);
	if (r != 0)
		return -1;

	r = reg_write(ec, 0x96, 0xff);
	if (r != 0)
		return -1;

	r = reg_write(ec, 0x97, 0xff);
	if (r != 0)
		return -1;

	// enable interrupt
	if (ec->int_mask > 0) {
		// register isr
		if (isr) {
			// register interrupt handler
			r = alt_ic_isr_register(HDMI_TX_INT_N_IRQ_INTERRUPT_CONTROLLER_ID, HDMI_TX_INT_N_IRQ, isr, ec, NULL);
			if (r != 0)
				return -1;
		}

		// enable interrupts
		r = reg_write(ec, 0x92, mask->reg92);
		if (r != 0)
			return -1;

		r = reg_write(ec, 0x94, mask->reg94);
		if (r != 0)
			return -1;

		r = reg_write(ec, 0x95, mask->reg95);
		if (r != 0)
			return -1;

		IOWR_ALTERA_AVALON_PIO_IRQ_MASK(HDMI_TX_INT_N_BASE, HDMI_TX_INT_MASK); // 0x01: enable bit0

		alt_ic_irq_enable(HDMI_TX_INT_N_IRQ_INTERRUPT_CONTROLLER_ID, HDMI_TX_INT_N_IRQ);
	}

	return 0;
}

int main_xxx(int argc, const char *argv[])
{
	int r = 0, rr = 0;

	struct hdmi_encoder encoder = {
		.slave_addr = ADV7513_SALVE_ADDR8,
		.edid_addr = ADV7513_EDID_ADDR8,
		.hpd = 0,
		.chip_id = {0},
		.chip_rev = {0},

		.adc = {
			.slave_addr = ADV7341_SALVE_ADDR8,
		},
	};

	struct adv7513_int_mask ie_mask;

	memset(&ie_mask, 0, sizeof(ie_mask));

	printf("\n===== adv7511/adv7513 encoder demo =====\n");

	r = adv7513_chip_identify(&encoder);
	if (r != 0) {
		printf("[err] failed to do chip-identification! (%d)\n", r);
		rr = -1;
		goto _safe_exit;
	}

	if ((encoder.chip_id[0] == adv7513_register_defaults[ADV7513_REG_CHIP_ID_LOW]) &&
		(encoder.chip_id[1] == adv7513_register_defaults[ADV7513_REG_CHIP_ID_HIGH])) {
		printf("encoder chip : ADV%02x%02x rev: 0x%02x\n", encoder.chip_id[1], encoder.chip_id[0], encoder.chip_rev[0]);
	} else {
		printf("encoder chip : unknown (id: 0x%02x 0x%02x rev: 0x%02x)\n", encoder.chip_id[0], encoder.chip_id[1], encoder.chip_rev[0]);
	}

	ie_mask.reg94_bits.hpd = 1;
	ie_mask.reg94_bits.monitor_sense = 1;

	r = adv7513_int_setup(&encoder, &ie_mask, adv7513_int_handler);
	if (r != 0) {
		printf("[err] failed to do HDMI_TX_INT interrupt setup! (%d)\n", r);
		rr = -1;
		goto _safe_exit;
	} else {
		printf("success to setup HDMI_TX_INT interrupt handler.\n\n");
	}

	// interactive command line mode -- used in local develop-testing
	while (1) {

		char cmd[256] = {0};

		printf("your command : ");

		fgets(cmd, 256, stdin);

		if (cmd[0] == 'a') {

			if (cmd[1] == 'r') {

				alt_u8 regv = 0;
				alt_u8 reg = 0;

				reg = (alt_u8)strtoul(&cmd[3], 0, 16);

				if (adc_reg_read(&encoder, reg, &regv) == 0) {
					printf("adc[%02x] %02x\n", reg, regv);
				} else {
					printf("[err] i2c error!\n");
				}

			} else if (cmd[1] == 'w') {

				alt_u8 regv = 0;
				alt_u8 reg = 0;
				char arg1[8] = {0};
				char arg2[8] = {0};

				strncpy(arg1, &cmd[3], 2);
				strncpy(arg2, &cmd[6], 2);

				reg = (alt_u8)strtoul(arg1, 0, 16);
				regv = (alt_u8)strtoul(arg2, 0, 16);

				if (adc_reg_write(&encoder, reg, regv) == 0) {
					printf("adc[%02x] <- %02x (done)\n", reg, regv);
				} else {
					printf("adc[%02x] <- %02x (i2c error)\n", reg, regv);
				}

			} else {

				int onoff = 0;

				onoff = ((int)strtoul(&cmd[2], 0, 10) == 0) ? 0 : 1;

				adc_power(&encoder, onoff);
			}
		}

		if (cmd[0] == 'd') {
			alt_u8 regs[256];

			r = adv7513_regmap_dump(&encoder, regs, 0);
			if (r != 0) {
				printf("[err] failed to read chip regs! (%d)", r);
			}

			bin_dump(regs, 256);
		}

		if (cmd[0] == 'e') {
			alt_u8 edid[256];

			r = adv7513_edid_read(&encoder, edid, 0);
			if (r != 0) {
				printf("[err] failed to read edid data! (%d)", r);
			}

			bin_dump(edid, 256);
		}

		if (cmd[0] == 'i') {
			r = adv7513_do_hpd_powerup(&encoder);
			if (r != 0) {
				printf("[err] failed to do chip power up! (%d)", r);
			} else {
				printf("[hpd] done chip power up process.\n");
			}

			r = adv7513_chip_init(&encoder, 0);
			if (r != 0) {
				printf("[err] failed to do chip initialization! (%d)", r);
			}
		}

		if (cmd[0] == 'v') {
			r = adv7513_do_hpd_powerup(&encoder);
			if (r != 0) {
				printf("[err] failed to do chip power up! (%d)", r);
			} else {
				printf("[hpd] done chip power up process.\n");
			}

			r = adv7513_chip_init(&encoder, 1);
			if (r != 0) {
				printf("[err] failed to do chip initialization! (%d)", r);
			}
		}

		if (cmd[0] == 'r') {
			alt_u8 regv = 0;
			alt_u8 reg = 0;

			reg = (alt_u8)strtoul(&cmd[2], 0, 16);

			if (reg_read(&encoder, reg, &regv) == 0) {
				printf("[%02x] %02x\n", reg, regv);
			} else {
				printf("[err] i2c error!\n");
			}
		}

		if (cmd[0] == 'w') {
			alt_u8 regv = 0;
			alt_u8 reg = 0;
			char arg1[8] = {0};
			char arg2[8] = {0};

			strncpy(arg1, &cmd[2], 2);
			strncpy(arg2, &cmd[5], 2);

			reg = (alt_u8)strtoul(arg1, 0, 16);
			regv = (alt_u8)strtoul(arg2, 0, 16);

			if (reg_write(&encoder, reg, regv) == 0) {
				printf("[%02x] <- %02x (done)\n", reg, regv);
			} else {
				printf("[%02x] <- %02x (i2c error)\n", reg, regv);
			}
		}

		if (cmd[0] == 'p') {
			r = adv7513_do_hpd_powerup(&encoder);
			if (r != 0) {
				printf("[err] failed to do chip power up! (%d)", r);
			} else {
				printf("[hpd] done chip power up process.\n");
			}

			//usleep(100000);
		}

		if (cmd[0] == 'o') {
			r = adv7513_do_hpd_powerdown(&encoder);
			if (r != 0) {
				printf("[err] failed to do chip power off! (%d)", r);
			} else {
				printf("[hpd] done chip power off setting.\n");
			}

			//usleep(100000);
		}

		if (cmd[0] == 'h') {

			printf("performing hot-plug detection ...");

			while (1) {
				// probe for HDMI monitor hot plugging ...
				r = adv7513_hpd_probe(&encoder);
				if (r != 0) {  // error
					printf("[err] failed to do hpd probing! (%d)\n", r);
					rr = -1;
					goto _safe_exit;
				}

				if (encoder.hpd_event & (ADV7513_STATUS_HPD)) {
					if (encoder.hpd_latest & (ADV7513_STATUS_HPD)) {
						printf("[hpd] detected HDMI-sink hot-plugged.\n");
					} else {
						printf("[hpd] detected HDMI-sink un-plugged.\n");
					}
				}

				if (encoder.hpd_event & (ADV7513_STATUS_MONITOR_SENSE)) {
					if (encoder.hpd_latest & (ADV7513_STATUS_MONITOR_SENSE)) {
						printf("[hpd] detected monitor-sense change -- TMDS clock ready.\n");
					} else {
						printf("[hpd] detected monitor-sense change -- no TMDS clock.\n");
					}
				}
#if 0
				if (encoder.hpd != 0) {
					break;
				}
#else
				// if hpd state has changed and both HPD and monitor-sense signal asserts
				if (encoder.hpd > 0) {
					// handle plug-in events ...
					//usleep(100000);

					r = adv7513_do_hpd_powerup(&encoder);
					if (r != 0) {
						printf("[err] failed to do chip power up! (%d)", r);
					} else {
						printf("[hpd] done chip power up process.\n");
					}

					//usleep(100000);

					r = adv7513_chip_init(&encoder, 0);
					if (r != 0) {
						printf("[err] failed to do video input setting! (%d)", r);
					} else {
						printf("[vid] done video input setting.\n");
					}

					//usleep(100000);

				} else if (encoder.hpd < 0) {
					// handle unplug events ...
					//r = adv7513_do_hpd_powerdown(&encoder);
					//if (r != 0) {
					//	printf("[err] failed to do chip power down! (%d)", r);
					//} else {
					//	printf("[hpd] done chip power down process.\n");
					//}
				}
#endif
				printf(".");
				usleep(100000);
			}
		}
	}

_safe_exit:

	printf("\nprogram exit!\n");

	return rr;
}


bool hdmi_tx_start(void)
{
	int err, r = 0;

	bool bSuccess = TRUE;
//	struct hdmi_encoder encoder = {
//		.slave_addr = ADV7513_SALVE_ADDR8,
//		.edid_addr = ADV7513_EDID_ADDR8,
//		.hpd = 0,
//		.chip_id = {0},
//		.chip_rev = {0},
//
//		.adc = {
//			.slave_addr = ADV7341_SALVE_ADDR8,
//		},
//	};

	struct adv7513_int_mask ie_mask;

	memset(&ie_mask, 0, sizeof(ie_mask));

	printf("\n===== adv7511/adv7513 encoder demo =====\n");

	err = adv7513_chip_identify(&encoder);
	if (err) {
		printf("[err] failed to do chip-identification! (%d)\n", err);
		bSuccess = FALSE;
	}

	if (bSuccess){

		if ((encoder.chip_id[0] == adv7513_register_defaults[ADV7513_REG_CHIP_ID_LOW]) &&
				(encoder.chip_id[1] == adv7513_register_defaults[ADV7513_REG_CHIP_ID_HIGH])) {
			printf("encoder chip : ADV%02x%02x rev: 0x%02x\n", encoder.chip_id[1], encoder.chip_id[0], encoder.chip_rev[0]);
		} else {
			printf("encoder chip : unknown (id: 0x%02x 0x%02x rev: 0x%02x)\n", encoder.chip_id[0], encoder.chip_id[1], encoder.chip_rev[0]);
		}

		ie_mask.reg94_bits.hpd = 1;
		ie_mask.reg94_bits.monitor_sense = 1;

		err = adv7513_int_setup(&encoder, &ie_mask, adv7513_int_handler);
		if (err) {
			printf("[err] failed to do HDMI_TX_INT interrupt setup! (%d)\n", err);
			bSuccess = FALSE;
		} else {
			printf("success to setup HDMI_TX_INT interrupt handler.\n\n");
		}

	}
	// hdmi mode

	r = adv7513_do_hpd_powerup(&encoder);
	if (r != 0) {
		printf("[err] failed to do HDMI encoder power up! (%d)", r);
	} else {
		printf("[hpd] done HDMI encoder power up.\n");
	}

	r = adv7513_chip_init(&encoder, 0);
	if (r != 0) {
		printf("[err] failed to do HDMI encoder initialization! (%d)\n", r);
	} else {
		printf("[hpd] done HDMI encoder initialization.\n");
	}


	printf("\nHDMI TX(on-board) config program exit!\n");

	return bSuccess;
}


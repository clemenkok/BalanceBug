	component Qsys is
		port (
			alt_vip_itc_0_clocked_video_vid_clk       : in    std_logic                     := 'X';             -- vid_clk
			alt_vip_itc_0_clocked_video_vid_data      : out   std_logic_vector(23 downto 0);                    -- vid_data
			alt_vip_itc_0_clocked_video_underflow     : out   std_logic;                                        -- underflow
			alt_vip_itc_0_clocked_video_vid_datavalid : out   std_logic;                                        -- vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync    : out   std_logic;                                        -- vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync    : out   std_logic;                                        -- vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f         : out   std_logic;                                        -- vid_f
			alt_vip_itc_0_clocked_video_vid_h         : out   std_logic;                                        -- vid_h
			alt_vip_itc_0_clocked_video_vid_v         : out   std_logic;                                        -- vid_v
			altpll_0_areset_conduit_export            : in    std_logic                     := 'X';             -- export
			altpll_0_locked_conduit_export            : out   std_logic;                                        -- export
			clk_clk                                   : in    std_logic                     := 'X';             -- clk
			clk_sdram_clk                             : out   std_logic;                                        -- clk
			clk_vga_clk                               : out   std_logic;                                        -- clk
			d8m_xclkin_clk                            : out   std_logic;                                        -- clk
			eee_imgproc_0_conduit_mode_new_signal     : in    std_logic                     := 'X';             -- new_signal
			i2c_opencores_camera_export_scl_pad_io    : inout std_logic                     := 'X';             -- scl_pad_io
			i2c_opencores_camera_export_sda_pad_io    : inout std_logic                     := 'X';             -- sda_pad_io
			i2c_opencores_mipi_export_scl_pad_io      : inout std_logic                     := 'X';             -- scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io      : inout std_logic                     := 'X';             -- sda_pad_io
			key_external_connection_export            : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			led_external_connection_export            : out   std_logic_vector(9 downto 0);                     -- export
			mipi_pwdn_n_external_connection_export    : out   std_logic;                                        -- export
			mipi_reset_n_external_connection_export   : out   std_logic;                                        -- export
			reset_reset_n                             : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr                           : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                             : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                          : out   std_logic;                                        -- cas_n
			sdram_wire_cke                            : out   std_logic;                                        -- cke
			sdram_wire_cs_n                           : out   std_logic;                                        -- cs_n
			sdram_wire_dq                             : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                            : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                          : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                           : out   std_logic;                                        -- we_n
			sw_external_connection_export             : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			terasic_auto_focus_0_conduit_vcm_i2c_sda  : inout std_logic                     := 'X';             -- vcm_i2c_sda
			terasic_auto_focus_0_conduit_clk50        : in    std_logic                     := 'X';             -- clk50
			terasic_auto_focus_0_conduit_vcm_i2c_scl  : inout std_logic                     := 'X';             -- vcm_i2c_scl
			terasic_camera_0_conduit_end_D            : in    std_logic_vector(11 downto 0) := (others => 'X'); -- D
			terasic_camera_0_conduit_end_FVAL         : in    std_logic                     := 'X';             -- FVAL
			terasic_camera_0_conduit_end_LVAL         : in    std_logic                     := 'X';             -- LVAL
			terasic_camera_0_conduit_end_PIXCLK       : in    std_logic                     := 'X';             -- PIXCLK
			uart_0_rx_tx_rxd                          : in    std_logic                     := 'X';             -- rxd
			uart_0_rx_tx_txd                          : out   std_logic                                         -- txd
		);
	end component Qsys;

	u0 : component Qsys
		port map (
			alt_vip_itc_0_clocked_video_vid_clk       => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_clk,       --      alt_vip_itc_0_clocked_video.vid_clk
			alt_vip_itc_0_clocked_video_vid_data      => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_data,      --                                 .vid_data
			alt_vip_itc_0_clocked_video_underflow     => CONNECTED_TO_alt_vip_itc_0_clocked_video_underflow,     --                                 .underflow
			alt_vip_itc_0_clocked_video_vid_datavalid => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_datavalid, --                                 .vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync    => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v_sync,    --                                 .vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync    => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h_sync,    --                                 .vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f         => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_f,         --                                 .vid_f
			alt_vip_itc_0_clocked_video_vid_h         => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h,         --                                 .vid_h
			alt_vip_itc_0_clocked_video_vid_v         => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v,         --                                 .vid_v
			altpll_0_areset_conduit_export            => CONNECTED_TO_altpll_0_areset_conduit_export,            --          altpll_0_areset_conduit.export
			altpll_0_locked_conduit_export            => CONNECTED_TO_altpll_0_locked_conduit_export,            --          altpll_0_locked_conduit.export
			clk_clk                                   => CONNECTED_TO_clk_clk,                                   --                              clk.clk
			clk_sdram_clk                             => CONNECTED_TO_clk_sdram_clk,                             --                        clk_sdram.clk
			clk_vga_clk                               => CONNECTED_TO_clk_vga_clk,                               --                          clk_vga.clk
			d8m_xclkin_clk                            => CONNECTED_TO_d8m_xclkin_clk,                            --                       d8m_xclkin.clk
			eee_imgproc_0_conduit_mode_new_signal     => CONNECTED_TO_eee_imgproc_0_conduit_mode_new_signal,     --       eee_imgproc_0_conduit_mode.new_signal
			i2c_opencores_camera_export_scl_pad_io    => CONNECTED_TO_i2c_opencores_camera_export_scl_pad_io,    --      i2c_opencores_camera_export.scl_pad_io
			i2c_opencores_camera_export_sda_pad_io    => CONNECTED_TO_i2c_opencores_camera_export_sda_pad_io,    --                                 .sda_pad_io
			i2c_opencores_mipi_export_scl_pad_io      => CONNECTED_TO_i2c_opencores_mipi_export_scl_pad_io,      --        i2c_opencores_mipi_export.scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io      => CONNECTED_TO_i2c_opencores_mipi_export_sda_pad_io,      --                                 .sda_pad_io
			key_external_connection_export            => CONNECTED_TO_key_external_connection_export,            --          key_external_connection.export
			led_external_connection_export            => CONNECTED_TO_led_external_connection_export,            --          led_external_connection.export
			mipi_pwdn_n_external_connection_export    => CONNECTED_TO_mipi_pwdn_n_external_connection_export,    --  mipi_pwdn_n_external_connection.export
			mipi_reset_n_external_connection_export   => CONNECTED_TO_mipi_reset_n_external_connection_export,   -- mipi_reset_n_external_connection.export
			reset_reset_n                             => CONNECTED_TO_reset_reset_n,                             --                            reset.reset_n
			sdram_wire_addr                           => CONNECTED_TO_sdram_wire_addr,                           --                       sdram_wire.addr
			sdram_wire_ba                             => CONNECTED_TO_sdram_wire_ba,                             --                                 .ba
			sdram_wire_cas_n                          => CONNECTED_TO_sdram_wire_cas_n,                          --                                 .cas_n
			sdram_wire_cke                            => CONNECTED_TO_sdram_wire_cke,                            --                                 .cke
			sdram_wire_cs_n                           => CONNECTED_TO_sdram_wire_cs_n,                           --                                 .cs_n
			sdram_wire_dq                             => CONNECTED_TO_sdram_wire_dq,                             --                                 .dq
			sdram_wire_dqm                            => CONNECTED_TO_sdram_wire_dqm,                            --                                 .dqm
			sdram_wire_ras_n                          => CONNECTED_TO_sdram_wire_ras_n,                          --                                 .ras_n
			sdram_wire_we_n                           => CONNECTED_TO_sdram_wire_we_n,                           --                                 .we_n
			sw_external_connection_export             => CONNECTED_TO_sw_external_connection_export,             --           sw_external_connection.export
			terasic_auto_focus_0_conduit_vcm_i2c_sda  => CONNECTED_TO_terasic_auto_focus_0_conduit_vcm_i2c_sda,  --     terasic_auto_focus_0_conduit.vcm_i2c_sda
			terasic_auto_focus_0_conduit_clk50        => CONNECTED_TO_terasic_auto_focus_0_conduit_clk50,        --                                 .clk50
			terasic_auto_focus_0_conduit_vcm_i2c_scl  => CONNECTED_TO_terasic_auto_focus_0_conduit_vcm_i2c_scl,  --                                 .vcm_i2c_scl
			terasic_camera_0_conduit_end_D            => CONNECTED_TO_terasic_camera_0_conduit_end_D,            --     terasic_camera_0_conduit_end.D
			terasic_camera_0_conduit_end_FVAL         => CONNECTED_TO_terasic_camera_0_conduit_end_FVAL,         --                                 .FVAL
			terasic_camera_0_conduit_end_LVAL         => CONNECTED_TO_terasic_camera_0_conduit_end_LVAL,         --                                 .LVAL
			terasic_camera_0_conduit_end_PIXCLK       => CONNECTED_TO_terasic_camera_0_conduit_end_PIXCLK,       --                                 .PIXCLK
			uart_0_rx_tx_rxd                          => CONNECTED_TO_uart_0_rx_tx_rxd,                          --                     uart_0_rx_tx.rxd
			uart_0_rx_tx_txd                          => CONNECTED_TO_uart_0_rx_tx_txd                           --                                 .txd
		);


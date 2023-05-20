	component D8M_QSYS is
		port (
			alt_vip_itc_0_clocked_video_vid_clk         : in    std_logic                     := 'X';             -- vid_clk
			alt_vip_itc_0_clocked_video_vid_data        : out   std_logic_vector(23 downto 0);                    -- vid_data
			alt_vip_itc_0_clocked_video_underflow       : out   std_logic;                                        -- underflow
			alt_vip_itc_0_clocked_video_vid_datavalid   : out   std_logic;                                        -- vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync      : out   std_logic;                                        -- vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync      : out   std_logic;                                        -- vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f           : out   std_logic;                                        -- vid_f
			alt_vip_itc_0_clocked_video_vid_h           : out   std_logic;                                        -- vid_h
			alt_vip_itc_0_clocked_video_vid_v           : out   std_logic;                                        -- vid_v
			external_clk50_clk                          : in    std_logic                     := 'X';             -- clk
			external_reset_reset_n                      : in    std_logic                     := 'X';             -- reset_n
			hdmi_tx_int_n_external_connection_export    : in    std_logic                     := 'X';             -- export
			i2c_opencores_camera_export_scl_pad_io      : inout std_logic                     := 'X';             -- scl_pad_io
			i2c_opencores_camera_export_sda_pad_io      : inout std_logic                     := 'X';             -- sda_pad_io
			i2c_opencores_mipi_export_scl_pad_io        : inout std_logic                     := 'X';             -- scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io        : inout std_logic                     := 'X';             -- sda_pad_io
			i2c_scl_external_connection_export          : out   std_logic;                                        -- export
			i2c_sda_external_connection_export          : inout std_logic                     := 'X';             -- export
			key_external_connection_export              : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			mem_if_lpddr2_emif_pll_ref_clk_clk          : in    std_logic                     := 'X';             -- clk
			mem_if_lpddr2_emif_status_local_init_done   : out   std_logic;                                        -- local_init_done
			mem_if_lpddr2_emif_status_local_cal_success : out   std_logic;                                        -- local_cal_success
			mem_if_lpddr2_emif_status_local_cal_fail    : out   std_logic;                                        -- local_cal_fail
			memory_mem_ca                               : out   std_logic_vector(9 downto 0);                     -- mem_ca
			memory_mem_ck                               : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n                             : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke                              : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n                             : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm                               : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_mem_dq                               : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                              : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                            : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			mipi_pwdn_n_external_connection_export      : out   std_logic;                                        -- export
			mipi_reset_n_external_connection_export     : out   std_logic;                                        -- export
			oct_rzqin                                   : in    std_logic                     := 'X';             -- rzqin
			terasic_auto_focus_0_conduit_vcm_i2c_sda    : inout std_logic                     := 'X';             -- vcm_i2c_sda
			terasic_auto_focus_0_conduit_clk50          : in    std_logic                     := 'X';             -- clk50
			terasic_auto_focus_0_conduit_vcm_i2c_scl    : inout std_logic                     := 'X';             -- vcm_i2c_scl
			terasic_camera_0_conduit_end_D              : in    std_logic_vector(11 downto 0) := (others => 'X'); -- D
			terasic_camera_0_conduit_end_FVAL           : in    std_logic                     := 'X';             -- FVAL
			terasic_camera_0_conduit_end_LVAL           : in    std_logic                     := 'X';             -- LVAL
			terasic_camera_0_conduit_end_PIXCLK         : in    std_logic                     := 'X'              -- PIXCLK
		);
	end component D8M_QSYS;

	u0 : component D8M_QSYS
		port map (
			alt_vip_itc_0_clocked_video_vid_clk         => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_clk,         --       alt_vip_itc_0_clocked_video.vid_clk
			alt_vip_itc_0_clocked_video_vid_data        => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_data,        --                                  .vid_data
			alt_vip_itc_0_clocked_video_underflow       => CONNECTED_TO_alt_vip_itc_0_clocked_video_underflow,       --                                  .underflow
			alt_vip_itc_0_clocked_video_vid_datavalid   => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_datavalid,   --                                  .vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync      => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v_sync,      --                                  .vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync      => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h_sync,      --                                  .vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f           => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_f,           --                                  .vid_f
			alt_vip_itc_0_clocked_video_vid_h           => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h,           --                                  .vid_h
			alt_vip_itc_0_clocked_video_vid_v           => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v,           --                                  .vid_v
			external_clk50_clk                          => CONNECTED_TO_external_clk50_clk,                          --                    external_clk50.clk
			external_reset_reset_n                      => CONNECTED_TO_external_reset_reset_n,                      --                    external_reset.reset_n
			hdmi_tx_int_n_external_connection_export    => CONNECTED_TO_hdmi_tx_int_n_external_connection_export,    -- hdmi_tx_int_n_external_connection.export
			i2c_opencores_camera_export_scl_pad_io      => CONNECTED_TO_i2c_opencores_camera_export_scl_pad_io,      --       i2c_opencores_camera_export.scl_pad_io
			i2c_opencores_camera_export_sda_pad_io      => CONNECTED_TO_i2c_opencores_camera_export_sda_pad_io,      --                                  .sda_pad_io
			i2c_opencores_mipi_export_scl_pad_io        => CONNECTED_TO_i2c_opencores_mipi_export_scl_pad_io,        --         i2c_opencores_mipi_export.scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io        => CONNECTED_TO_i2c_opencores_mipi_export_sda_pad_io,        --                                  .sda_pad_io
			i2c_scl_external_connection_export          => CONNECTED_TO_i2c_scl_external_connection_export,          --       i2c_scl_external_connection.export
			i2c_sda_external_connection_export          => CONNECTED_TO_i2c_sda_external_connection_export,          --       i2c_sda_external_connection.export
			key_external_connection_export              => CONNECTED_TO_key_external_connection_export,              --           key_external_connection.export
			mem_if_lpddr2_emif_pll_ref_clk_clk          => CONNECTED_TO_mem_if_lpddr2_emif_pll_ref_clk_clk,          --    mem_if_lpddr2_emif_pll_ref_clk.clk
			mem_if_lpddr2_emif_status_local_init_done   => CONNECTED_TO_mem_if_lpddr2_emif_status_local_init_done,   --         mem_if_lpddr2_emif_status.local_init_done
			mem_if_lpddr2_emif_status_local_cal_success => CONNECTED_TO_mem_if_lpddr2_emif_status_local_cal_success, --                                  .local_cal_success
			mem_if_lpddr2_emif_status_local_cal_fail    => CONNECTED_TO_mem_if_lpddr2_emif_status_local_cal_fail,    --                                  .local_cal_fail
			memory_mem_ca                               => CONNECTED_TO_memory_mem_ca,                               --                            memory.mem_ca
			memory_mem_ck                               => CONNECTED_TO_memory_mem_ck,                               --                                  .mem_ck
			memory_mem_ck_n                             => CONNECTED_TO_memory_mem_ck_n,                             --                                  .mem_ck_n
			memory_mem_cke                              => CONNECTED_TO_memory_mem_cke,                              --                                  .mem_cke
			memory_mem_cs_n                             => CONNECTED_TO_memory_mem_cs_n,                             --                                  .mem_cs_n
			memory_mem_dm                               => CONNECTED_TO_memory_mem_dm,                               --                                  .mem_dm
			memory_mem_dq                               => CONNECTED_TO_memory_mem_dq,                               --                                  .mem_dq
			memory_mem_dqs                              => CONNECTED_TO_memory_mem_dqs,                              --                                  .mem_dqs
			memory_mem_dqs_n                            => CONNECTED_TO_memory_mem_dqs_n,                            --                                  .mem_dqs_n
			mipi_pwdn_n_external_connection_export      => CONNECTED_TO_mipi_pwdn_n_external_connection_export,      --   mipi_pwdn_n_external_connection.export
			mipi_reset_n_external_connection_export     => CONNECTED_TO_mipi_reset_n_external_connection_export,     --  mipi_reset_n_external_connection.export
			oct_rzqin                                   => CONNECTED_TO_oct_rzqin,                                   --                               oct.rzqin
			terasic_auto_focus_0_conduit_vcm_i2c_sda    => CONNECTED_TO_terasic_auto_focus_0_conduit_vcm_i2c_sda,    --      terasic_auto_focus_0_conduit.vcm_i2c_sda
			terasic_auto_focus_0_conduit_clk50          => CONNECTED_TO_terasic_auto_focus_0_conduit_clk50,          --                                  .clk50
			terasic_auto_focus_0_conduit_vcm_i2c_scl    => CONNECTED_TO_terasic_auto_focus_0_conduit_vcm_i2c_scl,    --                                  .vcm_i2c_scl
			terasic_camera_0_conduit_end_D              => CONNECTED_TO_terasic_camera_0_conduit_end_D,              --      terasic_camera_0_conduit_end.D
			terasic_camera_0_conduit_end_FVAL           => CONNECTED_TO_terasic_camera_0_conduit_end_FVAL,           --                                  .FVAL
			terasic_camera_0_conduit_end_LVAL           => CONNECTED_TO_terasic_camera_0_conduit_end_LVAL,           --                                  .LVAL
			terasic_camera_0_conduit_end_PIXCLK         => CONNECTED_TO_terasic_camera_0_conduit_end_PIXCLK          --                                  .PIXCLK
		);


-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from bb_rgb_to_v_B1_start_stall_region
-- VHDL created on Tue Jun 06 01:49:34 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity bb_rgb_to_v_B1_start_stall_region is
    port (
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifodata : out std_logic_vector(55 downto 0);  -- ufix56
        out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_do_i_fifodata : in std_logic_vector(23 downto 0);  -- ufix24
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_rgb_to_v_B1_start_stall_region;

architecture normal of bb_rgb_to_v_B1_start_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_v12 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(23 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_v13 is
        port (
            in_i_data_0 : in std_logic_vector(55 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifodata : out std_logic_vector(55 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr is
        port (
            in_unnamed_rgb_to_v0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component rgb_to_v_B1_start_merge_reg is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv_i_i2_rgb_to_vgr_sel_x_b : STD_LOGIC_VECTOR (55 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifodata : STD_LOGIC_VECTOR (55 downto 0);
    signal i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i23_rgb_to_vgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i23_rgb_to_vgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i23_rgb_to_vgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i23_rgb_to_vgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i28_rgb_to_vgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i28_rgb_to_vgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i28_rgb_to_vgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i28_rgb_to_vgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i48_rgb_to_vgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i48_rgb_to_vgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i48_rgb_to_vgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i48_rgb_to_vgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i53_rgb_to_vgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i53_rgb_to_vgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i53_rgb_to_vgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i53_rgb_to_vgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv_i_i2_rgb_to_vgr_vt_const_55_q : STD_LOGIC_VECTOR (47 downto 0);
    signal i_conv_i_i2_rgb_to_vgr_vt_join_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv_i_i2_rgb_to_vgr_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_max_1_rgb_to_vgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_max_1_rgb_to_vgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_max_2_rgb_to_vgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_max_2_rgb_to_vgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_or_cond189_rgb_to_vgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond189_rgb_to_vgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond190_rgb_to_vgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond190_rgb_to_vgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_v_B1_start_merge_reg_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_v_B1_start_merge_reg_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d : STD_LOGIC_VECTOR (7 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_or_cond189_rgb_to_vgr_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_rgb_to_v_B1_start_merge_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x(STALLENABLE,63)
    -- Valid signal propagation
    SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_V0 <= SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_wireValid <= i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x(BLACKBOX,15)@1
    -- in in_i_stall@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x : i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr
    PORT MAP (
        in_unnamed_rgb_to_v0_0 => GND_q,
        in_i_stall => SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_backStall,
        in_i_valid => SE_out_rgb_to_v_B1_start_merge_reg_V1,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out => i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out => i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out,
        out_o_stall => i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,76)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= rgb_to_v_B1_start_merge_reg_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- rgb_to_v_B1_start_merge_reg(BLACKBOX,38)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thergb_to_v_B1_start_merge_reg : rgb_to_v_B1_start_merge_reg
    PORT MAP (
        in_data_in => GND_q,
        in_stall_in => SE_out_rgb_to_v_B1_start_merge_reg_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_stall_out => rgb_to_v_B1_start_merge_reg_out_stall_out,
        out_valid_out => rgb_to_v_B1_start_merge_reg_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_rgb_to_v_B1_start_merge_reg(STALLENABLE,75)
    SE_out_rgb_to_v_B1_start_merge_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_rgb_to_v_B1_start_merge_reg_fromReg0 <= (others => '0');
            SE_out_rgb_to_v_B1_start_merge_reg_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_rgb_to_v_B1_start_merge_reg_fromReg0 <= SE_out_rgb_to_v_B1_start_merge_reg_toReg0;
            -- Succesor 1
            SE_out_rgb_to_v_B1_start_merge_reg_fromReg1 <= SE_out_rgb_to_v_B1_start_merge_reg_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_rgb_to_v_B1_start_merge_reg_consumed0 <= (not (i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_stall) and SE_out_rgb_to_v_B1_start_merge_reg_wireValid) or SE_out_rgb_to_v_B1_start_merge_reg_fromReg0;
    SE_out_rgb_to_v_B1_start_merge_reg_consumed1 <= (not (i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_o_stall) and SE_out_rgb_to_v_B1_start_merge_reg_wireValid) or SE_out_rgb_to_v_B1_start_merge_reg_fromReg1;
    -- Consuming
    SE_out_rgb_to_v_B1_start_merge_reg_StallValid <= SE_out_rgb_to_v_B1_start_merge_reg_backStall and SE_out_rgb_to_v_B1_start_merge_reg_wireValid;
    SE_out_rgb_to_v_B1_start_merge_reg_toReg0 <= SE_out_rgb_to_v_B1_start_merge_reg_StallValid and SE_out_rgb_to_v_B1_start_merge_reg_consumed0;
    SE_out_rgb_to_v_B1_start_merge_reg_toReg1 <= SE_out_rgb_to_v_B1_start_merge_reg_StallValid and SE_out_rgb_to_v_B1_start_merge_reg_consumed1;
    -- Backward Stall generation
    SE_out_rgb_to_v_B1_start_merge_reg_or0 <= SE_out_rgb_to_v_B1_start_merge_reg_consumed0;
    SE_out_rgb_to_v_B1_start_merge_reg_wireStall <= not (SE_out_rgb_to_v_B1_start_merge_reg_consumed1 and SE_out_rgb_to_v_B1_start_merge_reg_or0);
    SE_out_rgb_to_v_B1_start_merge_reg_backStall <= SE_out_rgb_to_v_B1_start_merge_reg_wireStall;
    -- Valid signal propagation
    SE_out_rgb_to_v_B1_start_merge_reg_V0 <= SE_out_rgb_to_v_B1_start_merge_reg_wireValid and not (SE_out_rgb_to_v_B1_start_merge_reg_fromReg0);
    SE_out_rgb_to_v_B1_start_merge_reg_V1 <= SE_out_rgb_to_v_B1_start_merge_reg_wireValid and not (SE_out_rgb_to_v_B1_start_merge_reg_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_rgb_to_v_B1_start_merge_reg_wireValid <= rgb_to_v_B1_start_merge_reg_out_valid_out;

    -- SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x(STALLENABLE,61)
    -- Backward Stall generation
    SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_wireValid <= i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_valid;

    -- i_conv_i_i2_rgb_to_vgr_vt_const_55(CONSTANT,27)
    i_conv_i_i2_rgb_to_vgr_vt_const_55_q <= "000000000000000000000000000000000000000000000000";

    -- bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x(BITJOIN,51)
    bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_q <= i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2 & i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1 & i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0;

    -- bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x(BITSELECT,52)
    bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_q(7 downto 0));
    bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_q(15 downto 8));
    bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_q(23 downto 16));

    -- redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0(REG,49)
    redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_q <= "00000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_or_cond189_rgb_to_vgr_backEN = "1") THEN
                redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_q <= STD_LOGIC_VECTOR(bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0(REG,48)
    redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_q <= "00000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_or_cond189_rgb_to_vgr_backEN = "1") THEN
                redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_q <= STD_LOGIC_VECTOR(bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0(REG,47)
    redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_q <= "00000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_or_cond189_rgb_to_vgr_backEN = "1") THEN
                redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_q <= STD_LOGIC_VECTOR(bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_cmp_i_i48_rgb_to_vgr(COMPARE,24)@1
    i_cmp_i_i48_rgb_to_vgr_a <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d);
    i_cmp_i_i48_rgb_to_vgr_b <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c);
    i_cmp_i_i48_rgb_to_vgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i48_rgb_to_vgr_a) - UNSIGNED(i_cmp_i_i48_rgb_to_vgr_b));
    i_cmp_i_i48_rgb_to_vgr_c(0) <= i_cmp_i_i48_rgb_to_vgr_o(9);

    -- i_cmp_i_i53_rgb_to_vgr(COMPARE,25)@1
    i_cmp_i_i53_rgb_to_vgr_a <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_b);
    i_cmp_i_i53_rgb_to_vgr_b <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c);
    i_cmp_i_i53_rgb_to_vgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i53_rgb_to_vgr_a) - UNSIGNED(i_cmp_i_i53_rgb_to_vgr_b));
    i_cmp_i_i53_rgb_to_vgr_c(0) <= i_cmp_i_i53_rgb_to_vgr_o(9);

    -- i_or_cond189_rgb_to_vgr(LOGICAL,32)@1 + 1
    i_or_cond189_rgb_to_vgr_qi <= i_cmp_i_i53_rgb_to_vgr_c and i_cmp_i_i48_rgb_to_vgr_c;
    i_or_cond189_rgb_to_vgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond189_rgb_to_vgr_qi, xout => i_or_cond189_rgb_to_vgr_q, ena => SE_i_or_cond189_rgb_to_vgr_backEN(0), clk => clock, aclr => resetn );

    -- i_max_1_rgb_to_vgr(MUX,30)@2
    i_max_1_rgb_to_vgr_s <= i_or_cond189_rgb_to_vgr_q;
    i_max_1_rgb_to_vgr_combproc: PROCESS (i_max_1_rgb_to_vgr_s, redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_q, redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_q)
    BEGIN
        CASE (i_max_1_rgb_to_vgr_s) IS
            WHEN "0" => i_max_1_rgb_to_vgr_q <= redist0_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0_1_0_q;
            WHEN "1" => i_max_1_rgb_to_vgr_q <= redist1_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1_1_0_q;
            WHEN OTHERS => i_max_1_rgb_to_vgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i23_rgb_to_vgr(COMPARE,22)@1
    i_cmp_i_i23_rgb_to_vgr_a <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_c);
    i_cmp_i_i23_rgb_to_vgr_b <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d);
    i_cmp_i_i23_rgb_to_vgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i23_rgb_to_vgr_a) - UNSIGNED(i_cmp_i_i23_rgb_to_vgr_b));
    i_cmp_i_i23_rgb_to_vgr_c(0) <= i_cmp_i_i23_rgb_to_vgr_o(9);

    -- i_cmp_i_i28_rgb_to_vgr(COMPARE,23)@1
    i_cmp_i_i28_rgb_to_vgr_a <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_b);
    i_cmp_i_i28_rgb_to_vgr_b <= STD_LOGIC_VECTOR("00" & bubble_select_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_d);
    i_cmp_i_i28_rgb_to_vgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i28_rgb_to_vgr_a) - UNSIGNED(i_cmp_i_i28_rgb_to_vgr_b));
    i_cmp_i_i28_rgb_to_vgr_c(0) <= i_cmp_i_i28_rgb_to_vgr_o(9);

    -- i_or_cond190_rgb_to_vgr(LOGICAL,33)@1 + 1
    i_or_cond190_rgb_to_vgr_qi <= i_cmp_i_i28_rgb_to_vgr_c and i_cmp_i_i23_rgb_to_vgr_c;
    i_or_cond190_rgb_to_vgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond190_rgb_to_vgr_qi, xout => i_or_cond190_rgb_to_vgr_q, ena => SE_i_or_cond189_rgb_to_vgr_backEN(0), clk => clock, aclr => resetn );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_max_2_rgb_to_vgr(MUX,31)@2
    i_max_2_rgb_to_vgr_s <= i_or_cond190_rgb_to_vgr_q;
    i_max_2_rgb_to_vgr_combproc: PROCESS (i_max_2_rgb_to_vgr_s, i_max_1_rgb_to_vgr_q, redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_q)
    BEGIN
        CASE (i_max_2_rgb_to_vgr_s) IS
            WHEN "0" => i_max_2_rgb_to_vgr_q <= i_max_1_rgb_to_vgr_q;
            WHEN "1" => i_max_2_rgb_to_vgr_q <= redist2_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2_1_0_q;
            WHEN OTHERS => i_max_2_rgb_to_vgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv_i_i2_rgb_to_vgr_sel_x(BITSELECT,12)@2
    i_conv_i_i2_rgb_to_vgr_sel_x_b <= std_logic_vector(resize(unsigned(i_max_2_rgb_to_vgr_q(7 downto 0)), 56));

    -- i_conv_i_i2_rgb_to_vgr_vt_select_7(BITSELECT,29)@2
    i_conv_i_i2_rgb_to_vgr_vt_select_7_b <= i_conv_i_i2_rgb_to_vgr_sel_x_b(7 downto 0);

    -- i_conv_i_i2_rgb_to_vgr_vt_join(BITJOIN,28)@2
    i_conv_i_i2_rgb_to_vgr_vt_join_q <= i_conv_i_i2_rgb_to_vgr_vt_const_55_q & i_conv_i_i2_rgb_to_vgr_vt_select_7_b;

    -- i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x(BLACKBOX,14)@2
    -- in in_i_stall@20000000
    -- out out_iowr_nb_return_o_fifodata@20000000
    -- out out_iowr_nb_return_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x : i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_v13
    PORT MAP (
        in_i_data_0 => i_conv_i_i2_rgb_to_vgr_vt_join_q,
        in_i_stall => SE_out_i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_backStall,
        in_i_valid => SE_i_or_cond189_rgb_to_vgr_V0,
        out_iowr_nb_return_o_fifodata => i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifodata,
        out_iowr_nb_return_o_fifovalid => i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifovalid,
        out_o_stall => i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_stall,
        out_o_valid => i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_or_cond189_rgb_to_vgr(STALLENABLE,72)
    -- Valid signal propagation
    SE_i_or_cond189_rgb_to_vgr_V0 <= SE_i_or_cond189_rgb_to_vgr_R_v_0;
    -- Stall signal propagation
    SE_i_or_cond189_rgb_to_vgr_s_tv_0 <= i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_o_stall and SE_i_or_cond189_rgb_to_vgr_R_v_0;
    -- Backward Enable generation
    SE_i_or_cond189_rgb_to_vgr_backEN <= not (SE_i_or_cond189_rgb_to_vgr_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_or_cond189_rgb_to_vgr_v_s_0 <= SE_i_or_cond189_rgb_to_vgr_backEN and SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_V0;
    -- Backward Stall generation
    SE_i_or_cond189_rgb_to_vgr_backStall <= not (SE_i_or_cond189_rgb_to_vgr_v_s_0);
    SE_i_or_cond189_rgb_to_vgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_or_cond189_rgb_to_vgr_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_or_cond189_rgb_to_vgr_backEN = "0") THEN
                SE_i_or_cond189_rgb_to_vgr_R_v_0 <= SE_i_or_cond189_rgb_to_vgr_R_v_0 and SE_i_or_cond189_rgb_to_vgr_s_tv_0;
            ELSE
                SE_i_or_cond189_rgb_to_vgr_R_v_0 <= SE_i_or_cond189_rgb_to_vgr_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x(STALLENABLE,59)
    -- Valid signal propagation
    SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_V0 <= SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_backStall <= SE_i_or_cond189_rgb_to_vgr_backStall or not (SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_wireValid <= i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_valid;

    -- i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x(BLACKBOX,13)@1
    -- in in_i_stall@20000000
    -- out out_iord_bl_do_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x : i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_v12
    PORT MAP (
        in_i_stall => SE_out_i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_backStall,
        in_i_valid => SE_out_rgb_to_v_B1_start_merge_reg_V0,
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        out_o_data_0 => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_0,
        out_o_data_1 => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_1,
        out_o_data_2 => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_data_2,
        out_iord_bl_do_o_fifoready => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_iord_bl_do_o_fifoready,
        out_o_stall => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_stall,
        out_o_valid => i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,2)
    out_iord_bl_do_o_fifoready <= i_iord_bl_do_unnamed_rgb_to_v1_rgb_to_vgr_aunroll_x_out_iord_bl_do_o_fifoready;

    -- dupName_0_sync_out_x(GPOUT,6)@1
    out_valid_out <= SE_out_i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,7)
    out_iowr_nb_return_o_fifodata <= i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifodata;
    out_iowr_nb_return_o_fifovalid <= i_iowr_nb_return_unnamed_rgb_to_v2_rgb_to_vgr_aunroll_x_out_iowr_nb_return_o_fifovalid;

    -- ext_sig_sync_out(GPOUT,21)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out <= i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out <= i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_vgr_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,37)
    out_pipeline_valid_out <= i_sfc_c0_wt_entry_rgb_to_v_c0_enter_rgb_to_vgr_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,42)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;

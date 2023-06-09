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

-- VHDL created from i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13
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

entity i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13 is
    port (
        in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_1 : out std_logic_vector(55 downto 0);  -- ufix56
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13;

architecture normal of i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_i_i_i_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (18 downto 0);
    signal bgTrunc_i_add_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub90_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_sub_i_i_i_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal bgTrunc_i_sub_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv4_i_i_i_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_conv52_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv91_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i2_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv_i_i_i16_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_conv_i_i_i325_rgb_to_hgr_sel_x_b : STD_LOGIC_VECTOR (18 downto 0);
    signal c_i17_65535_q : STD_LOGIC_VECTOR (16 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_4gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_5gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i56_524287_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_13_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_13_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hgr_vt_const_31_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_acl_13_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hgr_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_14_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hgr_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_17_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_17_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hgr_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_19_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_19_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hgr_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_24_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_24_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hgr_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_25_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_26_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hgr_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_28_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_rgb_to_hgr_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_28_rgb_to_hgr_vt_const_55_q : STD_LOGIC_VECTOR (36 downto 0);
    signal i_acl_28_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_28_rgb_to_hgr_vt_select_18_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_acl_4_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_4_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_5_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_5_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_6_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_6_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_7_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_7_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_8_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_8_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_9_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_9_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_add_i_i_i_rgb_to_hgr_a : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_i_i_i_rgb_to_hgr_b : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_i_i_i_rgb_to_hgr_o : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_i_i_i_rgb_to_hgr_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_rgb_to_hgr_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hgr_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hgr_vt_const_31_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_add_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_rgb_to_hgr_vt_select_24_b : STD_LOGIC_VECTOR (24 downto 0);
    signal i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cmp_i_i103_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i103_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i103_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i103_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i128_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i128_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i128_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i128_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i141_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i148_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i148_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i148_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i148_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i98_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i98_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i98_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i98_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i29_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i44_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i49_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i64_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i69_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i74_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i74_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_rgb_to_hgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_conv4_i_i_i_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_conv4_i_i_i_rgb_to_hgr_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_conv52_rgb_to_hgr_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv52_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_hgr_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv91_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv91_rgb_to_hgr_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i2_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv_i_i2_rgb_to_hgr_vt_select_18_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q : STD_LOGIC_VECTOR (12 downto 0);
    signal i_conv_i_i_i325_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_div_rgb_to_hgr_vt_const_31_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_div_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_rgb_to_hgr_vt_select_23_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_add66_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mux_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hgr_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_mux_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hgr_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond329_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond330_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond331_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond327_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond328_not_demorgan_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond328_not_demorgan_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond329_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond330_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond330_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond331_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond331_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond332_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond332_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond333_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond333_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_rgb_to_h_0_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_1_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_2_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_2_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_3_demorgan_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_3_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_5_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_6_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_7_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_h_7_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl_rgb_to_hgr_vt_const_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_shl_rgb_to_hgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_rgb_to_hgr_vt_select_23_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sub90_rgb_to_hgr_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub90_rgb_to_hgr_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub90_rgb_to_hgr_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub90_rgb_to_hgr_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_i_i_i_rgb_to_hgr_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hgr_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hgr_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hgr_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_rgb_to_hgr_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hgr_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hgr_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hgr_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_unnamed_rgb_to_h23_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h25_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h27_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h27_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_h29_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_rgb_to_h29_vt_select_18_b : STD_LOGIC_VECTOR (2 downto 0);
    signal normYNoLeadOne_uid192_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid192_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid193_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid194_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid193_i_div_rgb_to_hgr_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid193_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid193_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid196_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid197_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid197_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid198_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid198_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid198_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid203_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid203_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid204_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid205_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid206_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid207_i_div_rgb_to_hgr_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid207_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid207_i_div_rgb_to_hgr_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid207_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid211_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal allOnes_uid211_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid213_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid214_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid217_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid218_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid218_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalM1_uid223_i_div_rgb_to_hgr_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid223_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid223_i_div_rgb_to_hgr_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid223_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalPostMux_uid224_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalPostMux_uid224_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid225_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinalIntDiv_uid225_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid245_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid259_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid260_zCount_uid190_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid264_invTabGen_q : STD_LOGIC_VECTOR (37 downto 0);
    signal yT1_uid279_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid281_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid282_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid284_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid284_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid284_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid284_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid285_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid286_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cIncludingRoundingBit_uid289_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal ts2_uid291_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid291_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid291_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid291_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid292_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rndBit_uid295_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid296_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid299_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal nx_mergedSignalTM_uid303_pT1_uid280_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid315_pT1_uid280_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal topRangeY_mergedSignalTM_uid319_pT1_uid280_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid321_pT1_uid280_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid321_pT1_uid280_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid321_pT1_uid280_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid321_pT1_uid280_invPolyEval_reset : std_logic;
    signal sm0_uid321_pT1_uid280_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid322_pT1_uid280_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid322_pT1_uid280_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal topRangeX_uid336_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid337_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid342_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid345_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_mergedSignalTM_uid349_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomY_uid351_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid355_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_uid355_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid356_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid356_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid357_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid357_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid358_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid358_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid364_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid365_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid366_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid367_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid372_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid373_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid374_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid375_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid386_pT2_uid287_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid386_pT2_uid287_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid386_pT2_uid287_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid386_pT2_uid287_invPolyEval_reset : std_logic;
    signal sm0_uid386_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid387_pT2_uid287_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid387_pT2_uid287_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid387_pT2_uid287_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid387_pT2_uid287_invPolyEval_reset : std_logic;
    signal sm0_uid387_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm1_uid388_pT2_uid287_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid388_pT2_uid287_invPolyEval_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid388_pT2_uid287_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid388_pT2_uid287_invPolyEval_reset : std_logic;
    signal sm1_uid388_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid389_pT2_uid287_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid389_pT2_uid287_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid389_pT2_uid287_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid389_pT2_uid287_invPolyEval_reset : std_logic;
    signal sm0_uid389_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid390_pT2_uid287_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid390_pT2_uid287_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid390_pT2_uid287_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid390_pT2_uid287_invPolyEval_reset : std_logic;
    signal sm1_uid390_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid391_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid391_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid392_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid393_pT2_uid287_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid393_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid393_pT2_uid287_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid393_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid394_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid395_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeA_uid395_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highABits_uid396_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid397_pT2_uid287_invPolyEval_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid397_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid397_pT2_uid287_invPolyEval_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid397_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal lev1_a1_uid398_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid399_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid399_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid400_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid401_pT2_uid287_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid401_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid401_pT2_uid287_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid401_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid402_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lowRangeA_uid403_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid403_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid404_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev3_a0high_uid405_pT2_uid287_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid405_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid405_pT2_uid287_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid405_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid406_pT2_uid287_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid407_pT2_uid287_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid407_pT2_uid287_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal topRangeX_uid421_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid422_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_mergedSignalTM_uid446_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomExtension_uid448_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_mergedSignalTM_uid450_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid456_pT3_uid294_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftX_uid456_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid457_pT3_uid294_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_uid457_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid463_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid464_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid469_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid470_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid475_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid476_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid485_pT3_uid294_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid485_pT3_uid294_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid485_pT3_uid294_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid485_pT3_uid294_invPolyEval_reset : std_logic;
    signal sm0_uid485_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid486_pT3_uid294_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid486_pT3_uid294_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid486_pT3_uid294_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm0_uid486_pT3_uid294_invPolyEval_reset : std_logic;
    signal sm0_uid486_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm1_uid487_pT3_uid294_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid487_pT3_uid294_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid487_pT3_uid294_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm1_uid487_pT3_uid294_invPolyEval_reset : std_logic;
    signal sm1_uid487_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid488_pT3_uid294_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid488_pT3_uid294_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid488_pT3_uid294_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid488_pT3_uid294_invPolyEval_reset : std_logic;
    signal sm0_uid488_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid489_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeB_uid490_pT3_uid294_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid490_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal highBBits_uid491_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0_uid493_pT3_uid294_invPolyEval_q : STD_LOGIC_VECTOR (51 downto 0);
    signal leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid502_i_shl_rgb_to_h_rgb_to_h22_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid511_i_unnamed_rgb_to_h30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_add66_rgb_to_hgr_BitSelect_for_a_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hgr_BitSelect_for_b_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hgr_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid533_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2_uid536_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid539_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid548_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2_uid551_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3_uid554_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4_uid557_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Pad5_uid558_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5_uid560_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx6Pad6_uid561_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6_uid563_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7_uid566_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im0_reset : std_logic;
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im3_reset : std_logic;
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im6_reset : std_logic;
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im9_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im9_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im9_reset : std_logic;
    signal prodXInvY_uid208_i_div_rgb_to_hgr_im9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_join_12_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_align_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_align_13_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx1_uid593_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid596_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx3Pad48_uid598_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid599_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx4Pad64_uid601_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx4_uid602_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng2_uid608_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid610_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng4_uid611_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx2_uid613_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng6_uid614_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage1Idx3_uid616_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx4Rng8_uid617_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx4_uid619_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx5Rng10_uid620_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx5_uid622_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx6Rng12_uid623_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx6Pad12_uid624_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx6_uid625_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx7Rng14_uid626_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx7Pad14_uid627_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx7_uid628_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng1_uid631_prodPostRightShift_uid209_i_div_rgb_to_hgr_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage2Idx1_uid633_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im0_reset : std_logic;
    signal prodResY_uid219_i_div_rgb_to_hgr_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im3_reset : std_logic;
    signal prodResY_uid219_i_div_rgb_to_hgr_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_bs5_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im6_reset : std_logic;
    signal prodResY_uid219_i_div_rgb_to_hgr_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im9_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im9_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_im9_reset : std_logic;
    signal prodResY_uid219_i_div_rgb_to_hgr_im9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_join_12_q : STD_LOGIC_VECTOR (63 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_align_13_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_align_13_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal memoryC0_uid262_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid262_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid262_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid262_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid262_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid262_invTabGen_lutmem_r : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid263_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid263_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid263_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid263_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid263_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid263_invTabGen_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid266_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid266_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid266_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid266_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid266_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid266_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid269_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid269_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid269_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid269_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid269_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid269_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid272_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid272_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid272_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid272_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid272_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid272_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_UpperBits_for_a_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid298_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (41 downto 0);
    signal ts3_uid298_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid298_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid298_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid298_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid298_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid298_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid298_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid298_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid298_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid298_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid298_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid298_invPolyEval_BitJoin_for_q_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_b_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_UpperBits_for_b_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_d : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitJoin_for_q_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (24 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_in : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal redist0_leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist19_leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist20_prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist21_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist22_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist23_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist24_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist25_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist26_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist29_ts3_uid298_invPolyEval_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_memoryC3_uid272_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist32_memoryC1_uid266_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist33_memoryC0_uid263_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist34_memoryC0_uid262_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist35_prodResY_uid219_i_div_rgb_to_hgr_im9_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist36_prodResY_uid219_i_div_rgb_to_hgr_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_prodResY_uid219_i_div_rgb_to_hgr_im3_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_prodResY_uid219_i_div_rgb_to_hgr_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist39_prodXInvY_uid208_i_div_rgb_to_hgr_im9_q_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist40_prodXInvY_uid208_i_div_rgb_to_hgr_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_prodXInvY_uid208_i_div_rgb_to_hgr_im3_q_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist42_prodXInvY_uid208_i_div_rgb_to_hgr_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist43_lowRangeB_uid490_pT3_uid294_invPolyEval_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist44_sm0_uid488_pT3_uid294_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist47_sm0_uid485_pT3_uid294_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist48_rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist49_topRangeY_uid422_pT3_uid294_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist50_osig_uid407_pT2_uid287_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist52_lowRangeA_uid403_pT2_uid287_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist53_lev1_a1high_uid397_pT2_uid287_invPolyEval_q_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist54_lowRangeA_uid395_pT2_uid287_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist55_lowRangeA_uid391_pT2_uid287_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_sm1_uid390_pT2_uid287_invPolyEval_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist59_n0_uid375_pT2_uid287_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist60_n1_uid374_pT2_uid287_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist61_s2_uid292_invPolyEval_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist62_s1_uid285_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist64_rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist75_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist76_normYIsOne_uid197_i_div_rgb_to_hgr_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_normYIsOneC2_uid196_i_div_rgb_to_hgr_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_normYNoLeadOne_uid192_i_div_rgb_to_hgr_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist79_i_reduction_rgb_to_h_7_rgb_to_hgr_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_i_or_cond329_rgb_to_hgr_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_i_mux_rgb_to_hgr_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_i_div_rgb_to_hgr_vt_select_23_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist84_i_conv52_rgb_to_hgr_vt_join_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hgr_vt_join_q_37_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_cmp_rgb_to_hgr_q_48_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_i_cmp_i_i_i69_rgb_to_hgr_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_i_acl_18_rgb_to_hgr_vt_select_2_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_sync_in_aunroll_x_in_c1_eni1_1_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist95_sync_in_aunroll_x_in_c1_eni1_2_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist97_sync_in_aunroll_x_in_c1_eni1_3_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist98_sync_in_aunroll_x_in_i_valid_50_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist100_bgTrunc_i_sub_rgb_to_hgr_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_inputreg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_reset0 : std_logic;
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i : signal is true;
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq : std_logic;
    attribute preserve of redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq : signal is true;
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_reset0 : std_logic;
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i : signal is true;
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq : std_logic;
    attribute preserve of redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq : signal is true;
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_reset0 : std_logic;
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i : signal is true;
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq : std_logic;
    attribute preserve of redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq : signal is true;
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_i_conv52_rgb_to_hgr_vt_join_q_36_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_inputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_outputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_reset0 : std_logic;
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_iq : STD_LOGIC_VECTOR (2 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i : signal is true;
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq : std_logic;
    attribute preserve of redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq : signal is true;
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist98_sync_in_aunroll_x_in_i_valid_50(DELAY,894)
    redist98_sync_in_aunroll_x_in_i_valid_50 : dspba_delay
    GENERIC MAP ( width => 1, depth => 50, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist98_sync_in_aunroll_x_in_i_valid_50_q, clk => clock, aclr => resetn );

    -- i_acl_28_rgb_to_hgr_vt_const_55(CONSTANT,66)
    i_acl_28_rgb_to_hgr_vt_const_55_q <= "0000000000000000000000000000000000000";

    -- c_i56_524287(CONSTANT,38)
    c_i56_524287_q <= "00000000000000000000000000000000000001111111111111111111";

    -- leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x(BITSELECT,509)@49
    leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_in <= i_acl_24_rgb_to_hgr_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_b <= leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid511_i_unnamed_rgb_to_h30_shift_x(BITJOIN,510)@49
    leftShiftStage0Idx1_uid511_i_unnamed_rgb_to_h30_shift_x_q <= leftShiftStage0Idx1Rng16_uid510_i_unnamed_rgb_to_h30_shift_x_b & i_shl_rgb_to_hgr_vt_const_15_q;

    -- i_acl_13_rgb_to_hgr_vt_const_31(CONSTANT,40)
    i_acl_13_rgb_to_hgr_vt_const_31_q <= "00000000000000000000000000000";

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_notEnable(LOGICAL,942)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_nor(LOGICAL,943)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_nor_q <= not (redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_notEnable_q or redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_q);

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_last(CONSTANT,939)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_last_q <= "0100110";

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp(LOGICAL,940)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_b <= STD_LOGIC_VECTOR("0" & redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_q);
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_q <= "1" WHEN redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_last_q = redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_b ELSE "0";

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg(REG,941)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg_q <= STD_LOGIC_VECTOR(redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmp_q);
        END IF;
    END PROCESS;

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena(REG,944)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_nor_q = "1") THEN
                redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_q <= STD_LOGIC_VECTOR(redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_enaAnd(LOGICAL,945)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_enaAnd_q <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_sticky_ena_q and VCC_q;

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt(COUNTER,937)
    -- low=0, high=39, step=1, init=0
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i = TO_UNSIGNED(38, 6)) THEN
                redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq <= '1';
            ELSE
                redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq <= '0';
            END IF;
            IF (redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_eq = '1') THEN
                redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i + 25;
            ELSE
                redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_i, 6)));

    -- c_i32_5gr(CONSTANT,37)
    c_i32_5gr_q <= "00000000000000000000000000000101";

    -- c_i32_0gr(CONSTANT,31)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- c_i32_1gr(CONSTANT,33)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- c_i32_2gr(CONSTANT,34)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- c_i32_3gr(CONSTANT,35)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- i_mux_rgb_to_hgr_vt_const_31(CONSTANT,130)
    i_mux_rgb_to_hgr_vt_const_31_q <= "0000000000000000000000000000010";

    -- c_i32_4gr(CONSTANT,36)
    c_i32_4gr_q <= "00000000000000000000000000000100";

    -- redist94_sync_in_aunroll_x_in_c1_eni1_2_1(DELAY,890)
    redist94_sync_in_aunroll_x_in_c1_eni1_2_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_2, xout => redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q, clk => clock, aclr => resetn );

    -- redist95_sync_in_aunroll_x_in_c1_eni1_2_2(DELAY,891)
    redist95_sync_in_aunroll_x_in_c1_eni1_2_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q, xout => redist95_sync_in_aunroll_x_in_c1_eni1_2_2_q, clk => clock, aclr => resetn );

    -- redist92_sync_in_aunroll_x_in_c1_eni1_1_1(DELAY,888)
    redist92_sync_in_aunroll_x_in_c1_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_1, xout => redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_rgb_to_hgr(COMPARE,93)@1 + 1
    i_cmp_i_i_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_rgb_to_hgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i_rgb_to_hgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_rgb_to_hgr_c(0) <= i_cmp_i_i_rgb_to_hgr_o(9);

    -- i_green_coerce240241272_red_coerce288289320_rgb_to_hgr(MUX,122)@2
    i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_s <= i_cmp_i_i_rgb_to_hgr_c;
    i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_combproc: PROCESS (i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_s, redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_s) IS
            WHEN "0" => i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_q <= redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_q <= redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist96_sync_in_aunroll_x_in_c1_eni1_3_1(DELAY,892)
    redist96_sync_in_aunroll_x_in_c1_eni1_3_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_3, xout => redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i148_rgb_to_hgr(COMPARE,85)@1 + 1
    i_cmp_i_i148_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i148_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i148_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i148_rgb_to_hgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i148_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i148_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i148_rgb_to_hgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i148_rgb_to_hgr_c(0) <= i_cmp_i_i148_rgb_to_hgr_o(9);

    -- i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr(MUX,81)@2
    i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_s <= i_cmp_i_i148_rgb_to_hgr_c;
    i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_combproc: PROCESS (i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_s, redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_s) IS
            WHEN "0" => i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q <= redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i141_rgb_to_hgr(COMPARE,84)@1 + 1
    i_cmp_i_i141_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i141_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i141_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i141_rgb_to_hgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i141_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i141_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i141_rgb_to_hgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i141_rgb_to_hgr_c(0) <= i_cmp_i_i141_rgb_to_hgr_o(9);

    -- i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr(MUX,80)@2
    i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_s <= i_cmp_i_i141_rgb_to_hgr_c;
    i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_combproc: PROCESS (i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_s, redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_s) IS
            WHEN "0" => i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q <= redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i128_rgb_to_hgr(COMPARE,83)@1 + 1
    i_cmp_i_i128_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i128_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i128_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i128_rgb_to_hgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i128_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i128_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i128_rgb_to_hgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i128_rgb_to_hgr_c(0) <= i_cmp_i_i128_rgb_to_hgr_o(9);

    -- i_or_cond327_rgb_to_hgr(LOGICAL,136)@2
    i_or_cond327_rgb_to_hgr_q <= i_cmp_i_i128_rgb_to_hgr_c and i_cmp_i_i141_rgb_to_hgr_c;

    -- i_acl_6_rgb_to_hgr(MUX,71)@2
    i_acl_6_rgb_to_hgr_s <= i_or_cond327_rgb_to_hgr_q;
    i_acl_6_rgb_to_hgr_combproc: PROCESS (i_acl_6_rgb_to_hgr_s, i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q, i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q)
    BEGIN
        CASE (i_acl_6_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_6_rgb_to_hgr_q <= i_blue_coerce192193224_green_coerce240241272_rgb_to_hgr_q;
            WHEN "1" => i_acl_6_rgb_to_hgr_q <= i_blue_coerce192193224_red_coerce288289320_rgb_to_hgr_q;
            WHEN OTHERS => i_acl_6_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i98_rgb_to_hgr(COMPARE,86)@1
    i_cmp_i_i98_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i98_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i98_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i98_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i98_rgb_to_hgr_b));
    i_cmp_i_i98_rgb_to_hgr_c(0) <= i_cmp_i_i98_rgb_to_hgr_o(9);

    -- i_cmp_i_i103_rgb_to_hgr(COMPARE,82)@1
    i_cmp_i_i103_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i103_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i103_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i103_rgb_to_hgr_a) - UNSIGNED(i_cmp_i_i103_rgb_to_hgr_b));
    i_cmp_i_i103_rgb_to_hgr_c(0) <= i_cmp_i_i103_rgb_to_hgr_o(9);

    -- i_or_cond328_not_demorgan_rgb_to_hgr(LOGICAL,137)@1 + 1
    i_or_cond328_not_demorgan_rgb_to_hgr_qi <= i_cmp_i_i103_rgb_to_hgr_c and i_cmp_i_i98_rgb_to_hgr_c;
    i_or_cond328_not_demorgan_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond328_not_demorgan_rgb_to_hgr_qi, xout => i_or_cond328_not_demorgan_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_acl_9_rgb_to_hgr(MUX,74)@2 + 1
    i_acl_9_rgb_to_hgr_s <= i_or_cond328_not_demorgan_rgb_to_hgr_q;
    i_acl_9_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_9_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_9_rgb_to_hgr_s) IS
                WHEN "0" => i_acl_9_rgb_to_hgr_q <= i_acl_6_rgb_to_hgr_q;
                WHEN "1" => i_acl_9_rgb_to_hgr_q <= i_green_coerce240241272_red_coerce288289320_rgb_to_hgr_q;
                WHEN OTHERS => i_acl_9_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i29_rgb_to_hgr(LOGICAL,87)@3
    i_cmp_i_i_i29_rgb_to_hgr_q <= "1" WHEN i_acl_9_rgb_to_hgr_q = redist95_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- redist97_sync_in_aunroll_x_in_c1_eni1_3_2(DELAY,893)
    redist97_sync_in_aunroll_x_in_c1_eni1_3_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q, xout => redist97_sync_in_aunroll_x_in_c1_eni1_3_2_q, clk => clock, aclr => resetn );

    -- i_acl_5_rgb_to_hgr(MUX,70)@2
    i_acl_5_rgb_to_hgr_s <= i_or_cond327_rgb_to_hgr_q;
    i_acl_5_rgb_to_hgr_combproc: PROCESS (i_acl_5_rgb_to_hgr_s, redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_acl_5_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_5_rgb_to_hgr_q <= redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_acl_5_rgb_to_hgr_q <= redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_acl_5_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_8_rgb_to_hgr(MUX,73)@2 + 1
    i_acl_8_rgb_to_hgr_s <= i_or_cond328_not_demorgan_rgb_to_hgr_q;
    i_acl_8_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_8_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_8_rgb_to_hgr_s) IS
                WHEN "0" => i_acl_8_rgb_to_hgr_q <= i_acl_5_rgb_to_hgr_q;
                WHEN "1" => i_acl_8_rgb_to_hgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q;
                WHEN OTHERS => i_acl_8_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i44_rgb_to_hgr(LOGICAL,88)@3
    i_cmp_i_i_i44_rgb_to_hgr_q <= "1" WHEN i_acl_8_rgb_to_hgr_q = redist97_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- i_or_cond333_rgb_to_hgr(LOGICAL,142)@3 + 1
    i_or_cond333_rgb_to_hgr_qi <= i_cmp_i_i_i44_rgb_to_hgr_q and i_cmp_i_i_i29_rgb_to_hgr_q;
    i_or_cond333_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond333_rgb_to_hgr_qi, xout => i_or_cond333_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hgr(MUX,129)@4
    i_mux_rgb_to_hgr_s <= i_or_cond333_rgb_to_hgr_q;
    i_mux_rgb_to_hgr_combproc: PROCESS (i_mux_rgb_to_hgr_s, c_i32_5gr_q, c_i32_4gr_q)
    BEGIN
        CASE (i_mux_rgb_to_hgr_s) IS
            WHEN "0" => i_mux_rgb_to_hgr_q <= c_i32_5gr_q;
            WHEN "1" => i_mux_rgb_to_hgr_q <= c_i32_4gr_q;
            WHEN OTHERS => i_mux_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mux_rgb_to_hgr_vt_select_0(BITSELECT,132)@4
    i_mux_rgb_to_hgr_vt_select_0_b <= i_mux_rgb_to_hgr_q(0 downto 0);

    -- redist81_i_mux_rgb_to_hgr_vt_select_0_b_1(DELAY,877)
    redist81_i_mux_rgb_to_hgr_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mux_rgb_to_hgr_vt_select_0_b, xout => redist81_i_mux_rgb_to_hgr_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hgr_vt_join(BITJOIN,131)@5
    i_mux_rgb_to_hgr_vt_join_q <= i_mux_rgb_to_hgr_vt_const_31_q & redist81_i_mux_rgb_to_hgr_vt_select_0_b_1_q;

    -- i_cmp_i_i_i69_rgb_to_hgr(LOGICAL,91)@3
    i_cmp_i_i_i69_rgb_to_hgr_q <= "1" WHEN i_acl_9_rgb_to_hgr_q = redist97_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- redist89_i_cmp_i_i_i69_rgb_to_hgr_q_1(DELAY,885)
    redist89_i_cmp_i_i_i69_rgb_to_hgr_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i69_rgb_to_hgr_q, xout => redist89_i_cmp_i_i_i69_rgb_to_hgr_q_1_q, clk => clock, aclr => resetn );

    -- redist93_sync_in_aunroll_x_in_c1_eni1_1_2(DELAY,889)
    redist93_sync_in_aunroll_x_in_c1_eni1_1_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q, xout => redist93_sync_in_aunroll_x_in_c1_eni1_1_2_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_i74_rgb_to_hgr(LOGICAL,92)@3 + 1
    i_cmp_i_i_i74_rgb_to_hgr_qi <= "1" WHEN i_acl_8_rgb_to_hgr_q = redist93_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";
    i_cmp_i_i_i74_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i74_rgb_to_hgr_qi, xout => i_cmp_i_i_i74_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_or_cond329_rgb_to_hgr(LOGICAL,138)@4
    i_or_cond329_rgb_to_hgr_q <= i_cmp_i_i_i74_rgb_to_hgr_q and redist89_i_cmp_i_i_i69_rgb_to_hgr_q_1_q;

    -- i_not_or_cond329_rgb_to_hgr(LOGICAL,133)@4
    i_not_or_cond329_rgb_to_hgr_q <= i_or_cond329_rgb_to_hgr_q xor VCC_q;

    -- i_cmp_i_i_i49_rgb_to_hgr(LOGICAL,89)@3
    i_cmp_i_i_i49_rgb_to_hgr_q <= "1" WHEN i_acl_9_rgb_to_hgr_q = redist93_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";

    -- i_or_cond332_rgb_to_hgr(LOGICAL,141)@3 + 1
    i_or_cond332_rgb_to_hgr_qi <= i_cmp_i_i_i44_rgb_to_hgr_q and i_cmp_i_i_i49_rgb_to_hgr_q;
    i_or_cond332_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond332_rgb_to_hgr_qi, xout => i_or_cond332_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_reduction_rgb_to_h_1_rgb_to_hgr(LOGICAL,146)@4
    i_reduction_rgb_to_h_1_rgb_to_hgr_q <= i_or_cond332_rgb_to_hgr_q and i_not_or_cond329_rgb_to_hgr_q;

    -- i_cmp_i_i_i64_rgb_to_hgr(LOGICAL,90)@3
    i_cmp_i_i_i64_rgb_to_hgr_q <= "1" WHEN i_acl_8_rgb_to_hgr_q = redist95_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- i_or_cond330_rgb_to_hgr(LOGICAL,139)@3 + 1
    i_or_cond330_rgb_to_hgr_qi <= i_cmp_i_i_i64_rgb_to_hgr_q and i_cmp_i_i_i69_rgb_to_hgr_q;
    i_or_cond330_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond330_rgb_to_hgr_qi, xout => i_or_cond330_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_not_or_cond330_rgb_to_hgr(LOGICAL,134)@4
    i_not_or_cond330_rgb_to_hgr_q <= i_or_cond330_rgb_to_hgr_q xor VCC_q;

    -- i_or_cond331_rgb_to_hgr(LOGICAL,140)@3 + 1
    i_or_cond331_rgb_to_hgr_qi <= i_cmp_i_i_i64_rgb_to_hgr_q and i_cmp_i_i_i49_rgb_to_hgr_q;
    i_or_cond331_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond331_rgb_to_hgr_qi, xout => i_or_cond331_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_not_or_cond331_rgb_to_hgr(LOGICAL,135)@4
    i_not_or_cond331_rgb_to_hgr_q <= i_or_cond331_rgb_to_hgr_q xor VCC_q;

    -- i_reduction_rgb_to_h_0_rgb_to_hgr(LOGICAL,145)@4
    i_reduction_rgb_to_h_0_rgb_to_hgr_q <= i_not_or_cond331_rgb_to_hgr_q and i_not_or_cond330_rgb_to_hgr_q;

    -- i_reduction_rgb_to_h_2_rgb_to_hgr(LOGICAL,147)@4 + 1
    i_reduction_rgb_to_h_2_rgb_to_hgr_qi <= i_reduction_rgb_to_h_0_rgb_to_hgr_q and i_reduction_rgb_to_h_1_rgb_to_hgr_q;
    i_reduction_rgb_to_h_2_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_h_2_rgb_to_hgr_qi, xout => i_reduction_rgb_to_h_2_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_acl_13_rgb_to_hgr(MUX,39)@5
    i_acl_13_rgb_to_hgr_s <= i_reduction_rgb_to_h_2_rgb_to_hgr_q;
    i_acl_13_rgb_to_hgr_combproc: PROCESS (i_acl_13_rgb_to_hgr_s, i_mux_rgb_to_hgr_vt_join_q, c_i32_3gr_q)
    BEGIN
        CASE (i_acl_13_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_13_rgb_to_hgr_q <= i_mux_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_13_rgb_to_hgr_q <= c_i32_3gr_q;
            WHEN OTHERS => i_acl_13_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_13_rgb_to_hgr_vt_select_2(BITSELECT,42)@5
    i_acl_13_rgb_to_hgr_vt_select_2_b <= i_acl_13_rgb_to_hgr_q(2 downto 0);

    -- i_acl_13_rgb_to_hgr_vt_join(BITJOIN,41)@5
    i_acl_13_rgb_to_hgr_vt_join_q <= i_acl_13_rgb_to_hgr_vt_const_31_q & i_acl_13_rgb_to_hgr_vt_select_2_b;

    -- i_acl_14_rgb_to_hgr(LOGICAL,43)@4
    i_acl_14_rgb_to_hgr_q <= i_or_cond331_rgb_to_hgr_q and i_not_or_cond330_rgb_to_hgr_q;

    -- i_acl_15_rgb_to_hgr(LOGICAL,44)@4 + 1
    i_acl_15_rgb_to_hgr_qi <= i_acl_14_rgb_to_hgr_q and i_not_or_cond329_rgb_to_hgr_q;
    i_acl_15_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_15_rgb_to_hgr_qi, xout => i_acl_15_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_acl_16_rgb_to_hgr(MUX,45)@5
    i_acl_16_rgb_to_hgr_s <= i_acl_15_rgb_to_hgr_q;
    i_acl_16_rgb_to_hgr_combproc: PROCESS (i_acl_16_rgb_to_hgr_s, i_acl_13_rgb_to_hgr_vt_join_q, c_i32_2gr_q)
    BEGIN
        CASE (i_acl_16_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_16_rgb_to_hgr_q <= i_acl_13_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_16_rgb_to_hgr_q <= c_i32_2gr_q;
            WHEN OTHERS => i_acl_16_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_16_rgb_to_hgr_vt_select_2(BITSELECT,48)@5
    i_acl_16_rgb_to_hgr_vt_select_2_b <= i_acl_16_rgb_to_hgr_q(2 downto 0);

    -- i_acl_16_rgb_to_hgr_vt_join(BITJOIN,47)@5
    i_acl_16_rgb_to_hgr_vt_join_q <= i_acl_13_rgb_to_hgr_vt_const_31_q & i_acl_16_rgb_to_hgr_vt_select_2_b;

    -- i_acl_17_rgb_to_hgr(LOGICAL,49)@4 + 1
    i_acl_17_rgb_to_hgr_qi <= i_or_cond330_rgb_to_hgr_q and i_not_or_cond329_rgb_to_hgr_q;
    i_acl_17_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_17_rgb_to_hgr_qi, xout => i_acl_17_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hgr(MUX,50)@5
    i_acl_18_rgb_to_hgr_s <= i_acl_17_rgb_to_hgr_q;
    i_acl_18_rgb_to_hgr_combproc: PROCESS (i_acl_18_rgb_to_hgr_s, i_acl_16_rgb_to_hgr_vt_join_q, c_i32_1gr_q)
    BEGIN
        CASE (i_acl_18_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_18_rgb_to_hgr_q <= i_acl_16_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_18_rgb_to_hgr_q <= c_i32_1gr_q;
            WHEN OTHERS => i_acl_18_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_18_rgb_to_hgr_vt_select_2(BITSELECT,53)@5
    i_acl_18_rgb_to_hgr_vt_select_2_b <= i_acl_18_rgb_to_hgr_q(2 downto 0);

    -- redist91_i_acl_18_rgb_to_hgr_vt_select_2_b_1(DELAY,887)
    redist91_i_acl_18_rgb_to_hgr_vt_select_2_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_18_rgb_to_hgr_vt_select_2_b, xout => redist91_i_acl_18_rgb_to_hgr_vt_select_2_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hgr_vt_join(BITJOIN,52)@6
    i_acl_18_rgb_to_hgr_vt_join_q <= i_acl_13_rgb_to_hgr_vt_const_31_q & redist91_i_acl_18_rgb_to_hgr_vt_select_2_b_1_q;

    -- redist80_i_or_cond329_rgb_to_hgr_q_2(DELAY,876)
    redist80_i_or_cond329_rgb_to_hgr_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond329_rgb_to_hgr_q, xout => redist80_i_or_cond329_rgb_to_hgr_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_19_rgb_to_hgr(MUX,54)@6
    i_acl_19_rgb_to_hgr_s <= redist80_i_or_cond329_rgb_to_hgr_q_2_q;
    i_acl_19_rgb_to_hgr_combproc: PROCESS (i_acl_19_rgb_to_hgr_s, i_acl_18_rgb_to_hgr_vt_join_q, c_i32_0gr_q)
    BEGIN
        CASE (i_acl_19_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_19_rgb_to_hgr_q <= i_acl_18_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_19_rgb_to_hgr_q <= c_i32_0gr_q;
            WHEN OTHERS => i_acl_19_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_19_rgb_to_hgr_vt_select_2(BITSELECT,57)@6
    i_acl_19_rgb_to_hgr_vt_select_2_b <= i_acl_19_rgb_to_hgr_q(2 downto 0);

    -- i_acl_19_rgb_to_hgr_vt_join(BITJOIN,56)@6
    i_acl_19_rgb_to_hgr_vt_join_q <= i_acl_13_rgb_to_hgr_vt_const_31_q & i_acl_19_rgb_to_hgr_vt_select_2_b;

    -- i_reduction_rgb_to_h_6_rgb_to_hgr(LOGICAL,151)@4
    i_reduction_rgb_to_h_6_rgb_to_hgr_q <= i_or_cond329_rgb_to_hgr_q xor i_cmp_i_i_i74_rgb_to_hgr_q;

    -- i_reduction_rgb_to_h_3_demorgan_rgb_to_hgr(LOGICAL,148)@4
    i_reduction_rgb_to_h_3_demorgan_rgb_to_hgr_q <= i_or_cond333_rgb_to_hgr_q or i_or_cond332_rgb_to_hgr_q;

    -- i_reduction_rgb_to_h_3_rgb_to_hgr(LOGICAL,149)@4
    i_reduction_rgb_to_h_3_rgb_to_hgr_q <= i_reduction_rgb_to_h_3_demorgan_rgb_to_hgr_q xor VCC_q;

    -- i_reduction_rgb_to_h_5_rgb_to_hgr(LOGICAL,150)@4
    i_reduction_rgb_to_h_5_rgb_to_hgr_q <= i_reduction_rgb_to_h_0_rgb_to_hgr_q and i_reduction_rgb_to_h_3_rgb_to_hgr_q;

    -- i_reduction_rgb_to_h_7_rgb_to_hgr(LOGICAL,152)@4 + 1
    i_reduction_rgb_to_h_7_rgb_to_hgr_qi <= i_reduction_rgb_to_h_5_rgb_to_hgr_q and i_reduction_rgb_to_h_6_rgb_to_hgr_q;
    i_reduction_rgb_to_h_7_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_h_7_rgb_to_hgr_qi, xout => i_reduction_rgb_to_h_7_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist79_i_reduction_rgb_to_h_7_rgb_to_hgr_q_2(DELAY,875)
    redist79_i_reduction_rgb_to_h_7_rgb_to_hgr_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_h_7_rgb_to_hgr_q, xout => redist79_i_reduction_rgb_to_h_7_rgb_to_hgr_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hgr(MUX,58)@6
    i_acl_24_rgb_to_hgr_s <= redist79_i_reduction_rgb_to_h_7_rgb_to_hgr_q_2_q;
    i_acl_24_rgb_to_hgr_combproc: PROCESS (i_acl_24_rgb_to_hgr_s, i_acl_19_rgb_to_hgr_vt_join_q, c_i32_5gr_q)
    BEGIN
        CASE (i_acl_24_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_24_rgb_to_hgr_q <= i_acl_19_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_24_rgb_to_hgr_q <= c_i32_5gr_q;
            WHEN OTHERS => i_acl_24_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_24_rgb_to_hgr_vt_select_2(BITSELECT,61)@6
    i_acl_24_rgb_to_hgr_vt_select_2_b <= i_acl_24_rgb_to_hgr_q(2 downto 0);

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_inputreg(DELAY,934)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_24_rgb_to_hgr_vt_select_2_b, xout => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_inputreg_q, clk => clock, aclr => resetn );

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr(REG,938)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr_q <= "100111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr_q <= STD_LOGIC_VECTOR(redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem(DUALMEM,936)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ia <= STD_LOGIC_VECTOR(redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_inputreg_q);
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_aa <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_wraddr_q;
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ab <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_rdcnt_q;
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_reset0 <= not (resetn);
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 6,
        numwords_a => 40,
        width_b => 3,
        widthad_b => 6,
        numwords_b => 40,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_reset0,
        clock1 => clock,
        address_a => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_aa,
        data_a => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_ab,
        q_b => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_iq
    );
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_q <= redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_iq(2 downto 0);

    -- redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_outputreg(DELAY,935)
    redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_outputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_mem_q, xout => redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_outputreg_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hgr_vt_join(BITJOIN,60)@49
    i_acl_24_rgb_to_hgr_vt_join_q <= i_acl_13_rgb_to_hgr_vt_const_31_q & redist90_i_acl_24_rgb_to_hgr_vt_select_2_b_43_outputreg_q;

    -- leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x(MUX,512)@49
    leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_s <= VCC_q;
    leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_combproc: PROCESS (leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_s, i_acl_24_rgb_to_hgr_vt_join_q, leftShiftStage0Idx1_uid511_i_unnamed_rgb_to_h30_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_q <= i_acl_24_rgb_to_hgr_vt_join_q;
            WHEN "1" => leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_q <= leftShiftStage0Idx1_uid511_i_unnamed_rgb_to_h30_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_rgb_to_h29_vt_select_18(BITSELECT,166)@49
    i_unnamed_rgb_to_h29_vt_select_18_b <= leftShiftStage0_uid513_i_unnamed_rgb_to_h30_shift_x_q(18 downto 16);

    -- i_shl_rgb_to_hgr_vt_const_15(CONSTANT,153)
    i_shl_rgb_to_hgr_vt_const_15_q <= "0000000000000000";

    -- i_unnamed_rgb_to_h29_vt_join(BITJOIN,165)@49
    i_unnamed_rgb_to_h29_vt_join_q <= i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q & i_unnamed_rgb_to_h29_vt_select_18_b & i_shl_rgb_to_hgr_vt_const_15_q;

    -- i_mul_add66_rgb_to_hgr_BitSelect_for_b(BITSELECT,526)@49
    i_mul_add66_rgb_to_hgr_BitSelect_for_b_b <= i_unnamed_rgb_to_h29_vt_join_q(18 downto 16);

    -- i_mul_add66_rgb_to_hgr_BitSelect_for_a(BITSELECT,525)@49
    i_mul_add66_rgb_to_hgr_BitSelect_for_a_b <= i_acl_24_rgb_to_hgr_vt_join_q(2 downto 0);

    -- i_mul_add66_rgb_to_hgr_join(BITJOIN,527)@49
    i_mul_add66_rgb_to_hgr_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_mul_add66_rgb_to_hgr_BitSelect_for_b_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_mul_add66_rgb_to_hgr_BitSelect_for_a_b;

    -- i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select(BITSELECT,794)@49
    i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_in <= i_mul_add66_rgb_to_hgr_join_q(18 downto 0);
    i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_b <= i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_in(18 downto 16);
    i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_c <= i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_in(2 downto 0);

    -- i_mul_add66_rgb_to_hgr_vt_join(BITJOIN,126)@49
    i_mul_add66_rgb_to_hgr_vt_join_q <= i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q & i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_b & i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q & i_mul_add66_rgb_to_hgr_vt_select_18_merged_bit_select_c;

    -- i_conv_i_i_i325_rgb_to_hgr_sel_x(BITSELECT,12)@49
    i_conv_i_i_i325_rgb_to_hgr_sel_x_b <= i_mul_add66_rgb_to_hgr_vt_join_q(18 downto 0);

    -- i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select(BITSELECT,782)@49
    i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b <= i_conv_i_i_i325_rgb_to_hgr_sel_x_b(18 downto 16);
    i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c <= i_conv_i_i_i325_rgb_to_hgr_sel_x_b(2 downto 0);

    -- redist13_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b_2(DELAY,809)
    redist13_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b, xout => redist13_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b_2_q, clk => clock, aclr => resetn );

    -- i_conv_i_i_i325_rgb_to_hgr_vt_const_15(CONSTANT,113)
    i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q <= "0000000000000";

    -- redist14_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c_2(DELAY,810)
    redist14_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c, xout => redist14_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c_2_q, clk => clock, aclr => resetn );

    -- i_conv_i_i_i325_rgb_to_hgr_vt_join(BITJOIN,114)@51
    i_conv_i_i_i325_rgb_to_hgr_vt_join_q <= redist13_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_b_2_q & i_conv_i_i_i325_rgb_to_hgr_vt_const_15_q & redist14_i_conv_i_i_i325_rgb_to_hgr_vt_select_18_merged_bit_select_c_2_q;

    -- i_conv4_i_i_i_rgb_to_hgr_vt_const_18(CONSTANT,96)
    i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q <= "00";

    -- c_i17_65535(CONSTANT,28)
    c_i17_65535_q <= "10000000000000001";

    -- i_sub_i_i_i_rgb_to_hgr(SUB,158)@50
    i_sub_i_i_i_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & c_i17_65535_q);
    i_sub_i_i_i_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1_q);
    i_sub_i_i_i_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_i_i_i_rgb_to_hgr_a) - UNSIGNED(i_sub_i_i_i_rgb_to_hgr_b));
    i_sub_i_i_i_rgb_to_hgr_q <= i_sub_i_i_i_rgb_to_hgr_o(17 downto 0);

    -- bgTrunc_i_sub_i_i_i_rgb_to_hgr_sel_x(BITSELECT,5)@50
    bgTrunc_i_sub_i_i_i_rgb_to_hgr_sel_x_b <= STD_LOGIC_VECTOR(i_sub_i_i_i_rgb_to_hgr_q(16 downto 0));

    -- i_add_rgb_to_hgr_vt_const_31(CONSTANT,77)
    i_add_rgb_to_hgr_vt_const_31_q <= "0000000";

    -- i_div_rgb_to_hgr_vt_const_31(CONSTANT,118)
    i_div_rgb_to_hgr_vt_const_31_q <= "00000000";

    -- cstValOvf_uid217_i_div_rgb_to_hgr(CONSTANT,216)
    cstValOvf_uid217_i_div_rgb_to_hgr_q <= "11111111111111111111111111111111";

    -- rightShiftStage2Idx1Rng1_uid631_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,630)@38
    rightShiftStage2Idx1Rng1_uid631_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 1);

    -- rightShiftStage2Idx1_uid633_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,632)@38
    rightShiftStage2Idx1_uid633_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= GND_q & rightShiftStage2Idx1Rng1_uid631_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage1Idx7Pad14_uid627_prodPostRightShift_uid209_i_div_rgb_to_hgr(CONSTANT,626)
    rightShiftStage1Idx7Pad14_uid627_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= "00000000000000";

    -- rightShiftStage1Idx7Rng14_uid626_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,625)@38
    rightShiftStage1Idx7Rng14_uid626_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 14);

    -- rightShiftStage1Idx7_uid628_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,627)@38
    rightShiftStage1Idx7_uid628_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx7Pad14_uid627_prodPostRightShift_uid209_i_div_rgb_to_hgr_q & rightShiftStage1Idx7Rng14_uid626_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage1Idx6Pad12_uid624_prodPostRightShift_uid209_i_div_rgb_to_hgr(CONSTANT,623)
    rightShiftStage1Idx6Pad12_uid624_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= "000000000000";

    -- rightShiftStage1Idx6Rng12_uid623_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,622)@38
    rightShiftStage1Idx6Rng12_uid623_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 12);

    -- rightShiftStage1Idx6_uid625_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,624)@38
    rightShiftStage1Idx6_uid625_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx6Pad12_uid624_prodPostRightShift_uid209_i_div_rgb_to_hgr_q & rightShiftStage1Idx6Rng12_uid623_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightBottomX_bottomExtension_uid448_pT3_uid294_invPolyEval(CONSTANT,447)
    rightBottomX_bottomExtension_uid448_pT3_uid294_invPolyEval_q <= "0000000000";

    -- rightShiftStage1Idx5Rng10_uid620_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,619)@38
    rightShiftStage1Idx5Rng10_uid620_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 10);

    -- rightShiftStage1Idx5_uid622_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,621)@38
    rightShiftStage1Idx5_uid622_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightBottomX_bottomExtension_uid448_pT3_uid294_invPolyEval_q & rightShiftStage1Idx5Rng10_uid620_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage1Idx4Rng8_uid617_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,616)@38
    rightShiftStage1Idx4Rng8_uid617_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 8);

    -- rightShiftStage1Idx4_uid619_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,618)@38
    rightShiftStage1Idx4_uid619_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= i_div_rgb_to_hgr_vt_const_31_q & rightShiftStage1Idx4Rng8_uid617_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- leftShiftStage1Idx6Pad6_uid561_normY_uid191_i_div_rgb_to_hgr(CONSTANT,560)
    leftShiftStage1Idx6Pad6_uid561_normY_uid191_i_div_rgb_to_hgr_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid614_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,613)@38
    rightShiftStage1Idx3Rng6_uid614_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 6);

    -- rightShiftStage1Idx3_uid616_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,615)@38
    rightShiftStage1Idx3_uid616_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= leftShiftStage1Idx6Pad6_uid561_normY_uid191_i_div_rgb_to_hgr_q & rightShiftStage1Idx3Rng6_uid614_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- zs_uid245_zCount_uid190_i_div_rgb_to_hgr(CONSTANT,244)
    zs_uid245_zCount_uid190_i_div_rgb_to_hgr_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid611_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,610)@38
    rightShiftStage1Idx2Rng4_uid611_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 4);

    -- rightShiftStage1Idx2_uid613_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,612)@38
    rightShiftStage1Idx2_uid613_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= zs_uid245_zCount_uid190_i_div_rgb_to_hgr_q & rightShiftStage1Idx2Rng4_uid611_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage1Idx1Rng2_uid608_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,607)@38
    rightShiftStage1Idx1Rng2_uid608_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(64 downto 2);

    -- rightShiftStage1Idx1_uid610_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,609)@38
    rightShiftStage1Idx1_uid610_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q & rightShiftStage1Idx1Rng2_uid608_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr(CONSTANT,602)
    rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= "00000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Pad64_uid601_prodPostRightShift_uid209_i_div_rgb_to_hgr(CONSTANT,600)
    rightShiftStage0Idx4Pad64_uid601_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,599)@37
    rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_in <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_in(64 downto 64);

    -- rightShiftStage0Idx4_uid602_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,601)@37
    rightShiftStage0Idx4_uid602_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx4Pad64_uid601_prodPostRightShift_uid209_i_div_rgb_to_hgr_q & rightShiftStage0Idx4Rng64_uid600_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage0Idx3Pad48_uid598_prodPostRightShift_uid209_i_div_rgb_to_hgr(CONSTANT,597)
    rightShiftStage0Idx3Pad48_uid598_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,596)@37
    rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_in <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_in(64 downto 48);

    -- rightShiftStage0Idx3_uid599_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,598)@37
    rightShiftStage0Idx3_uid599_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx3Pad48_uid598_prodPostRightShift_uid209_i_div_rgb_to_hgr_q & rightShiftStage0Idx3Rng48_uid597_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,593)@37
    rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_in <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_in(64 downto 32);

    -- rightShiftStage0Idx2_uid596_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,595)@37
    rightShiftStage0Idx2_uid596_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= c_i32_0gr_q & rightShiftStage0Idx2Rng32_uid594_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITSELECT,590)@37
    rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_in <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_b <= rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_in(64 downto 16);

    -- rightShiftStage0Idx1_uid593_prodPostRightShift_uid209_i_div_rgb_to_hgr(BITJOIN,592)@37
    rightShiftStage0Idx1_uid593_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= i_shl_rgb_to_hgr_vt_const_15_q & rightShiftStage0Idx1Rng16_uid591_prodPostRightShift_uid209_i_div_rgb_to_hgr_b;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_UpperBits_for_b(CONSTANT,704)
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_UpperBits_for_b_q <= "00000000000000000";

    -- i_conv52_rgb_to_hgr_vt_const_31(CONSTANT,100)
    i_conv52_rgb_to_hgr_vt_const_31_q <= "000000000000000000000000";

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0(BITSELECT,770)
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b <= i_conv52_rgb_to_hgr_vt_const_31_q(7 downto 0);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel3_0(BITSELECT,774)
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel3_0_b <= i_conv52_rgb_to_hgr_vt_const_31_q(23 downto 16);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3(MUX,733)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_s <= VCC_q;
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_combproc: PROCESS (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_s, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel3_0_b, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b)
    BEGIN
        CASE (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_s) IS
            WHEN "0" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel3_0_b;
            WHEN "1" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN OTHERS => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_notEnable(LOGICAL,918)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_nor(LOGICAL,919)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_nor_q <= not (redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_notEnable_q or redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_q);

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_last(CONSTANT,915)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_last_q <= "011000";

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp(LOGICAL,916)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_b <= STD_LOGIC_VECTOR("0" & redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_q);
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_q <= "1" WHEN redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_last_q = redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_b ELSE "0";

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg(REG,917)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg_q <= STD_LOGIC_VECTOR(redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmp_q);
        END IF;
    END PROCESS;

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena(REG,920)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_nor_q = "1") THEN
                redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_q <= STD_LOGIC_VECTOR(redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_enaAnd(LOGICAL,921)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_enaAnd_q <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_sticky_ena_q and VCC_q;

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt(COUNTER,913)
    -- low=0, high=25, step=1, init=0
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq <= '1';
            ELSE
                redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq <= '0';
            END IF;
            IF (redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_eq = '1') THEN
                redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i + 7;
            ELSE
                redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_i, 5)));

    -- i_red_coerce288289320_green_coerce240241272_rgb_to_hgr(MUX,144)@2
    i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_s <= i_cmp_i_i_rgb_to_hgr_c;
    i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_combproc: PROCESS (i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_s, redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_s) IS
            WHEN "0" => i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_q <= redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_q <= redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr(MUX,143)@2
    i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_s <= i_cmp_i_i148_rgb_to_hgr_c;
    i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_combproc: PROCESS (i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_s, redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_s) IS
            WHEN "0" => i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q <= redist92_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr(MUX,121)@2
    i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_s <= i_cmp_i_i141_rgb_to_hgr_c;
    i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_combproc: PROCESS (i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_s, redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_s) IS
            WHEN "0" => i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q <= redist94_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_4_rgb_to_hgr(MUX,69)@2
    i_acl_4_rgb_to_hgr_s <= i_or_cond327_rgb_to_hgr_q;
    i_acl_4_rgb_to_hgr_combproc: PROCESS (i_acl_4_rgb_to_hgr_s, i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q, i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q)
    BEGIN
        CASE (i_acl_4_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_4_rgb_to_hgr_q <= i_green_coerce240241272_blue_coerce192193224_rgb_to_hgr_q;
            WHEN "1" => i_acl_4_rgb_to_hgr_q <= i_red_coerce288289320_blue_coerce192193224_rgb_to_hgr_q;
            WHEN OTHERS => i_acl_4_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_7_rgb_to_hgr(MUX,72)@2 + 1
    i_acl_7_rgb_to_hgr_s <= i_or_cond328_not_demorgan_rgb_to_hgr_q;
    i_acl_7_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_7_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_7_rgb_to_hgr_s) IS
                WHEN "0" => i_acl_7_rgb_to_hgr_q <= i_acl_4_rgb_to_hgr_q;
                WHEN "1" => i_acl_7_rgb_to_hgr_q <= i_red_coerce288289320_green_coerce240241272_rgb_to_hgr_q;
                WHEN OTHERS => i_acl_7_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_sub90_rgb_to_hgr(SUB,157)@3
    i_sub90_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & i_acl_7_rgb_to_hgr_q);
    i_sub90_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hgr_q);
    i_sub90_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub90_rgb_to_hgr_a) - UNSIGNED(i_sub90_rgb_to_hgr_b));
    i_sub90_rgb_to_hgr_q <= i_sub90_rgb_to_hgr_o(8 downto 0);

    -- bgTrunc_i_sub90_rgb_to_hgr_sel_x(BITSELECT,4)@3
    bgTrunc_i_sub90_rgb_to_hgr_sel_x_b <= STD_LOGIC_VECTOR(i_sub90_rgb_to_hgr_q(7 downto 0));

    -- i_conv91_rgb_to_hgr_sel_x(BITSELECT,9)@3
    i_conv91_rgb_to_hgr_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_sub90_rgb_to_hgr_sel_x_b(7 downto 0)), 32));

    -- i_conv91_rgb_to_hgr_vt_select_7(BITSELECT,106)@3
    i_conv91_rgb_to_hgr_vt_select_7_b <= i_conv91_rgb_to_hgr_sel_x_b(7 downto 0);

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_inputreg(DELAY,911)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv91_rgb_to_hgr_vt_select_7_b, xout => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_inputreg_q, clk => clock, aclr => resetn );

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr(REG,914)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr_q <= "11001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr_q <= STD_LOGIC_VECTOR(redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem(DUALMEM,912)
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ia <= STD_LOGIC_VECTOR(redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_inputreg_q);
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_aa <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_wraddr_q;
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ab <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_rdcnt_q;
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_reset0 <= not (resetn);
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 26,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_reset0,
        clock1 => clock,
        address_a => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_aa,
        data_a => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_ab,
        q_b => redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_iq
    );
    redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_q <= redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_iq(7 downto 0);

    -- i_conv91_rgb_to_hgr_vt_join(BITJOIN,105)@31
    i_conv91_rgb_to_hgr_vt_join_q <= i_conv52_rgb_to_hgr_vt_const_31_q & redist83_i_conv91_rgb_to_hgr_vt_select_7_b_28_mem_q;

    -- leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x(BITSELECT,500)@31
    leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_in <= i_conv91_rgb_to_hgr_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_b <= leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid502_i_shl_rgb_to_h_rgb_to_h22_shift_x(BITJOIN,501)@31
    leftShiftStage0Idx1_uid502_i_shl_rgb_to_h_rgb_to_h22_shift_x_q <= leftShiftStage0Idx1Rng16_uid501_i_shl_rgb_to_h_rgb_to_h22_shift_x_b & i_shl_rgb_to_hgr_vt_const_15_q;

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b(BITSELECT,728)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_d <= leftShiftStage0Idx1_uid502_i_shl_rgb_to_h_rgb_to_h22_shift_x_q(23 downto 16);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel2_0(BITSELECT,772)
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel2_0_b <= i_conv52_rgb_to_hgr_vt_const_31_q(15 downto 8);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2(MUX,732)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_s <= VCC_q;
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_combproc: PROCESS (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_s, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel2_0_b, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_d)
    BEGIN
        CASE (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_s) IS
            WHEN "0" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel2_0_b;
            WHEN "1" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_d;
            WHEN OTHERS => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,783)
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b <= i_shl_rgb_to_hgr_vt_const_15_q(7 downto 0);
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c <= i_shl_rgb_to_hgr_vt_const_15_q(15 downto 8);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1(MUX,731)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_s <= VCC_q;
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_combproc: PROCESS (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_s, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c)
    BEGIN
        CASE (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_s) IS
            WHEN "0" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN "1" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c;
            WHEN OTHERS => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a(BITSELECT,729)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_b <= i_conv91_rgb_to_hgr_vt_join_q(7 downto 0);

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0(MUX,730)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_s <= VCC_q;
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_combproc: PROCESS (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_s, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_b, leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b)
    BEGIN
        CASE (leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_s) IS
            WHEN "0" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_a_b;
            WHEN "1" => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b;
            WHEN OTHERS => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitJoin_for_q(BITJOIN,734)@31
    leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitJoin_for_q_q <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p3_q & leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q & leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p1_q & leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p0_q;

    -- i_shl_rgb_to_hgr_vt_select_23(BITSELECT,156)@31
    i_shl_rgb_to_hgr_vt_select_23_b <= leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_BitJoin_for_q_q(23 downto 16);

    -- i_shl_rgb_to_hgr_vt_join(BITJOIN,155)@31
    i_shl_rgb_to_hgr_vt_join_q <= i_div_rgb_to_hgr_vt_const_31_q & i_shl_rgb_to_hgr_vt_select_23_b & i_shl_rgb_to_hgr_vt_const_15_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select(BITSELECT,784)@31
    prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_b <= i_shl_rgb_to_hgr_vt_join_q(17 downto 0);
    prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_c <= i_shl_rgb_to_hgr_vt_join_q(31 downto 18);

    -- oneInvRes_uid204_i_div_rgb_to_hgr(CONSTANT,203)
    oneInvRes_uid204_i_div_rgb_to_hgr_q <= "100000000000000000000000000000000";

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b(BITSELECT,685)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b <= STD_LOGIC_VECTOR(redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1_q(33 downto 33));

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_UpperBits_for_b(BITJOIN,686)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_UpperBits_for_b_q <= lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b & lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_b_b;

    -- leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr(BITSELECT,564)@10
    leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(24 downto 0);
    leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_in(24 downto 0);

    -- leftShiftStage1Idx7_uid566_normY_uid191_i_div_rgb_to_hgr(BITJOIN,565)@10
    leftShiftStage1Idx7_uid566_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx7Rng7_uid565_normY_uid191_i_div_rgb_to_hgr_b & i_add_rgb_to_hgr_vt_const_31_q;

    -- leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr(BITSELECT,561)@10
    leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(25 downto 0);
    leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_in(25 downto 0);

    -- leftShiftStage1Idx6_uid563_normY_uid191_i_div_rgb_to_hgr(BITJOIN,562)@10
    leftShiftStage1Idx6_uid563_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx6Rng6_uid562_normY_uid191_i_div_rgb_to_hgr_b & leftShiftStage1Idx6Pad6_uid561_normY_uid191_i_div_rgb_to_hgr_q;

    -- leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr(BITSELECT,558)@10
    leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(26 downto 0);
    leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_in(26 downto 0);

    -- leftShiftStage1Idx5Pad5_uid558_normY_uid191_i_div_rgb_to_hgr(CONSTANT,557)
    leftShiftStage1Idx5Pad5_uid558_normY_uid191_i_div_rgb_to_hgr_q <= "00000";

    -- leftShiftStage1Idx5_uid560_normY_uid191_i_div_rgb_to_hgr(BITJOIN,559)@10
    leftShiftStage1Idx5_uid560_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx5Rng5_uid559_normY_uid191_i_div_rgb_to_hgr_b & leftShiftStage1Idx5Pad5_uid558_normY_uid191_i_div_rgb_to_hgr_q;

    -- leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr(BITSELECT,555)@10
    leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(27 downto 0);
    leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_in(27 downto 0);

    -- leftShiftStage1Idx4_uid557_normY_uid191_i_div_rgb_to_hgr(BITJOIN,556)@10
    leftShiftStage1Idx4_uid557_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx4Rng4_uid556_normY_uid191_i_div_rgb_to_hgr_b & zs_uid245_zCount_uid190_i_div_rgb_to_hgr_q;

    -- leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr(BITSELECT,552)@10
    leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(28 downto 0);
    leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_in(28 downto 0);

    -- leftShiftStage1Idx3_uid554_normY_uid191_i_div_rgb_to_hgr(BITJOIN,553)@10
    leftShiftStage1Idx3_uid554_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx3Rng3_uid553_normY_uid191_i_div_rgb_to_hgr_b & topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr(BITSELECT,549)@10
    leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(29 downto 0);
    leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_in(29 downto 0);

    -- leftShiftStage1Idx2_uid551_normY_uid191_i_div_rgb_to_hgr(BITJOIN,550)@10
    leftShiftStage1Idx2_uid551_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx2Rng2_uid550_normY_uid191_i_div_rgb_to_hgr_b & i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q;

    -- leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr(BITSELECT,546)@10
    leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_in <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_in(30 downto 0);

    -- leftShiftStage1Idx1_uid548_normY_uid191_i_div_rgb_to_hgr(BITJOIN,547)@10
    leftShiftStage1Idx1_uid548_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx1Rng1_uid547_normY_uid191_i_div_rgb_to_hgr_b & GND_q;

    -- leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr(BITSELECT,537)@9
    leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_in <= redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q(7 downto 0);
    leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_in(7 downto 0);

    -- leftShiftStage0Idx3_uid539_normY_uid191_i_div_rgb_to_hgr(BITJOIN,538)@9
    leftShiftStage0Idx3_uid539_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx3Rng24_uid538_normY_uid191_i_div_rgb_to_hgr_b & i_conv52_rgb_to_hgr_vt_const_31_q;

    -- leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr(BITSELECT,534)@9
    leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_in <= redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q(15 downto 0);
    leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_in(15 downto 0);

    -- leftShiftStage0Idx2_uid536_normY_uid191_i_div_rgb_to_hgr(BITJOIN,535)@9
    leftShiftStage0Idx2_uid536_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx2Rng16_uid535_normY_uid191_i_div_rgb_to_hgr_b & i_shl_rgb_to_hgr_vt_const_15_q;

    -- leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr(BITSELECT,531)@9
    leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_in <= redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q(23 downto 0);
    leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_b <= leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_in(23 downto 0);

    -- leftShiftStage0Idx1_uid533_normY_uid191_i_div_rgb_to_hgr(BITJOIN,532)@9
    leftShiftStage0Idx1_uid533_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx1Rng8_uid532_normY_uid191_i_div_rgb_to_hgr_b & i_div_rgb_to_hgr_vt_const_31_q;

    -- i_sub_rgb_to_hgr(SUB,159)@3
    i_sub_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & i_acl_8_rgb_to_hgr_q);
    i_sub_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hgr_q);
    i_sub_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_rgb_to_hgr_a) - UNSIGNED(i_sub_rgb_to_hgr_b));
    i_sub_rgb_to_hgr_q <= i_sub_rgb_to_hgr_o(8 downto 0);

    -- bgTrunc_i_sub_rgb_to_hgr_sel_x(BITSELECT,6)@3
    bgTrunc_i_sub_rgb_to_hgr_sel_x_b <= STD_LOGIC_VECTOR(i_sub_rgb_to_hgr_q(7 downto 0));

    -- redist100_bgTrunc_i_sub_rgb_to_hgr_sel_x_b_1(DELAY,896)
    redist100_bgTrunc_i_sub_rgb_to_hgr_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_rgb_to_hgr_sel_x_b, xout => redist100_bgTrunc_i_sub_rgb_to_hgr_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv52_rgb_to_hgr_sel_x(BITSELECT,8)@4
    i_conv52_rgb_to_hgr_sel_x_b <= std_logic_vector(resize(unsigned(redist100_bgTrunc_i_sub_rgb_to_hgr_sel_x_b_1_q(7 downto 0)), 32));

    -- i_conv52_rgb_to_hgr_vt_select_7(BITSELECT,102)@4
    i_conv52_rgb_to_hgr_vt_select_7_b <= i_conv52_rgb_to_hgr_sel_x_b(7 downto 0);

    -- i_conv52_rgb_to_hgr_vt_join(BITJOIN,101)@4
    i_conv52_rgb_to_hgr_vt_join_q <= i_conv52_rgb_to_hgr_vt_const_31_q & i_conv52_rgb_to_hgr_vt_select_7_b;

    -- redist84_i_conv52_rgb_to_hgr_vt_join_q_1(DELAY,880)
    redist84_i_conv52_rgb_to_hgr_vt_join_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv52_rgb_to_hgr_vt_join_q, xout => redist84_i_conv52_rgb_to_hgr_vt_join_q_1_q, clk => clock, aclr => resetn );

    -- redist85_i_conv52_rgb_to_hgr_vt_join_q_5(DELAY,881)
    redist85_i_conv52_rgb_to_hgr_vt_join_q_5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist84_i_conv52_rgb_to_hgr_vt_join_q_1_q, xout => redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q, clk => clock, aclr => resetn );

    -- vCount_uid229_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,228)@4 + 1
    vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_qi <= "1" WHEN i_conv52_rgb_to_hgr_vt_join_q = c_i32_0gr_q ELSE "0";
    vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_qi, xout => vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist69_vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q_5(DELAY,865)
    redist69_vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist69_vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q_5_q, clk => clock, aclr => resetn );

    -- vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr(MUX,231)@5
    vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_s <= vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q;
    vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_combproc: PROCESS (vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_s, redist84_i_conv52_rgb_to_hgr_vt_join_q_1_q, cstValOvf_uid217_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_s) IS
            WHEN "0" => vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q <= redist84_i_conv52_rgb_to_hgr_vt_join_q_1_q;
            WHEN "1" => vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q <= cstValOvf_uid217_i_div_rgb_to_hgr_q;
            WHEN OTHERS => vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,789)@5
    rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b <= vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q(31 downto 16);
    rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c <= vStagei_uid232_zCount_uid190_i_div_rgb_to_hgr_q(15 downto 0);

    -- vCount_uid235_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,234)@5 + 1
    vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_qi <= "1" WHEN rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b = i_shl_rgb_to_hgr_vt_const_15_q ELSE "0";
    vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_qi, xout => vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist68_vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q_4(DELAY,864)
    redist68_vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist68_vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q_4_q, clk => clock, aclr => resetn );

    -- redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1(DELAY,800)
    redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c, xout => redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1(DELAY,799)
    redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b, xout => redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr(MUX,237)@6
    vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_s <= vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q;
    vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_combproc: PROCESS (vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_s, redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q, redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_s) IS
            WHEN "0" => vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q <= redist3_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q <= redist4_rVStage_uid234_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,790)@6
    rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b <= vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q(15 downto 8);
    rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c <= vStagei_uid238_zCount_uid190_i_div_rgb_to_hgr_q(7 downto 0);

    -- vCount_uid241_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,240)@6 + 1
    vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_qi <= "1" WHEN rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b = i_div_rgb_to_hgr_vt_const_31_q ELSE "0";
    vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_qi, xout => vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist67_vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q_3(DELAY,863)
    redist67_vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist67_vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q_3_q, clk => clock, aclr => resetn );

    -- redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1(DELAY,798)
    redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c, xout => redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1(DELAY,797)
    redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b, xout => redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr(MUX,243)@7
    vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_s <= vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q;
    vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_combproc: PROCESS (vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_s, redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q, redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_s) IS
            WHEN "0" => vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q <= redist1_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q <= redist2_rVStage_uid240_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,791)@7
    rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b <= vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q(7 downto 4);
    rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c <= vStagei_uid244_zCount_uid190_i_div_rgb_to_hgr_q(3 downto 0);

    -- vCount_uid247_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,246)@7
    vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q <= "1" WHEN rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b = zs_uid245_zCount_uid190_i_div_rgb_to_hgr_q ELSE "0";

    -- redist66_vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q_2(DELAY,862)
    redist66_vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist66_vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q_2_q, clk => clock, aclr => resetn );

    -- vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr(MUX,249)@7 + 1
    vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_s <= vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q;
    vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_s) IS
                WHEN "0" => vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q <= rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b;
                WHEN "1" => vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q <= rVStage_uid246_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,792)@8
    rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b <= vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q(3 downto 2);
    rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c <= vStagei_uid250_zCount_uid190_i_div_rgb_to_hgr_q(1 downto 0);

    -- vCount_uid253_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,252)@8
    vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q <= "1" WHEN rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b = i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q ELSE "0";

    -- redist65_vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q_1(DELAY,861)
    redist65_vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist65_vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr(MUX,255)@8
    vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_s <= vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q;
    vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_combproc: PROCESS (vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_s, rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b, rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_s) IS
            WHEN "0" => vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_q <= rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_b;
            WHEN "1" => vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_q <= rVStage_uid252_zCount_uid190_i_div_rgb_to_hgr_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr(BITSELECT,257)@8
    rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b <= vStagei_uid256_zCount_uid190_i_div_rgb_to_hgr_q(1 downto 1);

    -- redist64_rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b_1(DELAY,860)
    redist64_rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b, xout => redist64_rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b_1_q, clk => clock, aclr => resetn );

    -- vCount_uid259_zCount_uid190_i_div_rgb_to_hgr(LOGICAL,258)@9
    vCount_uid259_zCount_uid190_i_div_rgb_to_hgr_q <= "1" WHEN redist64_rVStage_uid258_zCount_uid190_i_div_rgb_to_hgr_b_1_q = GND_q ELSE "0";

    -- r_uid260_zCount_uid190_i_div_rgb_to_hgr(BITJOIN,259)@9
    r_uid260_zCount_uid190_i_div_rgb_to_hgr_q <= redist69_vCount_uid229_zCount_uid190_i_div_rgb_to_hgr_q_5_q & redist68_vCount_uid235_zCount_uid190_i_div_rgb_to_hgr_q_4_q & redist67_vCount_uid241_zCount_uid190_i_div_rgb_to_hgr_q_3_q & redist66_vCount_uid247_zCount_uid190_i_div_rgb_to_hgr_q_2_q & redist65_vCount_uid253_zCount_uid190_i_div_rgb_to_hgr_q_1_q & vCount_uid259_zCount_uid190_i_div_rgb_to_hgr_q;

    -- leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,793)@9
    leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_b <= r_uid260_zCount_uid190_i_div_rgb_to_hgr_q(5 downto 3);
    leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c <= r_uid260_zCount_uid190_i_div_rgb_to_hgr_q(2 downto 0);

    -- leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr(MUX,544)@9 + 1
    leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_s <= leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_b;
    leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_s) IS
                WHEN "000" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q;
                WHEN "001" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx1_uid533_normY_uid191_i_div_rgb_to_hgr_q;
                WHEN "010" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx2_uid536_normY_uid191_i_div_rgb_to_hgr_q;
                WHEN "011" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0Idx3_uid539_normY_uid191_i_div_rgb_to_hgr_q;
                WHEN "100" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= c_i32_0gr_q;
                WHEN "101" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= c_i32_0gr_q;
                WHEN "110" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= c_i32_0gr_q;
                WHEN "111" => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= c_i32_0gr_q;
                WHEN OTHERS => leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c_1(DELAY,796)
    redist0_leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c, xout => redist0_leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr(MUX,567)@10
    leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_s <= redist0_leftShiftStageSel5Dto3_uid544_normY_uid191_i_div_rgb_to_hgr_merged_bit_select_c_1_q;
    leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_combproc: PROCESS (leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_s, leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx1_uid548_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx2_uid551_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx3_uid554_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx4_uid557_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx5_uid560_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx6_uid563_normY_uid191_i_div_rgb_to_hgr_q, leftShiftStage1Idx7_uid566_normY_uid191_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_s) IS
            WHEN "000" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage0_uid545_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "001" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx1_uid548_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "010" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx2_uid551_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "011" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx3_uid554_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "100" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx4_uid557_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "101" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx5_uid560_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "110" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx6_uid563_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN "111" => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= leftShiftStage1Idx7_uid566_normY_uid191_i_div_rgb_to_hgr_q;
            WHEN OTHERS => leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid192_i_div_rgb_to_hgr(BITSELECT,191)@10
    normYNoLeadOne_uid192_i_div_rgb_to_hgr_in <= leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q(30 downto 0);
    normYNoLeadOne_uid192_i_div_rgb_to_hgr_b <= normYNoLeadOne_uid192_i_div_rgb_to_hgr_in(30 downto 0);

    -- yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,785)@10
    yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b <= normYNoLeadOne_uid192_i_div_rgb_to_hgr_b(30 downto 23);
    yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c <= normYNoLeadOne_uid192_i_div_rgb_to_hgr_b(22 downto 0);

    -- memoryC3_uid272_invTabGen_lutmem(DUALMEM,659)@10 + 2
    -- in j@20000000
    memoryC3_uid272_invTabGen_lutmem_aa <= yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b;
    memoryC3_uid272_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC3_uid272_invTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enteA4ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid272_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC3_uid272_invTabGen_lutmem_aa,
        q_a => memoryC3_uid272_invTabGen_lutmem_ir
    );
    memoryC3_uid272_invTabGen_lutmem_r <= memoryC3_uid272_invTabGen_lutmem_ir(13 downto 0);

    -- redist31_memoryC3_uid272_invTabGen_lutmem_r_1(DELAY,827)
    redist31_memoryC3_uid272_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC3_uid272_invTabGen_lutmem_r, xout => redist31_memoryC3_uid272_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval(CONSTANT,316)
    topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q <= "000";

    -- topRangeY_mergedSignalTM_uid319_pT1_uid280_invPolyEval(BITJOIN,318)@13
    topRangeY_mergedSignalTM_uid319_pT1_uid280_invPolyEval_q <= redist31_memoryC3_uid272_invTabGen_lutmem_r_1_q & topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q;

    -- redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3(DELAY,806)
    redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c, xout => redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3_q, clk => clock, aclr => resetn );

    -- yT1_uid279_invPolyEval(BITSELECT,278)@13
    yT1_uid279_invPolyEval_b <= redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3_q(22 downto 9);

    -- nx_mergedSignalTM_uid303_pT1_uid280_invPolyEval(BITJOIN,302)@13
    nx_mergedSignalTM_uid303_pT1_uid280_invPolyEval_q <= GND_q & yT1_uid279_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid315_pT1_uid280_invPolyEval(BITJOIN,314)@13
    topRangeX_mergedSignalTM_uid315_pT1_uid280_invPolyEval_q <= nx_mergedSignalTM_uid303_pT1_uid280_invPolyEval_q & i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q;

    -- sm0_uid321_pT1_uid280_invPolyEval(MULT,320)@13 + 2
    sm0_uid321_pT1_uid280_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid315_pT1_uid280_invPolyEval_q);
    sm0_uid321_pT1_uid280_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid319_pT1_uid280_invPolyEval_q);
    sm0_uid321_pT1_uid280_invPolyEval_reset <= not (resetn);
    sm0_uid321_pT1_uid280_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid321_pT1_uid280_invPolyEval_a0,
        datab => sm0_uid321_pT1_uid280_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid321_pT1_uid280_invPolyEval_reset,
        clock => clock,
        result => sm0_uid321_pT1_uid280_invPolyEval_s1
    );
    sm0_uid321_pT1_uid280_invPolyEval_q <= sm0_uid321_pT1_uid280_invPolyEval_s1;

    -- osig_uid322_pT1_uid280_invPolyEval(BITSELECT,321)@15
    osig_uid322_pT1_uid280_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid321_pT1_uid280_invPolyEval_q(32 downto 0));
    osig_uid322_pT1_uid280_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid322_pT1_uid280_invPolyEval_in(32 downto 18));

    -- redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3(DELAY,803)
    redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b, xout => redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3_q, clk => clock, aclr => resetn );

    -- memoryC2_uid269_invTabGen_lutmem(DUALMEM,658)@13 + 2
    -- in j@20000000
    memoryC2_uid269_invTabGen_lutmem_aa <= redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3_q;
    memoryC2_uid269_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC2_uid269_invTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enteA3ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid269_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC2_uid269_invTabGen_lutmem_aa,
        q_a => memoryC2_uid269_invTabGen_lutmem_ir
    );
    memoryC2_uid269_invTabGen_lutmem_r <= memoryC2_uid269_invTabGen_lutmem_ir(20 downto 0);

    -- rndBit_uid281_invPolyEval(CONSTANT,280)
    rndBit_uid281_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid282_invPolyEval(BITJOIN,281)@15
    cIncludingRoundingBit_uid282_invPolyEval_q <= memoryC2_uid269_invTabGen_lutmem_r & rndBit_uid281_invPolyEval_q;

    -- ts1_uid284_invPolyEval(ADD,283)@15
    ts1_uid284_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid282_invPolyEval_q(22)) & cIncludingRoundingBit_uid282_invPolyEval_q));
    ts1_uid284_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid322_pT1_uid280_invPolyEval_b(14)) & osig_uid322_pT1_uid280_invPolyEval_b));
    ts1_uid284_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid284_invPolyEval_a) + SIGNED(ts1_uid284_invPolyEval_b));
    ts1_uid284_invPolyEval_q <= ts1_uid284_invPolyEval_o(23 downto 0);

    -- s1_uid285_invPolyEval(BITSELECT,284)@15
    s1_uid285_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid284_invPolyEval_q(23 downto 1));

    -- redist62_s1_uid285_invPolyEval_b_1(DELAY,858)
    redist62_s1_uid285_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s1_uid285_invPolyEval_b, xout => redist62_s1_uid285_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid358_pT2_uid287_invPolyEval(BITSELECT,357)@16
    aboveLeftY_uid358_pT2_uid287_invPolyEval_in <= redist62_s1_uid285_invPolyEval_b_1_q(14 downto 0);
    aboveLeftY_uid358_pT2_uid287_invPolyEval_b <= aboveLeftY_uid358_pT2_uid287_invPolyEval_in(14 downto 10);

    -- n1_uid366_pT2_uid287_invPolyEval(BITSELECT,365)@16
    n1_uid366_pT2_uid287_invPolyEval_b <= aboveLeftY_uid358_pT2_uid287_invPolyEval_b(4 downto 1);

    -- n1_uid374_pT2_uid287_invPolyEval(BITSELECT,373)@16
    n1_uid374_pT2_uid287_invPolyEval_b <= n1_uid366_pT2_uid287_invPolyEval_b(3 downto 1);

    -- redist60_n1_uid374_pT2_uid287_invPolyEval_b_2(DELAY,856)
    redist60_n1_uid374_pT2_uid287_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n1_uid374_pT2_uid287_invPolyEval_b, xout => redist60_n1_uid374_pT2_uid287_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6(DELAY,807)
    redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_3_q, xout => redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6_q, clk => clock, aclr => resetn );

    -- yT2_uid286_invPolyEval(BITSELECT,285)@16
    yT2_uid286_invPolyEval_b <= redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6_q(22 downto 2);

    -- nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval(BITJOIN,325)@16
    nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q <= GND_q & yT2_uid286_invPolyEval_b;

    -- aboveLeftX_uid357_pT2_uid287_invPolyEval(BITSELECT,356)@16
    aboveLeftX_uid357_pT2_uid287_invPolyEval_in <= nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q(4 downto 0);
    aboveLeftX_uid357_pT2_uid287_invPolyEval_b <= aboveLeftX_uid357_pT2_uid287_invPolyEval_in(4 downto 0);

    -- n0_uid367_pT2_uid287_invPolyEval(BITSELECT,366)@16
    n0_uid367_pT2_uid287_invPolyEval_b <= aboveLeftX_uid357_pT2_uid287_invPolyEval_b(4 downto 1);

    -- n0_uid375_pT2_uid287_invPolyEval(BITSELECT,374)@16
    n0_uid375_pT2_uid287_invPolyEval_b <= n0_uid367_pT2_uid287_invPolyEval_b(3 downto 1);

    -- redist59_n0_uid375_pT2_uid287_invPolyEval_b_2(DELAY,855)
    redist59_n0_uid375_pT2_uid287_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n0_uid375_pT2_uid287_invPolyEval_b, xout => redist59_n0_uid375_pT2_uid287_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- sm1_uid390_pT2_uid287_invPolyEval(MULT,389)@18 + 2
    sm1_uid390_pT2_uid287_invPolyEval_a0 <= redist59_n0_uid375_pT2_uid287_invPolyEval_b_2_q;
    sm1_uid390_pT2_uid287_invPolyEval_b0 <= redist60_n1_uid374_pT2_uid287_invPolyEval_b_2_q;
    sm1_uid390_pT2_uid287_invPolyEval_reset <= not (resetn);
    sm1_uid390_pT2_uid287_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 3,
        lpm_widthb => 3,
        lpm_widthp => 6,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid390_pT2_uid287_invPolyEval_a0,
        datab => sm1_uid390_pT2_uid287_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid390_pT2_uid287_invPolyEval_reset,
        clock => clock,
        result => sm1_uid390_pT2_uid287_invPolyEval_s1
    );
    sm1_uid390_pT2_uid287_invPolyEval_q <= sm1_uid390_pT2_uid287_invPolyEval_s1;

    -- redist56_sm1_uid390_pT2_uid287_invPolyEval_q_1(DELAY,852)
    redist56_sm1_uid390_pT2_uid287_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid390_pT2_uid287_invPolyEval_q, xout => redist56_sm1_uid390_pT2_uid287_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- rightBottomY_uid356_pT2_uid287_invPolyEval(BITSELECT,355)@16
    rightBottomY_uid356_pT2_uid287_invPolyEval_in <= redist62_s1_uid285_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid356_pT2_uid287_invPolyEval_b <= rightBottomY_uid356_pT2_uid287_invPolyEval_in(5 downto 1);

    -- n1_uid364_pT2_uid287_invPolyEval(BITSELECT,363)@16
    n1_uid364_pT2_uid287_invPolyEval_b <= rightBottomY_uid356_pT2_uid287_invPolyEval_b(4 downto 1);

    -- n1_uid372_pT2_uid287_invPolyEval(BITSELECT,371)@16
    n1_uid372_pT2_uid287_invPolyEval_b <= n1_uid364_pT2_uid287_invPolyEval_b(3 downto 1);

    -- rightBottomX_uid355_pT2_uid287_invPolyEval(BITSELECT,354)@16
    rightBottomX_uid355_pT2_uid287_invPolyEval_in <= nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q(13 downto 0);
    rightBottomX_uid355_pT2_uid287_invPolyEval_b <= rightBottomX_uid355_pT2_uid287_invPolyEval_in(13 downto 9);

    -- n0_uid365_pT2_uid287_invPolyEval(BITSELECT,364)@16
    n0_uid365_pT2_uid287_invPolyEval_b <= rightBottomX_uid355_pT2_uid287_invPolyEval_b(4 downto 1);

    -- n0_uid373_pT2_uid287_invPolyEval(BITSELECT,372)@16
    n0_uid373_pT2_uid287_invPolyEval_b <= n0_uid365_pT2_uid287_invPolyEval_b(3 downto 1);

    -- sm0_uid389_pT2_uid287_invPolyEval(MULT,388)@16 + 2
    sm0_uid389_pT2_uid287_invPolyEval_a0 <= n0_uid373_pT2_uid287_invPolyEval_b;
    sm0_uid389_pT2_uid287_invPolyEval_b0 <= n1_uid372_pT2_uid287_invPolyEval_b;
    sm0_uid389_pT2_uid287_invPolyEval_reset <= not (resetn);
    sm0_uid389_pT2_uid287_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 3,
        lpm_widthb => 3,
        lpm_widthp => 6,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid389_pT2_uid287_invPolyEval_a0,
        datab => sm0_uid389_pT2_uid287_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid389_pT2_uid287_invPolyEval_reset,
        clock => clock,
        result => sm0_uid389_pT2_uid287_invPolyEval_s1
    );
    sm0_uid389_pT2_uid287_invPolyEval_q <= sm0_uid389_pT2_uid287_invPolyEval_s1;

    -- rightBottomY_uid351_pT2_uid287_invPolyEval(BITSELECT,350)@16
    rightBottomY_uid351_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(redist62_s1_uid285_invPolyEval_b_1_q(22 downto 15));

    -- rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval(BITSELECT,347)@16
    rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q(4 downto 0));
    rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_in(4 downto 0));

    -- rightBottomX_mergedSignalTM_uid349_pT2_uid287_invPolyEval(BITJOIN,348)@16
    rightBottomX_mergedSignalTM_uid349_pT2_uid287_invPolyEval_q <= rightBottomX_bottomRange_uid348_pT2_uid287_invPolyEval_b & topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q;

    -- sm1_uid388_pT2_uid287_invPolyEval(MULT,387)@16 + 2
    sm1_uid388_pT2_uid287_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid349_pT2_uid287_invPolyEval_q;
    sm1_uid388_pT2_uid287_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid351_pT2_uid287_invPolyEval_b);
    sm1_uid388_pT2_uid287_invPolyEval_reset <= not (resetn);
    sm1_uid388_pT2_uid287_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 8,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid388_pT2_uid287_invPolyEval_a0,
        datab => sm1_uid388_pT2_uid287_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid388_pT2_uid287_invPolyEval_reset,
        clock => clock,
        result => sm1_uid388_pT2_uid287_invPolyEval_s1
    );
    sm1_uid388_pT2_uid287_invPolyEval_q <= sm1_uid388_pT2_uid287_invPolyEval_s1(15 downto 0);

    -- highABits_uid396_pT2_uid287_invPolyEval(BITSELECT,395)@18
    highABits_uid396_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(sm1_uid388_pT2_uid287_invPolyEval_q(15 downto 2));

    -- lev1_a1high_uid397_pT2_uid287_invPolyEval(ADD,396)@18 + 1
    lev1_a1high_uid397_pT2_uid287_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid396_pT2_uid287_invPolyEval_b(13)) & highABits_uid396_pT2_uid287_invPolyEval_b));
    lev1_a1high_uid397_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & sm0_uid389_pT2_uid287_invPolyEval_q));
    lev1_a1high_uid397_pT2_uid287_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a1high_uid397_pT2_uid287_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a1high_uid397_pT2_uid287_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1high_uid397_pT2_uid287_invPolyEval_a) + SIGNED(lev1_a1high_uid397_pT2_uid287_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid397_pT2_uid287_invPolyEval_q <= lev1_a1high_uid397_pT2_uid287_invPolyEval_o(14 downto 0);

    -- redist53_lev1_a1high_uid397_pT2_uid287_invPolyEval_q_2(DELAY,849)
    redist53_lev1_a1high_uid397_pT2_uid287_invPolyEval_q_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev1_a1high_uid397_pT2_uid287_invPolyEval_q, xout => redist53_lev1_a1high_uid397_pT2_uid287_invPolyEval_q_2_q, clk => clock, aclr => resetn );

    -- lowRangeA_uid395_pT2_uid287_invPolyEval(BITSELECT,394)@18
    lowRangeA_uid395_pT2_uid287_invPolyEval_in <= sm1_uid388_pT2_uid287_invPolyEval_q(1 downto 0);
    lowRangeA_uid395_pT2_uid287_invPolyEval_b <= lowRangeA_uid395_pT2_uid287_invPolyEval_in(1 downto 0);

    -- redist54_lowRangeA_uid395_pT2_uid287_invPolyEval_b_2(DELAY,850)
    redist54_lowRangeA_uid395_pT2_uid287_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid395_pT2_uid287_invPolyEval_b, xout => redist54_lowRangeA_uid395_pT2_uid287_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- lev1_a1_uid398_pT2_uid287_invPolyEval(BITJOIN,397)@20
    lev1_a1_uid398_pT2_uid287_invPolyEval_q <= redist53_lev1_a1high_uid397_pT2_uid287_invPolyEval_q_2_q & redist54_lowRangeA_uid395_pT2_uid287_invPolyEval_b_2_q;

    -- aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval(BITSELECT,343)@16
    aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_in <= STD_LOGIC_VECTOR(redist62_s1_uid285_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid345_pT2_uid287_invPolyEval(BITJOIN,344)@16
    aboveLeftY_mergedSignalTM_uid345_pT2_uid287_invPolyEval_q <= aboveLeftY_bottomRange_uid344_pT2_uid287_invPolyEval_b & i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q;

    -- aboveLeftX_uid342_pT2_uid287_invPolyEval(BITSELECT,341)@16
    aboveLeftX_uid342_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q(21 downto 14));

    -- sm0_uid387_pT2_uid287_invPolyEval(MULT,386)@16 + 2
    sm0_uid387_pT2_uid287_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid342_pT2_uid287_invPolyEval_b);
    sm0_uid387_pT2_uid287_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid345_pT2_uid287_invPolyEval_q;
    sm0_uid387_pT2_uid287_invPolyEval_reset <= not (resetn);
    sm0_uid387_pT2_uid287_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 9,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid387_pT2_uid287_invPolyEval_a0,
        datab => sm0_uid387_pT2_uid287_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid387_pT2_uid287_invPolyEval_reset,
        clock => clock,
        result => sm0_uid387_pT2_uid287_invPolyEval_s1
    );
    sm0_uid387_pT2_uid287_invPolyEval_q <= sm0_uid387_pT2_uid287_invPolyEval_s1(15 downto 0);

    -- redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1(DELAY,853)
    redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid387_pT2_uid287_invPolyEval_q, xout => redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid337_pT2_uid287_invPolyEval(BITSELECT,336)@16
    topRangeY_uid337_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(redist62_s1_uid285_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_uid336_pT2_uid287_invPolyEval(BITSELECT,335)@16
    topRangeX_uid336_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid326_pT2_uid287_invPolyEval_q(21 downto 5));

    -- sm0_uid386_pT2_uid287_invPolyEval(MULT,385)@16 + 2
    sm0_uid386_pT2_uid287_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid336_pT2_uid287_invPolyEval_b);
    sm0_uid386_pT2_uid287_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid337_pT2_uid287_invPolyEval_b);
    sm0_uid386_pT2_uid287_invPolyEval_reset <= not (resetn);
    sm0_uid386_pT2_uid287_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid386_pT2_uid287_invPolyEval_a0,
        datab => sm0_uid386_pT2_uid287_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid386_pT2_uid287_invPolyEval_reset,
        clock => clock,
        result => sm0_uid386_pT2_uid287_invPolyEval_s1
    );
    sm0_uid386_pT2_uid287_invPolyEval_q <= sm0_uid386_pT2_uid287_invPolyEval_s1;

    -- redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1(DELAY,854)
    redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid386_pT2_uid287_invPolyEval_q, xout => redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highABits_uid392_pT2_uid287_invPolyEval(BITSELECT,391)@19
    highABits_uid392_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1_q(33 downto 1));

    -- lev1_a0high_uid393_pT2_uid287_invPolyEval(ADD,392)@19 + 1
    lev1_a0high_uid393_pT2_uid287_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid392_pT2_uid287_invPolyEval_b(32)) & highABits_uid392_pT2_uid287_invPolyEval_b));
    lev1_a0high_uid393_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1_q(15)) & redist57_sm0_uid387_pT2_uid287_invPolyEval_q_1_q));
    lev1_a0high_uid393_pT2_uid287_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0high_uid393_pT2_uid287_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0high_uid393_pT2_uid287_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid393_pT2_uid287_invPolyEval_a) + SIGNED(lev1_a0high_uid393_pT2_uid287_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0high_uid393_pT2_uid287_invPolyEval_q <= lev1_a0high_uid393_pT2_uid287_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid391_pT2_uid287_invPolyEval(BITSELECT,390)@19
    lowRangeA_uid391_pT2_uid287_invPolyEval_in <= redist58_sm0_uid386_pT2_uid287_invPolyEval_q_1_q(0 downto 0);
    lowRangeA_uid391_pT2_uid287_invPolyEval_b <= lowRangeA_uid391_pT2_uid287_invPolyEval_in(0 downto 0);

    -- redist55_lowRangeA_uid391_pT2_uid287_invPolyEval_b_1(DELAY,851)
    redist55_lowRangeA_uid391_pT2_uid287_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid391_pT2_uid287_invPolyEval_b, xout => redist55_lowRangeA_uid391_pT2_uid287_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid394_pT2_uid287_invPolyEval(BITJOIN,393)@20
    lev1_a0_uid394_pT2_uid287_invPolyEval_q <= lev1_a0high_uid393_pT2_uid287_invPolyEval_q & redist55_lowRangeA_uid391_pT2_uid287_invPolyEval_b_1_q;

    -- highABits_uid400_pT2_uid287_invPolyEval(BITSELECT,399)@20
    highABits_uid400_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid394_pT2_uid287_invPolyEval_q(34 downto 1));

    -- lev2_a0high_uid401_pT2_uid287_invPolyEval(ADD,400)@20
    lev2_a0high_uid401_pT2_uid287_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => highABits_uid400_pT2_uid287_invPolyEval_b(33)) & highABits_uid400_pT2_uid287_invPolyEval_b));
    lev2_a0high_uid401_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 17 => lev1_a1_uid398_pT2_uid287_invPolyEval_q(16)) & lev1_a1_uid398_pT2_uid287_invPolyEval_q));
    lev2_a0high_uid401_pT2_uid287_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid401_pT2_uid287_invPolyEval_a) + SIGNED(lev2_a0high_uid401_pT2_uid287_invPolyEval_b));
    lev2_a0high_uid401_pT2_uid287_invPolyEval_q <= lev2_a0high_uid401_pT2_uid287_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid399_pT2_uid287_invPolyEval(BITSELECT,398)@20
    lowRangeA_uid399_pT2_uid287_invPolyEval_in <= lev1_a0_uid394_pT2_uid287_invPolyEval_q(0 downto 0);
    lowRangeA_uid399_pT2_uid287_invPolyEval_b <= lowRangeA_uid399_pT2_uid287_invPolyEval_in(0 downto 0);

    -- lev2_a0_uid402_pT2_uid287_invPolyEval(BITJOIN,401)@20
    lev2_a0_uid402_pT2_uid287_invPolyEval_q <= lev2_a0high_uid401_pT2_uid287_invPolyEval_q & lowRangeA_uid399_pT2_uid287_invPolyEval_b;

    -- highABits_uid404_pT2_uid287_invPolyEval(BITSELECT,403)@20
    highABits_uid404_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(lev2_a0_uid402_pT2_uid287_invPolyEval_q(35 downto 3));

    -- redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1(DELAY,847)
    redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => highABits_uid404_pT2_uid287_invPolyEval_b, xout => redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0high_uid405_pT2_uid287_invPolyEval(ADD,404)@21
    lev3_a0high_uid405_pT2_uid287_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1_q(32)) & redist51_highABits_uid404_pT2_uid287_invPolyEval_b_1_q));
    lev3_a0high_uid405_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & redist56_sm1_uid390_pT2_uid287_invPolyEval_q_1_q));
    lev3_a0high_uid405_pT2_uid287_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0high_uid405_pT2_uid287_invPolyEval_a) + SIGNED(lev3_a0high_uid405_pT2_uid287_invPolyEval_b));
    lev3_a0high_uid405_pT2_uid287_invPolyEval_q <= lev3_a0high_uid405_pT2_uid287_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid403_pT2_uid287_invPolyEval(BITSELECT,402)@20
    lowRangeA_uid403_pT2_uid287_invPolyEval_in <= lev2_a0_uid402_pT2_uid287_invPolyEval_q(2 downto 0);
    lowRangeA_uid403_pT2_uid287_invPolyEval_b <= lowRangeA_uid403_pT2_uid287_invPolyEval_in(2 downto 0);

    -- redist52_lowRangeA_uid403_pT2_uid287_invPolyEval_b_1(DELAY,848)
    redist52_lowRangeA_uid403_pT2_uid287_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid403_pT2_uid287_invPolyEval_b, xout => redist52_lowRangeA_uid403_pT2_uid287_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0_uid406_pT2_uid287_invPolyEval(BITJOIN,405)@21
    lev3_a0_uid406_pT2_uid287_invPolyEval_q <= lev3_a0high_uid405_pT2_uid287_invPolyEval_q & redist52_lowRangeA_uid403_pT2_uid287_invPolyEval_b_1_q;

    -- osig_uid407_pT2_uid287_invPolyEval(BITSELECT,406)@21
    osig_uid407_pT2_uid287_invPolyEval_in <= STD_LOGIC_VECTOR(lev3_a0_uid406_pT2_uid287_invPolyEval_q(32 downto 0));
    osig_uid407_pT2_uid287_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid407_pT2_uid287_invPolyEval_in(32 downto 9));

    -- redist50_osig_uid407_pT2_uid287_invPolyEval_b_1(DELAY,846)
    redist50_osig_uid407_pT2_uid287_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid407_pT2_uid287_invPolyEval_b, xout => redist50_osig_uid407_pT2_uid287_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9(DELAY,804)
    redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_3_q, xout => redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9_q, clk => clock, aclr => resetn );

    -- memoryC1_uid266_invTabGen_lutmem(DUALMEM,657)@19 + 2
    -- in j@20000000
    memoryC1_uid266_invTabGen_lutmem_aa <= redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9_q;
    memoryC1_uid266_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC1_uid266_invTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enteA2ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid266_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC1_uid266_invTabGen_lutmem_aa,
        q_a => memoryC1_uid266_invTabGen_lutmem_ir
    );
    memoryC1_uid266_invTabGen_lutmem_r <= memoryC1_uid266_invTabGen_lutmem_ir(28 downto 0);

    -- redist32_memoryC1_uid266_invTabGen_lutmem_r_1(DELAY,828)
    redist32_memoryC1_uid266_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC1_uid266_invTabGen_lutmem_r, xout => redist32_memoryC1_uid266_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- cIncludingRoundingBit_uid289_invPolyEval(BITJOIN,288)@22
    cIncludingRoundingBit_uid289_invPolyEval_q <= redist32_memoryC1_uid266_invTabGen_lutmem_r_1_q & rndBit_uid281_invPolyEval_q;

    -- ts2_uid291_invPolyEval(ADD,290)@22
    ts2_uid291_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => cIncludingRoundingBit_uid289_invPolyEval_q(30)) & cIncludingRoundingBit_uid289_invPolyEval_q));
    ts2_uid291_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 24 => redist50_osig_uid407_pT2_uid287_invPolyEval_b_1_q(23)) & redist50_osig_uid407_pT2_uid287_invPolyEval_b_1_q));
    ts2_uid291_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid291_invPolyEval_a) + SIGNED(ts2_uid291_invPolyEval_b));
    ts2_uid291_invPolyEval_q <= ts2_uid291_invPolyEval_o(31 downto 0);

    -- s2_uid292_invPolyEval(BITSELECT,291)@22
    s2_uid292_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid291_invPolyEval_q(31 downto 1));

    -- redist61_s2_uid292_invPolyEval_b_1(DELAY,857)
    redist61_s2_uid292_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s2_uid292_invPolyEval_b, xout => redist61_s2_uid292_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid422_pT3_uid294_invPolyEval(BITSELECT,421)@23
    topRangeY_uid422_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(redist61_s2_uid292_invPolyEval_b_1_q(30 downto 14));

    -- redist49_topRangeY_uid422_pT3_uid294_invPolyEval_b_1(DELAY,845)
    redist49_topRangeY_uid422_pT3_uid294_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => topRangeY_uid422_pT3_uid294_invPolyEval_b, xout => redist49_topRangeY_uid422_pT3_uid294_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_inputreg(DELAY,897)
    redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_6_q, xout => redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_inputreg_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13(DELAY,808)
    redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_inputreg_q, xout => redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_q, clk => clock, aclr => resetn );

    -- nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval(BITJOIN,410)@23
    nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval_q <= GND_q & redist12_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_c_13_q;

    -- rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval(BITSELECT,448)@23
    rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval_q(6 downto 0));
    rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_in(6 downto 0));

    -- redist48_rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b_1(DELAY,844)
    redist48_rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b, xout => redist48_rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- rightBottomX_mergedSignalTM_uid450_pT3_uid294_invPolyEval(BITJOIN,449)@24
    rightBottomX_mergedSignalTM_uid450_pT3_uid294_invPolyEval_q <= redist48_rightBottomX_bottomRange_uid449_pT3_uid294_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid448_pT3_uid294_invPolyEval_q;

    -- sm1_uid487_pT3_uid294_invPolyEval(MULT,486)@24 + 2
    sm1_uid487_pT3_uid294_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid450_pT3_uid294_invPolyEval_q;
    sm1_uid487_pT3_uid294_invPolyEval_b0 <= STD_LOGIC_VECTOR(redist49_topRangeY_uid422_pT3_uid294_invPolyEval_b_1_q);
    sm1_uid487_pT3_uid294_invPolyEval_reset <= not (resetn);
    sm1_uid487_pT3_uid294_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 17,
        lpm_widthp => 35,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid487_pT3_uid294_invPolyEval_a0,
        datab => sm1_uid487_pT3_uid294_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid487_pT3_uid294_invPolyEval_reset,
        clock => clock,
        result => sm1_uid487_pT3_uid294_invPolyEval_s1
    );
    sm1_uid487_pT3_uid294_invPolyEval_q <= sm1_uid487_pT3_uid294_invPolyEval_s1(33 downto 0);

    -- redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1(DELAY,841)
    redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid487_pT3_uid294_invPolyEval_q, xout => redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_b(BITJOIN,684)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_b_q <= lev2_a0_uid494_pT3_uid294_invPolyEval_UpperBits_for_b_q & redist45_sm1_uid487_pT3_uid294_invPolyEval_q_1_q;

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b(BITSELECT,688)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_b <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_b_q(38 downto 0));
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_b_q(52 downto 39));

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_a(BITSELECT,682)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(lev1_a0_uid493_pT3_uid294_invPolyEval_q(51 downto 51));

    -- aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval(BITSELECT,444)@23
    aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_in <= STD_LOGIC_VECTOR(redist61_s2_uid292_invPolyEval_b_1_q(13 downto 0));
    aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_in(13 downto 0));

    -- aboveLeftY_mergedSignalTM_uid446_pT3_uid294_invPolyEval(BITJOIN,445)@23
    aboveLeftY_mergedSignalTM_uid446_pT3_uid294_invPolyEval_q <= aboveLeftY_bottomRange_uid445_pT3_uid294_invPolyEval_b & topRangeY_bottomExtension_uid317_pT1_uid280_invPolyEval_q;

    -- topRangeX_uid421_pT3_uid294_invPolyEval(BITSELECT,420)@23
    topRangeX_uid421_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval_q(23 downto 7));

    -- sm0_uid486_pT3_uid294_invPolyEval(MULT,485)@23 + 2
    sm0_uid486_pT3_uid294_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid421_pT3_uid294_invPolyEval_b);
    sm0_uid486_pT3_uid294_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid446_pT3_uid294_invPolyEval_q;
    sm0_uid486_pT3_uid294_invPolyEval_reset <= not (resetn);
    sm0_uid486_pT3_uid294_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 18,
        lpm_widthp => 35,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid486_pT3_uid294_invPolyEval_a0,
        datab => sm0_uid486_pT3_uid294_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid486_pT3_uid294_invPolyEval_reset,
        clock => clock,
        result => sm0_uid486_pT3_uid294_invPolyEval_s1
    );
    sm0_uid486_pT3_uid294_invPolyEval_q <= sm0_uid486_pT3_uid294_invPolyEval_s1(33 downto 0);

    -- redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1(DELAY,842)
    redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid486_pT3_uid294_invPolyEval_q, xout => redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid491_pT3_uid294_invPolyEval(BITSELECT,490)@26
    highBBits_uid491_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1_q(33 downto 13));

    -- sm0_uid485_pT3_uid294_invPolyEval(MULT,484)@23 + 2
    sm0_uid485_pT3_uid294_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid421_pT3_uid294_invPolyEval_b);
    sm0_uid485_pT3_uid294_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid422_pT3_uid294_invPolyEval_b);
    sm0_uid485_pT3_uid294_invPolyEval_reset <= not (resetn);
    sm0_uid485_pT3_uid294_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid485_pT3_uid294_invPolyEval_a0,
        datab => sm0_uid485_pT3_uid294_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid485_pT3_uid294_invPolyEval_reset,
        clock => clock,
        result => sm0_uid485_pT3_uid294_invPolyEval_s1
    );
    sm0_uid485_pT3_uid294_invPolyEval_q <= sm0_uid485_pT3_uid294_invPolyEval_s1;

    -- redist47_sm0_uid485_pT3_uid294_invPolyEval_q_1(DELAY,843)
    redist47_sm0_uid485_pT3_uid294_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid485_pT3_uid294_invPolyEval_q, xout => redist47_sm0_uid485_pT3_uid294_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid457_pT3_uid294_invPolyEval(BITSELECT,456)@23
    aboveLeftY_uid457_pT3_uid294_invPolyEval_in <= redist61_s2_uid292_invPolyEval_b_1_q(13 downto 0);
    aboveLeftY_uid457_pT3_uid294_invPolyEval_b <= aboveLeftY_uid457_pT3_uid294_invPolyEval_in(13 downto 9);

    -- n1_uid463_pT3_uid294_invPolyEval(BITSELECT,462)@23
    n1_uid463_pT3_uid294_invPolyEval_b <= aboveLeftY_uid457_pT3_uid294_invPolyEval_b(4 downto 1);

    -- n1_uid469_pT3_uid294_invPolyEval(BITSELECT,468)@23
    n1_uid469_pT3_uid294_invPolyEval_b <= n1_uid463_pT3_uid294_invPolyEval_b(3 downto 1);

    -- n1_uid475_pT3_uid294_invPolyEval(BITSELECT,474)@23
    n1_uid475_pT3_uid294_invPolyEval_b <= n1_uid469_pT3_uid294_invPolyEval_b(2 downto 1);

    -- aboveLeftX_uid456_pT3_uid294_invPolyEval(BITSELECT,455)@23
    aboveLeftX_uid456_pT3_uid294_invPolyEval_in <= nx_mergedSignalTM_uid411_pT3_uid294_invPolyEval_q(6 downto 0);
    aboveLeftX_uid456_pT3_uid294_invPolyEval_b <= aboveLeftX_uid456_pT3_uid294_invPolyEval_in(6 downto 2);

    -- n0_uid464_pT3_uid294_invPolyEval(BITSELECT,463)@23
    n0_uid464_pT3_uid294_invPolyEval_b <= aboveLeftX_uid456_pT3_uid294_invPolyEval_b(4 downto 1);

    -- n0_uid470_pT3_uid294_invPolyEval(BITSELECT,469)@23
    n0_uid470_pT3_uid294_invPolyEval_b <= n0_uid464_pT3_uid294_invPolyEval_b(3 downto 1);

    -- n0_uid476_pT3_uid294_invPolyEval(BITSELECT,475)@23
    n0_uid476_pT3_uid294_invPolyEval_b <= n0_uid470_pT3_uid294_invPolyEval_b(2 downto 1);

    -- sm0_uid488_pT3_uid294_invPolyEval(MULT,487)@23 + 2
    sm0_uid488_pT3_uid294_invPolyEval_a0 <= n0_uid476_pT3_uid294_invPolyEval_b;
    sm0_uid488_pT3_uid294_invPolyEval_b0 <= n1_uid475_pT3_uid294_invPolyEval_b;
    sm0_uid488_pT3_uid294_invPolyEval_reset <= not (resetn);
    sm0_uid488_pT3_uid294_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 2,
        lpm_widthb => 2,
        lpm_widthp => 4,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid488_pT3_uid294_invPolyEval_a0,
        datab => sm0_uid488_pT3_uid294_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid488_pT3_uid294_invPolyEval_reset,
        clock => clock,
        result => sm0_uid488_pT3_uid294_invPolyEval_s1
    );
    sm0_uid488_pT3_uid294_invPolyEval_q <= sm0_uid488_pT3_uid294_invPolyEval_s1;

    -- redist44_sm0_uid488_pT3_uid294_invPolyEval_q_1(DELAY,840)
    redist44_sm0_uid488_pT3_uid294_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid488_pT3_uid294_invPolyEval_q, xout => redist44_sm0_uid488_pT3_uid294_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- sumAb_uid489_pT3_uid294_invPolyEval(BITJOIN,488)@26
    sumAb_uid489_pT3_uid294_invPolyEval_q <= redist47_sm0_uid485_pT3_uid294_invPolyEval_q_1_q & redist44_sm0_uid488_pT3_uid294_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval(ADD,491)@26 + 1
    lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => sumAb_uid489_pT3_uid294_invPolyEval_q(37)) & sumAb_uid489_pT3_uid294_invPolyEval_q));
    lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 21 => highBBits_uid491_pT3_uid294_invPolyEval_b(20)) & highBBits_uid491_pT3_uid294_invPolyEval_b));
    lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_q <= lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid490_pT3_uid294_invPolyEval(BITSELECT,489)@26
    lowRangeB_uid490_pT3_uid294_invPolyEval_in <= redist46_sm0_uid486_pT3_uid294_invPolyEval_q_1_q(12 downto 0);
    lowRangeB_uid490_pT3_uid294_invPolyEval_b <= lowRangeB_uid490_pT3_uid294_invPolyEval_in(12 downto 0);

    -- redist43_lowRangeB_uid490_pT3_uid294_invPolyEval_b_1(DELAY,839)
    redist43_lowRangeB_uid490_pT3_uid294_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid490_pT3_uid294_invPolyEval_b, xout => redist43_lowRangeB_uid490_pT3_uid294_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid493_pT3_uid294_invPolyEval(BITJOIN,492)@27
    lev1_a0_uid493_pT3_uid294_invPolyEval_q <= lev1_a0sumAHighB_uid492_pT3_uid294_invPolyEval_q & redist43_lowRangeB_uid490_pT3_uid294_invPolyEval_b_1_q;

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_a(BITJOIN,681)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_a_q <= lev2_a0_uid494_pT3_uid294_invPolyEval_SignBit_for_a_b & lev1_a0_uid493_pT3_uid294_invPolyEval_q;

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a(BITSELECT,687)@27
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_BitExpansion_for_a_q(52 downto 39));

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2(ADD,689)@27 + 1
    lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_b);
    lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_b);
    lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_a) + UNSIGNED(lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_c(0) <= lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_o(39);
    lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_q <= lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1(DELAY,823)
    redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c, xout => redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1(DELAY,824)
    redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c, xout => redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2(ADD,690)@28 + 1
    lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_cin <= lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_c;
    lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1_q(13)) & redist28_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1_q(13)) & redist27_lev2_a0_uid494_pT3_uid294_invPolyEval_BitSelect_for_b_c_1_q) & lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_cin(0));
    lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_a) + SIGNED(lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_q <= lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_o(14 downto 1);

    -- ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2(BITSELECT,749)@29
    ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_q(10 downto 10));

    -- ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_1(BITSELECT,748)@29
    ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_p2_of_2_q(10 downto 0));

    -- ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0(BITSELECT,747)@28
    ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(lev2_a0_uid494_pT3_uid294_invPolyEval_p1_of_2_q(38 downto 17));

    -- redist18_ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b_1(DELAY,814)
    redist18_ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b, xout => redist18_ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_b(BITJOIN,755)@29
    ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_b_q <= ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_1_b & redist18_ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q;

    -- ts3_uid298_invPolyEval_SignBit_for_a(BITSELECT,671)@29
    ts3_uid298_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(cIncludingRoundingBit_uid296_invPolyEval_q(40 downto 40));

    -- redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16(DELAY,805)
    redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_9_q, xout => redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16_q, clk => clock, aclr => resetn );

    -- memoryC0_uid263_invTabGen_lutmem(DUALMEM,656)@26 + 2
    -- in j@20000000
    memoryC0_uid263_invTabGen_lutmem_aa <= redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16_q;
    memoryC0_uid263_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid263_invTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 2,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enteA1ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid263_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid263_invTabGen_lutmem_aa,
        q_a => memoryC0_uid263_invTabGen_lutmem_ir
    );
    memoryC0_uid263_invTabGen_lutmem_r <= memoryC0_uid263_invTabGen_lutmem_ir(1 downto 0);

    -- redist33_memoryC0_uid263_invTabGen_lutmem_r_1(DELAY,829)
    redist33_memoryC0_uid263_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid263_invTabGen_lutmem_r, xout => redist33_memoryC0_uid263_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- memoryC0_uid262_invTabGen_lutmem(DUALMEM,655)@26 + 2
    -- in j@20000000
    memoryC0_uid262_invTabGen_lutmem_aa <= redist9_yAddr_uid200_i_div_rgb_to_hgr_merged_bit_select_b_16_q;
    memoryC0_uid262_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid262_invTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 36,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enteA0ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid262_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid262_invTabGen_lutmem_aa,
        q_a => memoryC0_uid262_invTabGen_lutmem_ir
    );
    memoryC0_uid262_invTabGen_lutmem_r <= memoryC0_uid262_invTabGen_lutmem_ir(35 downto 0);

    -- redist34_memoryC0_uid262_invTabGen_lutmem_r_1(DELAY,830)
    redist34_memoryC0_uid262_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid262_invTabGen_lutmem_r, xout => redist34_memoryC0_uid262_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- os_uid264_invTabGen(BITJOIN,263)@29
    os_uid264_invTabGen_q <= redist33_memoryC0_uid263_invTabGen_lutmem_r_1_q & redist34_memoryC0_uid262_invTabGen_lutmem_r_1_q;

    -- rndBit_uid295_invPolyEval(CONSTANT,294)
    rndBit_uid295_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid296_invPolyEval(BITJOIN,295)@29
    cIncludingRoundingBit_uid296_invPolyEval_q <= os_uid264_invTabGen_q & rndBit_uid295_invPolyEval_q;

    -- ts3_uid298_invPolyEval_BitExpansion_for_a(BITJOIN,670)@29
    ts3_uid298_invPolyEval_BitExpansion_for_a_q <= ts3_uid298_invPolyEval_SignBit_for_a_b & cIncludingRoundingBit_uid296_invPolyEval_q;

    -- ts3_uid298_invPolyEval_BitSelect_for_a(BITSELECT,676)@29
    ts3_uid298_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(ts3_uid298_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    ts3_uid298_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(ts3_uid298_invPolyEval_BitExpansion_for_a_q(41 downto 39));

    -- ts3_uid298_invPolyEval_p1_of_2(ADD,678)@29 + 1
    ts3_uid298_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & ts3_uid298_invPolyEval_BitSelect_for_a_b);
    ts3_uid298_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_b_q);
    ts3_uid298_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid298_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid298_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(ts3_uid298_invPolyEval_p1_of_2_a) + UNSIGNED(ts3_uid298_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid298_invPolyEval_p1_of_2_c(0) <= ts3_uid298_invPolyEval_p1_of_2_o(39);
    ts3_uid298_invPolyEval_p1_of_2_q <= ts3_uid298_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1(DELAY,811)
    redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid298_invPolyEval_BitSelect_for_b_tessel0_2_b, xout => redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_c(BITJOIN,759)@30
    ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_c_q <= redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist15_ts3_uid298_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q;

    -- redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1(DELAY,826)
    redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid298_invPolyEval_BitSelect_for_a_c, xout => redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- ts3_uid298_invPolyEval_p2_of_2(ADD,679)@30 + 1
    ts3_uid298_invPolyEval_p2_of_2_cin <= ts3_uid298_invPolyEval_p1_of_2_c;
    ts3_uid298_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1_q(2)) & redist30_ts3_uid298_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    ts3_uid298_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_c_q(2)) & ts3_uid298_invPolyEval_BitSelect_for_b_BitJoin_for_c_q) & ts3_uid298_invPolyEval_p2_of_2_cin(0));
    ts3_uid298_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid298_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid298_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid298_invPolyEval_p2_of_2_a) + SIGNED(ts3_uid298_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid298_invPolyEval_p2_of_2_q <= ts3_uid298_invPolyEval_p2_of_2_o(3 downto 1);

    -- redist29_ts3_uid298_invPolyEval_p1_of_2_q_1(DELAY,825)
    redist29_ts3_uid298_invPolyEval_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid298_invPolyEval_p1_of_2_q, xout => redist29_ts3_uid298_invPolyEval_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- ts3_uid298_invPolyEval_BitJoin_for_q(BITJOIN,680)@31
    ts3_uid298_invPolyEval_BitJoin_for_q_q <= ts3_uid298_invPolyEval_p2_of_2_q & redist29_ts3_uid298_invPolyEval_p1_of_2_q_1_q;

    -- s3_uid299_invPolyEval(BITSELECT,298)@31
    s3_uid299_invPolyEval_b <= STD_LOGIC_VECTOR(ts3_uid298_invPolyEval_BitJoin_for_q_q(41 downto 1));

    -- fxpInverseRes_uid203_i_div_rgb_to_hgr(BITSELECT,202)@31
    fxpInverseRes_uid203_i_div_rgb_to_hgr_in <= s3_uid299_invPolyEval_b(38 downto 0);
    fxpInverseRes_uid203_i_div_rgb_to_hgr_b <= fxpInverseRes_uid203_i_div_rgb_to_hgr_in(38 downto 6);

    -- paddingY_uid193_i_div_rgb_to_hgr(CONSTANT,192)
    paddingY_uid193_i_div_rgb_to_hgr_q <= "0000000000000000000000000000000";

    -- updatedY_uid194_i_div_rgb_to_hgr(BITJOIN,193)@11
    updatedY_uid194_i_div_rgb_to_hgr_q <= GND_q & paddingY_uid193_i_div_rgb_to_hgr_q;

    -- redist78_normYNoLeadOne_uid192_i_div_rgb_to_hgr_b_1(DELAY,874)
    redist78_normYNoLeadOne_uid192_i_div_rgb_to_hgr_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYNoLeadOne_uid192_i_div_rgb_to_hgr_b, xout => redist78_normYNoLeadOne_uid192_i_div_rgb_to_hgr_b_1_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid193_i_div_rgb_to_hgr(LOGICAL,194)@11 + 1
    normYIsOneC2_uid193_i_div_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & redist78_normYNoLeadOne_uid192_i_div_rgb_to_hgr_b_1_q);
    normYIsOneC2_uid193_i_div_rgb_to_hgr_qi <= "1" WHEN normYIsOneC2_uid193_i_div_rgb_to_hgr_a = updatedY_uid194_i_div_rgb_to_hgr_q ELSE "0";
    normYIsOneC2_uid193_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid193_i_div_rgb_to_hgr_qi, xout => normYIsOneC2_uid193_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid196_i_div_rgb_to_hgr(BITSELECT,195)@10
    normYIsOneC2_uid196_i_div_rgb_to_hgr_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid568_normY_uid191_i_div_rgb_to_hgr_q(31 downto 31));

    -- redist77_normYIsOneC2_uid196_i_div_rgb_to_hgr_b_2(DELAY,873)
    redist77_normYIsOneC2_uid196_i_div_rgb_to_hgr_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid196_i_div_rgb_to_hgr_b, xout => redist77_normYIsOneC2_uid196_i_div_rgb_to_hgr_b_2_q, clk => clock, aclr => resetn );

    -- normYIsOne_uid197_i_div_rgb_to_hgr(LOGICAL,196)@12 + 1
    normYIsOne_uid197_i_div_rgb_to_hgr_qi <= redist77_normYIsOneC2_uid196_i_div_rgb_to_hgr_b_2_q and normYIsOneC2_uid193_i_div_rgb_to_hgr_q;
    normYIsOne_uid197_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid197_i_div_rgb_to_hgr_qi, xout => normYIsOne_uid197_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist76_normYIsOne_uid197_i_div_rgb_to_hgr_q_19(DELAY,872)
    redist76_normYIsOne_uid197_i_div_rgb_to_hgr_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid197_i_div_rgb_to_hgr_q, xout => redist76_normYIsOne_uid197_i_div_rgb_to_hgr_q_19_q, clk => clock, aclr => resetn );

    -- invResPostOneHandling2_uid205_i_div_rgb_to_hgr(MUX,204)@31
    invResPostOneHandling2_uid205_i_div_rgb_to_hgr_s <= redist76_normYIsOne_uid197_i_div_rgb_to_hgr_q_19_q;
    invResPostOneHandling2_uid205_i_div_rgb_to_hgr_combproc: PROCESS (invResPostOneHandling2_uid205_i_div_rgb_to_hgr_s, fxpInverseRes_uid203_i_div_rgb_to_hgr_b, oneInvRes_uid204_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (invResPostOneHandling2_uid205_i_div_rgb_to_hgr_s) IS
            WHEN "0" => invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q <= fxpInverseRes_uid203_i_div_rgb_to_hgr_b;
            WHEN "1" => invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q <= oneInvRes_uid204_i_div_rgb_to_hgr_q;
            WHEN OTHERS => invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select(BITSELECT,786)@31
    prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_b <= invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q(17 downto 0);
    prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_c <= invResPostOneHandling2_uid205_i_div_rgb_to_hgr_q(32 downto 18);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_im6(MULT,575)@31 + 2
    prodXInvY_uid208_i_div_rgb_to_hgr_im6_a0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_b;
    prodXInvY_uid208_i_div_rgb_to_hgr_im6_b0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_im6_reset <= not (resetn);
    prodXInvY_uid208_i_div_rgb_to_hgr_im6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXInvY_uid208_i_div_rgb_to_hgr_im6_a0,
        datab => prodXInvY_uid208_i_div_rgb_to_hgr_im6_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid208_i_div_rgb_to_hgr_im6_reset,
        clock => clock,
        result => prodXInvY_uid208_i_div_rgb_to_hgr_im6_s1
    );
    prodXInvY_uid208_i_div_rgb_to_hgr_im6_q <= prodXInvY_uid208_i_div_rgb_to_hgr_im6_s1;

    -- redist40_prodXInvY_uid208_i_div_rgb_to_hgr_im6_q_2(DELAY,836)
    redist40_prodXInvY_uid208_i_div_rgb_to_hgr_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_im6_q, xout => redist40_prodXInvY_uid208_i_div_rgb_to_hgr_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_align_15(BITSHIFT,584)@35
    prodXInvY_uid208_i_div_rgb_to_hgr_align_15_qint <= redist40_prodXInvY_uid208_i_div_rgb_to_hgr_im6_q_2_q & "000000000000000000";
    prodXInvY_uid208_i_div_rgb_to_hgr_align_15_q <= prodXInvY_uid208_i_div_rgb_to_hgr_align_15_qint(49 downto 0);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b(BITJOIN,703)@35
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_UpperBits_for_b_q & prodXInvY_uid208_i_div_rgb_to_hgr_align_15_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b(BITSELECT,706)@35
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q(66 downto 39);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_UpperBits_for_b(CONSTANT,695)
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_UpperBits_for_b_q <= "000000000000000";

    -- prodXInvY_uid208_i_div_rgb_to_hgr_im3(MULT,572)@31 + 2
    prodXInvY_uid208_i_div_rgb_to_hgr_im3_a0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_b;
    prodXInvY_uid208_i_div_rgb_to_hgr_im3_b0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_im3_reset <= not (resetn);
    prodXInvY_uid208_i_div_rgb_to_hgr_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 15,
        lpm_widthp => 33,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXInvY_uid208_i_div_rgb_to_hgr_im3_a0,
        datab => prodXInvY_uid208_i_div_rgb_to_hgr_im3_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid208_i_div_rgb_to_hgr_im3_reset,
        clock => clock,
        result => prodXInvY_uid208_i_div_rgb_to_hgr_im3_s1
    );
    prodXInvY_uid208_i_div_rgb_to_hgr_im3_q <= prodXInvY_uid208_i_div_rgb_to_hgr_im3_s1;

    -- redist41_prodXInvY_uid208_i_div_rgb_to_hgr_im3_q_1(DELAY,837)
    redist41_prodXInvY_uid208_i_div_rgb_to_hgr_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_im3_q, xout => redist41_prodXInvY_uid208_i_div_rgb_to_hgr_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_align_13(BITSHIFT,582)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_align_13_qint <= redist41_prodXInvY_uid208_i_div_rgb_to_hgr_im3_q_1_q & "000000000000000000";
    prodXInvY_uid208_i_div_rgb_to_hgr_align_13_q <= prodXInvY_uid208_i_div_rgb_to_hgr_align_13_qint(50 downto 0);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b(BITJOIN,694)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_UpperBits_for_b_q & prodXInvY_uid208_i_div_rgb_to_hgr_align_13_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b(BITSELECT,697)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q(65 downto 39);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_im9(MULT,578)@31 + 2
    prodXInvY_uid208_i_div_rgb_to_hgr_im9_a0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_im9_b0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_im9_reset <= not (resetn);
    prodXInvY_uid208_i_div_rgb_to_hgr_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXInvY_uid208_i_div_rgb_to_hgr_im9_a0,
        datab => prodXInvY_uid208_i_div_rgb_to_hgr_im9_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid208_i_div_rgb_to_hgr_im9_reset,
        clock => clock,
        result => prodXInvY_uid208_i_div_rgb_to_hgr_im9_s1
    );
    prodXInvY_uid208_i_div_rgb_to_hgr_im9_q <= prodXInvY_uid208_i_div_rgb_to_hgr_im9_s1;

    -- redist39_prodXInvY_uid208_i_div_rgb_to_hgr_im9_q_1(DELAY,835)
    redist39_prodXInvY_uid208_i_div_rgb_to_hgr_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_im9_q, xout => redist39_prodXInvY_uid208_i_div_rgb_to_hgr_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_im0(MULT,569)@31 + 2
    prodXInvY_uid208_i_div_rgb_to_hgr_im0_a0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs1_merged_bit_select_b;
    prodXInvY_uid208_i_div_rgb_to_hgr_im0_b0 <= prodXInvY_uid208_i_div_rgb_to_hgr_bs2_merged_bit_select_b;
    prodXInvY_uid208_i_div_rgb_to_hgr_im0_reset <= not (resetn);
    prodXInvY_uid208_i_div_rgb_to_hgr_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXInvY_uid208_i_div_rgb_to_hgr_im0_a0,
        datab => prodXInvY_uid208_i_div_rgb_to_hgr_im0_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid208_i_div_rgb_to_hgr_im0_reset,
        clock => clock,
        result => prodXInvY_uid208_i_div_rgb_to_hgr_im0_s1
    );
    prodXInvY_uid208_i_div_rgb_to_hgr_im0_q <= prodXInvY_uid208_i_div_rgb_to_hgr_im0_s1;

    -- redist42_prodXInvY_uid208_i_div_rgb_to_hgr_im0_q_1(DELAY,838)
    redist42_prodXInvY_uid208_i_div_rgb_to_hgr_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_im0_q, xout => redist42_prodXInvY_uid208_i_div_rgb_to_hgr_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_join_12(BITJOIN,581)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_join_12_q <= redist39_prodXInvY_uid208_i_div_rgb_to_hgr_im9_q_1_q & redist42_prodXInvY_uid208_i_div_rgb_to_hgr_im0_q_1_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a(BITJOIN,692)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodXInvY_uid208_i_div_rgb_to_hgr_join_12_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a(BITSELECT,696)@34
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q(65 downto 39);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2(ADD,698)@34 + 1
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c(0) <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o(39);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2(ADD,707)@35 + 1
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c(0) <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o(39);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist24_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1(DELAY,820)
    redist24_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c, xout => redist24_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist25_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1(DELAY,821)
    redist25_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c, xout => redist25_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist26_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1(DELAY,822)
    redist26_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c, xout => redist26_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2(ADD,699)@35 + 1
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist26_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist25_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q) & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin(0);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o(27 downto 1);

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,764)@36
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q;

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2(ADD,708)@36 + 1
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist24_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q) & prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin(0);
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o(28 downto 1);

    -- redist23_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q_1(DELAY,819)
    redist23_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q, xout => redist23_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q(BITJOIN,709)@37
    prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q & redist23_prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q_1_q;

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_notEnable(LOGICAL,905)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_nor(LOGICAL,906)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_nor_q <= not (redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_notEnable_q or redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_q);

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_last(CONSTANT,902)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_last_q <= "010111";

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp(LOGICAL,903)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_b <= STD_LOGIC_VECTOR("0" & redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_q);
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_q <= "1" WHEN redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_last_q = redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_b ELSE "0";

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg(REG,904)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg_q <= STD_LOGIC_VECTOR(redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmp_q);
        END IF;
    END PROCESS;

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena(REG,907)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_nor_q = "1") THEN
                redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_q <= STD_LOGIC_VECTOR(redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_enaAnd(LOGICAL,908)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_enaAnd_q <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_sticky_ena_q and VCC_q;

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt(COUNTER,900)
    -- low=0, high=24, step=1, init=0
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i = TO_UNSIGNED(23, 5)) THEN
                redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq <= '1';
            ELSE
                redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq <= '0';
            END IF;
            IF (redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_eq = '1') THEN
                redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i + 8;
            ELSE
                redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_i, 5)));

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_inputreg(DELAY,898)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid260_zCount_uid190_i_div_rgb_to_hgr_q, xout => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_inputreg_q, clk => clock, aclr => resetn );

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr(REG,901)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr_q <= "11000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr_q <= STD_LOGIC_VECTOR(redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem(DUALMEM,899)
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ia <= STD_LOGIC_VECTOR(redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_inputreg_q);
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_aa <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_wraddr_q;
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ab <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_rdcnt_q;
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_reset0 <= not (resetn);
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 25,
        width_b => 6,
        widthad_b => 5,
        numwords_b => 25,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_reset0,
        clock1 => clock,
        address_a => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_aa,
        data_a => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_ab,
        q_b => redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_iq
    );
    redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_q <= redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_iq(5 downto 0);

    -- cWOut_uid206_i_div_rgb_to_hgr(CONSTANT,205)
    cWOut_uid206_i_div_rgb_to_hgr_q <= "11111";

    -- rShiftCount_uid207_i_div_rgb_to_hgr(SUB,206)@36 + 1
    rShiftCount_uid207_i_div_rgb_to_hgr_a <= STD_LOGIC_VECTOR("00" & cWOut_uid206_i_div_rgb_to_hgr_q);
    rShiftCount_uid207_i_div_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & redist63_r_uid260_zCount_uid190_i_div_rgb_to_hgr_q_27_mem_q);
    rShiftCount_uid207_i_div_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rShiftCount_uid207_i_div_rgb_to_hgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            rShiftCount_uid207_i_div_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid207_i_div_rgb_to_hgr_a) - UNSIGNED(rShiftCount_uid207_i_div_rgb_to_hgr_b));
        END IF;
    END PROCESS;
    rShiftCount_uid207_i_div_rgb_to_hgr_q <= rShiftCount_uid207_i_div_rgb_to_hgr_o(6 downto 0);

    -- rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select(BITSELECT,787)@37
    rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_b <= rShiftCount_uid207_i_div_rgb_to_hgr_q(6 downto 4);
    rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c <= rShiftCount_uid207_i_div_rgb_to_hgr_q(3 downto 1);
    rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d <= rShiftCount_uid207_i_div_rgb_to_hgr_q(0 downto 0);

    -- rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr(MUX,606)@37 + 1
    rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_s <= rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_b;
    rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_s) IS
                WHEN "000" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
                WHEN "001" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx1_uid593_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "010" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx2_uid596_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "011" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx3_uid599_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "100" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx4_uid602_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "101" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "110" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN "111" => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0Idx5_uid603_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
                WHEN OTHERS => rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c_1(DELAY,801)
    redist5_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c, xout => redist5_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr(MUX,629)@38
    rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_s <= redist5_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_c_1_q;
    rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_combproc: PROCESS (rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_s, rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx1_uid610_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx2_uid613_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx3_uid616_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx4_uid619_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx5_uid622_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx6_uid625_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage1Idx7_uid628_prodPostRightShift_uid209_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_s) IS
            WHEN "000" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage0_uid607_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "001" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx1_uid610_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "010" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx2_uid613_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "011" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx3_uid616_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "100" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx4_uid619_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "101" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx5_uid622_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "110" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx6_uid625_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "111" => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1Idx7_uid628_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN OTHERS => rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d_1(DELAY,802)
    redist6_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d, xout => redist6_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr(MUX,634)@38
    rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_s <= redist6_rightShiftStageSel6Dto4_uid606_prodPostRightShift_uid209_i_div_rgb_to_hgr_merged_bit_select_d_1_q;
    rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_combproc: PROCESS (rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_s, rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q, rightShiftStage2Idx1_uid633_prodPostRightShift_uid209_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_s) IS
            WHEN "0" => rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage1_uid630_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN "1" => rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= rightShiftStage2Idx1_uid633_prodPostRightShift_uid209_i_div_rgb_to_hgr_q;
            WHEN OTHERS => rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid210_i_div_rgb_to_hgr(BITSELECT,209)@38
    prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_in <= rightShiftStage2_uid635_prodPostRightShift_uid209_i_div_rgb_to_hgr_q(63 downto 0);
    prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b <= prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_in(63 downto 31);

    -- redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1(DELAY,870)
    redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b, xout => redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1_q, clk => clock, aclr => resetn );

    -- allOnes_uid211_i_div_rgb_to_hgr(LOGICAL,210)@39 + 1
    allOnes_uid211_i_div_rgb_to_hgr_qi <= "1" WHEN redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1_q = "111111111111111111111111111111111" ELSE "0";
    allOnes_uid211_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => allOnes_uid211_i_div_rgb_to_hgr_qi, xout => allOnes_uid211_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- invAllOnes_uid213_i_div_rgb_to_hgr(LOGICAL,212)@40
    invAllOnes_uid213_i_div_rgb_to_hgr_q <= not (allOnes_uid211_i_div_rgb_to_hgr_q);

    -- addOp2_uid214_i_div_rgb_to_hgr(LOGICAL,213)@40
    addOp2_uid214_i_div_rgb_to_hgr_q <= invAllOnes_uid213_i_div_rgb_to_hgr_q and VCC_q;

    -- redist75_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_2(DELAY,871)
    redist75_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_2 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist74_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_1_q, xout => redist75_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_2_q, clk => clock, aclr => resetn );

    -- prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr(ADD,214)@40
    prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & redist75_prodPostRightShiftPost_uid210_i_div_rgb_to_hgr_b_2_q);
    prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid214_i_div_rgb_to_hgr_q);
    prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_a) + UNSIGNED(prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_b));
    prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_q <= prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr(BITSELECT,215)@40
    prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_in <= prodPostRightShiftPostRnd_uid215_i_div_rgb_to_hgr_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b <= prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_in(32 downto 1);

    -- redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1(DELAY,869)
    redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b, xout => redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1_q, clk => clock, aclr => resetn );

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_notEnable(LOGICAL,930)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_nor(LOGICAL,931)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_nor_q <= not (redist86_i_conv52_rgb_to_hgr_vt_join_q_36_notEnable_q or redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_q);

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_last(CONSTANT,927)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_last_q <= "011010";

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp(LOGICAL,928)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_b <= STD_LOGIC_VECTOR("0" & redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_q);
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_q <= "1" WHEN redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_last_q = redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_b ELSE "0";

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg(REG,929)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg_q <= STD_LOGIC_VECTOR(redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmp_q);
        END IF;
    END PROCESS;

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena(REG,932)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist86_i_conv52_rgb_to_hgr_vt_join_q_36_nor_q = "1") THEN
                redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_q <= STD_LOGIC_VECTOR(redist86_i_conv52_rgb_to_hgr_vt_join_q_36_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_enaAnd(LOGICAL,933)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_enaAnd_q <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_sticky_ena_q and VCC_q;

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt(COUNTER,925)
    -- low=0, high=27, step=1, init=0
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq <= '1';
            ELSE
                redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq <= '0';
            END IF;
            IF (redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_eq = '1') THEN
                redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i + 5;
            ELSE
                redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_i, 5)));

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_inputreg(DELAY,922)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist85_i_conv52_rgb_to_hgr_vt_join_q_5_q, xout => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_inputreg_q, clk => clock, aclr => resetn );

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr(REG,926)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr_q <= STD_LOGIC_VECTOR(redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem(DUALMEM,924)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ia <= STD_LOGIC_VECTOR(redist86_i_conv52_rgb_to_hgr_vt_join_q_36_inputreg_q);
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_aa <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_wraddr_q;
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ab <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_rdcnt_q;
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_reset0 <= not (resetn);
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 28,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_reset0,
        clock1 => clock,
        address_a => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_aa,
        data_a => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_ab,
        q_b => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_iq
    );
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_q <= redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_iq(31 downto 0);

    -- redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg(DELAY,923)
    redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_mem_q, xout => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg_q, clk => clock, aclr => resetn );

    -- yIsZero_uid198_i_div_rgb_to_hgr(LOGICAL,197)@40 + 1
    yIsZero_uid198_i_div_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid198_i_div_rgb_to_hgr_qi <= "1" WHEN redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg_q = yIsZero_uid198_i_div_rgb_to_hgr_b ELSE "0";
    yIsZero_uid198_i_div_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yIsZero_uid198_i_div_rgb_to_hgr_qi, xout => yIsZero_uid198_i_div_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- resFinal_uid218_i_div_rgb_to_hgr(MUX,217)@41
    resFinal_uid218_i_div_rgb_to_hgr_s <= yIsZero_uid198_i_div_rgb_to_hgr_q;
    resFinal_uid218_i_div_rgb_to_hgr_combproc: PROCESS (resFinal_uid218_i_div_rgb_to_hgr_s, redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1_q, cstValOvf_uid217_i_div_rgb_to_hgr_q)
    BEGIN
        CASE (resFinal_uid218_i_div_rgb_to_hgr_s) IS
            WHEN "0" => resFinal_uid218_i_div_rgb_to_hgr_q <= redist73_prodPostRightShiftPostRndRange_uid216_i_div_rgb_to_hgr_b_1_q;
            WHEN "1" => resFinal_uid218_i_div_rgb_to_hgr_q <= cstValOvf_uid217_i_div_rgb_to_hgr_q;
            WHEN OTHERS => resFinal_uid218_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_inputreg(DELAY,909)
    redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinal_uid218_i_div_rgb_to_hgr_q, xout => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6(DELAY,867)
    redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_inputreg_q, xout => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_q, clk => clock, aclr => resetn );

    -- redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg(DELAY,910)
    redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_q, xout => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg_q, clk => clock, aclr => resetn );

    -- resFinalM1_uid223_i_div_rgb_to_hgr(SUB,222)@47
    resFinalM1_uid223_i_div_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg_q);
    resFinalM1_uid223_i_div_rgb_to_hgr_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    resFinalM1_uid223_i_div_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalM1_uid223_i_div_rgb_to_hgr_a) - UNSIGNED(resFinalM1_uid223_i_div_rgb_to_hgr_b));
    resFinalM1_uid223_i_div_rgb_to_hgr_q <= resFinalM1_uid223_i_div_rgb_to_hgr_o(32 downto 0);

    -- resFinalPostMux_uid224_i_div_rgb_to_hgr(BITSELECT,223)@47
    resFinalPostMux_uid224_i_div_rgb_to_hgr_in <= resFinalM1_uid223_i_div_rgb_to_hgr_q(31 downto 0);
    resFinalPostMux_uid224_i_div_rgb_to_hgr_b <= resFinalPostMux_uid224_i_div_rgb_to_hgr_in(31 downto 0);

    -- redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1(DELAY,866)
    redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalPostMux_uid224_i_div_rgb_to_hgr_b, xout => redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1_q, clk => clock, aclr => resetn );

    -- redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7(DELAY,868)
    redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist71_resFinal_uid218_i_div_rgb_to_hgr_q_6_outputreg_q, xout => redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select(BITSELECT,788)@41
    prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_b <= resFinal_uid218_i_div_rgb_to_hgr_q(17 downto 0);
    prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_c <= resFinal_uid218_i_div_rgb_to_hgr_q(31 downto 18);

    -- redist87_i_conv52_rgb_to_hgr_vt_join_q_37(DELAY,883)
    redist87_i_conv52_rgb_to_hgr_vt_join_q_37 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist86_i_conv52_rgb_to_hgr_vt_join_q_36_outputreg_q, xout => redist87_i_conv52_rgb_to_hgr_vt_join_q_37_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_bs2(BITSELECT,638)@41
    prodResY_uid219_i_div_rgb_to_hgr_bs2_in <= redist87_i_conv52_rgb_to_hgr_vt_join_q_37_q(17 downto 0);
    prodResY_uid219_i_div_rgb_to_hgr_bs2_b <= prodResY_uid219_i_div_rgb_to_hgr_bs2_in(17 downto 0);

    -- prodResY_uid219_i_div_rgb_to_hgr_im6(MULT,642)@41 + 2
    prodResY_uid219_i_div_rgb_to_hgr_im6_a0 <= prodResY_uid219_i_div_rgb_to_hgr_bs2_b;
    prodResY_uid219_i_div_rgb_to_hgr_im6_b0 <= prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_c;
    prodResY_uid219_i_div_rgb_to_hgr_im6_reset <= not (resetn);
    prodResY_uid219_i_div_rgb_to_hgr_im6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodResY_uid219_i_div_rgb_to_hgr_im6_a0,
        datab => prodResY_uid219_i_div_rgb_to_hgr_im6_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid219_i_div_rgb_to_hgr_im6_reset,
        clock => clock,
        result => prodResY_uid219_i_div_rgb_to_hgr_im6_s1
    );
    prodResY_uid219_i_div_rgb_to_hgr_im6_q <= prodResY_uid219_i_div_rgb_to_hgr_im6_s1;

    -- redist36_prodResY_uid219_i_div_rgb_to_hgr_im6_q_2(DELAY,832)
    redist36_prodResY_uid219_i_div_rgb_to_hgr_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_im6_q, xout => redist36_prodResY_uid219_i_div_rgb_to_hgr_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_align_15(BITSHIFT,651)@45
    prodResY_uid219_i_div_rgb_to_hgr_align_15_qint <= redist36_prodResY_uid219_i_div_rgb_to_hgr_im6_q_2_q & "000000000000000000";
    prodResY_uid219_i_div_rgb_to_hgr_align_15_q <= prodResY_uid219_i_div_rgb_to_hgr_align_15_qint(49 downto 0);

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b(BITJOIN,721)@45
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q <= i_shl_rgb_to_hgr_vt_const_15_q & prodResY_uid219_i_div_rgb_to_hgr_align_15_q;

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b(BITSELECT,724)@45
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitExpansion_for_b_q(65 downto 39);

    -- prodResY_uid219_i_div_rgb_to_hgr_bs5(BITSELECT,641)@41
    prodResY_uid219_i_div_rgb_to_hgr_bs5_b <= redist87_i_conv52_rgb_to_hgr_vt_join_q_37_q(31 downto 18);

    -- prodResY_uid219_i_div_rgb_to_hgr_im3(MULT,639)@41 + 2
    prodResY_uid219_i_div_rgb_to_hgr_im3_a0 <= prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_b;
    prodResY_uid219_i_div_rgb_to_hgr_im3_b0 <= prodResY_uid219_i_div_rgb_to_hgr_bs5_b;
    prodResY_uid219_i_div_rgb_to_hgr_im3_reset <= not (resetn);
    prodResY_uid219_i_div_rgb_to_hgr_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodResY_uid219_i_div_rgb_to_hgr_im3_a0,
        datab => prodResY_uid219_i_div_rgb_to_hgr_im3_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid219_i_div_rgb_to_hgr_im3_reset,
        clock => clock,
        result => prodResY_uid219_i_div_rgb_to_hgr_im3_s1
    );
    prodResY_uid219_i_div_rgb_to_hgr_im3_q <= prodResY_uid219_i_div_rgb_to_hgr_im3_s1;

    -- redist37_prodResY_uid219_i_div_rgb_to_hgr_im3_q_1(DELAY,833)
    redist37_prodResY_uid219_i_div_rgb_to_hgr_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_im3_q, xout => redist37_prodResY_uid219_i_div_rgb_to_hgr_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_align_13(BITSHIFT,649)@44
    prodResY_uid219_i_div_rgb_to_hgr_align_13_qint <= redist37_prodResY_uid219_i_div_rgb_to_hgr_im3_q_1_q & "000000000000000000";
    prodResY_uid219_i_div_rgb_to_hgr_align_13_q <= prodResY_uid219_i_div_rgb_to_hgr_align_13_qint(49 downto 0);

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b(BITJOIN,712)@44
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q <= prodXInvY_uid208_i_div_rgb_to_hgr_result_add_0_0_UpperBits_for_b_q & prodResY_uid219_i_div_rgb_to_hgr_align_13_q;

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b(BITSELECT,715)@44
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_b_q(64 downto 39);

    -- prodResY_uid219_i_div_rgb_to_hgr_im9(MULT,645)@41 + 2
    prodResY_uid219_i_div_rgb_to_hgr_im9_a0 <= prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_c;
    prodResY_uid219_i_div_rgb_to_hgr_im9_b0 <= prodResY_uid219_i_div_rgb_to_hgr_bs5_b;
    prodResY_uid219_i_div_rgb_to_hgr_im9_reset <= not (resetn);
    prodResY_uid219_i_div_rgb_to_hgr_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 14,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodResY_uid219_i_div_rgb_to_hgr_im9_a0,
        datab => prodResY_uid219_i_div_rgb_to_hgr_im9_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid219_i_div_rgb_to_hgr_im9_reset,
        clock => clock,
        result => prodResY_uid219_i_div_rgb_to_hgr_im9_s1
    );
    prodResY_uid219_i_div_rgb_to_hgr_im9_q <= prodResY_uid219_i_div_rgb_to_hgr_im9_s1;

    -- redist35_prodResY_uid219_i_div_rgb_to_hgr_im9_q_1(DELAY,831)
    redist35_prodResY_uid219_i_div_rgb_to_hgr_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_im9_q, xout => redist35_prodResY_uid219_i_div_rgb_to_hgr_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_im0(MULT,636)@41 + 2
    prodResY_uid219_i_div_rgb_to_hgr_im0_a0 <= prodResY_uid219_i_div_rgb_to_hgr_bs1_merged_bit_select_b;
    prodResY_uid219_i_div_rgb_to_hgr_im0_b0 <= prodResY_uid219_i_div_rgb_to_hgr_bs2_b;
    prodResY_uid219_i_div_rgb_to_hgr_im0_reset <= not (resetn);
    prodResY_uid219_i_div_rgb_to_hgr_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodResY_uid219_i_div_rgb_to_hgr_im0_a0,
        datab => prodResY_uid219_i_div_rgb_to_hgr_im0_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid219_i_div_rgb_to_hgr_im0_reset,
        clock => clock,
        result => prodResY_uid219_i_div_rgb_to_hgr_im0_s1
    );
    prodResY_uid219_i_div_rgb_to_hgr_im0_q <= prodResY_uid219_i_div_rgb_to_hgr_im0_s1;

    -- redist38_prodResY_uid219_i_div_rgb_to_hgr_im0_q_1(DELAY,834)
    redist38_prodResY_uid219_i_div_rgb_to_hgr_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_im0_q, xout => redist38_prodResY_uid219_i_div_rgb_to_hgr_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_join_12(BITJOIN,648)@44
    prodResY_uid219_i_div_rgb_to_hgr_join_12_q <= redist35_prodResY_uid219_i_div_rgb_to_hgr_im9_q_1_q & redist38_prodResY_uid219_i_div_rgb_to_hgr_im0_q_1_q;

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a(BITJOIN,710)@44
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodResY_uid219_i_div_rgb_to_hgr_join_12_q;

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a(BITSELECT,714)@44
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitExpansion_for_a_q(64 downto 39);

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2(ADD,716)@44 + 1
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_b);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_b);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_a) + UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c(0) <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o(39);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2(ADD,725)@45 + 1
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_q);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_b);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_a) + UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c(0) <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o(39);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist19_leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q_15(DELAY,815)
    redist19_leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 15, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q, xout => redist19_leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q_15_q, clk => clock, aclr => resetn );

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_BitJoin_for_b(BITJOIN,739)@46
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_BitJoin_for_b_q <= prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_b & i_div_rgb_to_hgr_vt_const_31_q & redist19_leftShiftStage0_uid504_i_shl_rgb_to_h_rgb_to_h22_shift_x_p2_q_15_q & i_shl_rgb_to_hgr_vt_const_15_q;

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2(COMPARE,666)@46 + 1
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_BitJoin_for_b_q);
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_q);
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_a) - UNSIGNED(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_c(0) <= prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_o(39);

    -- redist20_prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1(DELAY,816)
    redist20_prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c, xout => redist20_prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist21_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1(DELAY,817)
    redist21_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c, xout => redist21_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist22_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1(DELAY,818)
    redist22_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c, xout => redist22_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2(ADD,717)@45 + 1
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p1_of_2_c;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist22_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist21_prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_BitSelect_for_b_c_1_q) & prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_cin(0);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_a) + UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q <= prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_o(26 downto 1);

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,769)@46
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodResY_uid219_i_div_rgb_to_hgr_result_add_0_0_p2_of_2_q;

    -- prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2(ADD,726)@46 + 1
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p1_of_2_c;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist20_prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_BitSelect_for_b_c_1_q) & prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_cin(0);
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_a) + UNSIGNED(prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q <= prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_o(27 downto 1);

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_tessel1_0(BITSELECT,744)@47
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(prodResY_uid219_i_div_rgb_to_hgr_result_add_1_0_p2_of_2_q(24 downto 0));

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_BitJoin_for_c(BITJOIN,746)@47
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_BitJoin_for_c_q <= GND_q & prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_tessel1_0_b;

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_UpperBits_for_a(CONSTANT,661)
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_UpperBits_for_a_q <= "000000000000000000000000000000000";

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select(BITSELECT,795)
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_b <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_UpperBits_for_a_q(6 downto 0));
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_c <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_UpperBits_for_a_q(32 downto 7));

    -- prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2(COMPARE,667)@47 + 1
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_cin <= prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p1_of_2_c;
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_a_tessel0_3_merged_bit_select_c) & '0';
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid220_i_div_rgb_to_hgr_BitSelect_for_b_BitJoin_for_c_q) & prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_cin(0);
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_a) - UNSIGNED(prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_c(0) <= prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_o(27);

    -- resFinalIntDiv_uid225_i_div_rgb_to_hgr(MUX,224)@48
    resFinalIntDiv_uid225_i_div_rgb_to_hgr_s <= prod_qy_GT_x_uid220_i_div_rgb_to_hgr_p2_of_2_c;
    resFinalIntDiv_uid225_i_div_rgb_to_hgr_combproc: PROCESS (resFinalIntDiv_uid225_i_div_rgb_to_hgr_s, redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7_q, redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1_q)
    BEGIN
        CASE (resFinalIntDiv_uid225_i_div_rgb_to_hgr_s) IS
            WHEN "0" => resFinalIntDiv_uid225_i_div_rgb_to_hgr_q <= redist72_resFinal_uid218_i_div_rgb_to_hgr_q_7_q;
            WHEN "1" => resFinalIntDiv_uid225_i_div_rgb_to_hgr_q <= redist70_resFinalPostMux_uid224_i_div_rgb_to_hgr_b_1_q;
            WHEN OTHERS => resFinalIntDiv_uid225_i_div_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_div_rgb_to_hgr_vt_select_23(BITSELECT,120)@48
    i_div_rgb_to_hgr_vt_select_23_b <= resFinalIntDiv_uid225_i_div_rgb_to_hgr_q(23 downto 0);

    -- redist82_i_div_rgb_to_hgr_vt_select_23_b_1(DELAY,878)
    redist82_i_div_rgb_to_hgr_vt_select_23_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_rgb_to_hgr_vt_select_23_b, xout => redist82_i_div_rgb_to_hgr_vt_select_23_b_1_q, clk => clock, aclr => resetn );

    -- i_div_rgb_to_hgr_vt_join(BITJOIN,119)@49
    i_div_rgb_to_hgr_vt_join_q <= i_div_rgb_to_hgr_vt_const_31_q & redist82_i_div_rgb_to_hgr_vt_select_23_b_1_q;

    -- i_add_rgb_to_hgr(ADD,76)@49
    i_add_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & i_div_rgb_to_hgr_vt_join_q);
    i_add_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_add_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_rgb_to_hgr_a) + UNSIGNED(i_add_rgb_to_hgr_b));
    i_add_rgb_to_hgr_q <= i_add_rgb_to_hgr_o(32 downto 0);

    -- bgTrunc_i_add_rgb_to_hgr_sel_x(BITSELECT,3)@49
    bgTrunc_i_add_rgb_to_hgr_sel_x_b <= i_add_rgb_to_hgr_q(31 downto 0);

    -- i_add_rgb_to_hgr_vt_select_24(BITSELECT,79)@49
    i_add_rgb_to_hgr_vt_select_24_b <= bgTrunc_i_add_rgb_to_hgr_sel_x_b(24 downto 0);

    -- i_add_rgb_to_hgr_vt_join(BITJOIN,78)@49
    i_add_rgb_to_hgr_vt_join_q <= i_add_rgb_to_hgr_vt_const_31_q & i_add_rgb_to_hgr_vt_select_24_b;

    -- i_conv_i_i_i16_rgb_to_hgr_sel_x(BITSELECT,11)@49
    i_conv_i_i_i16_rgb_to_hgr_sel_x_b <= i_add_rgb_to_hgr_vt_join_q(16 downto 0);

    -- redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1(DELAY,895)
    redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv_i_i_i16_rgb_to_hgr_sel_x_b, xout => redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_h27(LOGICAL,162)@49 + 1
    i_unnamed_rgb_to_h27_qi <= "1" WHEN i_acl_24_rgb_to_hgr_vt_join_q = c_i32_1gr_q ELSE "0";
    i_unnamed_rgb_to_h27_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_h27_qi, xout => i_unnamed_rgb_to_h27_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_h25(LOGICAL,161)@49 + 1
    i_unnamed_rgb_to_h25_qi <= "1" WHEN i_acl_24_rgb_to_hgr_vt_join_q = c_i32_3gr_q ELSE "0";
    i_unnamed_rgb_to_h25_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_h25_qi, xout => i_unnamed_rgb_to_h25_q, clk => clock, aclr => resetn );

    -- i_acl_25_rgb_to_hgr(LOGICAL,62)@50
    i_acl_25_rgb_to_hgr_q <= i_unnamed_rgb_to_h25_q or i_unnamed_rgb_to_h27_q;

    -- i_unnamed_rgb_to_h23(LOGICAL,160)@49 + 1
    i_unnamed_rgb_to_h23_qi <= "1" WHEN i_acl_24_rgb_to_hgr_vt_join_q = c_i32_5gr_q ELSE "0";
    i_unnamed_rgb_to_h23_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_h23_qi, xout => i_unnamed_rgb_to_h23_q, clk => clock, aclr => resetn );

    -- i_acl_26_rgb_to_hgr(LOGICAL,63)@50
    i_acl_26_rgb_to_hgr_q <= i_unnamed_rgb_to_h23_q or i_acl_25_rgb_to_hgr_q;

    -- i_acl_27_rgb_to_hgr(MUX,64)@50 + 1
    i_acl_27_rgb_to_hgr_s <= i_acl_26_rgb_to_hgr_q;
    i_acl_27_rgb_to_hgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_27_rgb_to_hgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_27_rgb_to_hgr_s) IS
                WHEN "0" => i_acl_27_rgb_to_hgr_q <= redist99_i_conv_i_i_i16_rgb_to_hgr_sel_x_b_1_q;
                WHEN "1" => i_acl_27_rgb_to_hgr_q <= bgTrunc_i_sub_i_i_i_rgb_to_hgr_sel_x_b;
                WHEN OTHERS => i_acl_27_rgb_to_hgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_conv4_i_i_i_rgb_to_hgr_sel_x(BITSELECT,7)@51
    i_conv4_i_i_i_rgb_to_hgr_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_27_rgb_to_hgr_q(16 downto 0)), 19));

    -- i_conv4_i_i_i_rgb_to_hgr_vt_select_16(BITSELECT,98)@51
    i_conv4_i_i_i_rgb_to_hgr_vt_select_16_b <= i_conv4_i_i_i_rgb_to_hgr_sel_x_b(16 downto 0);

    -- i_conv4_i_i_i_rgb_to_hgr_vt_join(BITJOIN,97)@51
    i_conv4_i_i_i_rgb_to_hgr_vt_join_q <= i_conv4_i_i_i_rgb_to_hgr_vt_const_18_q & i_conv4_i_i_i_rgb_to_hgr_vt_select_16_b;

    -- i_add_i_i_i_rgb_to_hgr(ADD,75)@51
    i_add_i_i_i_rgb_to_hgr_a <= STD_LOGIC_VECTOR("0" & i_conv4_i_i_i_rgb_to_hgr_vt_join_q);
    i_add_i_i_i_rgb_to_hgr_b <= STD_LOGIC_VECTOR("0" & i_conv_i_i_i325_rgb_to_hgr_vt_join_q);
    i_add_i_i_i_rgb_to_hgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_i_i_i_rgb_to_hgr_a) + UNSIGNED(i_add_i_i_i_rgb_to_hgr_b));
    i_add_i_i_i_rgb_to_hgr_q <= i_add_i_i_i_rgb_to_hgr_o(19 downto 0);

    -- bgTrunc_i_add_i_i_i_rgb_to_hgr_sel_x(BITSELECT,2)@51
    bgTrunc_i_add_i_i_i_rgb_to_hgr_sel_x_b <= i_add_i_i_i_rgb_to_hgr_q(18 downto 0);

    -- i_conv_i_i2_rgb_to_hgr_sel_x(BITSELECT,10)@51
    i_conv_i_i2_rgb_to_hgr_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_add_i_i_i_rgb_to_hgr_sel_x_b(18 downto 0)), 56));

    -- i_conv_i_i2_rgb_to_hgr_vt_select_18(BITSELECT,110)@51
    i_conv_i_i2_rgb_to_hgr_vt_select_18_b <= i_conv_i_i2_rgb_to_hgr_sel_x_b(18 downto 0);

    -- i_conv_i_i2_rgb_to_hgr_vt_join(BITJOIN,109)@51
    i_conv_i_i2_rgb_to_hgr_vt_join_q <= i_acl_28_rgb_to_hgr_vt_const_55_q & i_conv_i_i2_rgb_to_hgr_vt_select_18_b;

    -- i_cmp_rgb_to_hgr(LOGICAL,94)@3 + 1
    i_cmp_rgb_to_hgr_qi <= "1" WHEN i_acl_8_rgb_to_hgr_q = i_acl_9_rgb_to_hgr_q ELSE "0";
    i_cmp_rgb_to_hgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hgr_qi, xout => i_cmp_rgb_to_hgr_q, clk => clock, aclr => resetn );

    -- redist88_i_cmp_rgb_to_hgr_q_48(DELAY,884)
    redist88_i_cmp_rgb_to_hgr_q_48 : dspba_delay
    GENERIC MAP ( width => 1, depth => 47, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hgr_q, xout => redist88_i_cmp_rgb_to_hgr_q_48_q, clk => clock, aclr => resetn );

    -- i_acl_28_rgb_to_hgr(MUX,65)@51
    i_acl_28_rgb_to_hgr_s <= redist88_i_cmp_rgb_to_hgr_q_48_q;
    i_acl_28_rgb_to_hgr_combproc: PROCESS (i_acl_28_rgb_to_hgr_s, i_conv_i_i2_rgb_to_hgr_vt_join_q, c_i56_524287_q)
    BEGIN
        CASE (i_acl_28_rgb_to_hgr_s) IS
            WHEN "0" => i_acl_28_rgb_to_hgr_q <= i_conv_i_i2_rgb_to_hgr_vt_join_q;
            WHEN "1" => i_acl_28_rgb_to_hgr_q <= c_i56_524287_q;
            WHEN OTHERS => i_acl_28_rgb_to_hgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_28_rgb_to_hgr_vt_select_18(BITSELECT,68)@51
    i_acl_28_rgb_to_hgr_vt_select_18_b <= i_acl_28_rgb_to_hgr_q(18 downto 0);

    -- i_acl_28_rgb_to_hgr_vt_join(BITJOIN,67)@51
    i_acl_28_rgb_to_hgr_vt_join_q <= i_acl_28_rgb_to_hgr_vt_const_55_q & i_acl_28_rgb_to_hgr_vt_select_18_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,22)@51
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_acl_28_rgb_to_hgr_vt_join_q;
    out_o_valid <= redist98_sync_in_aunroll_x_in_i_valid_50_q;

END normal;

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

-- VHDL created from i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enter_rgb_to_hsv13
-- VHDL created on Tue Jun 06 22:18:54 2023


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

entity i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enter_rgb_to_hsv13 is
    port (
        in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_1 : out std_logic_vector(27 downto 0);  -- ufix28
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enter_rgb_to_hsv13;

architecture normal of i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enter_rgb_to_hsv13 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub96_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_sub_i_i_i_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal bgTrunc_i_sub_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_vec_2_join_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal i_acl_28_compressed_rgb_to_hsv_rgb_to_hsv33_acl_28_shuffle_join_x_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_acl_8_zext_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_i_i_i_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv97_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i_i29_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_s_coerce268269274_zext_rgb_to_hsv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i17_65535_q : STD_LOGIC_VECTOR (16 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_4gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_5gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_13_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_acl_13_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hsv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_14_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hsv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_17_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_17_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hsv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_19_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_19_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hsv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_24_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_24_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hsv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_25_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_26_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hsv_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_4_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_4_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_5_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_5_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_6_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_6_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_7_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_7_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_8_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_8_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_8_zext_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_acl_8_zext_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_8_zext_rgb_to_hsv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_9_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_9_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_add_i_i_i_rgb_to_hsv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hsv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hsv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hsv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hsv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hsv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_add_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_rgb_to_hsv_vt_select_24_b : STD_LOGIC_VECTOR (24 downto 0);
    signal i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cmp_i_i136_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i136_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i136_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i136_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i141_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i141_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i166_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i166_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i166_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i166_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i179_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i179_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i179_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i179_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i186_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i186_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i186_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i186_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i42_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i57_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i62_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i77_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i82_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i87_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_rgb_to_hsv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hsv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hsv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hsv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv4_i_i_i_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (14 downto 0);
    signal i_conv4_i_i_i_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_conv52_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_hsv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv97_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv97_rgb_to_hsv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i3_rgb_to_hsv_vt_const_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i3_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i3_rgb_to_hsv_vt_select_31_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_div_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_rgb_to_hsv_vt_select_23_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_add66_rgb_to_hsv_vt_const_15_q : STD_LOGIC_VECTOR (12 downto 0);
    signal i_mul_add66_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mux_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_mux_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hsv_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond427_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond428_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond429_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond425_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond426_not_demorgan_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond426_not_demorgan_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond427_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond427_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond428_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond428_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond429_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond429_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond430_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond430_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond431_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond431_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_i_i_zext_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_i_i_zext_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i_i_zext_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_or_i_i_zext_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i_i_zext_rgb_to_hsv_vt_select_26_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_rgb_to_hsv_0_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_1_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_2_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_2_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_3_demorgan_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_3_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_5_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_6_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_7_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hsv_7_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_s_coerce268269274_zext_rgb_to_hsv_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_s_coerce268269274_zext_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl_i_i4_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i_i4_rgb_to_hsv_vt_select_26_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_shl_rgb_to_hsv_vt_const_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_shl_rgb_to_hsv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_rgb_to_hsv_vt_select_23_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sub96_rgb_to_hsv_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub96_rgb_to_hsv_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub96_rgb_to_hsv_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub96_rgb_to_hsv_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_i_i_i_rgb_to_hsv_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hsv_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hsv_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hsv_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_rgb_to_hsv_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hsv_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hsv_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hsv_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_unnamed_rgb_to_hsv23_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv25_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv27_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv27_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hsv29_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_rgb_to_hsv29_vt_select_18_b : STD_LOGIC_VECTOR (2 downto 0);
    signal normYNoLeadOne_uid303_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid303_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid305_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid304_i_div_rgb_to_hsv_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid304_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid304_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid307_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid308_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid308_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid309_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid309_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid309_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid314_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid314_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid315_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid316_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid317_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid318_i_div_rgb_to_hsv_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid318_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid318_i_div_rgb_to_hsv_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid318_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid322_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal allOnes_uid322_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid324_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid325_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid328_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid329_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid329_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalM1_uid334_i_div_rgb_to_hsv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid334_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid334_i_div_rgb_to_hsv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid334_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalPostMux_uid335_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalPostMux_uid335_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid336_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinalIntDiv_uid336_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid356_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid370_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid371_zCount_uid301_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid375_invTabGen_q : STD_LOGIC_VECTOR (37 downto 0);
    signal yT1_uid390_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid392_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid393_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid395_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid395_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid395_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid396_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid397_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cIncludingRoundingBit_uid400_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal ts2_uid402_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid402_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid403_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rndBit_uid406_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid407_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid410_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal nx_mergedSignalTM_uid414_pT1_uid391_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid426_pT1_uid391_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal topRangeY_mergedSignalTM_uid430_pT1_uid391_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid432_pT1_uid391_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid432_pT1_uid391_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid432_pT1_uid391_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid432_pT1_uid391_invPolyEval_reset : std_logic;
    signal sm0_uid432_pT1_uid391_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid433_pT1_uid391_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid433_pT1_uid391_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal topRangeX_uid447_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid448_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid453_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid456_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_mergedSignalTM_uid460_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomY_uid462_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid466_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_uid466_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid467_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid467_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid468_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid468_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid469_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid469_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid475_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid476_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid477_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid478_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid483_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid484_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid485_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid486_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid497_pT2_uid398_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid497_pT2_uid398_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid497_pT2_uid398_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid497_pT2_uid398_invPolyEval_reset : std_logic;
    signal sm0_uid497_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid498_pT2_uid398_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid498_pT2_uid398_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid498_pT2_uid398_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid498_pT2_uid398_invPolyEval_reset : std_logic;
    signal sm0_uid498_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm1_uid499_pT2_uid398_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid499_pT2_uid398_invPolyEval_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid499_pT2_uid398_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid499_pT2_uid398_invPolyEval_reset : std_logic;
    signal sm1_uid499_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid500_pT2_uid398_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid500_pT2_uid398_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid500_pT2_uid398_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid500_pT2_uid398_invPolyEval_reset : std_logic;
    signal sm0_uid500_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid501_pT2_uid398_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid501_pT2_uid398_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid501_pT2_uid398_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid501_pT2_uid398_invPolyEval_reset : std_logic;
    signal sm1_uid501_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid502_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid502_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid503_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid504_pT2_uid398_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid504_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid504_pT2_uid398_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid504_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid505_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid506_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeA_uid506_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highABits_uid507_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid508_pT2_uid398_invPolyEval_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid508_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid508_pT2_uid398_invPolyEval_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid508_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal lev1_a1_uid509_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid510_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid510_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid511_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid512_pT2_uid398_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid512_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid512_pT2_uid398_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid512_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid513_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lowRangeA_uid514_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid514_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid515_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev3_a0high_uid516_pT2_uid398_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid516_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid516_pT2_uid398_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid516_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid517_pT2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid518_pT2_uid398_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid518_pT2_uid398_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal topRangeX_uid532_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid533_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_mergedSignalTM_uid557_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomExtension_uid559_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_mergedSignalTM_uid561_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid567_pT3_uid405_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftX_uid567_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid568_pT3_uid405_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_uid568_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid574_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid575_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid580_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid581_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid586_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid587_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid596_pT3_uid405_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid596_pT3_uid405_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid596_pT3_uid405_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid596_pT3_uid405_invPolyEval_reset : std_logic;
    signal sm0_uid596_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid597_pT3_uid405_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid597_pT3_uid405_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid597_pT3_uid405_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm0_uid597_pT3_uid405_invPolyEval_reset : std_logic;
    signal sm0_uid597_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm1_uid598_pT3_uid405_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid598_pT3_uid405_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid598_pT3_uid405_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm1_uid598_pT3_uid405_invPolyEval_reset : std_logic;
    signal sm1_uid598_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid599_pT3_uid405_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid599_pT3_uid405_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid599_pT3_uid405_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid599_pT3_uid405_invPolyEval_reset : std_logic;
    signal sm0_uid599_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid600_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeB_uid601_pT3_uid405_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid601_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal highBBits_uid602_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0_uid604_pT3_uid405_invPolyEval_q : STD_LOGIC_VECTOR (51 downto 0);
    signal leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid613_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid622_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid631_i_unnamed_rgb_to_hsv30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_add66_rgb_to_hsv_BitSelect_for_a_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hsv_BitSelect_for_b_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hsv_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i_i4_rgb_to_hsv_BitSelect_for_a_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_shl_i_i4_rgb_to_hsv_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid655_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2_uid658_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid661_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid670_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2_uid673_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3_uid676_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4_uid679_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5_uid682_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx6Pad6_uid683_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6_uid685_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7_uid688_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im0_reset : std_logic;
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im3_reset : std_logic;
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im6_reset : std_logic;
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im9_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im9_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im9_reset : std_logic;
    signal prodXInvY_uid319_i_div_rgb_to_hsv_im9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_join_12_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_align_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_align_13_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx1_uid715_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid718_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx3Pad48_uid720_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid721_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx4Pad64_uid723_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx4_uid724_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng2_uid730_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid732_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng4_uid733_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx2_uid735_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng6_uid736_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage1Idx3_uid738_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx4Rng8_uid739_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx4_uid741_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx5Rng10_uid742_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx5_uid744_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx6Rng12_uid745_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx6Pad12_uid746_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx6_uid747_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx7Rng14_uid748_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx7Pad14_uid749_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx7_uid750_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng1_uid753_prodPostRightShift_uid320_i_div_rgb_to_hsv_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage2Idx1_uid755_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im0_reset : std_logic;
    signal prodResY_uid330_i_div_rgb_to_hsv_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im3_reset : std_logic;
    signal prodResY_uid330_i_div_rgb_to_hsv_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_bs5_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im6_reset : std_logic;
    signal prodResY_uid330_i_div_rgb_to_hsv_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im9_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im9_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_im9_reset : std_logic;
    signal prodResY_uid330_i_div_rgb_to_hsv_im9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_join_12_q : STD_LOGIC_VECTOR (63 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_align_13_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_align_13_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal memoryC0_uid373_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid373_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid373_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid373_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid373_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid373_invTabGen_lutmem_r : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid374_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid374_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid374_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid374_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid374_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid374_invTabGen_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid377_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid377_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid377_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid377_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid377_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid377_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid380_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid380_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid380_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid380_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid380_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid380_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid383_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid383_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid383_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid383_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid383_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid383_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_UpperBits_for_a_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid409_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (41 downto 0);
    signal ts3_uid409_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid409_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid409_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid409_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid409_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid409_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid409_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid409_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid409_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid409_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid409_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid409_invPolyEval_BitJoin_for_q_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_b_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_UpperBits_for_b_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_d : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitJoin_for_q_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (24 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_g : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_h : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_i : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_j : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_k : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_l : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_m : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_o : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_p : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_r : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_t : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_u : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_v : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_w : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_y : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_z : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_bb : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_cc : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_in : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal redist0_leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist17_leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist19_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist20_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist21_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist22_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist23_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist24_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist27_ts3_uid409_invPolyEval_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_memoryC3_uid383_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist30_memoryC1_uid377_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist31_memoryC0_uid374_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_memoryC0_uid373_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist33_prodResY_uid330_i_div_rgb_to_hsv_im9_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist34_prodResY_uid330_i_div_rgb_to_hsv_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_prodResY_uid330_i_div_rgb_to_hsv_im3_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_prodResY_uid330_i_div_rgb_to_hsv_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist37_prodXInvY_uid319_i_div_rgb_to_hsv_im9_q_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist38_prodXInvY_uid319_i_div_rgb_to_hsv_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_prodXInvY_uid319_i_div_rgb_to_hsv_im3_q_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist40_prodXInvY_uid319_i_div_rgb_to_hsv_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist41_i_mul_add66_rgb_to_hsv_BitSelect_for_a_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist42_lowRangeB_uid601_pT3_uid405_invPolyEval_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist43_sm0_uid599_pT3_uid405_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist46_sm0_uid596_pT3_uid405_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist47_rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist48_topRangeY_uid533_pT3_uid405_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist49_osig_uid518_pT2_uid398_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist51_lowRangeA_uid514_pT2_uid398_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_lev1_a1high_uid508_pT2_uid398_invPolyEval_q_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist53_lowRangeA_uid506_pT2_uid398_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_lowRangeA_uid502_pT2_uid398_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_sm1_uid501_pT2_uid398_invPolyEval_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist58_n0_uid486_pT2_uid398_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist59_n1_uid485_pT2_uid398_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist60_s2_uid403_invPolyEval_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist61_s1_uid396_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist63_rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist74_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist75_normYIsOne_uid308_i_div_rgb_to_hsv_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_normYIsOneC2_uid307_i_div_rgb_to_hsv_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_normYNoLeadOne_uid303_i_div_rgb_to_hsv_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist78_i_unnamed_rgb_to_hsv29_vt_select_18_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist79_i_shl_i_i4_rgb_to_hsv_vt_select_26_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist80_i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b_51_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_i_reduction_rgb_to_hsv_7_rgb_to_hsv_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_i_or_cond427_rgb_to_hsv_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_mux_rgb_to_hsv_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_div_rgb_to_hsv_vt_select_23_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist86_i_conv52_rgb_to_hsv_vt_join_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist89_i_conv52_rgb_to_hsv_vt_join_q_37_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist90_i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist91_i_cmp_rgb_to_hsv_q_49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_cmp_i_i_i87_rgb_to_hsv_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_i_acl_18_rgb_to_hsv_vt_select_2_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist97_sync_in_aunroll_x_in_c1_eni1_1_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_sync_in_aunroll_x_in_c1_eni1_2_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist101_sync_in_aunroll_x_in_c1_eni1_3_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist102_sync_in_aunroll_x_in_i_valid_51_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist104_bgTrunc_i_sub_rgb_to_hsv_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_inputreg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_reset0 : std_logic;
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i : signal is true;
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq : std_logic;
    attribute preserve of redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq : signal is true;
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_reset0 : std_logic;
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i : signal is true;
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq : std_logic;
    attribute preserve of redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq : signal is true;
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_reset0 : std_logic;
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i : signal is true;
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq : std_logic;
    attribute preserve of redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq : signal is true;
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_i_conv52_rgb_to_hsv_vt_join_q_36_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_reset0 : std_logic;
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i : signal is true;
    signal redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq : std_logic;
    attribute preserve of redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq : signal is true;
    signal redist93_i_acl_8_rgb_to_hsv_q_50_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_8_rgb_to_hsv_q_50_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_inputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_outputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_reset0 : std_logic;
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_iq : STD_LOGIC_VECTOR (2 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i : signal is true;
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq : std_logic;
    attribute preserve of redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq : signal is true;
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist102_sync_in_aunroll_x_in_i_valid_51(DELAY,1020)
    redist102_sync_in_aunroll_x_in_i_valid_51 : dspba_delay
    GENERIC MAP ( width => 1, depth => 51, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist102_sync_in_aunroll_x_in_i_valid_51_q, clk => clock, aclr => resetn );

    -- i_s_coerce268269274_zext_rgb_to_hsv_vt_const_31(CONSTANT,256)
    i_s_coerce268269274_zext_rgb_to_hsv_vt_const_31_q <= "0000000000000000000000000000000";

    -- i_s_coerce268269274_zext_rgb_to_hsv_sel_x(BITSELECT,115)@1
    i_s_coerce268269274_zext_rgb_to_hsv_sel_x_b <= std_logic_vector(resize(unsigned(in_c1_eni1_4(0 downto 0)), 32));

    -- i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0(BITSELECT,258)@1
    i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b <= i_s_coerce268269274_zext_rgb_to_hsv_sel_x_b(0 downto 0);

    -- redist80_i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b_51(DELAY,998)
    redist80_i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b_51 : dspba_delay
    GENERIC MAP ( width => 1, depth => 51, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b, xout => redist80_i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b_51_q, clk => clock, aclr => resetn );

    -- i_s_coerce268269274_zext_rgb_to_hsv_vt_join(BITJOIN,257)@52
    i_s_coerce268269274_zext_rgb_to_hsv_vt_join_q <= i_s_coerce268269274_zext_rgb_to_hsv_vt_const_31_q & redist80_i_s_coerce268269274_zext_rgb_to_hsv_vt_select_0_b_51_q;

    -- i_or_i_i_zext_rgb_to_hsv_vt_const_31(CONSTANT,241)
    i_or_i_i_zext_rgb_to_hsv_vt_const_31_q <= "00000";

    -- dupName_0_c_i32_0gr_x(CONSTANT,7)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x(BITSELECT,611)@51
    leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_in <= bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x_b(23 downto 0);
    leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_b <= leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_in(23 downto 0);

    -- leftShiftStage0Idx1_uid613_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x(BITJOIN,612)@51
    leftShiftStage0Idx1_uid613_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q <= leftShiftStage0Idx1Rng8_uid612_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_b & i_conv_i_i3_rgb_to_hsv_vt_const_7_q;

    -- i_mul_add66_rgb_to_hsv_vt_const_15(CONSTANT,221)
    i_mul_add66_rgb_to_hsv_vt_const_15_q <= "0000000000000";

    -- leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x(BITSELECT,629)@49
    leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_in <= i_acl_24_rgb_to_hsv_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_b <= leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid631_i_unnamed_rgb_to_hsv30_shift_x(BITJOIN,630)@49
    leftShiftStage0Idx1_uid631_i_unnamed_rgb_to_hsv30_shift_x_q <= leftShiftStage0Idx1Rng16_uid630_i_unnamed_rgb_to_hsv30_shift_x_b & i_shl_rgb_to_hsv_vt_const_15_q;

    -- i_acl_13_rgb_to_hsv_vt_const_31(CONSTANT,143)
    i_acl_13_rgb_to_hsv_vt_const_31_q <= "00000000000000000000000000000";

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_notEnable(LOGICAL,1078)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_nor(LOGICAL,1079)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_nor_q <= not (redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_notEnable_q or redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_q);

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_last(CONSTANT,1075)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_last_q <= "0100110";

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp(LOGICAL,1076)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_b <= STD_LOGIC_VECTOR("0" & redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_q);
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_q <= "1" WHEN redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_last_q = redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_b ELSE "0";

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg(REG,1077)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg_q <= STD_LOGIC_VECTOR(redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmp_q);
        END IF;
    END PROCESS;

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena(REG,1080)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_nor_q = "1") THEN
                redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_q <= STD_LOGIC_VECTOR(redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_enaAnd(LOGICAL,1081)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_enaAnd_q <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_sticky_ena_q and VCC_q;

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt(COUNTER,1073)
    -- low=0, high=39, step=1, init=0
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i = TO_UNSIGNED(38, 6)) THEN
                redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq <= '1';
            ELSE
                redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq <= '0';
            END IF;
            IF (redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_eq = '1') THEN
                redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i + 25;
            ELSE
                redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_i, 6)));

    -- c_i32_5gr(CONSTANT,140)
    c_i32_5gr_q <= "00000000000000000000000000000101";

    -- c_i32_1gr(CONSTANT,136)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- c_i32_2gr(CONSTANT,137)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- c_i32_3gr(CONSTANT,138)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- i_mux_rgb_to_hsv_vt_const_31(CONSTANT,227)
    i_mux_rgb_to_hsv_vt_const_31_q <= "0000000000000000000000000000010";

    -- c_i32_4gr(CONSTANT,139)
    c_i32_4gr_q <= "00000000000000000000000000000100";

    -- redist98_sync_in_aunroll_x_in_c1_eni1_2_1(DELAY,1016)
    redist98_sync_in_aunroll_x_in_c1_eni1_2_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_2, xout => redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q, clk => clock, aclr => resetn );

    -- redist99_sync_in_aunroll_x_in_c1_eni1_2_2(DELAY,1017)
    redist99_sync_in_aunroll_x_in_c1_eni1_2_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q, xout => redist99_sync_in_aunroll_x_in_c1_eni1_2_2_q, clk => clock, aclr => resetn );

    -- redist96_sync_in_aunroll_x_in_c1_eni1_1_1(DELAY,1014)
    redist96_sync_in_aunroll_x_in_c1_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_1, xout => redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_rgb_to_hsv(COMPARE,196)@1 + 1
    i_cmp_i_i_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_rgb_to_hsv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i_rgb_to_hsv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_rgb_to_hsv_c(0) <= i_cmp_i_i_rgb_to_hsv_o(9);

    -- i_green_coerce338339370_red_coerce386387418_rgb_to_hsv(MUX,219)@2
    i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_s <= i_cmp_i_i_rgb_to_hsv_c;
    i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_combproc: PROCESS (i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_s, redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_s) IS
            WHEN "0" => i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_q <= redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_q <= redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist100_sync_in_aunroll_x_in_c1_eni1_3_1(DELAY,1018)
    redist100_sync_in_aunroll_x_in_c1_eni1_3_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_3, xout => redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i186_rgb_to_hsv(COMPARE,189)@1 + 1
    i_cmp_i_i186_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i186_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i186_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i186_rgb_to_hsv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i186_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i186_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i186_rgb_to_hsv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i186_rgb_to_hsv_c(0) <= i_cmp_i_i186_rgb_to_hsv_o(9);

    -- i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv(MUX,184)@2
    i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_s <= i_cmp_i_i186_rgb_to_hsv_c;
    i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_combproc: PROCESS (i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_s, redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_s) IS
            WHEN "0" => i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q <= redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q <= redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i179_rgb_to_hsv(COMPARE,188)@1 + 1
    i_cmp_i_i179_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i179_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i179_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i179_rgb_to_hsv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i179_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i179_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i179_rgb_to_hsv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i179_rgb_to_hsv_c(0) <= i_cmp_i_i179_rgb_to_hsv_o(9);

    -- i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv(MUX,183)@2
    i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_s <= i_cmp_i_i179_rgb_to_hsv_c;
    i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_combproc: PROCESS (i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_s, redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_s) IS
            WHEN "0" => i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q <= redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q <= redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i166_rgb_to_hsv(COMPARE,187)@1 + 1
    i_cmp_i_i166_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i166_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i166_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i166_rgb_to_hsv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i166_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i166_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i166_rgb_to_hsv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i166_rgb_to_hsv_c(0) <= i_cmp_i_i166_rgb_to_hsv_o(9);

    -- i_or_cond425_rgb_to_hsv(LOGICAL,233)@2
    i_or_cond425_rgb_to_hsv_q <= i_cmp_i_i166_rgb_to_hsv_c and i_cmp_i_i179_rgb_to_hsv_c;

    -- i_acl_6_rgb_to_hsv(MUX,170)@2
    i_acl_6_rgb_to_hsv_s <= i_or_cond425_rgb_to_hsv_q;
    i_acl_6_rgb_to_hsv_combproc: PROCESS (i_acl_6_rgb_to_hsv_s, i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q, i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q)
    BEGIN
        CASE (i_acl_6_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_6_rgb_to_hsv_q <= i_blue_coerce290291322_green_coerce338339370_rgb_to_hsv_q;
            WHEN "1" => i_acl_6_rgb_to_hsv_q <= i_blue_coerce290291322_red_coerce386387418_rgb_to_hsv_q;
            WHEN OTHERS => i_acl_6_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i136_rgb_to_hsv(COMPARE,185)@1
    i_cmp_i_i136_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i136_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i136_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i136_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i136_rgb_to_hsv_b));
    i_cmp_i_i136_rgb_to_hsv_c(0) <= i_cmp_i_i136_rgb_to_hsv_o(9);

    -- i_cmp_i_i141_rgb_to_hsv(COMPARE,186)@1
    i_cmp_i_i141_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i141_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i141_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i141_rgb_to_hsv_a) - UNSIGNED(i_cmp_i_i141_rgb_to_hsv_b));
    i_cmp_i_i141_rgb_to_hsv_c(0) <= i_cmp_i_i141_rgb_to_hsv_o(9);

    -- i_or_cond426_not_demorgan_rgb_to_hsv(LOGICAL,234)@1 + 1
    i_or_cond426_not_demorgan_rgb_to_hsv_qi <= i_cmp_i_i141_rgb_to_hsv_c and i_cmp_i_i136_rgb_to_hsv_c;
    i_or_cond426_not_demorgan_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond426_not_demorgan_rgb_to_hsv_qi, xout => i_or_cond426_not_demorgan_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_acl_9_rgb_to_hsv(MUX,177)@2 + 1
    i_acl_9_rgb_to_hsv_s <= i_or_cond426_not_demorgan_rgb_to_hsv_q;
    i_acl_9_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_9_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_9_rgb_to_hsv_s) IS
                WHEN "0" => i_acl_9_rgb_to_hsv_q <= i_acl_6_rgb_to_hsv_q;
                WHEN "1" => i_acl_9_rgb_to_hsv_q <= i_green_coerce338339370_red_coerce386387418_rgb_to_hsv_q;
                WHEN OTHERS => i_acl_9_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i42_rgb_to_hsv(LOGICAL,190)@3
    i_cmp_i_i_i42_rgb_to_hsv_q <= "1" WHEN i_acl_9_rgb_to_hsv_q = redist99_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- redist101_sync_in_aunroll_x_in_c1_eni1_3_2(DELAY,1019)
    redist101_sync_in_aunroll_x_in_c1_eni1_3_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q, xout => redist101_sync_in_aunroll_x_in_c1_eni1_3_2_q, clk => clock, aclr => resetn );

    -- i_acl_5_rgb_to_hsv(MUX,169)@2
    i_acl_5_rgb_to_hsv_s <= i_or_cond425_rgb_to_hsv_q;
    i_acl_5_rgb_to_hsv_combproc: PROCESS (i_acl_5_rgb_to_hsv_s, redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_acl_5_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_5_rgb_to_hsv_q <= redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_acl_5_rgb_to_hsv_q <= redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_acl_5_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_8_rgb_to_hsv(MUX,172)@2 + 1
    i_acl_8_rgb_to_hsv_s <= i_or_cond426_not_demorgan_rgb_to_hsv_q;
    i_acl_8_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_8_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_8_rgb_to_hsv_s) IS
                WHEN "0" => i_acl_8_rgb_to_hsv_q <= i_acl_5_rgb_to_hsv_q;
                WHEN "1" => i_acl_8_rgb_to_hsv_q <= redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q;
                WHEN OTHERS => i_acl_8_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i57_rgb_to_hsv(LOGICAL,191)@3
    i_cmp_i_i_i57_rgb_to_hsv_q <= "1" WHEN i_acl_8_rgb_to_hsv_q = redist101_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- i_or_cond431_rgb_to_hsv(LOGICAL,239)@3 + 1
    i_or_cond431_rgb_to_hsv_qi <= i_cmp_i_i_i57_rgb_to_hsv_q and i_cmp_i_i_i42_rgb_to_hsv_q;
    i_or_cond431_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond431_rgb_to_hsv_qi, xout => i_or_cond431_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hsv(MUX,226)@4
    i_mux_rgb_to_hsv_s <= i_or_cond431_rgb_to_hsv_q;
    i_mux_rgb_to_hsv_combproc: PROCESS (i_mux_rgb_to_hsv_s, c_i32_5gr_q, c_i32_4gr_q)
    BEGIN
        CASE (i_mux_rgb_to_hsv_s) IS
            WHEN "0" => i_mux_rgb_to_hsv_q <= c_i32_5gr_q;
            WHEN "1" => i_mux_rgb_to_hsv_q <= c_i32_4gr_q;
            WHEN OTHERS => i_mux_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mux_rgb_to_hsv_vt_select_0(BITSELECT,229)@4
    i_mux_rgb_to_hsv_vt_select_0_b <= i_mux_rgb_to_hsv_q(0 downto 0);

    -- redist83_i_mux_rgb_to_hsv_vt_select_0_b_1(DELAY,1001)
    redist83_i_mux_rgb_to_hsv_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mux_rgb_to_hsv_vt_select_0_b, xout => redist83_i_mux_rgb_to_hsv_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hsv_vt_join(BITJOIN,228)@5
    i_mux_rgb_to_hsv_vt_join_q <= i_mux_rgb_to_hsv_vt_const_31_q & redist83_i_mux_rgb_to_hsv_vt_select_0_b_1_q;

    -- i_cmp_i_i_i82_rgb_to_hsv(LOGICAL,194)@3
    i_cmp_i_i_i82_rgb_to_hsv_q <= "1" WHEN i_acl_9_rgb_to_hsv_q = redist101_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- redist97_sync_in_aunroll_x_in_c1_eni1_1_2(DELAY,1015)
    redist97_sync_in_aunroll_x_in_c1_eni1_1_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q, xout => redist97_sync_in_aunroll_x_in_c1_eni1_1_2_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_i87_rgb_to_hsv(LOGICAL,195)@3
    i_cmp_i_i_i87_rgb_to_hsv_q <= "1" WHEN i_acl_8_rgb_to_hsv_q = redist97_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";

    -- i_or_cond427_rgb_to_hsv(LOGICAL,235)@3 + 1
    i_or_cond427_rgb_to_hsv_qi <= i_cmp_i_i_i87_rgb_to_hsv_q and i_cmp_i_i_i82_rgb_to_hsv_q;
    i_or_cond427_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond427_rgb_to_hsv_qi, xout => i_or_cond427_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond427_rgb_to_hsv(LOGICAL,230)@4
    i_not_or_cond427_rgb_to_hsv_q <= i_or_cond427_rgb_to_hsv_q xor VCC_q;

    -- i_cmp_i_i_i62_rgb_to_hsv(LOGICAL,192)@3
    i_cmp_i_i_i62_rgb_to_hsv_q <= "1" WHEN i_acl_9_rgb_to_hsv_q = redist97_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";

    -- i_or_cond430_rgb_to_hsv(LOGICAL,238)@3 + 1
    i_or_cond430_rgb_to_hsv_qi <= i_cmp_i_i_i57_rgb_to_hsv_q and i_cmp_i_i_i62_rgb_to_hsv_q;
    i_or_cond430_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond430_rgb_to_hsv_qi, xout => i_or_cond430_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_reduction_rgb_to_hsv_1_rgb_to_hsv(LOGICAL,248)@4
    i_reduction_rgb_to_hsv_1_rgb_to_hsv_q <= i_or_cond430_rgb_to_hsv_q and i_not_or_cond427_rgb_to_hsv_q;

    -- i_cmp_i_i_i77_rgb_to_hsv(LOGICAL,193)@3
    i_cmp_i_i_i77_rgb_to_hsv_q <= "1" WHEN i_acl_8_rgb_to_hsv_q = redist99_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- i_or_cond428_rgb_to_hsv(LOGICAL,236)@3 + 1
    i_or_cond428_rgb_to_hsv_qi <= i_cmp_i_i_i77_rgb_to_hsv_q and i_cmp_i_i_i82_rgb_to_hsv_q;
    i_or_cond428_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond428_rgb_to_hsv_qi, xout => i_or_cond428_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond428_rgb_to_hsv(LOGICAL,231)@4
    i_not_or_cond428_rgb_to_hsv_q <= i_or_cond428_rgb_to_hsv_q xor VCC_q;

    -- i_or_cond429_rgb_to_hsv(LOGICAL,237)@3 + 1
    i_or_cond429_rgb_to_hsv_qi <= i_cmp_i_i_i77_rgb_to_hsv_q and i_cmp_i_i_i62_rgb_to_hsv_q;
    i_or_cond429_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond429_rgb_to_hsv_qi, xout => i_or_cond429_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond429_rgb_to_hsv(LOGICAL,232)@4
    i_not_or_cond429_rgb_to_hsv_q <= i_or_cond429_rgb_to_hsv_q xor VCC_q;

    -- i_reduction_rgb_to_hsv_0_rgb_to_hsv(LOGICAL,247)@4
    i_reduction_rgb_to_hsv_0_rgb_to_hsv_q <= i_not_or_cond429_rgb_to_hsv_q and i_not_or_cond428_rgb_to_hsv_q;

    -- i_reduction_rgb_to_hsv_2_rgb_to_hsv(LOGICAL,249)@4 + 1
    i_reduction_rgb_to_hsv_2_rgb_to_hsv_qi <= i_reduction_rgb_to_hsv_0_rgb_to_hsv_q and i_reduction_rgb_to_hsv_1_rgb_to_hsv_q;
    i_reduction_rgb_to_hsv_2_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hsv_2_rgb_to_hsv_qi, xout => i_reduction_rgb_to_hsv_2_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_acl_13_rgb_to_hsv(MUX,142)@5
    i_acl_13_rgb_to_hsv_s <= i_reduction_rgb_to_hsv_2_rgb_to_hsv_q;
    i_acl_13_rgb_to_hsv_combproc: PROCESS (i_acl_13_rgb_to_hsv_s, i_mux_rgb_to_hsv_vt_join_q, c_i32_3gr_q)
    BEGIN
        CASE (i_acl_13_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_13_rgb_to_hsv_q <= i_mux_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_acl_13_rgb_to_hsv_q <= c_i32_3gr_q;
            WHEN OTHERS => i_acl_13_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_13_rgb_to_hsv_vt_select_2(BITSELECT,145)@5
    i_acl_13_rgb_to_hsv_vt_select_2_b <= i_acl_13_rgb_to_hsv_q(2 downto 0);

    -- i_acl_13_rgb_to_hsv_vt_join(BITJOIN,144)@5
    i_acl_13_rgb_to_hsv_vt_join_q <= i_acl_13_rgb_to_hsv_vt_const_31_q & i_acl_13_rgb_to_hsv_vt_select_2_b;

    -- i_acl_14_rgb_to_hsv(LOGICAL,146)@4
    i_acl_14_rgb_to_hsv_q <= i_or_cond429_rgb_to_hsv_q and i_not_or_cond428_rgb_to_hsv_q;

    -- i_acl_15_rgb_to_hsv(LOGICAL,147)@4 + 1
    i_acl_15_rgb_to_hsv_qi <= i_acl_14_rgb_to_hsv_q and i_not_or_cond427_rgb_to_hsv_q;
    i_acl_15_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_15_rgb_to_hsv_qi, xout => i_acl_15_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_acl_16_rgb_to_hsv(MUX,148)@5
    i_acl_16_rgb_to_hsv_s <= i_acl_15_rgb_to_hsv_q;
    i_acl_16_rgb_to_hsv_combproc: PROCESS (i_acl_16_rgb_to_hsv_s, i_acl_13_rgb_to_hsv_vt_join_q, c_i32_2gr_q)
    BEGIN
        CASE (i_acl_16_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_16_rgb_to_hsv_q <= i_acl_13_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_acl_16_rgb_to_hsv_q <= c_i32_2gr_q;
            WHEN OTHERS => i_acl_16_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_16_rgb_to_hsv_vt_select_2(BITSELECT,151)@5
    i_acl_16_rgb_to_hsv_vt_select_2_b <= i_acl_16_rgb_to_hsv_q(2 downto 0);

    -- i_acl_16_rgb_to_hsv_vt_join(BITJOIN,150)@5
    i_acl_16_rgb_to_hsv_vt_join_q <= i_acl_13_rgb_to_hsv_vt_const_31_q & i_acl_16_rgb_to_hsv_vt_select_2_b;

    -- i_acl_17_rgb_to_hsv(LOGICAL,152)@4 + 1
    i_acl_17_rgb_to_hsv_qi <= i_or_cond428_rgb_to_hsv_q and i_not_or_cond427_rgb_to_hsv_q;
    i_acl_17_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_17_rgb_to_hsv_qi, xout => i_acl_17_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hsv(MUX,153)@5
    i_acl_18_rgb_to_hsv_s <= i_acl_17_rgb_to_hsv_q;
    i_acl_18_rgb_to_hsv_combproc: PROCESS (i_acl_18_rgb_to_hsv_s, i_acl_16_rgb_to_hsv_vt_join_q, c_i32_1gr_q)
    BEGIN
        CASE (i_acl_18_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_18_rgb_to_hsv_q <= i_acl_16_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_acl_18_rgb_to_hsv_q <= c_i32_1gr_q;
            WHEN OTHERS => i_acl_18_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_18_rgb_to_hsv_vt_select_2(BITSELECT,156)@5
    i_acl_18_rgb_to_hsv_vt_select_2_b <= i_acl_18_rgb_to_hsv_q(2 downto 0);

    -- redist95_i_acl_18_rgb_to_hsv_vt_select_2_b_1(DELAY,1013)
    redist95_i_acl_18_rgb_to_hsv_vt_select_2_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_18_rgb_to_hsv_vt_select_2_b, xout => redist95_i_acl_18_rgb_to_hsv_vt_select_2_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hsv_vt_join(BITJOIN,155)@6
    i_acl_18_rgb_to_hsv_vt_join_q <= i_acl_13_rgb_to_hsv_vt_const_31_q & redist95_i_acl_18_rgb_to_hsv_vt_select_2_b_1_q;

    -- redist82_i_or_cond427_rgb_to_hsv_q_3(DELAY,1000)
    redist82_i_or_cond427_rgb_to_hsv_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond427_rgb_to_hsv_q, xout => redist82_i_or_cond427_rgb_to_hsv_q_3_q, clk => clock, aclr => resetn );

    -- i_acl_19_rgb_to_hsv(MUX,157)@6
    i_acl_19_rgb_to_hsv_s <= redist82_i_or_cond427_rgb_to_hsv_q_3_q;
    i_acl_19_rgb_to_hsv_combproc: PROCESS (i_acl_19_rgb_to_hsv_s, i_acl_18_rgb_to_hsv_vt_join_q, dupName_0_c_i32_0gr_x_q)
    BEGIN
        CASE (i_acl_19_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_19_rgb_to_hsv_q <= i_acl_18_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_acl_19_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
            WHEN OTHERS => i_acl_19_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_19_rgb_to_hsv_vt_select_2(BITSELECT,160)@6
    i_acl_19_rgb_to_hsv_vt_select_2_b <= i_acl_19_rgb_to_hsv_q(2 downto 0);

    -- i_acl_19_rgb_to_hsv_vt_join(BITJOIN,159)@6
    i_acl_19_rgb_to_hsv_vt_join_q <= i_acl_13_rgb_to_hsv_vt_const_31_q & i_acl_19_rgb_to_hsv_vt_select_2_b;

    -- redist92_i_cmp_i_i_i87_rgb_to_hsv_q_1(DELAY,1010)
    redist92_i_cmp_i_i_i87_rgb_to_hsv_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i87_rgb_to_hsv_q, xout => redist92_i_cmp_i_i_i87_rgb_to_hsv_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_rgb_to_hsv_6_rgb_to_hsv(LOGICAL,253)@4
    i_reduction_rgb_to_hsv_6_rgb_to_hsv_q <= i_or_cond427_rgb_to_hsv_q xor redist92_i_cmp_i_i_i87_rgb_to_hsv_q_1_q;

    -- i_reduction_rgb_to_hsv_3_demorgan_rgb_to_hsv(LOGICAL,250)@4
    i_reduction_rgb_to_hsv_3_demorgan_rgb_to_hsv_q <= i_or_cond431_rgb_to_hsv_q or i_or_cond430_rgb_to_hsv_q;

    -- i_reduction_rgb_to_hsv_3_rgb_to_hsv(LOGICAL,251)@4
    i_reduction_rgb_to_hsv_3_rgb_to_hsv_q <= i_reduction_rgb_to_hsv_3_demorgan_rgb_to_hsv_q xor VCC_q;

    -- i_reduction_rgb_to_hsv_5_rgb_to_hsv(LOGICAL,252)@4
    i_reduction_rgb_to_hsv_5_rgb_to_hsv_q <= i_reduction_rgb_to_hsv_0_rgb_to_hsv_q and i_reduction_rgb_to_hsv_3_rgb_to_hsv_q;

    -- i_reduction_rgb_to_hsv_7_rgb_to_hsv(LOGICAL,254)@4 + 1
    i_reduction_rgb_to_hsv_7_rgb_to_hsv_qi <= i_reduction_rgb_to_hsv_5_rgb_to_hsv_q and i_reduction_rgb_to_hsv_6_rgb_to_hsv_q;
    i_reduction_rgb_to_hsv_7_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hsv_7_rgb_to_hsv_qi, xout => i_reduction_rgb_to_hsv_7_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist81_i_reduction_rgb_to_hsv_7_rgb_to_hsv_q_2(DELAY,999)
    redist81_i_reduction_rgb_to_hsv_7_rgb_to_hsv_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hsv_7_rgb_to_hsv_q, xout => redist81_i_reduction_rgb_to_hsv_7_rgb_to_hsv_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hsv(MUX,161)@6
    i_acl_24_rgb_to_hsv_s <= redist81_i_reduction_rgb_to_hsv_7_rgb_to_hsv_q_2_q;
    i_acl_24_rgb_to_hsv_combproc: PROCESS (i_acl_24_rgb_to_hsv_s, i_acl_19_rgb_to_hsv_vt_join_q, c_i32_5gr_q)
    BEGIN
        CASE (i_acl_24_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_24_rgb_to_hsv_q <= i_acl_19_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_acl_24_rgb_to_hsv_q <= c_i32_5gr_q;
            WHEN OTHERS => i_acl_24_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_24_rgb_to_hsv_vt_select_2(BITSELECT,164)@6
    i_acl_24_rgb_to_hsv_vt_select_2_b <= i_acl_24_rgb_to_hsv_q(2 downto 0);

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_inputreg(DELAY,1070)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_24_rgb_to_hsv_vt_select_2_b, xout => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_inputreg_q, clk => clock, aclr => resetn );

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr(REG,1074)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr_q <= "100111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr_q <= STD_LOGIC_VECTOR(redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem(DUALMEM,1072)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ia <= STD_LOGIC_VECTOR(redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_inputreg_q);
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_aa <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_wraddr_q;
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ab <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_rdcnt_q;
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_reset0 <= not (resetn);
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_dmem : altsyncram
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
        clocken1 => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_reset0,
        clock1 => clock,
        address_a => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_aa,
        data_a => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_ab,
        q_b => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_iq
    );
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_q <= redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_iq(2 downto 0);

    -- redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_outputreg(DELAY,1071)
    redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_outputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_mem_q, xout => redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_outputreg_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hsv_vt_join(BITJOIN,163)@49
    i_acl_24_rgb_to_hsv_vt_join_q <= i_acl_13_rgb_to_hsv_vt_const_31_q & redist94_i_acl_24_rgb_to_hsv_vt_select_2_b_43_outputreg_q;

    -- leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x(MUX,632)@49
    leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_s <= VCC_q;
    leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_combproc: PROCESS (leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_s, i_acl_24_rgb_to_hsv_vt_join_q, leftShiftStage0Idx1_uid631_i_unnamed_rgb_to_hsv30_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_q <= i_acl_24_rgb_to_hsv_vt_join_q;
            WHEN "1" => leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_q <= leftShiftStage0Idx1_uid631_i_unnamed_rgb_to_hsv30_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_rgb_to_hsv29_vt_select_18(BITSELECT,277)@49
    i_unnamed_rgb_to_hsv29_vt_select_18_b <= leftShiftStage0_uid633_i_unnamed_rgb_to_hsv30_shift_x_q(18 downto 16);

    -- redist78_i_unnamed_rgb_to_hsv29_vt_select_18_b_2(DELAY,996)
    redist78_i_unnamed_rgb_to_hsv29_vt_select_18_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hsv29_vt_select_18_b, xout => redist78_i_unnamed_rgb_to_hsv29_vt_select_18_b_2_q, clk => clock, aclr => resetn );

    -- i_shl_rgb_to_hsv_vt_const_15(CONSTANT,264)
    i_shl_rgb_to_hsv_vt_const_15_q <= "0000000000000000";

    -- i_unnamed_rgb_to_hsv29_vt_join(BITJOIN,276)@51
    i_unnamed_rgb_to_hsv29_vt_join_q <= i_mul_add66_rgb_to_hsv_vt_const_15_q & redist78_i_unnamed_rgb_to_hsv29_vt_select_18_b_2_q & i_shl_rgb_to_hsv_vt_const_15_q;

    -- i_mul_add66_rgb_to_hsv_BitSelect_for_b(BITSELECT,645)@51
    i_mul_add66_rgb_to_hsv_BitSelect_for_b_b <= i_unnamed_rgb_to_hsv29_vt_join_q(18 downto 16);

    -- i_mul_add66_rgb_to_hsv_BitSelect_for_a(BITSELECT,644)@49
    i_mul_add66_rgb_to_hsv_BitSelect_for_a_b <= i_acl_24_rgb_to_hsv_vt_join_q(2 downto 0);

    -- redist41_i_mul_add66_rgb_to_hsv_BitSelect_for_a_b_2(DELAY,959)
    redist41_i_mul_add66_rgb_to_hsv_BitSelect_for_a_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_add66_rgb_to_hsv_BitSelect_for_a_b, xout => redist41_i_mul_add66_rgb_to_hsv_BitSelect_for_a_b_2_q, clk => clock, aclr => resetn );

    -- i_mul_add66_rgb_to_hsv_join(BITJOIN,646)@51
    i_mul_add66_rgb_to_hsv_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_mul_add66_rgb_to_hsv_BitSelect_for_b_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & redist41_i_mul_add66_rgb_to_hsv_BitSelect_for_a_b_2_q;

    -- i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select(BITSELECT,916)@51
    i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_in <= i_mul_add66_rgb_to_hsv_join_q(18 downto 0);
    i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_b <= i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_in(18 downto 16);
    i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_c <= i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_in(2 downto 0);

    -- i_mul_add66_rgb_to_hsv_vt_join(BITJOIN,223)@51
    i_mul_add66_rgb_to_hsv_vt_join_q <= i_mul_add66_rgb_to_hsv_vt_const_15_q & i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_b & i_mul_add66_rgb_to_hsv_vt_const_15_q & i_mul_add66_rgb_to_hsv_vt_select_18_merged_bit_select_c;

    -- i_conv4_i_i_i_rgb_to_hsv_vt_const_31(CONSTANT,199)
    i_conv4_i_i_i_rgb_to_hsv_vt_const_31_q <= "000000000000000";

    -- c_i17_65535(CONSTANT,131)
    c_i17_65535_q <= "10000000000000001";

    -- i_sub_i_i_i_rgb_to_hsv(SUB,269)@50
    i_sub_i_i_i_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & c_i17_65535_q);
    i_sub_i_i_i_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1_q);
    i_sub_i_i_i_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_i_i_i_rgb_to_hsv_a) - UNSIGNED(i_sub_i_i_i_rgb_to_hsv_b));
    i_sub_i_i_i_rgb_to_hsv_q <= i_sub_i_i_i_rgb_to_hsv_o(17 downto 0);

    -- bgTrunc_i_sub_i_i_i_rgb_to_hsv_sel_x(BITSELECT,5)@50
    bgTrunc_i_sub_i_i_i_rgb_to_hsv_sel_x_b <= STD_LOGIC_VECTOR(i_sub_i_i_i_rgb_to_hsv_q(16 downto 0));

    -- i_add_rgb_to_hsv_vt_const_31(CONSTANT,180)
    i_add_rgb_to_hsv_vt_const_31_q <= "0000000";

    -- cstValOvf_uid328_i_div_rgb_to_hsv(CONSTANT,327)
    cstValOvf_uid328_i_div_rgb_to_hsv_q <= "11111111111111111111111111111111";

    -- rightShiftStage2Idx1Rng1_uid753_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,752)@38
    rightShiftStage2Idx1Rng1_uid753_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 1);

    -- rightShiftStage2Idx1_uid755_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,754)@38
    rightShiftStage2Idx1_uid755_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= GND_q & rightShiftStage2Idx1Rng1_uid753_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage1Idx7Pad14_uid749_prodPostRightShift_uid320_i_div_rgb_to_hsv(CONSTANT,748)
    rightShiftStage1Idx7Pad14_uid749_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= "00000000000000";

    -- rightShiftStage1Idx7Rng14_uid748_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,747)@38
    rightShiftStage1Idx7Rng14_uid748_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 14);

    -- rightShiftStage1Idx7_uid750_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,749)@38
    rightShiftStage1Idx7_uid750_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx7Pad14_uid749_prodPostRightShift_uid320_i_div_rgb_to_hsv_q & rightShiftStage1Idx7Rng14_uid748_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage1Idx6Pad12_uid746_prodPostRightShift_uid320_i_div_rgb_to_hsv(CONSTANT,745)
    rightShiftStage1Idx6Pad12_uid746_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= "000000000000";

    -- rightShiftStage1Idx6Rng12_uid745_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,744)@38
    rightShiftStage1Idx6Rng12_uid745_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 12);

    -- rightShiftStage1Idx6_uid747_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,746)@38
    rightShiftStage1Idx6_uid747_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx6Pad12_uid746_prodPostRightShift_uid320_i_div_rgb_to_hsv_q & rightShiftStage1Idx6Rng12_uid745_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightBottomX_bottomExtension_uid559_pT3_uid405_invPolyEval(CONSTANT,558)
    rightBottomX_bottomExtension_uid559_pT3_uid405_invPolyEval_q <= "0000000000";

    -- rightShiftStage1Idx5Rng10_uid742_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,741)@38
    rightShiftStage1Idx5Rng10_uid742_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 10);

    -- rightShiftStage1Idx5_uid744_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,743)@38
    rightShiftStage1Idx5_uid744_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightBottomX_bottomExtension_uid559_pT3_uid405_invPolyEval_q & rightShiftStage1Idx5Rng10_uid742_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage1Idx4Rng8_uid739_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,738)@38
    rightShiftStage1Idx4Rng8_uid739_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 8);

    -- rightShiftStage1Idx4_uid741_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,740)@38
    rightShiftStage1Idx4_uid741_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= i_conv_i_i3_rgb_to_hsv_vt_const_7_q & rightShiftStage1Idx4Rng8_uid739_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- leftShiftStage1Idx6Pad6_uid683_normY_uid302_i_div_rgb_to_hsv(CONSTANT,682)
    leftShiftStage1Idx6Pad6_uid683_normY_uid302_i_div_rgb_to_hsv_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid736_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,735)@38
    rightShiftStage1Idx3Rng6_uid736_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 6);

    -- rightShiftStage1Idx3_uid738_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,737)@38
    rightShiftStage1Idx3_uid738_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= leftShiftStage1Idx6Pad6_uid683_normY_uid302_i_div_rgb_to_hsv_q & rightShiftStage1Idx3Rng6_uid736_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- zs_uid356_zCount_uid301_i_div_rgb_to_hsv(CONSTANT,355)
    zs_uid356_zCount_uid301_i_div_rgb_to_hsv_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid733_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,732)@38
    rightShiftStage1Idx2Rng4_uid733_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 4);

    -- rightShiftStage1Idx2_uid735_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,734)@38
    rightShiftStage1Idx2_uid735_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= zs_uid356_zCount_uid301_i_div_rgb_to_hsv_q & rightShiftStage1Idx2Rng4_uid733_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- zs_uid362_zCount_uid301_i_div_rgb_to_hsv(CONSTANT,361)
    zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid730_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,729)@38
    rightShiftStage1Idx1Rng2_uid730_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(64 downto 2);

    -- rightShiftStage1Idx1_uid732_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,731)@38
    rightShiftStage1Idx1_uid732_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q & rightShiftStage1Idx1Rng2_uid730_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv(CONSTANT,724)
    rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= "00000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Pad64_uid723_prodPostRightShift_uid320_i_div_rgb_to_hsv(CONSTANT,722)
    rightShiftStage0Idx4Pad64_uid723_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,721)@37
    rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_in <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_in(64 downto 64);

    -- rightShiftStage0Idx4_uid724_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,723)@37
    rightShiftStage0Idx4_uid724_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx4Pad64_uid723_prodPostRightShift_uid320_i_div_rgb_to_hsv_q & rightShiftStage0Idx4Rng64_uid722_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage0Idx3Pad48_uid720_prodPostRightShift_uid320_i_div_rgb_to_hsv(CONSTANT,719)
    rightShiftStage0Idx3Pad48_uid720_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,718)@37
    rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_in <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_in(64 downto 48);

    -- rightShiftStage0Idx3_uid721_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,720)@37
    rightShiftStage0Idx3_uid721_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx3Pad48_uid720_prodPostRightShift_uid320_i_div_rgb_to_hsv_q & rightShiftStage0Idx3Rng48_uid719_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,715)@37
    rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_in <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_in(64 downto 32);

    -- rightShiftStage0Idx2_uid718_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,717)@37
    rightShiftStage0Idx2_uid718_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q & rightShiftStage0Idx2Rng32_uid716_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITSELECT,712)@37
    rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_in <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_b <= rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_in(64 downto 16);

    -- rightShiftStage0Idx1_uid715_prodPostRightShift_uid320_i_div_rgb_to_hsv(BITJOIN,714)@37
    rightShiftStage0Idx1_uid715_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= i_shl_rgb_to_hsv_vt_const_15_q & rightShiftStage0Idx1Rng16_uid713_prodPostRightShift_uid320_i_div_rgb_to_hsv_b;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_UpperBits_for_b(CONSTANT,826)
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_UpperBits_for_b_q <= "00000000000000000";

    -- i_acl_8_zext_rgb_to_hsv_vt_const_31(CONSTANT,174)
    i_acl_8_zext_rgb_to_hsv_vt_const_31_q <= "000000000000000000000000";

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0(BITSELECT,892)
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q(7 downto 0);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel3_0(BITSELECT,896)
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel3_0_b <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q(23 downto 16);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3(MUX,855)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_s <= VCC_q;
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_combproc: PROCESS (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_s, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel3_0_b, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b)
    BEGIN
        CASE (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_s) IS
            WHEN "0" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel3_0_b;
            WHEN "1" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN OTHERS => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_notEnable(LOGICAL,1044)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_nor(LOGICAL,1045)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_nor_q <= not (redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_notEnable_q or redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_q);

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_last(CONSTANT,1041)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_last_q <= "011000";

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp(LOGICAL,1042)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_b <= STD_LOGIC_VECTOR("0" & redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_q);
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_q <= "1" WHEN redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_last_q = redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_b ELSE "0";

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg(REG,1043)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg_q <= STD_LOGIC_VECTOR(redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmp_q);
        END IF;
    END PROCESS;

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena(REG,1046)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_nor_q = "1") THEN
                redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_q <= STD_LOGIC_VECTOR(redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_enaAnd(LOGICAL,1047)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_enaAnd_q <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_sticky_ena_q and VCC_q;

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt(COUNTER,1039)
    -- low=0, high=25, step=1, init=0
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq <= '1';
            ELSE
                redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq <= '0';
            END IF;
            IF (redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_eq = '1') THEN
                redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i + 7;
            ELSE
                redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_i, 5)));

    -- i_red_coerce386387418_green_coerce338339370_rgb_to_hsv(MUX,246)@2
    i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_s <= i_cmp_i_i_rgb_to_hsv_c;
    i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_combproc: PROCESS (i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_s, redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_s) IS
            WHEN "0" => i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_q <= redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_q <= redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv(MUX,245)@2
    i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_s <= i_cmp_i_i186_rgb_to_hsv_c;
    i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_combproc: PROCESS (i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_s, redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_s) IS
            WHEN "0" => i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q <= redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q <= redist96_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv(MUX,218)@2
    i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_s <= i_cmp_i_i179_rgb_to_hsv_c;
    i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_combproc: PROCESS (i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_s, redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_s) IS
            WHEN "0" => i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q <= redist100_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q <= redist98_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_4_rgb_to_hsv(MUX,168)@2
    i_acl_4_rgb_to_hsv_s <= i_or_cond425_rgb_to_hsv_q;
    i_acl_4_rgb_to_hsv_combproc: PROCESS (i_acl_4_rgb_to_hsv_s, i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q, i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q)
    BEGIN
        CASE (i_acl_4_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_4_rgb_to_hsv_q <= i_green_coerce338339370_blue_coerce290291322_rgb_to_hsv_q;
            WHEN "1" => i_acl_4_rgb_to_hsv_q <= i_red_coerce386387418_blue_coerce290291322_rgb_to_hsv_q;
            WHEN OTHERS => i_acl_4_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_7_rgb_to_hsv(MUX,171)@2 + 1
    i_acl_7_rgb_to_hsv_s <= i_or_cond426_not_demorgan_rgb_to_hsv_q;
    i_acl_7_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_7_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_7_rgb_to_hsv_s) IS
                WHEN "0" => i_acl_7_rgb_to_hsv_q <= i_acl_4_rgb_to_hsv_q;
                WHEN "1" => i_acl_7_rgb_to_hsv_q <= i_red_coerce386387418_green_coerce338339370_rgb_to_hsv_q;
                WHEN OTHERS => i_acl_7_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_sub96_rgb_to_hsv(SUB,268)@3
    i_sub96_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & i_acl_7_rgb_to_hsv_q);
    i_sub96_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hsv_q);
    i_sub96_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub96_rgb_to_hsv_a) - UNSIGNED(i_sub96_rgb_to_hsv_b));
    i_sub96_rgb_to_hsv_q <= i_sub96_rgb_to_hsv_o(8 downto 0);

    -- bgTrunc_i_sub96_rgb_to_hsv_sel_x(BITSELECT,4)@3
    bgTrunc_i_sub96_rgb_to_hsv_sel_x_b <= STD_LOGIC_VECTOR(i_sub96_rgb_to_hsv_q(7 downto 0));

    -- i_conv97_rgb_to_hsv_sel_x(BITSELECT,109)@3
    i_conv97_rgb_to_hsv_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_sub96_rgb_to_hsv_sel_x_b(7 downto 0)), 32));

    -- i_conv97_rgb_to_hsv_vt_select_7(BITSELECT,209)@3
    i_conv97_rgb_to_hsv_vt_select_7_b <= i_conv97_rgb_to_hsv_sel_x_b(7 downto 0);

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_inputreg(DELAY,1037)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv97_rgb_to_hsv_vt_select_7_b, xout => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_inputreg_q, clk => clock, aclr => resetn );

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr(REG,1040)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr_q <= "11001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr_q <= STD_LOGIC_VECTOR(redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem(DUALMEM,1038)
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ia <= STD_LOGIC_VECTOR(redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_inputreg_q);
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_aa <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_wraddr_q;
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ab <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_rdcnt_q;
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_reset0 <= not (resetn);
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_dmem : altsyncram
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
        clocken1 => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_reset0,
        clock1 => clock,
        address_a => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_aa,
        data_a => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_ab,
        q_b => redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_iq
    );
    redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_q <= redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_iq(7 downto 0);

    -- i_conv97_rgb_to_hsv_vt_join(BITJOIN,208)@31
    i_conv97_rgb_to_hsv_vt_join_q <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q & redist85_i_conv97_rgb_to_hsv_vt_select_7_b_28_mem_q;

    -- leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x(BITSELECT,620)@31
    leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_in <= i_conv97_rgb_to_hsv_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_b <= leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid622_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x(BITJOIN,621)@31
    leftShiftStage0Idx1_uid622_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_q <= leftShiftStage0Idx1Rng16_uid621_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_b & i_shl_rgb_to_hsv_vt_const_15_q;

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b(BITSELECT,850)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_d <= leftShiftStage0Idx1_uid622_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_q(23 downto 16);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel2_0(BITSELECT,894)
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel2_0_b <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q(15 downto 8);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2(MUX,854)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_s <= VCC_q;
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_combproc: PROCESS (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_s, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel2_0_b, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_d)
    BEGIN
        CASE (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_s) IS
            WHEN "0" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel2_0_b;
            WHEN "1" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_d;
            WHEN OTHERS => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,905)
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b <= i_shl_rgb_to_hsv_vt_const_15_q(7 downto 0);
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c <= i_shl_rgb_to_hsv_vt_const_15_q(15 downto 8);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1(MUX,853)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_s <= VCC_q;
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_combproc: PROCESS (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_s, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c)
    BEGIN
        CASE (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_s) IS
            WHEN "0" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN "1" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c;
            WHEN OTHERS => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a(BITSELECT,851)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_b <= i_conv97_rgb_to_hsv_vt_join_q(7 downto 0);

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0(MUX,852)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_s <= VCC_q;
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_combproc: PROCESS (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_s, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_b, leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b)
    BEGIN
        CASE (leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_s) IS
            WHEN "0" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_a_b;
            WHEN "1" => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b;
            WHEN OTHERS => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitJoin_for_q(BITJOIN,856)@31
    leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitJoin_for_q_q <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p3_q & leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q & leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p1_q & leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p0_q;

    -- i_shl_rgb_to_hsv_vt_select_23(BITSELECT,267)@31
    i_shl_rgb_to_hsv_vt_select_23_b <= leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_BitJoin_for_q_q(23 downto 16);

    -- i_shl_rgb_to_hsv_vt_join(BITJOIN,266)@31
    i_shl_rgb_to_hsv_vt_join_q <= i_conv_i_i3_rgb_to_hsv_vt_const_7_q & i_shl_rgb_to_hsv_vt_select_23_b & i_shl_rgb_to_hsv_vt_const_15_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select(BITSELECT,906)@31
    prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_b <= i_shl_rgb_to_hsv_vt_join_q(17 downto 0);
    prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_c <= i_shl_rgb_to_hsv_vt_join_q(31 downto 18);

    -- oneInvRes_uid315_i_div_rgb_to_hsv(CONSTANT,314)
    oneInvRes_uid315_i_div_rgb_to_hsv_q <= "100000000000000000000000000000000";

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b(BITSELECT,807)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b <= STD_LOGIC_VECTOR(redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1_q(33 downto 33));

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_UpperBits_for_b(BITJOIN,808)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_UpperBits_for_b_q <= lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b & lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_b_b;

    -- leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv(BITSELECT,686)@10
    leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(24 downto 0);
    leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_in(24 downto 0);

    -- leftShiftStage1Idx7_uid688_normY_uid302_i_div_rgb_to_hsv(BITJOIN,687)@10
    leftShiftStage1Idx7_uid688_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx7Rng7_uid687_normY_uid302_i_div_rgb_to_hsv_b & i_add_rgb_to_hsv_vt_const_31_q;

    -- leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv(BITSELECT,683)@10
    leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(25 downto 0);
    leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_in(25 downto 0);

    -- leftShiftStage1Idx6_uid685_normY_uid302_i_div_rgb_to_hsv(BITJOIN,684)@10
    leftShiftStage1Idx6_uid685_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx6Rng6_uid684_normY_uid302_i_div_rgb_to_hsv_b & leftShiftStage1Idx6Pad6_uid683_normY_uid302_i_div_rgb_to_hsv_q;

    -- leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv(BITSELECT,680)@10
    leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(26 downto 0);
    leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_in(26 downto 0);

    -- leftShiftStage1Idx5_uid682_normY_uid302_i_div_rgb_to_hsv(BITJOIN,681)@10
    leftShiftStage1Idx5_uid682_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx5Rng5_uid681_normY_uid302_i_div_rgb_to_hsv_b & i_or_i_i_zext_rgb_to_hsv_vt_const_31_q;

    -- leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv(BITSELECT,677)@10
    leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(27 downto 0);
    leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_in(27 downto 0);

    -- leftShiftStage1Idx4_uid679_normY_uid302_i_div_rgb_to_hsv(BITJOIN,678)@10
    leftShiftStage1Idx4_uid679_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx4Rng4_uid678_normY_uid302_i_div_rgb_to_hsv_b & zs_uid356_zCount_uid301_i_div_rgb_to_hsv_q;

    -- leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv(BITSELECT,674)@10
    leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(28 downto 0);
    leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_in(28 downto 0);

    -- leftShiftStage1Idx3_uid676_normY_uid302_i_div_rgb_to_hsv(BITJOIN,675)@10
    leftShiftStage1Idx3_uid676_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx3Rng3_uid675_normY_uid302_i_div_rgb_to_hsv_b & topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv(BITSELECT,671)@10
    leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(29 downto 0);
    leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_in(29 downto 0);

    -- leftShiftStage1Idx2_uid673_normY_uid302_i_div_rgb_to_hsv(BITJOIN,672)@10
    leftShiftStage1Idx2_uid673_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx2Rng2_uid672_normY_uid302_i_div_rgb_to_hsv_b & zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q;

    -- leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv(BITSELECT,668)@10
    leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_in <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_in(30 downto 0);

    -- leftShiftStage1Idx1_uid670_normY_uid302_i_div_rgb_to_hsv(BITJOIN,669)@10
    leftShiftStage1Idx1_uid670_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx1Rng1_uid669_normY_uid302_i_div_rgb_to_hsv_b & GND_q;

    -- leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv(BITSELECT,659)@9
    leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_in <= redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q(7 downto 0);
    leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_in(7 downto 0);

    -- leftShiftStage0Idx3_uid661_normY_uid302_i_div_rgb_to_hsv(BITJOIN,660)@9
    leftShiftStage0Idx3_uid661_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx3Rng24_uid660_normY_uid302_i_div_rgb_to_hsv_b & i_acl_8_zext_rgb_to_hsv_vt_const_31_q;

    -- leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv(BITSELECT,656)@9
    leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_in <= redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q(15 downto 0);
    leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_in(15 downto 0);

    -- leftShiftStage0Idx2_uid658_normY_uid302_i_div_rgb_to_hsv(BITJOIN,657)@9
    leftShiftStage0Idx2_uid658_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx2Rng16_uid657_normY_uid302_i_div_rgb_to_hsv_b & i_shl_rgb_to_hsv_vt_const_15_q;

    -- leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv(BITSELECT,653)@9
    leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_in <= redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q(23 downto 0);
    leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_b <= leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_in(23 downto 0);

    -- leftShiftStage0Idx1_uid655_normY_uid302_i_div_rgb_to_hsv(BITJOIN,654)@9
    leftShiftStage0Idx1_uid655_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx1Rng8_uid654_normY_uid302_i_div_rgb_to_hsv_b & i_conv_i_i3_rgb_to_hsv_vt_const_7_q;

    -- i_sub_rgb_to_hsv(SUB,270)@3
    i_sub_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & i_acl_8_rgb_to_hsv_q);
    i_sub_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hsv_q);
    i_sub_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_rgb_to_hsv_a) - UNSIGNED(i_sub_rgb_to_hsv_b));
    i_sub_rgb_to_hsv_q <= i_sub_rgb_to_hsv_o(8 downto 0);

    -- bgTrunc_i_sub_rgb_to_hsv_sel_x(BITSELECT,6)@3
    bgTrunc_i_sub_rgb_to_hsv_sel_x_b <= STD_LOGIC_VECTOR(i_sub_rgb_to_hsv_q(7 downto 0));

    -- redist104_bgTrunc_i_sub_rgb_to_hsv_sel_x_b_1(DELAY,1022)
    redist104_bgTrunc_i_sub_rgb_to_hsv_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_rgb_to_hsv_sel_x_b, xout => redist104_bgTrunc_i_sub_rgb_to_hsv_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv52_rgb_to_hsv_sel_x(BITSELECT,108)@4
    i_conv52_rgb_to_hsv_sel_x_b <= std_logic_vector(resize(unsigned(redist104_bgTrunc_i_sub_rgb_to_hsv_sel_x_b_1_q(7 downto 0)), 32));

    -- i_conv52_rgb_to_hsv_vt_select_7(BITSELECT,205)@4
    i_conv52_rgb_to_hsv_vt_select_7_b <= i_conv52_rgb_to_hsv_sel_x_b(7 downto 0);

    -- i_conv52_rgb_to_hsv_vt_join(BITJOIN,204)@4
    i_conv52_rgb_to_hsv_vt_join_q <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q & i_conv52_rgb_to_hsv_vt_select_7_b;

    -- redist86_i_conv52_rgb_to_hsv_vt_join_q_1(DELAY,1004)
    redist86_i_conv52_rgb_to_hsv_vt_join_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv52_rgb_to_hsv_vt_join_q, xout => redist86_i_conv52_rgb_to_hsv_vt_join_q_1_q, clk => clock, aclr => resetn );

    -- redist87_i_conv52_rgb_to_hsv_vt_join_q_5(DELAY,1005)
    redist87_i_conv52_rgb_to_hsv_vt_join_q_5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist86_i_conv52_rgb_to_hsv_vt_join_q_1_q, xout => redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q, clk => clock, aclr => resetn );

    -- vCount_uid340_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,339)@4 + 1
    vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_qi <= "1" WHEN i_conv52_rgb_to_hsv_vt_join_q = dupName_0_c_i32_0gr_x_q ELSE "0";
    vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_qi, xout => vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist68_vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q_5(DELAY,986)
    redist68_vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist68_vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q_5_q, clk => clock, aclr => resetn );

    -- vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv(MUX,342)@5
    vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_s <= vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q;
    vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_combproc: PROCESS (vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_s, redist86_i_conv52_rgb_to_hsv_vt_join_q_1_q, cstValOvf_uid328_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_s) IS
            WHEN "0" => vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q <= redist86_i_conv52_rgb_to_hsv_vt_join_q_1_q;
            WHEN "1" => vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q <= cstValOvf_uid328_i_div_rgb_to_hsv_q;
            WHEN OTHERS => vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,911)@5
    rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b <= vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q(31 downto 16);
    rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c <= vStagei_uid343_zCount_uid301_i_div_rgb_to_hsv_q(15 downto 0);

    -- vCount_uid346_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,345)@5 + 1
    vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_qi <= "1" WHEN rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b = i_shl_rgb_to_hsv_vt_const_15_q ELSE "0";
    vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_qi, xout => vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist67_vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q_4(DELAY,985)
    redist67_vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist67_vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q_4_q, clk => clock, aclr => resetn );

    -- redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1(DELAY,922)
    redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c, xout => redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1(DELAY,921)
    redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b, xout => redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv(MUX,348)@6
    vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_s <= vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q;
    vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_combproc: PROCESS (vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_s, redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q, redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_s) IS
            WHEN "0" => vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q <= redist3_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q <= redist4_rVStage_uid345_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,912)@6
    rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b <= vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q(15 downto 8);
    rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c <= vStagei_uid349_zCount_uid301_i_div_rgb_to_hsv_q(7 downto 0);

    -- vCount_uid352_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,351)@6 + 1
    vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_qi <= "1" WHEN rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b = i_conv_i_i3_rgb_to_hsv_vt_const_7_q ELSE "0";
    vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_qi, xout => vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist66_vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q_3(DELAY,984)
    redist66_vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist66_vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q_3_q, clk => clock, aclr => resetn );

    -- redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1(DELAY,920)
    redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c, xout => redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1(DELAY,919)
    redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b, xout => redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv(MUX,354)@7
    vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_s <= vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q;
    vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_combproc: PROCESS (vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_s, redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q, redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_s) IS
            WHEN "0" => vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q <= redist1_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q <= redist2_rVStage_uid351_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,913)@7
    rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b <= vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q(7 downto 4);
    rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c <= vStagei_uid355_zCount_uid301_i_div_rgb_to_hsv_q(3 downto 0);

    -- vCount_uid358_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,357)@7
    vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q <= "1" WHEN rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b = zs_uid356_zCount_uid301_i_div_rgb_to_hsv_q ELSE "0";

    -- redist65_vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q_2(DELAY,983)
    redist65_vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist65_vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q_2_q, clk => clock, aclr => resetn );

    -- vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv(MUX,360)@7 + 1
    vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_s <= vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q;
    vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_s) IS
                WHEN "0" => vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q <= rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b;
                WHEN "1" => vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q <= rVStage_uid357_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,914)@8
    rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b <= vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q(3 downto 2);
    rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c <= vStagei_uid361_zCount_uid301_i_div_rgb_to_hsv_q(1 downto 0);

    -- vCount_uid364_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,363)@8
    vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q <= "1" WHEN rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b = zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q ELSE "0";

    -- redist64_vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q_1(DELAY,982)
    redist64_vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist64_vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv(MUX,366)@8
    vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_s <= vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q;
    vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_combproc: PROCESS (vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_s, rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b, rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_s) IS
            WHEN "0" => vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_q <= rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_b;
            WHEN "1" => vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_q <= rVStage_uid363_zCount_uid301_i_div_rgb_to_hsv_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv(BITSELECT,368)@8
    rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b <= vStagei_uid367_zCount_uid301_i_div_rgb_to_hsv_q(1 downto 1);

    -- redist63_rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b_1(DELAY,981)
    redist63_rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b, xout => redist63_rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b_1_q, clk => clock, aclr => resetn );

    -- vCount_uid370_zCount_uid301_i_div_rgb_to_hsv(LOGICAL,369)@9
    vCount_uid370_zCount_uid301_i_div_rgb_to_hsv_q <= "1" WHEN redist63_rVStage_uid369_zCount_uid301_i_div_rgb_to_hsv_b_1_q = GND_q ELSE "0";

    -- r_uid371_zCount_uid301_i_div_rgb_to_hsv(BITJOIN,370)@9
    r_uid371_zCount_uid301_i_div_rgb_to_hsv_q <= redist68_vCount_uid340_zCount_uid301_i_div_rgb_to_hsv_q_5_q & redist67_vCount_uid346_zCount_uid301_i_div_rgb_to_hsv_q_4_q & redist66_vCount_uid352_zCount_uid301_i_div_rgb_to_hsv_q_3_q & redist65_vCount_uid358_zCount_uid301_i_div_rgb_to_hsv_q_2_q & redist64_vCount_uid364_zCount_uid301_i_div_rgb_to_hsv_q_1_q & vCount_uid370_zCount_uid301_i_div_rgb_to_hsv_q;

    -- leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,915)@9
    leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_b <= r_uid371_zCount_uid301_i_div_rgb_to_hsv_q(5 downto 3);
    leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c <= r_uid371_zCount_uid301_i_div_rgb_to_hsv_q(2 downto 0);

    -- leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv(MUX,666)@9 + 1
    leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_s <= leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_b;
    leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_s) IS
                WHEN "000" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q;
                WHEN "001" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx1_uid655_normY_uid302_i_div_rgb_to_hsv_q;
                WHEN "010" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx2_uid658_normY_uid302_i_div_rgb_to_hsv_q;
                WHEN "011" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0Idx3_uid661_normY_uid302_i_div_rgb_to_hsv_q;
                WHEN "100" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
                WHEN "101" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
                WHEN "110" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
                WHEN "111" => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
                WHEN OTHERS => leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c_1(DELAY,918)
    redist0_leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c, xout => redist0_leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv(MUX,689)@10
    leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_s <= redist0_leftShiftStageSel5Dto3_uid666_normY_uid302_i_div_rgb_to_hsv_merged_bit_select_c_1_q;
    leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_combproc: PROCESS (leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_s, leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx1_uid670_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx2_uid673_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx3_uid676_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx4_uid679_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx5_uid682_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx6_uid685_normY_uid302_i_div_rgb_to_hsv_q, leftShiftStage1Idx7_uid688_normY_uid302_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_s) IS
            WHEN "000" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage0_uid667_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "001" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx1_uid670_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "010" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx2_uid673_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "011" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx3_uid676_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "100" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx4_uid679_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "101" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx5_uid682_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "110" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx6_uid685_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN "111" => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= leftShiftStage1Idx7_uid688_normY_uid302_i_div_rgb_to_hsv_q;
            WHEN OTHERS => leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid303_i_div_rgb_to_hsv(BITSELECT,302)@10
    normYNoLeadOne_uid303_i_div_rgb_to_hsv_in <= leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q(30 downto 0);
    normYNoLeadOne_uid303_i_div_rgb_to_hsv_b <= normYNoLeadOne_uid303_i_div_rgb_to_hsv_in(30 downto 0);

    -- yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,907)@10
    yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b <= normYNoLeadOne_uid303_i_div_rgb_to_hsv_b(30 downto 23);
    yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c <= normYNoLeadOne_uid303_i_div_rgb_to_hsv_b(22 downto 0);

    -- memoryC3_uid383_invTabGen_lutmem(DUALMEM,781)@10 + 2
    -- in j@20000000
    memoryC3_uid383_invTabGen_lutmem_aa <= yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b;
    memoryC3_uid383_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC3_uid383_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enA4ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid383_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC3_uid383_invTabGen_lutmem_aa,
        q_a => memoryC3_uid383_invTabGen_lutmem_ir
    );
    memoryC3_uid383_invTabGen_lutmem_r <= memoryC3_uid383_invTabGen_lutmem_ir(13 downto 0);

    -- redist29_memoryC3_uid383_invTabGen_lutmem_r_1(DELAY,947)
    redist29_memoryC3_uid383_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC3_uid383_invTabGen_lutmem_r, xout => redist29_memoryC3_uid383_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval(CONSTANT,427)
    topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q <= "000";

    -- topRangeY_mergedSignalTM_uid430_pT1_uid391_invPolyEval(BITJOIN,429)@13
    topRangeY_mergedSignalTM_uid430_pT1_uid391_invPolyEval_q <= redist29_memoryC3_uid383_invTabGen_lutmem_r_1_q & topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q;

    -- redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3(DELAY,928)
    redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c, xout => redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3_q, clk => clock, aclr => resetn );

    -- yT1_uid390_invPolyEval(BITSELECT,389)@13
    yT1_uid390_invPolyEval_b <= redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3_q(22 downto 9);

    -- nx_mergedSignalTM_uid414_pT1_uid391_invPolyEval(BITJOIN,413)@13
    nx_mergedSignalTM_uid414_pT1_uid391_invPolyEval_q <= GND_q & yT1_uid390_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid426_pT1_uid391_invPolyEval(BITJOIN,425)@13
    topRangeX_mergedSignalTM_uid426_pT1_uid391_invPolyEval_q <= nx_mergedSignalTM_uid414_pT1_uid391_invPolyEval_q & zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q;

    -- sm0_uid432_pT1_uid391_invPolyEval(MULT,431)@13 + 2
    sm0_uid432_pT1_uid391_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid426_pT1_uid391_invPolyEval_q);
    sm0_uid432_pT1_uid391_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid430_pT1_uid391_invPolyEval_q);
    sm0_uid432_pT1_uid391_invPolyEval_reset <= not (resetn);
    sm0_uid432_pT1_uid391_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid432_pT1_uid391_invPolyEval_a0,
        datab => sm0_uid432_pT1_uid391_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid432_pT1_uid391_invPolyEval_reset,
        clock => clock,
        result => sm0_uid432_pT1_uid391_invPolyEval_s1
    );
    sm0_uid432_pT1_uid391_invPolyEval_q <= sm0_uid432_pT1_uid391_invPolyEval_s1;

    -- osig_uid433_pT1_uid391_invPolyEval(BITSELECT,432)@15
    osig_uid433_pT1_uid391_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid432_pT1_uid391_invPolyEval_q(32 downto 0));
    osig_uid433_pT1_uid391_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid433_pT1_uid391_invPolyEval_in(32 downto 18));

    -- redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3(DELAY,925)
    redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b, xout => redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3_q, clk => clock, aclr => resetn );

    -- memoryC2_uid380_invTabGen_lutmem(DUALMEM,780)@13 + 2
    -- in j@20000000
    memoryC2_uid380_invTabGen_lutmem_aa <= redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3_q;
    memoryC2_uid380_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC2_uid380_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enA3ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid380_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC2_uid380_invTabGen_lutmem_aa,
        q_a => memoryC2_uid380_invTabGen_lutmem_ir
    );
    memoryC2_uid380_invTabGen_lutmem_r <= memoryC2_uid380_invTabGen_lutmem_ir(20 downto 0);

    -- rndBit_uid392_invPolyEval(CONSTANT,391)
    rndBit_uid392_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid393_invPolyEval(BITJOIN,392)@15
    cIncludingRoundingBit_uid393_invPolyEval_q <= memoryC2_uid380_invTabGen_lutmem_r & rndBit_uid392_invPolyEval_q;

    -- ts1_uid395_invPolyEval(ADD,394)@15
    ts1_uid395_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid393_invPolyEval_q(22)) & cIncludingRoundingBit_uid393_invPolyEval_q));
    ts1_uid395_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid433_pT1_uid391_invPolyEval_b(14)) & osig_uid433_pT1_uid391_invPolyEval_b));
    ts1_uid395_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid395_invPolyEval_a) + SIGNED(ts1_uid395_invPolyEval_b));
    ts1_uid395_invPolyEval_q <= ts1_uid395_invPolyEval_o(23 downto 0);

    -- s1_uid396_invPolyEval(BITSELECT,395)@15
    s1_uid396_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid395_invPolyEval_q(23 downto 1));

    -- redist61_s1_uid396_invPolyEval_b_1(DELAY,979)
    redist61_s1_uid396_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s1_uid396_invPolyEval_b, xout => redist61_s1_uid396_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid469_pT2_uid398_invPolyEval(BITSELECT,468)@16
    aboveLeftY_uid469_pT2_uid398_invPolyEval_in <= redist61_s1_uid396_invPolyEval_b_1_q(14 downto 0);
    aboveLeftY_uid469_pT2_uid398_invPolyEval_b <= aboveLeftY_uid469_pT2_uid398_invPolyEval_in(14 downto 10);

    -- n1_uid477_pT2_uid398_invPolyEval(BITSELECT,476)@16
    n1_uid477_pT2_uid398_invPolyEval_b <= aboveLeftY_uid469_pT2_uid398_invPolyEval_b(4 downto 1);

    -- n1_uid485_pT2_uid398_invPolyEval(BITSELECT,484)@16
    n1_uid485_pT2_uid398_invPolyEval_b <= n1_uid477_pT2_uid398_invPolyEval_b(3 downto 1);

    -- redist59_n1_uid485_pT2_uid398_invPolyEval_b_2(DELAY,977)
    redist59_n1_uid485_pT2_uid398_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n1_uid485_pT2_uid398_invPolyEval_b, xout => redist59_n1_uid485_pT2_uid398_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6(DELAY,929)
    redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_3_q, xout => redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6_q, clk => clock, aclr => resetn );

    -- yT2_uid397_invPolyEval(BITSELECT,396)@16
    yT2_uid397_invPolyEval_b <= redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6_q(22 downto 2);

    -- nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval(BITJOIN,436)@16
    nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q <= GND_q & yT2_uid397_invPolyEval_b;

    -- aboveLeftX_uid468_pT2_uid398_invPolyEval(BITSELECT,467)@16
    aboveLeftX_uid468_pT2_uid398_invPolyEval_in <= nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q(4 downto 0);
    aboveLeftX_uid468_pT2_uid398_invPolyEval_b <= aboveLeftX_uid468_pT2_uid398_invPolyEval_in(4 downto 0);

    -- n0_uid478_pT2_uid398_invPolyEval(BITSELECT,477)@16
    n0_uid478_pT2_uid398_invPolyEval_b <= aboveLeftX_uid468_pT2_uid398_invPolyEval_b(4 downto 1);

    -- n0_uid486_pT2_uid398_invPolyEval(BITSELECT,485)@16
    n0_uid486_pT2_uid398_invPolyEval_b <= n0_uid478_pT2_uid398_invPolyEval_b(3 downto 1);

    -- redist58_n0_uid486_pT2_uid398_invPolyEval_b_2(DELAY,976)
    redist58_n0_uid486_pT2_uid398_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n0_uid486_pT2_uid398_invPolyEval_b, xout => redist58_n0_uid486_pT2_uid398_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- sm1_uid501_pT2_uid398_invPolyEval(MULT,500)@18 + 2
    sm1_uid501_pT2_uid398_invPolyEval_a0 <= redist58_n0_uid486_pT2_uid398_invPolyEval_b_2_q;
    sm1_uid501_pT2_uid398_invPolyEval_b0 <= redist59_n1_uid485_pT2_uid398_invPolyEval_b_2_q;
    sm1_uid501_pT2_uid398_invPolyEval_reset <= not (resetn);
    sm1_uid501_pT2_uid398_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid501_pT2_uid398_invPolyEval_a0,
        datab => sm1_uid501_pT2_uid398_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid501_pT2_uid398_invPolyEval_reset,
        clock => clock,
        result => sm1_uid501_pT2_uid398_invPolyEval_s1
    );
    sm1_uid501_pT2_uid398_invPolyEval_q <= sm1_uid501_pT2_uid398_invPolyEval_s1;

    -- redist55_sm1_uid501_pT2_uid398_invPolyEval_q_1(DELAY,973)
    redist55_sm1_uid501_pT2_uid398_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid501_pT2_uid398_invPolyEval_q, xout => redist55_sm1_uid501_pT2_uid398_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- rightBottomY_uid467_pT2_uid398_invPolyEval(BITSELECT,466)@16
    rightBottomY_uid467_pT2_uid398_invPolyEval_in <= redist61_s1_uid396_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid467_pT2_uid398_invPolyEval_b <= rightBottomY_uid467_pT2_uid398_invPolyEval_in(5 downto 1);

    -- n1_uid475_pT2_uid398_invPolyEval(BITSELECT,474)@16
    n1_uid475_pT2_uid398_invPolyEval_b <= rightBottomY_uid467_pT2_uid398_invPolyEval_b(4 downto 1);

    -- n1_uid483_pT2_uid398_invPolyEval(BITSELECT,482)@16
    n1_uid483_pT2_uid398_invPolyEval_b <= n1_uid475_pT2_uid398_invPolyEval_b(3 downto 1);

    -- rightBottomX_uid466_pT2_uid398_invPolyEval(BITSELECT,465)@16
    rightBottomX_uid466_pT2_uid398_invPolyEval_in <= nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q(13 downto 0);
    rightBottomX_uid466_pT2_uid398_invPolyEval_b <= rightBottomX_uid466_pT2_uid398_invPolyEval_in(13 downto 9);

    -- n0_uid476_pT2_uid398_invPolyEval(BITSELECT,475)@16
    n0_uid476_pT2_uid398_invPolyEval_b <= rightBottomX_uid466_pT2_uid398_invPolyEval_b(4 downto 1);

    -- n0_uid484_pT2_uid398_invPolyEval(BITSELECT,483)@16
    n0_uid484_pT2_uid398_invPolyEval_b <= n0_uid476_pT2_uid398_invPolyEval_b(3 downto 1);

    -- sm0_uid500_pT2_uid398_invPolyEval(MULT,499)@16 + 2
    sm0_uid500_pT2_uid398_invPolyEval_a0 <= n0_uid484_pT2_uid398_invPolyEval_b;
    sm0_uid500_pT2_uid398_invPolyEval_b0 <= n1_uid483_pT2_uid398_invPolyEval_b;
    sm0_uid500_pT2_uid398_invPolyEval_reset <= not (resetn);
    sm0_uid500_pT2_uid398_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid500_pT2_uid398_invPolyEval_a0,
        datab => sm0_uid500_pT2_uid398_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid500_pT2_uid398_invPolyEval_reset,
        clock => clock,
        result => sm0_uid500_pT2_uid398_invPolyEval_s1
    );
    sm0_uid500_pT2_uid398_invPolyEval_q <= sm0_uid500_pT2_uid398_invPolyEval_s1;

    -- rightBottomY_uid462_pT2_uid398_invPolyEval(BITSELECT,461)@16
    rightBottomY_uid462_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(redist61_s1_uid396_invPolyEval_b_1_q(22 downto 15));

    -- rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval(BITSELECT,458)@16
    rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q(4 downto 0));
    rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_in(4 downto 0));

    -- rightBottomX_mergedSignalTM_uid460_pT2_uid398_invPolyEval(BITJOIN,459)@16
    rightBottomX_mergedSignalTM_uid460_pT2_uid398_invPolyEval_q <= rightBottomX_bottomRange_uid459_pT2_uid398_invPolyEval_b & topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q;

    -- sm1_uid499_pT2_uid398_invPolyEval(MULT,498)@16 + 2
    sm1_uid499_pT2_uid398_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid460_pT2_uid398_invPolyEval_q;
    sm1_uid499_pT2_uid398_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid462_pT2_uid398_invPolyEval_b);
    sm1_uid499_pT2_uid398_invPolyEval_reset <= not (resetn);
    sm1_uid499_pT2_uid398_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid499_pT2_uid398_invPolyEval_a0,
        datab => sm1_uid499_pT2_uid398_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid499_pT2_uid398_invPolyEval_reset,
        clock => clock,
        result => sm1_uid499_pT2_uid398_invPolyEval_s1
    );
    sm1_uid499_pT2_uid398_invPolyEval_q <= sm1_uid499_pT2_uid398_invPolyEval_s1(15 downto 0);

    -- highABits_uid507_pT2_uid398_invPolyEval(BITSELECT,506)@18
    highABits_uid507_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(sm1_uid499_pT2_uid398_invPolyEval_q(15 downto 2));

    -- lev1_a1high_uid508_pT2_uid398_invPolyEval(ADD,507)@18 + 1
    lev1_a1high_uid508_pT2_uid398_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid507_pT2_uid398_invPolyEval_b(13)) & highABits_uid507_pT2_uid398_invPolyEval_b));
    lev1_a1high_uid508_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & sm0_uid500_pT2_uid398_invPolyEval_q));
    lev1_a1high_uid508_pT2_uid398_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a1high_uid508_pT2_uid398_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a1high_uid508_pT2_uid398_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1high_uid508_pT2_uid398_invPolyEval_a) + SIGNED(lev1_a1high_uid508_pT2_uid398_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid508_pT2_uid398_invPolyEval_q <= lev1_a1high_uid508_pT2_uid398_invPolyEval_o(14 downto 0);

    -- redist52_lev1_a1high_uid508_pT2_uid398_invPolyEval_q_2(DELAY,970)
    redist52_lev1_a1high_uid508_pT2_uid398_invPolyEval_q_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev1_a1high_uid508_pT2_uid398_invPolyEval_q, xout => redist52_lev1_a1high_uid508_pT2_uid398_invPolyEval_q_2_q, clk => clock, aclr => resetn );

    -- lowRangeA_uid506_pT2_uid398_invPolyEval(BITSELECT,505)@18
    lowRangeA_uid506_pT2_uid398_invPolyEval_in <= sm1_uid499_pT2_uid398_invPolyEval_q(1 downto 0);
    lowRangeA_uid506_pT2_uid398_invPolyEval_b <= lowRangeA_uid506_pT2_uid398_invPolyEval_in(1 downto 0);

    -- redist53_lowRangeA_uid506_pT2_uid398_invPolyEval_b_2(DELAY,971)
    redist53_lowRangeA_uid506_pT2_uid398_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid506_pT2_uid398_invPolyEval_b, xout => redist53_lowRangeA_uid506_pT2_uid398_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- lev1_a1_uid509_pT2_uid398_invPolyEval(BITJOIN,508)@20
    lev1_a1_uid509_pT2_uid398_invPolyEval_q <= redist52_lev1_a1high_uid508_pT2_uid398_invPolyEval_q_2_q & redist53_lowRangeA_uid506_pT2_uid398_invPolyEval_b_2_q;

    -- aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval(BITSELECT,454)@16
    aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_in <= STD_LOGIC_VECTOR(redist61_s1_uid396_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid456_pT2_uid398_invPolyEval(BITJOIN,455)@16
    aboveLeftY_mergedSignalTM_uid456_pT2_uid398_invPolyEval_q <= aboveLeftY_bottomRange_uid455_pT2_uid398_invPolyEval_b & zs_uid362_zCount_uid301_i_div_rgb_to_hsv_q;

    -- aboveLeftX_uid453_pT2_uid398_invPolyEval(BITSELECT,452)@16
    aboveLeftX_uid453_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q(21 downto 14));

    -- sm0_uid498_pT2_uid398_invPolyEval(MULT,497)@16 + 2
    sm0_uid498_pT2_uid398_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid453_pT2_uid398_invPolyEval_b);
    sm0_uid498_pT2_uid398_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid456_pT2_uid398_invPolyEval_q;
    sm0_uid498_pT2_uid398_invPolyEval_reset <= not (resetn);
    sm0_uid498_pT2_uid398_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid498_pT2_uid398_invPolyEval_a0,
        datab => sm0_uid498_pT2_uid398_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid498_pT2_uid398_invPolyEval_reset,
        clock => clock,
        result => sm0_uid498_pT2_uid398_invPolyEval_s1
    );
    sm0_uid498_pT2_uid398_invPolyEval_q <= sm0_uid498_pT2_uid398_invPolyEval_s1(15 downto 0);

    -- redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1(DELAY,974)
    redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid498_pT2_uid398_invPolyEval_q, xout => redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid448_pT2_uid398_invPolyEval(BITSELECT,447)@16
    topRangeY_uid448_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(redist61_s1_uid396_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_uid447_pT2_uid398_invPolyEval(BITSELECT,446)@16
    topRangeX_uid447_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid437_pT2_uid398_invPolyEval_q(21 downto 5));

    -- sm0_uid497_pT2_uid398_invPolyEval(MULT,496)@16 + 2
    sm0_uid497_pT2_uid398_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid447_pT2_uid398_invPolyEval_b);
    sm0_uid497_pT2_uid398_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid448_pT2_uid398_invPolyEval_b);
    sm0_uid497_pT2_uid398_invPolyEval_reset <= not (resetn);
    sm0_uid497_pT2_uid398_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid497_pT2_uid398_invPolyEval_a0,
        datab => sm0_uid497_pT2_uid398_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid497_pT2_uid398_invPolyEval_reset,
        clock => clock,
        result => sm0_uid497_pT2_uid398_invPolyEval_s1
    );
    sm0_uid497_pT2_uid398_invPolyEval_q <= sm0_uid497_pT2_uid398_invPolyEval_s1;

    -- redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1(DELAY,975)
    redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid497_pT2_uid398_invPolyEval_q, xout => redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highABits_uid503_pT2_uid398_invPolyEval(BITSELECT,502)@19
    highABits_uid503_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1_q(33 downto 1));

    -- lev1_a0high_uid504_pT2_uid398_invPolyEval(ADD,503)@19 + 1
    lev1_a0high_uid504_pT2_uid398_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid503_pT2_uid398_invPolyEval_b(32)) & highABits_uid503_pT2_uid398_invPolyEval_b));
    lev1_a0high_uid504_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1_q(15)) & redist56_sm0_uid498_pT2_uid398_invPolyEval_q_1_q));
    lev1_a0high_uid504_pT2_uid398_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0high_uid504_pT2_uid398_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0high_uid504_pT2_uid398_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid504_pT2_uid398_invPolyEval_a) + SIGNED(lev1_a0high_uid504_pT2_uid398_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0high_uid504_pT2_uid398_invPolyEval_q <= lev1_a0high_uid504_pT2_uid398_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid502_pT2_uid398_invPolyEval(BITSELECT,501)@19
    lowRangeA_uid502_pT2_uid398_invPolyEval_in <= redist57_sm0_uid497_pT2_uid398_invPolyEval_q_1_q(0 downto 0);
    lowRangeA_uid502_pT2_uid398_invPolyEval_b <= lowRangeA_uid502_pT2_uid398_invPolyEval_in(0 downto 0);

    -- redist54_lowRangeA_uid502_pT2_uid398_invPolyEval_b_1(DELAY,972)
    redist54_lowRangeA_uid502_pT2_uid398_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid502_pT2_uid398_invPolyEval_b, xout => redist54_lowRangeA_uid502_pT2_uid398_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid505_pT2_uid398_invPolyEval(BITJOIN,504)@20
    lev1_a0_uid505_pT2_uid398_invPolyEval_q <= lev1_a0high_uid504_pT2_uid398_invPolyEval_q & redist54_lowRangeA_uid502_pT2_uid398_invPolyEval_b_1_q;

    -- highABits_uid511_pT2_uid398_invPolyEval(BITSELECT,510)@20
    highABits_uid511_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid505_pT2_uid398_invPolyEval_q(34 downto 1));

    -- lev2_a0high_uid512_pT2_uid398_invPolyEval(ADD,511)@20
    lev2_a0high_uid512_pT2_uid398_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => highABits_uid511_pT2_uid398_invPolyEval_b(33)) & highABits_uid511_pT2_uid398_invPolyEval_b));
    lev2_a0high_uid512_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 17 => lev1_a1_uid509_pT2_uid398_invPolyEval_q(16)) & lev1_a1_uid509_pT2_uid398_invPolyEval_q));
    lev2_a0high_uid512_pT2_uid398_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid512_pT2_uid398_invPolyEval_a) + SIGNED(lev2_a0high_uid512_pT2_uid398_invPolyEval_b));
    lev2_a0high_uid512_pT2_uid398_invPolyEval_q <= lev2_a0high_uid512_pT2_uid398_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid510_pT2_uid398_invPolyEval(BITSELECT,509)@20
    lowRangeA_uid510_pT2_uid398_invPolyEval_in <= lev1_a0_uid505_pT2_uid398_invPolyEval_q(0 downto 0);
    lowRangeA_uid510_pT2_uid398_invPolyEval_b <= lowRangeA_uid510_pT2_uid398_invPolyEval_in(0 downto 0);

    -- lev2_a0_uid513_pT2_uid398_invPolyEval(BITJOIN,512)@20
    lev2_a0_uid513_pT2_uid398_invPolyEval_q <= lev2_a0high_uid512_pT2_uid398_invPolyEval_q & lowRangeA_uid510_pT2_uid398_invPolyEval_b;

    -- highABits_uid515_pT2_uid398_invPolyEval(BITSELECT,514)@20
    highABits_uid515_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(lev2_a0_uid513_pT2_uid398_invPolyEval_q(35 downto 3));

    -- redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1(DELAY,968)
    redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => highABits_uid515_pT2_uid398_invPolyEval_b, xout => redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0high_uid516_pT2_uid398_invPolyEval(ADD,515)@21
    lev3_a0high_uid516_pT2_uid398_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1_q(32)) & redist50_highABits_uid515_pT2_uid398_invPolyEval_b_1_q));
    lev3_a0high_uid516_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & redist55_sm1_uid501_pT2_uid398_invPolyEval_q_1_q));
    lev3_a0high_uid516_pT2_uid398_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0high_uid516_pT2_uid398_invPolyEval_a) + SIGNED(lev3_a0high_uid516_pT2_uid398_invPolyEval_b));
    lev3_a0high_uid516_pT2_uid398_invPolyEval_q <= lev3_a0high_uid516_pT2_uid398_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid514_pT2_uid398_invPolyEval(BITSELECT,513)@20
    lowRangeA_uid514_pT2_uid398_invPolyEval_in <= lev2_a0_uid513_pT2_uid398_invPolyEval_q(2 downto 0);
    lowRangeA_uid514_pT2_uid398_invPolyEval_b <= lowRangeA_uid514_pT2_uid398_invPolyEval_in(2 downto 0);

    -- redist51_lowRangeA_uid514_pT2_uid398_invPolyEval_b_1(DELAY,969)
    redist51_lowRangeA_uid514_pT2_uid398_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid514_pT2_uid398_invPolyEval_b, xout => redist51_lowRangeA_uid514_pT2_uid398_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0_uid517_pT2_uid398_invPolyEval(BITJOIN,516)@21
    lev3_a0_uid517_pT2_uid398_invPolyEval_q <= lev3_a0high_uid516_pT2_uid398_invPolyEval_q & redist51_lowRangeA_uid514_pT2_uid398_invPolyEval_b_1_q;

    -- osig_uid518_pT2_uid398_invPolyEval(BITSELECT,517)@21
    osig_uid518_pT2_uid398_invPolyEval_in <= STD_LOGIC_VECTOR(lev3_a0_uid517_pT2_uid398_invPolyEval_q(32 downto 0));
    osig_uid518_pT2_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid518_pT2_uid398_invPolyEval_in(32 downto 9));

    -- redist49_osig_uid518_pT2_uid398_invPolyEval_b_1(DELAY,967)
    redist49_osig_uid518_pT2_uid398_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid518_pT2_uid398_invPolyEval_b, xout => redist49_osig_uid518_pT2_uid398_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9(DELAY,926)
    redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_3_q, xout => redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9_q, clk => clock, aclr => resetn );

    -- memoryC1_uid377_invTabGen_lutmem(DUALMEM,779)@19 + 2
    -- in j@20000000
    memoryC1_uid377_invTabGen_lutmem_aa <= redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9_q;
    memoryC1_uid377_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC1_uid377_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enA2ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid377_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC1_uid377_invTabGen_lutmem_aa,
        q_a => memoryC1_uid377_invTabGen_lutmem_ir
    );
    memoryC1_uid377_invTabGen_lutmem_r <= memoryC1_uid377_invTabGen_lutmem_ir(28 downto 0);

    -- redist30_memoryC1_uid377_invTabGen_lutmem_r_1(DELAY,948)
    redist30_memoryC1_uid377_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC1_uid377_invTabGen_lutmem_r, xout => redist30_memoryC1_uid377_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- cIncludingRoundingBit_uid400_invPolyEval(BITJOIN,399)@22
    cIncludingRoundingBit_uid400_invPolyEval_q <= redist30_memoryC1_uid377_invTabGen_lutmem_r_1_q & rndBit_uid392_invPolyEval_q;

    -- ts2_uid402_invPolyEval(ADD,401)@22
    ts2_uid402_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => cIncludingRoundingBit_uid400_invPolyEval_q(30)) & cIncludingRoundingBit_uid400_invPolyEval_q));
    ts2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 24 => redist49_osig_uid518_pT2_uid398_invPolyEval_b_1_q(23)) & redist49_osig_uid518_pT2_uid398_invPolyEval_b_1_q));
    ts2_uid402_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid402_invPolyEval_a) + SIGNED(ts2_uid402_invPolyEval_b));
    ts2_uid402_invPolyEval_q <= ts2_uid402_invPolyEval_o(31 downto 0);

    -- s2_uid403_invPolyEval(BITSELECT,402)@22
    s2_uid403_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid402_invPolyEval_q(31 downto 1));

    -- redist60_s2_uid403_invPolyEval_b_1(DELAY,978)
    redist60_s2_uid403_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s2_uid403_invPolyEval_b, xout => redist60_s2_uid403_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid533_pT3_uid405_invPolyEval(BITSELECT,532)@23
    topRangeY_uid533_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(redist60_s2_uid403_invPolyEval_b_1_q(30 downto 14));

    -- redist48_topRangeY_uid533_pT3_uid405_invPolyEval_b_1(DELAY,966)
    redist48_topRangeY_uid533_pT3_uid405_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => topRangeY_uid533_pT3_uid405_invPolyEval_b, xout => redist48_topRangeY_uid533_pT3_uid405_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_inputreg(DELAY,1023)
    redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_6_q, xout => redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_inputreg_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13(DELAY,930)
    redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_inputreg_q, xout => redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_q, clk => clock, aclr => resetn );

    -- nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval(BITJOIN,521)@23
    nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval_q <= GND_q & redist12_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_c_13_q;

    -- rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval(BITSELECT,559)@23
    rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval_q(6 downto 0));
    rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_in(6 downto 0));

    -- redist47_rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b_1(DELAY,965)
    redist47_rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b, xout => redist47_rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- rightBottomX_mergedSignalTM_uid561_pT3_uid405_invPolyEval(BITJOIN,560)@24
    rightBottomX_mergedSignalTM_uid561_pT3_uid405_invPolyEval_q <= redist47_rightBottomX_bottomRange_uid560_pT3_uid405_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid559_pT3_uid405_invPolyEval_q;

    -- sm1_uid598_pT3_uid405_invPolyEval(MULT,597)@24 + 2
    sm1_uid598_pT3_uid405_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid561_pT3_uid405_invPolyEval_q;
    sm1_uid598_pT3_uid405_invPolyEval_b0 <= STD_LOGIC_VECTOR(redist48_topRangeY_uid533_pT3_uid405_invPolyEval_b_1_q);
    sm1_uid598_pT3_uid405_invPolyEval_reset <= not (resetn);
    sm1_uid598_pT3_uid405_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid598_pT3_uid405_invPolyEval_a0,
        datab => sm1_uid598_pT3_uid405_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid598_pT3_uid405_invPolyEval_reset,
        clock => clock,
        result => sm1_uid598_pT3_uid405_invPolyEval_s1
    );
    sm1_uid598_pT3_uid405_invPolyEval_q <= sm1_uid598_pT3_uid405_invPolyEval_s1(33 downto 0);

    -- redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1(DELAY,962)
    redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid598_pT3_uid405_invPolyEval_q, xout => redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_b(BITJOIN,806)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_b_q <= lev2_a0_uid605_pT3_uid405_invPolyEval_UpperBits_for_b_q & redist44_sm1_uid598_pT3_uid405_invPolyEval_q_1_q;

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b(BITSELECT,810)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_b <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_b_q(38 downto 0));
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_b_q(52 downto 39));

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_a(BITSELECT,804)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(lev1_a0_uid604_pT3_uid405_invPolyEval_q(51 downto 51));

    -- aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval(BITSELECT,555)@23
    aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_in <= STD_LOGIC_VECTOR(redist60_s2_uid403_invPolyEval_b_1_q(13 downto 0));
    aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_in(13 downto 0));

    -- aboveLeftY_mergedSignalTM_uid557_pT3_uid405_invPolyEval(BITJOIN,556)@23
    aboveLeftY_mergedSignalTM_uid557_pT3_uid405_invPolyEval_q <= aboveLeftY_bottomRange_uid556_pT3_uid405_invPolyEval_b & topRangeY_bottomExtension_uid428_pT1_uid391_invPolyEval_q;

    -- topRangeX_uid532_pT3_uid405_invPolyEval(BITSELECT,531)@23
    topRangeX_uid532_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval_q(23 downto 7));

    -- sm0_uid597_pT3_uid405_invPolyEval(MULT,596)@23 + 2
    sm0_uid597_pT3_uid405_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid532_pT3_uid405_invPolyEval_b);
    sm0_uid597_pT3_uid405_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid557_pT3_uid405_invPolyEval_q;
    sm0_uid597_pT3_uid405_invPolyEval_reset <= not (resetn);
    sm0_uid597_pT3_uid405_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid597_pT3_uid405_invPolyEval_a0,
        datab => sm0_uid597_pT3_uid405_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid597_pT3_uid405_invPolyEval_reset,
        clock => clock,
        result => sm0_uid597_pT3_uid405_invPolyEval_s1
    );
    sm0_uid597_pT3_uid405_invPolyEval_q <= sm0_uid597_pT3_uid405_invPolyEval_s1(33 downto 0);

    -- redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1(DELAY,963)
    redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid597_pT3_uid405_invPolyEval_q, xout => redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid602_pT3_uid405_invPolyEval(BITSELECT,601)@26
    highBBits_uid602_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1_q(33 downto 13));

    -- sm0_uid596_pT3_uid405_invPolyEval(MULT,595)@23 + 2
    sm0_uid596_pT3_uid405_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid532_pT3_uid405_invPolyEval_b);
    sm0_uid596_pT3_uid405_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid533_pT3_uid405_invPolyEval_b);
    sm0_uid596_pT3_uid405_invPolyEval_reset <= not (resetn);
    sm0_uid596_pT3_uid405_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid596_pT3_uid405_invPolyEval_a0,
        datab => sm0_uid596_pT3_uid405_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid596_pT3_uid405_invPolyEval_reset,
        clock => clock,
        result => sm0_uid596_pT3_uid405_invPolyEval_s1
    );
    sm0_uid596_pT3_uid405_invPolyEval_q <= sm0_uid596_pT3_uid405_invPolyEval_s1;

    -- redist46_sm0_uid596_pT3_uid405_invPolyEval_q_1(DELAY,964)
    redist46_sm0_uid596_pT3_uid405_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid596_pT3_uid405_invPolyEval_q, xout => redist46_sm0_uid596_pT3_uid405_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid568_pT3_uid405_invPolyEval(BITSELECT,567)@23
    aboveLeftY_uid568_pT3_uid405_invPolyEval_in <= redist60_s2_uid403_invPolyEval_b_1_q(13 downto 0);
    aboveLeftY_uid568_pT3_uid405_invPolyEval_b <= aboveLeftY_uid568_pT3_uid405_invPolyEval_in(13 downto 9);

    -- n1_uid574_pT3_uid405_invPolyEval(BITSELECT,573)@23
    n1_uid574_pT3_uid405_invPolyEval_b <= aboveLeftY_uid568_pT3_uid405_invPolyEval_b(4 downto 1);

    -- n1_uid580_pT3_uid405_invPolyEval(BITSELECT,579)@23
    n1_uid580_pT3_uid405_invPolyEval_b <= n1_uid574_pT3_uid405_invPolyEval_b(3 downto 1);

    -- n1_uid586_pT3_uid405_invPolyEval(BITSELECT,585)@23
    n1_uid586_pT3_uid405_invPolyEval_b <= n1_uid580_pT3_uid405_invPolyEval_b(2 downto 1);

    -- aboveLeftX_uid567_pT3_uid405_invPolyEval(BITSELECT,566)@23
    aboveLeftX_uid567_pT3_uid405_invPolyEval_in <= nx_mergedSignalTM_uid522_pT3_uid405_invPolyEval_q(6 downto 0);
    aboveLeftX_uid567_pT3_uid405_invPolyEval_b <= aboveLeftX_uid567_pT3_uid405_invPolyEval_in(6 downto 2);

    -- n0_uid575_pT3_uid405_invPolyEval(BITSELECT,574)@23
    n0_uid575_pT3_uid405_invPolyEval_b <= aboveLeftX_uid567_pT3_uid405_invPolyEval_b(4 downto 1);

    -- n0_uid581_pT3_uid405_invPolyEval(BITSELECT,580)@23
    n0_uid581_pT3_uid405_invPolyEval_b <= n0_uid575_pT3_uid405_invPolyEval_b(3 downto 1);

    -- n0_uid587_pT3_uid405_invPolyEval(BITSELECT,586)@23
    n0_uid587_pT3_uid405_invPolyEval_b <= n0_uid581_pT3_uid405_invPolyEval_b(2 downto 1);

    -- sm0_uid599_pT3_uid405_invPolyEval(MULT,598)@23 + 2
    sm0_uid599_pT3_uid405_invPolyEval_a0 <= n0_uid587_pT3_uid405_invPolyEval_b;
    sm0_uid599_pT3_uid405_invPolyEval_b0 <= n1_uid586_pT3_uid405_invPolyEval_b;
    sm0_uid599_pT3_uid405_invPolyEval_reset <= not (resetn);
    sm0_uid599_pT3_uid405_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid599_pT3_uid405_invPolyEval_a0,
        datab => sm0_uid599_pT3_uid405_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid599_pT3_uid405_invPolyEval_reset,
        clock => clock,
        result => sm0_uid599_pT3_uid405_invPolyEval_s1
    );
    sm0_uid599_pT3_uid405_invPolyEval_q <= sm0_uid599_pT3_uid405_invPolyEval_s1;

    -- redist43_sm0_uid599_pT3_uid405_invPolyEval_q_1(DELAY,961)
    redist43_sm0_uid599_pT3_uid405_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid599_pT3_uid405_invPolyEval_q, xout => redist43_sm0_uid599_pT3_uid405_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- sumAb_uid600_pT3_uid405_invPolyEval(BITJOIN,599)@26
    sumAb_uid600_pT3_uid405_invPolyEval_q <= redist46_sm0_uid596_pT3_uid405_invPolyEval_q_1_q & redist43_sm0_uid599_pT3_uid405_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval(ADD,602)@26 + 1
    lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => sumAb_uid600_pT3_uid405_invPolyEval_q(37)) & sumAb_uid600_pT3_uid405_invPolyEval_q));
    lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 21 => highBBits_uid602_pT3_uid405_invPolyEval_b(20)) & highBBits_uid602_pT3_uid405_invPolyEval_b));
    lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_q <= lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid601_pT3_uid405_invPolyEval(BITSELECT,600)@26
    lowRangeB_uid601_pT3_uid405_invPolyEval_in <= redist45_sm0_uid597_pT3_uid405_invPolyEval_q_1_q(12 downto 0);
    lowRangeB_uid601_pT3_uid405_invPolyEval_b <= lowRangeB_uid601_pT3_uid405_invPolyEval_in(12 downto 0);

    -- redist42_lowRangeB_uid601_pT3_uid405_invPolyEval_b_1(DELAY,960)
    redist42_lowRangeB_uid601_pT3_uid405_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid601_pT3_uid405_invPolyEval_b, xout => redist42_lowRangeB_uid601_pT3_uid405_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid604_pT3_uid405_invPolyEval(BITJOIN,603)@27
    lev1_a0_uid604_pT3_uid405_invPolyEval_q <= lev1_a0sumAHighB_uid603_pT3_uid405_invPolyEval_q & redist42_lowRangeB_uid601_pT3_uid405_invPolyEval_b_1_q;

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_a(BITJOIN,803)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_a_q <= lev2_a0_uid605_pT3_uid405_invPolyEval_SignBit_for_a_b & lev1_a0_uid604_pT3_uid405_invPolyEval_q;

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a(BITSELECT,809)@27
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_BitExpansion_for_a_q(52 downto 39));

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2(ADD,811)@27 + 1
    lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_b);
    lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_b);
    lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_a) + UNSIGNED(lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_c(0) <= lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_o(39);
    lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_q <= lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1(DELAY,943)
    redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c, xout => redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1(DELAY,944)
    redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c, xout => redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2(ADD,812)@28 + 1
    lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_cin <= lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_c;
    lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1_q(13)) & redist26_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1_q(13)) & redist25_lev2_a0_uid605_pT3_uid405_invPolyEval_BitSelect_for_b_c_1_q) & lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_cin(0));
    lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_a) + SIGNED(lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_q <= lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_o(14 downto 1);

    -- ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2(BITSELECT,871)@29
    ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_q(10 downto 10));

    -- ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_1(BITSELECT,870)@29
    ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_p2_of_2_q(10 downto 0));

    -- ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0(BITSELECT,869)@28
    ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(lev2_a0_uid605_pT3_uid405_invPolyEval_p1_of_2_q(38 downto 17));

    -- redist16_ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b_1(DELAY,934)
    redist16_ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b, xout => redist16_ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_b(BITJOIN,877)@29
    ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_b_q <= ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_1_b & redist16_ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q;

    -- ts3_uid409_invPolyEval_SignBit_for_a(BITSELECT,793)@29
    ts3_uid409_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(cIncludingRoundingBit_uid407_invPolyEval_q(40 downto 40));

    -- redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16(DELAY,927)
    redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_9_q, xout => redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16_q, clk => clock, aclr => resetn );

    -- memoryC0_uid374_invTabGen_lutmem(DUALMEM,778)@26 + 2
    -- in j@20000000
    memoryC0_uid374_invTabGen_lutmem_aa <= redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16_q;
    memoryC0_uid374_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid374_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enA1ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid374_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid374_invTabGen_lutmem_aa,
        q_a => memoryC0_uid374_invTabGen_lutmem_ir
    );
    memoryC0_uid374_invTabGen_lutmem_r <= memoryC0_uid374_invTabGen_lutmem_ir(1 downto 0);

    -- redist31_memoryC0_uid374_invTabGen_lutmem_r_1(DELAY,949)
    redist31_memoryC0_uid374_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid374_invTabGen_lutmem_r, xout => redist31_memoryC0_uid374_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- memoryC0_uid373_invTabGen_lutmem(DUALMEM,777)@26 + 2
    -- in j@20000000
    memoryC0_uid373_invTabGen_lutmem_aa <= redist9_yAddr_uid311_i_div_rgb_to_hsv_merged_bit_select_b_16_q;
    memoryC0_uid373_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid373_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hsv_c1_enA0ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid373_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid373_invTabGen_lutmem_aa,
        q_a => memoryC0_uid373_invTabGen_lutmem_ir
    );
    memoryC0_uid373_invTabGen_lutmem_r <= memoryC0_uid373_invTabGen_lutmem_ir(35 downto 0);

    -- redist32_memoryC0_uid373_invTabGen_lutmem_r_1(DELAY,950)
    redist32_memoryC0_uid373_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid373_invTabGen_lutmem_r, xout => redist32_memoryC0_uid373_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- os_uid375_invTabGen(BITJOIN,374)@29
    os_uid375_invTabGen_q <= redist31_memoryC0_uid374_invTabGen_lutmem_r_1_q & redist32_memoryC0_uid373_invTabGen_lutmem_r_1_q;

    -- rndBit_uid406_invPolyEval(CONSTANT,405)
    rndBit_uid406_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid407_invPolyEval(BITJOIN,406)@29
    cIncludingRoundingBit_uid407_invPolyEval_q <= os_uid375_invTabGen_q & rndBit_uid406_invPolyEval_q;

    -- ts3_uid409_invPolyEval_BitExpansion_for_a(BITJOIN,792)@29
    ts3_uid409_invPolyEval_BitExpansion_for_a_q <= ts3_uid409_invPolyEval_SignBit_for_a_b & cIncludingRoundingBit_uid407_invPolyEval_q;

    -- ts3_uid409_invPolyEval_BitSelect_for_a(BITSELECT,798)@29
    ts3_uid409_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(ts3_uid409_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    ts3_uid409_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(ts3_uid409_invPolyEval_BitExpansion_for_a_q(41 downto 39));

    -- ts3_uid409_invPolyEval_p1_of_2(ADD,800)@29 + 1
    ts3_uid409_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & ts3_uid409_invPolyEval_BitSelect_for_a_b);
    ts3_uid409_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_b_q);
    ts3_uid409_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid409_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid409_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(ts3_uid409_invPolyEval_p1_of_2_a) + UNSIGNED(ts3_uid409_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid409_invPolyEval_p1_of_2_c(0) <= ts3_uid409_invPolyEval_p1_of_2_o(39);
    ts3_uid409_invPolyEval_p1_of_2_q <= ts3_uid409_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1(DELAY,931)
    redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid409_invPolyEval_BitSelect_for_b_tessel0_2_b, xout => redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_c(BITJOIN,881)@30
    ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_c_q <= redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist13_ts3_uid409_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q;

    -- redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1(DELAY,946)
    redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid409_invPolyEval_BitSelect_for_a_c, xout => redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- ts3_uid409_invPolyEval_p2_of_2(ADD,801)@30 + 1
    ts3_uid409_invPolyEval_p2_of_2_cin <= ts3_uid409_invPolyEval_p1_of_2_c;
    ts3_uid409_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1_q(2)) & redist28_ts3_uid409_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    ts3_uid409_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_c_q(2)) & ts3_uid409_invPolyEval_BitSelect_for_b_BitJoin_for_c_q) & ts3_uid409_invPolyEval_p2_of_2_cin(0));
    ts3_uid409_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid409_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid409_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid409_invPolyEval_p2_of_2_a) + SIGNED(ts3_uid409_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid409_invPolyEval_p2_of_2_q <= ts3_uid409_invPolyEval_p2_of_2_o(3 downto 1);

    -- redist27_ts3_uid409_invPolyEval_p1_of_2_q_1(DELAY,945)
    redist27_ts3_uid409_invPolyEval_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid409_invPolyEval_p1_of_2_q, xout => redist27_ts3_uid409_invPolyEval_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- ts3_uid409_invPolyEval_BitJoin_for_q(BITJOIN,802)@31
    ts3_uid409_invPolyEval_BitJoin_for_q_q <= ts3_uid409_invPolyEval_p2_of_2_q & redist27_ts3_uid409_invPolyEval_p1_of_2_q_1_q;

    -- s3_uid410_invPolyEval(BITSELECT,409)@31
    s3_uid410_invPolyEval_b <= STD_LOGIC_VECTOR(ts3_uid409_invPolyEval_BitJoin_for_q_q(41 downto 1));

    -- fxpInverseRes_uid314_i_div_rgb_to_hsv(BITSELECT,313)@31
    fxpInverseRes_uid314_i_div_rgb_to_hsv_in <= s3_uid410_invPolyEval_b(38 downto 0);
    fxpInverseRes_uid314_i_div_rgb_to_hsv_b <= fxpInverseRes_uid314_i_div_rgb_to_hsv_in(38 downto 6);

    -- updatedY_uid305_i_div_rgb_to_hsv(BITJOIN,304)@11
    updatedY_uid305_i_div_rgb_to_hsv_q <= GND_q & i_s_coerce268269274_zext_rgb_to_hsv_vt_const_31_q;

    -- redist77_normYNoLeadOne_uid303_i_div_rgb_to_hsv_b_1(DELAY,995)
    redist77_normYNoLeadOne_uid303_i_div_rgb_to_hsv_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYNoLeadOne_uid303_i_div_rgb_to_hsv_b, xout => redist77_normYNoLeadOne_uid303_i_div_rgb_to_hsv_b_1_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid304_i_div_rgb_to_hsv(LOGICAL,305)@11 + 1
    normYIsOneC2_uid304_i_div_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & redist77_normYNoLeadOne_uid303_i_div_rgb_to_hsv_b_1_q);
    normYIsOneC2_uid304_i_div_rgb_to_hsv_qi <= "1" WHEN normYIsOneC2_uid304_i_div_rgb_to_hsv_a = updatedY_uid305_i_div_rgb_to_hsv_q ELSE "0";
    normYIsOneC2_uid304_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid304_i_div_rgb_to_hsv_qi, xout => normYIsOneC2_uid304_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid307_i_div_rgb_to_hsv(BITSELECT,306)@10
    normYIsOneC2_uid307_i_div_rgb_to_hsv_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid690_normY_uid302_i_div_rgb_to_hsv_q(31 downto 31));

    -- redist76_normYIsOneC2_uid307_i_div_rgb_to_hsv_b_2(DELAY,994)
    redist76_normYIsOneC2_uid307_i_div_rgb_to_hsv_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid307_i_div_rgb_to_hsv_b, xout => redist76_normYIsOneC2_uid307_i_div_rgb_to_hsv_b_2_q, clk => clock, aclr => resetn );

    -- normYIsOne_uid308_i_div_rgb_to_hsv(LOGICAL,307)@12 + 1
    normYIsOne_uid308_i_div_rgb_to_hsv_qi <= redist76_normYIsOneC2_uid307_i_div_rgb_to_hsv_b_2_q and normYIsOneC2_uid304_i_div_rgb_to_hsv_q;
    normYIsOne_uid308_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid308_i_div_rgb_to_hsv_qi, xout => normYIsOne_uid308_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist75_normYIsOne_uid308_i_div_rgb_to_hsv_q_19(DELAY,993)
    redist75_normYIsOne_uid308_i_div_rgb_to_hsv_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid308_i_div_rgb_to_hsv_q, xout => redist75_normYIsOne_uid308_i_div_rgb_to_hsv_q_19_q, clk => clock, aclr => resetn );

    -- invResPostOneHandling2_uid316_i_div_rgb_to_hsv(MUX,315)@31
    invResPostOneHandling2_uid316_i_div_rgb_to_hsv_s <= redist75_normYIsOne_uid308_i_div_rgb_to_hsv_q_19_q;
    invResPostOneHandling2_uid316_i_div_rgb_to_hsv_combproc: PROCESS (invResPostOneHandling2_uid316_i_div_rgb_to_hsv_s, fxpInverseRes_uid314_i_div_rgb_to_hsv_b, oneInvRes_uid315_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (invResPostOneHandling2_uid316_i_div_rgb_to_hsv_s) IS
            WHEN "0" => invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q <= fxpInverseRes_uid314_i_div_rgb_to_hsv_b;
            WHEN "1" => invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q <= oneInvRes_uid315_i_div_rgb_to_hsv_q;
            WHEN OTHERS => invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select(BITSELECT,908)@31
    prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_b <= invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q(17 downto 0);
    prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_c <= invResPostOneHandling2_uid316_i_div_rgb_to_hsv_q(32 downto 18);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_im6(MULT,697)@31 + 2
    prodXInvY_uid319_i_div_rgb_to_hsv_im6_a0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_b;
    prodXInvY_uid319_i_div_rgb_to_hsv_im6_b0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_im6_reset <= not (resetn);
    prodXInvY_uid319_i_div_rgb_to_hsv_im6_component : lpm_mult
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
        dataa => prodXInvY_uid319_i_div_rgb_to_hsv_im6_a0,
        datab => prodXInvY_uid319_i_div_rgb_to_hsv_im6_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid319_i_div_rgb_to_hsv_im6_reset,
        clock => clock,
        result => prodXInvY_uid319_i_div_rgb_to_hsv_im6_s1
    );
    prodXInvY_uid319_i_div_rgb_to_hsv_im6_q <= prodXInvY_uid319_i_div_rgb_to_hsv_im6_s1;

    -- redist38_prodXInvY_uid319_i_div_rgb_to_hsv_im6_q_2(DELAY,956)
    redist38_prodXInvY_uid319_i_div_rgb_to_hsv_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_im6_q, xout => redist38_prodXInvY_uid319_i_div_rgb_to_hsv_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_align_15(BITSHIFT,706)@35
    prodXInvY_uid319_i_div_rgb_to_hsv_align_15_qint <= redist38_prodXInvY_uid319_i_div_rgb_to_hsv_im6_q_2_q & "000000000000000000";
    prodXInvY_uid319_i_div_rgb_to_hsv_align_15_q <= prodXInvY_uid319_i_div_rgb_to_hsv_align_15_qint(49 downto 0);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b(BITJOIN,825)@35
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_UpperBits_for_b_q & prodXInvY_uid319_i_div_rgb_to_hsv_align_15_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b(BITSELECT,828)@35
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q(66 downto 39);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_im3(MULT,694)@31 + 2
    prodXInvY_uid319_i_div_rgb_to_hsv_im3_a0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_b;
    prodXInvY_uid319_i_div_rgb_to_hsv_im3_b0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_im3_reset <= not (resetn);
    prodXInvY_uid319_i_div_rgb_to_hsv_im3_component : lpm_mult
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
        dataa => prodXInvY_uid319_i_div_rgb_to_hsv_im3_a0,
        datab => prodXInvY_uid319_i_div_rgb_to_hsv_im3_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid319_i_div_rgb_to_hsv_im3_reset,
        clock => clock,
        result => prodXInvY_uid319_i_div_rgb_to_hsv_im3_s1
    );
    prodXInvY_uid319_i_div_rgb_to_hsv_im3_q <= prodXInvY_uid319_i_div_rgb_to_hsv_im3_s1;

    -- redist39_prodXInvY_uid319_i_div_rgb_to_hsv_im3_q_1(DELAY,957)
    redist39_prodXInvY_uid319_i_div_rgb_to_hsv_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_im3_q, xout => redist39_prodXInvY_uid319_i_div_rgb_to_hsv_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_align_13(BITSHIFT,704)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_align_13_qint <= redist39_prodXInvY_uid319_i_div_rgb_to_hsv_im3_q_1_q & "000000000000000000";
    prodXInvY_uid319_i_div_rgb_to_hsv_align_13_q <= prodXInvY_uid319_i_div_rgb_to_hsv_align_13_qint(50 downto 0);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b(BITJOIN,816)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q <= i_conv4_i_i_i_rgb_to_hsv_vt_const_31_q & prodXInvY_uid319_i_div_rgb_to_hsv_align_13_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b(BITSELECT,819)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q(65 downto 39);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_im9(MULT,700)@31 + 2
    prodXInvY_uid319_i_div_rgb_to_hsv_im9_a0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_im9_b0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_im9_reset <= not (resetn);
    prodXInvY_uid319_i_div_rgb_to_hsv_im9_component : lpm_mult
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
        dataa => prodXInvY_uid319_i_div_rgb_to_hsv_im9_a0,
        datab => prodXInvY_uid319_i_div_rgb_to_hsv_im9_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid319_i_div_rgb_to_hsv_im9_reset,
        clock => clock,
        result => prodXInvY_uid319_i_div_rgb_to_hsv_im9_s1
    );
    prodXInvY_uid319_i_div_rgb_to_hsv_im9_q <= prodXInvY_uid319_i_div_rgb_to_hsv_im9_s1;

    -- redist37_prodXInvY_uid319_i_div_rgb_to_hsv_im9_q_1(DELAY,955)
    redist37_prodXInvY_uid319_i_div_rgb_to_hsv_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_im9_q, xout => redist37_prodXInvY_uid319_i_div_rgb_to_hsv_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_im0(MULT,691)@31 + 2
    prodXInvY_uid319_i_div_rgb_to_hsv_im0_a0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs1_merged_bit_select_b;
    prodXInvY_uid319_i_div_rgb_to_hsv_im0_b0 <= prodXInvY_uid319_i_div_rgb_to_hsv_bs2_merged_bit_select_b;
    prodXInvY_uid319_i_div_rgb_to_hsv_im0_reset <= not (resetn);
    prodXInvY_uid319_i_div_rgb_to_hsv_im0_component : lpm_mult
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
        dataa => prodXInvY_uid319_i_div_rgb_to_hsv_im0_a0,
        datab => prodXInvY_uid319_i_div_rgb_to_hsv_im0_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid319_i_div_rgb_to_hsv_im0_reset,
        clock => clock,
        result => prodXInvY_uid319_i_div_rgb_to_hsv_im0_s1
    );
    prodXInvY_uid319_i_div_rgb_to_hsv_im0_q <= prodXInvY_uid319_i_div_rgb_to_hsv_im0_s1;

    -- redist40_prodXInvY_uid319_i_div_rgb_to_hsv_im0_q_1(DELAY,958)
    redist40_prodXInvY_uid319_i_div_rgb_to_hsv_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_im0_q, xout => redist40_prodXInvY_uid319_i_div_rgb_to_hsv_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_join_12(BITJOIN,703)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_join_12_q <= redist37_prodXInvY_uid319_i_div_rgb_to_hsv_im9_q_1_q & redist40_prodXInvY_uid319_i_div_rgb_to_hsv_im0_q_1_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a(BITJOIN,814)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodXInvY_uid319_i_div_rgb_to_hsv_join_12_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a(BITSELECT,818)@34
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q(65 downto 39);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2(ADD,820)@34 + 1
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c(0) <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o(39);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2(ADD,829)@35 + 1
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c(0) <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o(39);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist22_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1(DELAY,940)
    redist22_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c, xout => redist22_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist23_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1(DELAY,941)
    redist23_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c, xout => redist23_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist24_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1(DELAY,942)
    redist24_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c, xout => redist24_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2(ADD,821)@35 + 1
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist24_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist23_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q) & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin(0);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o(27 downto 1);

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,886)@36
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q;

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2(ADD,830)@36 + 1
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist22_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q) & prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin(0);
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o(28 downto 1);

    -- redist21_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q_1(DELAY,939)
    redist21_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q, xout => redist21_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q(BITJOIN,831)@37
    prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q & redist21_prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q_1_q;

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_notEnable(LOGICAL,1031)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_nor(LOGICAL,1032)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_nor_q <= not (redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_notEnable_q or redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_q);

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_last(CONSTANT,1028)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_last_q <= "010111";

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp(LOGICAL,1029)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_b <= STD_LOGIC_VECTOR("0" & redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_q);
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_q <= "1" WHEN redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_last_q = redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_b ELSE "0";

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg(REG,1030)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg_q <= STD_LOGIC_VECTOR(redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmp_q);
        END IF;
    END PROCESS;

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena(REG,1033)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_nor_q = "1") THEN
                redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_q <= STD_LOGIC_VECTOR(redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_enaAnd(LOGICAL,1034)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_enaAnd_q <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_sticky_ena_q and VCC_q;

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt(COUNTER,1026)
    -- low=0, high=24, step=1, init=0
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i = TO_UNSIGNED(23, 5)) THEN
                redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq <= '1';
            ELSE
                redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq <= '0';
            END IF;
            IF (redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_eq = '1') THEN
                redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i + 8;
            ELSE
                redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_i, 5)));

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_inputreg(DELAY,1024)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid371_zCount_uid301_i_div_rgb_to_hsv_q, xout => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_inputreg_q, clk => clock, aclr => resetn );

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr(REG,1027)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr_q <= "11000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr_q <= STD_LOGIC_VECTOR(redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem(DUALMEM,1025)
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ia <= STD_LOGIC_VECTOR(redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_inputreg_q);
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_aa <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_wraddr_q;
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ab <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_rdcnt_q;
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_reset0 <= not (resetn);
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_dmem : altsyncram
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
        clocken1 => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_reset0,
        clock1 => clock,
        address_a => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_aa,
        data_a => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_ab,
        q_b => redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_iq
    );
    redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_q <= redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_iq(5 downto 0);

    -- cWOut_uid317_i_div_rgb_to_hsv(CONSTANT,316)
    cWOut_uid317_i_div_rgb_to_hsv_q <= "11111";

    -- rShiftCount_uid318_i_div_rgb_to_hsv(SUB,317)@36 + 1
    rShiftCount_uid318_i_div_rgb_to_hsv_a <= STD_LOGIC_VECTOR("00" & cWOut_uid317_i_div_rgb_to_hsv_q);
    rShiftCount_uid318_i_div_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & redist62_r_uid371_zCount_uid301_i_div_rgb_to_hsv_q_27_mem_q);
    rShiftCount_uid318_i_div_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rShiftCount_uid318_i_div_rgb_to_hsv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            rShiftCount_uid318_i_div_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid318_i_div_rgb_to_hsv_a) - UNSIGNED(rShiftCount_uid318_i_div_rgb_to_hsv_b));
        END IF;
    END PROCESS;
    rShiftCount_uid318_i_div_rgb_to_hsv_q <= rShiftCount_uid318_i_div_rgb_to_hsv_o(6 downto 0);

    -- rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select(BITSELECT,909)@37
    rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_b <= rShiftCount_uid318_i_div_rgb_to_hsv_q(6 downto 4);
    rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c <= rShiftCount_uid318_i_div_rgb_to_hsv_q(3 downto 1);
    rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d <= rShiftCount_uid318_i_div_rgb_to_hsv_q(0 downto 0);

    -- rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv(MUX,728)@37 + 1
    rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_s <= rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_b;
    rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_s) IS
                WHEN "000" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= prodXInvY_uid319_i_div_rgb_to_hsv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
                WHEN "001" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx1_uid715_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "010" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx2_uid718_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "011" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx3_uid721_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "100" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx4_uid724_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "101" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "110" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN "111" => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0Idx5_uid725_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
                WHEN OTHERS => rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c_1(DELAY,923)
    redist5_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c, xout => redist5_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv(MUX,751)@38
    rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_s <= redist5_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_c_1_q;
    rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_combproc: PROCESS (rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_s, rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx1_uid732_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx2_uid735_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx3_uid738_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx4_uid741_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx5_uid744_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx6_uid747_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage1Idx7_uid750_prodPostRightShift_uid320_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_s) IS
            WHEN "000" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage0_uid729_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "001" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx1_uid732_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "010" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx2_uid735_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "011" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx3_uid738_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "100" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx4_uid741_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "101" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx5_uid744_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "110" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx6_uid747_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "111" => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1Idx7_uid750_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN OTHERS => rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d_1(DELAY,924)
    redist6_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d, xout => redist6_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv(MUX,756)@38
    rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_s <= redist6_rightShiftStageSel6Dto4_uid728_prodPostRightShift_uid320_i_div_rgb_to_hsv_merged_bit_select_d_1_q;
    rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_combproc: PROCESS (rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_s, rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q, rightShiftStage2Idx1_uid755_prodPostRightShift_uid320_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_s) IS
            WHEN "0" => rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage1_uid752_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN "1" => rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= rightShiftStage2Idx1_uid755_prodPostRightShift_uid320_i_div_rgb_to_hsv_q;
            WHEN OTHERS => rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid321_i_div_rgb_to_hsv(BITSELECT,320)@38
    prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_in <= rightShiftStage2_uid757_prodPostRightShift_uid320_i_div_rgb_to_hsv_q(63 downto 0);
    prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b <= prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_in(63 downto 31);

    -- redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1(DELAY,991)
    redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b, xout => redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1_q, clk => clock, aclr => resetn );

    -- allOnes_uid322_i_div_rgb_to_hsv(LOGICAL,321)@39 + 1
    allOnes_uid322_i_div_rgb_to_hsv_qi <= "1" WHEN redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1_q = "111111111111111111111111111111111" ELSE "0";
    allOnes_uid322_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => allOnes_uid322_i_div_rgb_to_hsv_qi, xout => allOnes_uid322_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- invAllOnes_uid324_i_div_rgb_to_hsv(LOGICAL,323)@40
    invAllOnes_uid324_i_div_rgb_to_hsv_q <= not (allOnes_uid322_i_div_rgb_to_hsv_q);

    -- addOp2_uid325_i_div_rgb_to_hsv(LOGICAL,324)@40
    addOp2_uid325_i_div_rgb_to_hsv_q <= invAllOnes_uid324_i_div_rgb_to_hsv_q and VCC_q;

    -- redist74_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_2(DELAY,992)
    redist74_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_2 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist73_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_1_q, xout => redist74_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_2_q, clk => clock, aclr => resetn );

    -- prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv(ADD,325)@40
    prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & redist74_prodPostRightShiftPost_uid321_i_div_rgb_to_hsv_b_2_q);
    prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid325_i_div_rgb_to_hsv_q);
    prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_a) + UNSIGNED(prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_b));
    prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_q <= prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv(BITSELECT,326)@40
    prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_in <= prodPostRightShiftPostRnd_uid326_i_div_rgb_to_hsv_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b <= prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_in(32 downto 1);

    -- redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1(DELAY,990)
    redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b, xout => redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1_q, clk => clock, aclr => resetn );

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_notEnable(LOGICAL,1056)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_nor(LOGICAL,1057)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_nor_q <= not (redist88_i_conv52_rgb_to_hsv_vt_join_q_36_notEnable_q or redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_q);

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_last(CONSTANT,1053)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_last_q <= "011010";

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp(LOGICAL,1054)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_b <= STD_LOGIC_VECTOR("0" & redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_q);
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_q <= "1" WHEN redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_last_q = redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_b ELSE "0";

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg(REG,1055)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg_q <= STD_LOGIC_VECTOR(redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmp_q);
        END IF;
    END PROCESS;

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena(REG,1058)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist88_i_conv52_rgb_to_hsv_vt_join_q_36_nor_q = "1") THEN
                redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_q <= STD_LOGIC_VECTOR(redist88_i_conv52_rgb_to_hsv_vt_join_q_36_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_enaAnd(LOGICAL,1059)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_enaAnd_q <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_sticky_ena_q and VCC_q;

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt(COUNTER,1051)
    -- low=0, high=27, step=1, init=0
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq <= '1';
            ELSE
                redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq <= '0';
            END IF;
            IF (redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_eq = '1') THEN
                redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i + 5;
            ELSE
                redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_i, 5)));

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_inputreg(DELAY,1048)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist87_i_conv52_rgb_to_hsv_vt_join_q_5_q, xout => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_inputreg_q, clk => clock, aclr => resetn );

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr(REG,1052)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr_q <= STD_LOGIC_VECTOR(redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem(DUALMEM,1050)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ia <= STD_LOGIC_VECTOR(redist88_i_conv52_rgb_to_hsv_vt_join_q_36_inputreg_q);
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_aa <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_wraddr_q;
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ab <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_rdcnt_q;
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_reset0 <= not (resetn);
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_dmem : altsyncram
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
        clocken1 => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_reset0,
        clock1 => clock,
        address_a => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_aa,
        data_a => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_ab,
        q_b => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_iq
    );
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_q <= redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_iq(31 downto 0);

    -- redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg(DELAY,1049)
    redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_mem_q, xout => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg_q, clk => clock, aclr => resetn );

    -- yIsZero_uid309_i_div_rgb_to_hsv(LOGICAL,308)@40 + 1
    yIsZero_uid309_i_div_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid309_i_div_rgb_to_hsv_qi <= "1" WHEN redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg_q = yIsZero_uid309_i_div_rgb_to_hsv_b ELSE "0";
    yIsZero_uid309_i_div_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yIsZero_uid309_i_div_rgb_to_hsv_qi, xout => yIsZero_uid309_i_div_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- resFinal_uid329_i_div_rgb_to_hsv(MUX,328)@41
    resFinal_uid329_i_div_rgb_to_hsv_s <= yIsZero_uid309_i_div_rgb_to_hsv_q;
    resFinal_uid329_i_div_rgb_to_hsv_combproc: PROCESS (resFinal_uid329_i_div_rgb_to_hsv_s, redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1_q, cstValOvf_uid328_i_div_rgb_to_hsv_q)
    BEGIN
        CASE (resFinal_uid329_i_div_rgb_to_hsv_s) IS
            WHEN "0" => resFinal_uid329_i_div_rgb_to_hsv_q <= redist72_prodPostRightShiftPostRndRange_uid327_i_div_rgb_to_hsv_b_1_q;
            WHEN "1" => resFinal_uid329_i_div_rgb_to_hsv_q <= cstValOvf_uid328_i_div_rgb_to_hsv_q;
            WHEN OTHERS => resFinal_uid329_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_inputreg(DELAY,1035)
    redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinal_uid329_i_div_rgb_to_hsv_q, xout => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6(DELAY,988)
    redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_inputreg_q, xout => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_q, clk => clock, aclr => resetn );

    -- redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg(DELAY,1036)
    redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_q, xout => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg_q, clk => clock, aclr => resetn );

    -- resFinalM1_uid334_i_div_rgb_to_hsv(SUB,333)@47
    resFinalM1_uid334_i_div_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg_q);
    resFinalM1_uid334_i_div_rgb_to_hsv_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    resFinalM1_uid334_i_div_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalM1_uid334_i_div_rgb_to_hsv_a) - UNSIGNED(resFinalM1_uid334_i_div_rgb_to_hsv_b));
    resFinalM1_uid334_i_div_rgb_to_hsv_q <= resFinalM1_uid334_i_div_rgb_to_hsv_o(32 downto 0);

    -- resFinalPostMux_uid335_i_div_rgb_to_hsv(BITSELECT,334)@47
    resFinalPostMux_uid335_i_div_rgb_to_hsv_in <= resFinalM1_uid334_i_div_rgb_to_hsv_q(31 downto 0);
    resFinalPostMux_uid335_i_div_rgb_to_hsv_b <= resFinalPostMux_uid335_i_div_rgb_to_hsv_in(31 downto 0);

    -- redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1(DELAY,987)
    redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalPostMux_uid335_i_div_rgb_to_hsv_b, xout => redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1_q, clk => clock, aclr => resetn );

    -- redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7(DELAY,989)
    redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid329_i_div_rgb_to_hsv_q_6_outputreg_q, xout => redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select(BITSELECT,910)@41
    prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_b <= resFinal_uid329_i_div_rgb_to_hsv_q(17 downto 0);
    prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_c <= resFinal_uid329_i_div_rgb_to_hsv_q(31 downto 18);

    -- redist89_i_conv52_rgb_to_hsv_vt_join_q_37(DELAY,1007)
    redist89_i_conv52_rgb_to_hsv_vt_join_q_37 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist88_i_conv52_rgb_to_hsv_vt_join_q_36_outputreg_q, xout => redist89_i_conv52_rgb_to_hsv_vt_join_q_37_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_bs2(BITSELECT,760)@41
    prodResY_uid330_i_div_rgb_to_hsv_bs2_in <= redist89_i_conv52_rgb_to_hsv_vt_join_q_37_q(17 downto 0);
    prodResY_uid330_i_div_rgb_to_hsv_bs2_b <= prodResY_uid330_i_div_rgb_to_hsv_bs2_in(17 downto 0);

    -- prodResY_uid330_i_div_rgb_to_hsv_im6(MULT,764)@41 + 2
    prodResY_uid330_i_div_rgb_to_hsv_im6_a0 <= prodResY_uid330_i_div_rgb_to_hsv_bs2_b;
    prodResY_uid330_i_div_rgb_to_hsv_im6_b0 <= prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_c;
    prodResY_uid330_i_div_rgb_to_hsv_im6_reset <= not (resetn);
    prodResY_uid330_i_div_rgb_to_hsv_im6_component : lpm_mult
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
        dataa => prodResY_uid330_i_div_rgb_to_hsv_im6_a0,
        datab => prodResY_uid330_i_div_rgb_to_hsv_im6_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid330_i_div_rgb_to_hsv_im6_reset,
        clock => clock,
        result => prodResY_uid330_i_div_rgb_to_hsv_im6_s1
    );
    prodResY_uid330_i_div_rgb_to_hsv_im6_q <= prodResY_uid330_i_div_rgb_to_hsv_im6_s1;

    -- redist34_prodResY_uid330_i_div_rgb_to_hsv_im6_q_2(DELAY,952)
    redist34_prodResY_uid330_i_div_rgb_to_hsv_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_im6_q, xout => redist34_prodResY_uid330_i_div_rgb_to_hsv_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_align_15(BITSHIFT,773)@45
    prodResY_uid330_i_div_rgb_to_hsv_align_15_qint <= redist34_prodResY_uid330_i_div_rgb_to_hsv_im6_q_2_q & "000000000000000000";
    prodResY_uid330_i_div_rgb_to_hsv_align_15_q <= prodResY_uid330_i_div_rgb_to_hsv_align_15_qint(49 downto 0);

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b(BITJOIN,843)@45
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q <= i_shl_rgb_to_hsv_vt_const_15_q & prodResY_uid330_i_div_rgb_to_hsv_align_15_q;

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b(BITSELECT,846)@45
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitExpansion_for_b_q(65 downto 39);

    -- prodResY_uid330_i_div_rgb_to_hsv_bs5(BITSELECT,763)@41
    prodResY_uid330_i_div_rgb_to_hsv_bs5_b <= redist89_i_conv52_rgb_to_hsv_vt_join_q_37_q(31 downto 18);

    -- prodResY_uid330_i_div_rgb_to_hsv_im3(MULT,761)@41 + 2
    prodResY_uid330_i_div_rgb_to_hsv_im3_a0 <= prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_b;
    prodResY_uid330_i_div_rgb_to_hsv_im3_b0 <= prodResY_uid330_i_div_rgb_to_hsv_bs5_b;
    prodResY_uid330_i_div_rgb_to_hsv_im3_reset <= not (resetn);
    prodResY_uid330_i_div_rgb_to_hsv_im3_component : lpm_mult
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
        dataa => prodResY_uid330_i_div_rgb_to_hsv_im3_a0,
        datab => prodResY_uid330_i_div_rgb_to_hsv_im3_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid330_i_div_rgb_to_hsv_im3_reset,
        clock => clock,
        result => prodResY_uid330_i_div_rgb_to_hsv_im3_s1
    );
    prodResY_uid330_i_div_rgb_to_hsv_im3_q <= prodResY_uid330_i_div_rgb_to_hsv_im3_s1;

    -- redist35_prodResY_uid330_i_div_rgb_to_hsv_im3_q_1(DELAY,953)
    redist35_prodResY_uid330_i_div_rgb_to_hsv_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_im3_q, xout => redist35_prodResY_uid330_i_div_rgb_to_hsv_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_align_13(BITSHIFT,771)@44
    prodResY_uid330_i_div_rgb_to_hsv_align_13_qint <= redist35_prodResY_uid330_i_div_rgb_to_hsv_im3_q_1_q & "000000000000000000";
    prodResY_uid330_i_div_rgb_to_hsv_align_13_q <= prodResY_uid330_i_div_rgb_to_hsv_align_13_qint(49 downto 0);

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b(BITJOIN,834)@44
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q <= i_conv4_i_i_i_rgb_to_hsv_vt_const_31_q & prodResY_uid330_i_div_rgb_to_hsv_align_13_q;

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b(BITSELECT,837)@44
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_b_q(64 downto 39);

    -- prodResY_uid330_i_div_rgb_to_hsv_im9(MULT,767)@41 + 2
    prodResY_uid330_i_div_rgb_to_hsv_im9_a0 <= prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_c;
    prodResY_uid330_i_div_rgb_to_hsv_im9_b0 <= prodResY_uid330_i_div_rgb_to_hsv_bs5_b;
    prodResY_uid330_i_div_rgb_to_hsv_im9_reset <= not (resetn);
    prodResY_uid330_i_div_rgb_to_hsv_im9_component : lpm_mult
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
        dataa => prodResY_uid330_i_div_rgb_to_hsv_im9_a0,
        datab => prodResY_uid330_i_div_rgb_to_hsv_im9_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid330_i_div_rgb_to_hsv_im9_reset,
        clock => clock,
        result => prodResY_uid330_i_div_rgb_to_hsv_im9_s1
    );
    prodResY_uid330_i_div_rgb_to_hsv_im9_q <= prodResY_uid330_i_div_rgb_to_hsv_im9_s1;

    -- redist33_prodResY_uid330_i_div_rgb_to_hsv_im9_q_1(DELAY,951)
    redist33_prodResY_uid330_i_div_rgb_to_hsv_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_im9_q, xout => redist33_prodResY_uid330_i_div_rgb_to_hsv_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_im0(MULT,758)@41 + 2
    prodResY_uid330_i_div_rgb_to_hsv_im0_a0 <= prodResY_uid330_i_div_rgb_to_hsv_bs1_merged_bit_select_b;
    prodResY_uid330_i_div_rgb_to_hsv_im0_b0 <= prodResY_uid330_i_div_rgb_to_hsv_bs2_b;
    prodResY_uid330_i_div_rgb_to_hsv_im0_reset <= not (resetn);
    prodResY_uid330_i_div_rgb_to_hsv_im0_component : lpm_mult
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
        dataa => prodResY_uid330_i_div_rgb_to_hsv_im0_a0,
        datab => prodResY_uid330_i_div_rgb_to_hsv_im0_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid330_i_div_rgb_to_hsv_im0_reset,
        clock => clock,
        result => prodResY_uid330_i_div_rgb_to_hsv_im0_s1
    );
    prodResY_uid330_i_div_rgb_to_hsv_im0_q <= prodResY_uid330_i_div_rgb_to_hsv_im0_s1;

    -- redist36_prodResY_uid330_i_div_rgb_to_hsv_im0_q_1(DELAY,954)
    redist36_prodResY_uid330_i_div_rgb_to_hsv_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_im0_q, xout => redist36_prodResY_uid330_i_div_rgb_to_hsv_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_join_12(BITJOIN,770)@44
    prodResY_uid330_i_div_rgb_to_hsv_join_12_q <= redist33_prodResY_uid330_i_div_rgb_to_hsv_im9_q_1_q & redist36_prodResY_uid330_i_div_rgb_to_hsv_im0_q_1_q;

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a(BITJOIN,832)@44
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodResY_uid330_i_div_rgb_to_hsv_join_12_q;

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a(BITSELECT,836)@44
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitExpansion_for_a_q(64 downto 39);

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2(ADD,838)@44 + 1
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_b);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_b);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_a) + UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c(0) <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o(39);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2(ADD,847)@45 + 1
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_q);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_b);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_a) + UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c(0) <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o(39);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist17_leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q_15(DELAY,935)
    redist17_leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 15, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q, xout => redist17_leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q_15_q, clk => clock, aclr => resetn );

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_BitJoin_for_b(BITJOIN,861)@46
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_BitJoin_for_b_q <= prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_b & i_conv_i_i3_rgb_to_hsv_vt_const_7_q & redist17_leftShiftStage0_uid624_i_shl_rgb_to_hsv_rgb_to_hsv22_shift_x_p2_q_15_q & i_shl_rgb_to_hsv_vt_const_15_q;

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2(COMPARE,788)@46 + 1
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_BitJoin_for_b_q);
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_q);
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_a) - UNSIGNED(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_c(0) <= prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_o(39);

    -- redist18_prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1(DELAY,936)
    redist18_prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c, xout => redist18_prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist19_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1(DELAY,937)
    redist19_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c, xout => redist19_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist20_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1(DELAY,938)
    redist20_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c, xout => redist20_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2(ADD,839)@45 + 1
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p1_of_2_c;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist20_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist19_prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_BitSelect_for_b_c_1_q) & prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_cin(0);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_a) + UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q <= prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_o(26 downto 1);

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,891)@46
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodResY_uid330_i_div_rgb_to_hsv_result_add_0_0_p2_of_2_q;

    -- prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2(ADD,848)@46 + 1
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p1_of_2_c;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist18_prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_BitSelect_for_b_c_1_q) & prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_cin(0);
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_a) + UNSIGNED(prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q <= prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_o(27 downto 1);

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_tessel1_0(BITSELECT,866)@47
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(prodResY_uid330_i_div_rgb_to_hsv_result_add_1_0_p2_of_2_q(24 downto 0));

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_BitJoin_for_c(BITJOIN,868)@47
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_BitJoin_for_c_q <= GND_q & prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_tessel1_0_b;

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_UpperBits_for_a(CONSTANT,783)
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_UpperBits_for_a_q <= "000000000000000000000000000000000";

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select(BITSELECT,917)
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_b <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_UpperBits_for_a_q(6 downto 0));
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_c <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_UpperBits_for_a_q(32 downto 7));

    -- prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2(COMPARE,789)@47 + 1
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_cin <= prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p1_of_2_c;
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_a_tessel0_3_merged_bit_select_c) & '0';
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid331_i_div_rgb_to_hsv_BitSelect_for_b_BitJoin_for_c_q) & prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_cin(0);
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_a) - UNSIGNED(prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_c(0) <= prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_o(27);

    -- resFinalIntDiv_uid336_i_div_rgb_to_hsv(MUX,335)@48
    resFinalIntDiv_uid336_i_div_rgb_to_hsv_s <= prod_qy_GT_x_uid331_i_div_rgb_to_hsv_p2_of_2_c;
    resFinalIntDiv_uid336_i_div_rgb_to_hsv_combproc: PROCESS (resFinalIntDiv_uid336_i_div_rgb_to_hsv_s, redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7_q, redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1_q)
    BEGIN
        CASE (resFinalIntDiv_uid336_i_div_rgb_to_hsv_s) IS
            WHEN "0" => resFinalIntDiv_uid336_i_div_rgb_to_hsv_q <= redist71_resFinal_uid329_i_div_rgb_to_hsv_q_7_q;
            WHEN "1" => resFinalIntDiv_uid336_i_div_rgb_to_hsv_q <= redist69_resFinalPostMux_uid335_i_div_rgb_to_hsv_b_1_q;
            WHEN OTHERS => resFinalIntDiv_uid336_i_div_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_div_rgb_to_hsv_vt_select_23(BITSELECT,217)@48
    i_div_rgb_to_hsv_vt_select_23_b <= resFinalIntDiv_uid336_i_div_rgb_to_hsv_q(23 downto 0);

    -- redist84_i_div_rgb_to_hsv_vt_select_23_b_1(DELAY,1002)
    redist84_i_div_rgb_to_hsv_vt_select_23_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_rgb_to_hsv_vt_select_23_b, xout => redist84_i_div_rgb_to_hsv_vt_select_23_b_1_q, clk => clock, aclr => resetn );

    -- i_div_rgb_to_hsv_vt_join(BITJOIN,216)@49
    i_div_rgb_to_hsv_vt_join_q <= i_conv_i_i3_rgb_to_hsv_vt_const_7_q & redist84_i_div_rgb_to_hsv_vt_select_23_b_1_q;

    -- i_add_rgb_to_hsv(ADD,179)@49
    i_add_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & i_div_rgb_to_hsv_vt_join_q);
    i_add_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_add_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_rgb_to_hsv_a) + UNSIGNED(i_add_rgb_to_hsv_b));
    i_add_rgb_to_hsv_q <= i_add_rgb_to_hsv_o(32 downto 0);

    -- bgTrunc_i_add_rgb_to_hsv_sel_x(BITSELECT,3)@49
    bgTrunc_i_add_rgb_to_hsv_sel_x_b <= i_add_rgb_to_hsv_q(31 downto 0);

    -- i_add_rgb_to_hsv_vt_select_24(BITSELECT,182)@49
    i_add_rgb_to_hsv_vt_select_24_b <= bgTrunc_i_add_rgb_to_hsv_sel_x_b(24 downto 0);

    -- i_add_rgb_to_hsv_vt_join(BITJOIN,181)@49
    i_add_rgb_to_hsv_vt_join_q <= i_add_rgb_to_hsv_vt_const_31_q & i_add_rgb_to_hsv_vt_select_24_b;

    -- i_conv_i_i_i29_rgb_to_hsv_sel_x(BITSELECT,114)@49
    i_conv_i_i_i29_rgb_to_hsv_sel_x_b <= i_add_rgb_to_hsv_vt_join_q(16 downto 0);

    -- redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1(DELAY,1021)
    redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv_i_i_i29_rgb_to_hsv_sel_x_b, xout => redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_hsv27(LOGICAL,273)@49 + 1
    i_unnamed_rgb_to_hsv27_qi <= "1" WHEN i_acl_24_rgb_to_hsv_vt_join_q = c_i32_1gr_q ELSE "0";
    i_unnamed_rgb_to_hsv27_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hsv27_qi, xout => i_unnamed_rgb_to_hsv27_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_hsv25(LOGICAL,272)@49 + 1
    i_unnamed_rgb_to_hsv25_qi <= "1" WHEN i_acl_24_rgb_to_hsv_vt_join_q = c_i32_3gr_q ELSE "0";
    i_unnamed_rgb_to_hsv25_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hsv25_qi, xout => i_unnamed_rgb_to_hsv25_q, clk => clock, aclr => resetn );

    -- i_acl_25_rgb_to_hsv(LOGICAL,165)@50
    i_acl_25_rgb_to_hsv_q <= i_unnamed_rgb_to_hsv25_q or i_unnamed_rgb_to_hsv27_q;

    -- i_unnamed_rgb_to_hsv23(LOGICAL,271)@49 + 1
    i_unnamed_rgb_to_hsv23_qi <= "1" WHEN i_acl_24_rgb_to_hsv_vt_join_q = c_i32_5gr_q ELSE "0";
    i_unnamed_rgb_to_hsv23_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hsv23_qi, xout => i_unnamed_rgb_to_hsv23_q, clk => clock, aclr => resetn );

    -- i_acl_26_rgb_to_hsv(LOGICAL,166)@50
    i_acl_26_rgb_to_hsv_q <= i_unnamed_rgb_to_hsv23_q or i_acl_25_rgb_to_hsv_q;

    -- i_acl_27_rgb_to_hsv(MUX,167)@50
    i_acl_27_rgb_to_hsv_s <= i_acl_26_rgb_to_hsv_q;
    i_acl_27_rgb_to_hsv_combproc: PROCESS (i_acl_27_rgb_to_hsv_s, redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1_q, bgTrunc_i_sub_i_i_i_rgb_to_hsv_sel_x_b)
    BEGIN
        CASE (i_acl_27_rgb_to_hsv_s) IS
            WHEN "0" => i_acl_27_rgb_to_hsv_q <= redist103_i_conv_i_i_i29_rgb_to_hsv_sel_x_b_1_q;
            WHEN "1" => i_acl_27_rgb_to_hsv_q <= bgTrunc_i_sub_i_i_i_rgb_to_hsv_sel_x_b;
            WHEN OTHERS => i_acl_27_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv4_i_i_i_rgb_to_hsv_sel_x(BITSELECT,107)@50
    i_conv4_i_i_i_rgb_to_hsv_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_27_rgb_to_hsv_q(16 downto 0)), 32));

    -- i_conv4_i_i_i_rgb_to_hsv_vt_select_16(BITSELECT,201)@50
    i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b <= i_conv4_i_i_i_rgb_to_hsv_sel_x_b(16 downto 0);

    -- redist90_i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b_1(DELAY,1008)
    redist90_i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b, xout => redist90_i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b_1_q, clk => clock, aclr => resetn );

    -- i_conv4_i_i_i_rgb_to_hsv_vt_join(BITJOIN,200)@51
    i_conv4_i_i_i_rgb_to_hsv_vt_join_q <= i_conv4_i_i_i_rgb_to_hsv_vt_const_31_q & redist90_i_conv4_i_i_i_rgb_to_hsv_vt_select_16_b_1_q;

    -- i_add_i_i_i_rgb_to_hsv(ADD,178)@51
    i_add_i_i_i_rgb_to_hsv_a <= STD_LOGIC_VECTOR("0" & i_conv4_i_i_i_rgb_to_hsv_vt_join_q);
    i_add_i_i_i_rgb_to_hsv_b <= STD_LOGIC_VECTOR("0" & i_mul_add66_rgb_to_hsv_vt_join_q);
    i_add_i_i_i_rgb_to_hsv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_i_i_i_rgb_to_hsv_a) + UNSIGNED(i_add_i_i_i_rgb_to_hsv_b));
    i_add_i_i_i_rgb_to_hsv_q <= i_add_i_i_i_rgb_to_hsv_o(32 downto 0);

    -- bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x(BITSELECT,2)@51
    bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x_b <= i_add_i_i_i_rgb_to_hsv_q(31 downto 0);

    -- leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x(MUX,614)@51
    leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_s <= VCC_q;
    leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_combproc: PROCESS (leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_s, bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x_b, leftShiftStage0Idx1_uid613_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q <= bgTrunc_i_add_i_i_i_rgb_to_hsv_sel_x_b;
            WHEN "1" => leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q <= leftShiftStage0Idx1_uid613_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv_i_i3_rgb_to_hsv_vt_select_31(BITSELECT,212)@51
    i_conv_i_i3_rgb_to_hsv_vt_select_31_b <= leftShiftStage0_uid615_i_conv_i_i3_rgb_to_hsv_rgb_to_hsv31_shift_x_q(31 downto 8);

    -- i_conv_i_i3_rgb_to_hsv_vt_join(BITJOIN,211)@51
    i_conv_i_i3_rgb_to_hsv_vt_join_q <= i_conv_i_i3_rgb_to_hsv_vt_select_31_b & i_conv_i_i3_rgb_to_hsv_vt_const_7_q;

    -- i_shl_i_i4_rgb_to_hsv_BitSelect_for_a(BITSELECT,648)@51
    i_shl_i_i4_rgb_to_hsv_BitSelect_for_a_b <= i_conv_i_i3_rgb_to_hsv_vt_join_q(26 downto 8);

    -- i_shl_i_i4_rgb_to_hsv_join(BITJOIN,649)@51
    i_shl_i_i4_rgb_to_hsv_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & i_shl_i_i4_rgb_to_hsv_BitSelect_for_a_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q;

    -- i_shl_i_i4_rgb_to_hsv_vt_select_26(BITSELECT,263)@51
    i_shl_i_i4_rgb_to_hsv_vt_select_26_b <= i_shl_i_i4_rgb_to_hsv_join_q(26 downto 8);

    -- redist79_i_shl_i_i4_rgb_to_hsv_vt_select_26_b_1(DELAY,997)
    redist79_i_shl_i_i4_rgb_to_hsv_vt_select_26_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_shl_i_i4_rgb_to_hsv_vt_select_26_b, xout => redist79_i_shl_i_i4_rgb_to_hsv_vt_select_26_b_1_q, clk => clock, aclr => resetn );

    -- i_shl_i_i4_rgb_to_hsv_vt_join(BITJOIN,262)@52
    i_shl_i_i4_rgb_to_hsv_vt_join_q <= i_or_i_i_zext_rgb_to_hsv_vt_const_31_q & redist79_i_shl_i_i4_rgb_to_hsv_vt_select_26_b_1_q & i_conv_i_i3_rgb_to_hsv_vt_const_7_q;

    -- i_cmp_rgb_to_hsv(LOGICAL,197)@3 + 1
    i_cmp_rgb_to_hsv_qi <= "1" WHEN i_acl_8_rgb_to_hsv_q = i_acl_9_rgb_to_hsv_q ELSE "0";
    i_cmp_rgb_to_hsv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hsv_qi, xout => i_cmp_rgb_to_hsv_q, clk => clock, aclr => resetn );

    -- redist91_i_cmp_rgb_to_hsv_q_49(DELAY,1009)
    redist91_i_cmp_rgb_to_hsv_q_49 : dspba_delay
    GENERIC MAP ( width => 1, depth => 48, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hsv_q, xout => redist91_i_cmp_rgb_to_hsv_q_49_q, clk => clock, aclr => resetn );

    -- i_or_i_i_zext_rgb_to_hsv(MUX,240)@52
    i_or_i_i_zext_rgb_to_hsv_s <= redist91_i_cmp_rgb_to_hsv_q_49_q;
    i_or_i_i_zext_rgb_to_hsv_combproc: PROCESS (i_or_i_i_zext_rgb_to_hsv_s, i_shl_i_i4_rgb_to_hsv_vt_join_q, dupName_0_c_i32_0gr_x_q)
    BEGIN
        CASE (i_or_i_i_zext_rgb_to_hsv_s) IS
            WHEN "0" => i_or_i_i_zext_rgb_to_hsv_q <= i_shl_i_i4_rgb_to_hsv_vt_join_q;
            WHEN "1" => i_or_i_i_zext_rgb_to_hsv_q <= dupName_0_c_i32_0gr_x_q;
            WHEN OTHERS => i_or_i_i_zext_rgb_to_hsv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_or_i_i_zext_rgb_to_hsv_vt_select_26(BITSELECT,244)@52
    i_or_i_i_zext_rgb_to_hsv_vt_select_26_b <= i_or_i_i_zext_rgb_to_hsv_q(26 downto 8);

    -- i_conv_i_i3_rgb_to_hsv_vt_const_7(CONSTANT,210)
    i_conv_i_i3_rgb_to_hsv_vt_const_7_q <= "00000000";

    -- i_or_i_i_zext_rgb_to_hsv_vt_join(BITJOIN,243)@52
    i_or_i_i_zext_rgb_to_hsv_vt_join_q <= i_or_i_i_zext_rgb_to_hsv_vt_const_31_q & i_or_i_i_zext_rgb_to_hsv_vt_select_26_b & i_conv_i_i3_rgb_to_hsv_vt_const_7_q;

    -- redist93_i_acl_8_rgb_to_hsv_q_50_notEnable(LOGICAL,1066)
    redist93_i_acl_8_rgb_to_hsv_q_50_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist93_i_acl_8_rgb_to_hsv_q_50_nor(LOGICAL,1067)
    redist93_i_acl_8_rgb_to_hsv_q_50_nor_q <= not (redist93_i_acl_8_rgb_to_hsv_q_50_notEnable_q or redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_q);

    -- redist93_i_acl_8_rgb_to_hsv_q_50_mem_last(CONSTANT,1063)
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_last_q <= "0101110";

    -- redist93_i_acl_8_rgb_to_hsv_q_50_cmp(LOGICAL,1064)
    redist93_i_acl_8_rgb_to_hsv_q_50_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_q);
    redist93_i_acl_8_rgb_to_hsv_q_50_cmp_q <= "1" WHEN redist93_i_acl_8_rgb_to_hsv_q_50_mem_last_q = redist93_i_acl_8_rgb_to_hsv_q_50_cmp_b ELSE "0";

    -- redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg(REG,1065)
    redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg_q <= STD_LOGIC_VECTOR(redist93_i_acl_8_rgb_to_hsv_q_50_cmp_q);
        END IF;
    END PROCESS;

    -- redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena(REG,1068)
    redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist93_i_acl_8_rgb_to_hsv_q_50_nor_q = "1") THEN
                redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_i_acl_8_rgb_to_hsv_q_50_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_i_acl_8_rgb_to_hsv_q_50_enaAnd(LOGICAL,1069)
    redist93_i_acl_8_rgb_to_hsv_q_50_enaAnd_q <= redist93_i_acl_8_rgb_to_hsv_q_50_sticky_ena_q and VCC_q;

    -- redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt(COUNTER,1061)
    -- low=0, high=47, step=1, init=0
    redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i = TO_UNSIGNED(46, 6)) THEN
                redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq <= '1';
            ELSE
                redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq <= '0';
            END IF;
            IF (redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_eq = '1') THEN
                redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i <= redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i + 17;
            ELSE
                redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i <= redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_i, 6)));

    -- redist93_i_acl_8_rgb_to_hsv_q_50_wraddr(REG,1062)
    redist93_i_acl_8_rgb_to_hsv_q_50_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_wraddr_q <= "101111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist93_i_acl_8_rgb_to_hsv_q_50_wraddr_q <= STD_LOGIC_VECTOR(redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist93_i_acl_8_rgb_to_hsv_q_50_mem(DUALMEM,1060)
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_ia <= STD_LOGIC_VECTOR(i_acl_8_rgb_to_hsv_q);
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_aa <= redist93_i_acl_8_rgb_to_hsv_q_50_wraddr_q;
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_ab <= redist93_i_acl_8_rgb_to_hsv_q_50_rdcnt_q;
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_reset0 <= not (resetn);
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 48,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 48,
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
        clocken1 => redist93_i_acl_8_rgb_to_hsv_q_50_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist93_i_acl_8_rgb_to_hsv_q_50_mem_reset0,
        clock1 => clock,
        address_a => redist93_i_acl_8_rgb_to_hsv_q_50_mem_aa,
        data_a => redist93_i_acl_8_rgb_to_hsv_q_50_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_i_acl_8_rgb_to_hsv_q_50_mem_ab,
        q_b => redist93_i_acl_8_rgb_to_hsv_q_50_mem_iq
    );
    redist93_i_acl_8_rgb_to_hsv_q_50_mem_q <= redist93_i_acl_8_rgb_to_hsv_q_50_mem_iq(7 downto 0);

    -- i_acl_8_zext_rgb_to_hsv_sel_x(BITSELECT,106)@52
    i_acl_8_zext_rgb_to_hsv_sel_x_b <= std_logic_vector(resize(unsigned(redist93_i_acl_8_rgb_to_hsv_q_50_mem_q(7 downto 0)), 32));

    -- i_acl_8_zext_rgb_to_hsv_vt_select_7(BITSELECT,176)@52
    i_acl_8_zext_rgb_to_hsv_vt_select_7_b <= i_acl_8_zext_rgb_to_hsv_sel_x_b(7 downto 0);

    -- i_acl_8_zext_rgb_to_hsv_vt_join(BITJOIN,175)@52
    i_acl_8_zext_rgb_to_hsv_vt_join_q <= i_acl_8_zext_rgb_to_hsv_vt_const_31_q & i_acl_8_zext_rgb_to_hsv_vt_select_7_b;

    -- i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_vec_2_join_x(BITJOIN,104)@52
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_vec_2_join_x_q <= i_s_coerce268269274_zext_rgb_to_hsv_vt_join_q & i_or_i_i_zext_rgb_to_hsv_vt_join_q & i_acl_8_zext_rgb_to_hsv_vt_join_q;

    -- i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select(BITSELECT,904)@52
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_vec_2_join_x_q(64 downto 0);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_b <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(0 downto 0);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_c <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(1 downto 1);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_d <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(2 downto 2);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_e <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(3 downto 3);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_f <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(4 downto 4);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_g <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(40 downto 40);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_h <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(41 downto 41);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_i <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(42 downto 42);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_j <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(43 downto 43);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_k <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(44 downto 44);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_l <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(45 downto 45);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_m <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(46 downto 46);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_n <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(47 downto 47);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_o <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(48 downto 48);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_p <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(49 downto 49);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_q <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(5 downto 5);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_r <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(50 downto 50);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_s <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(51 downto 51);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_t <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(52 downto 52);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_u <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(53 downto 53);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_v <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(54 downto 54);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_w <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(55 downto 55);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_x <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(56 downto 56);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_y <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(57 downto 57);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_z <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(58 downto 58);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_aa <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(6 downto 6);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_bb <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(64 downto 64);
    i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_cc <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_in(7 downto 7);

    -- i_acl_28_compressed_rgb_to_hsv_rgb_to_hsv33_acl_28_shuffle_join_x(BITJOIN,105)@52
    i_acl_28_compressed_rgb_to_hsv_rgb_to_hsv33_acl_28_shuffle_join_x_q <= i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_bb & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_z & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_y & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_x & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_w & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_v & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_u & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_t & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_s & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_r & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_p & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_o & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_n & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_m & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_l & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_k & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_j & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_i & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_h & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_g & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_cc & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_aa & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_q & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_f & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_e & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_d & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_c & i_acl_28_bitvec_rgb_to_hsv_rgb_to_hsv32_acl_28_bitvec_select_0_x_merged_bit_select_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,125)@52
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_acl_28_compressed_rgb_to_hsv_rgb_to_hsv33_acl_28_shuffle_join_x_q;
    out_o_valid <= redist102_sync_in_aunroll_x_in_i_valid_51_q;

END normal;

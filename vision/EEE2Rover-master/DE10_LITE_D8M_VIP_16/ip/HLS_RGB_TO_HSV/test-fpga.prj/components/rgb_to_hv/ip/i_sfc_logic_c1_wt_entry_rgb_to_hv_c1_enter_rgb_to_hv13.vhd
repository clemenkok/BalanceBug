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

-- VHDL created from i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_enter_rgb_to_hv13
-- VHDL created on Tue Jun 06 17:34:01 2023


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

entity i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_enter_rgb_to_hv13 is
    port (
        in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_1 : out std_logic_vector(26 downto 0);  -- ufix27
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_enter_rgb_to_hv13;

architecture normal of i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_enter_rgb_to_hv13 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub95_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_sub_i_i_i_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal bgTrunc_i_sub_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_vec_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_28_compressed_rgb_to_hv_rgb_to_hv33_acl_28_shuffle_join_x_q : STD_LOGIC_VECTOR (26 downto 0);
    signal i_acl_8_zext_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_i_i_i_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv96_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i_i22_rgb_to_hv_sel_x_b : STD_LOGIC_VECTOR (16 downto 0);
    signal c_i17_65535_q : STD_LOGIC_VECTOR (16 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_4gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_5gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_13_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_acl_13_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_13_rgb_to_hv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_14_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_15_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_16_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_16_rgb_to_hv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_17_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_17_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_18_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_18_rgb_to_hv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_19_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_19_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_19_rgb_to_hv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_24_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_24_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_24_rgb_to_hv_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_acl_25_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_26_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_27_rgb_to_hv_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_acl_4_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_4_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_5_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_5_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_6_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_6_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_7_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_7_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_8_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_8_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_8_zext_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_acl_8_zext_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_8_zext_rgb_to_hv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_9_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_9_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_add_i_i_i_rgb_to_hv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_i_i_i_rgb_to_hv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_add_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_rgb_to_hv_vt_select_24_b : STD_LOGIC_VECTOR (24 downto 0);
    signal i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cmp_i_i121_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i121_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i121_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i121_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i126_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i126_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i126_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i126_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i151_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i151_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i151_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i151_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i164_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i164_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i164_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i164_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i171_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i171_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i171_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i171_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i35_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i50_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i55_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i70_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i75_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i80_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_rgb_to_hv_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hv_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hv_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_hv_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv4_i_i_i_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (14 downto 0);
    signal i_conv4_i_i_i_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_i_i_i_rgb_to_hv_vt_select_16_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_conv52_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_hv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv96_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv96_rgb_to_hv_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i1_rgb_to_hv_vt_const_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i1_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i1_rgb_to_hv_vt_select_31_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_div_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_rgb_to_hv_vt_select_23_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_green_coerce302303334_red_coerce350351382_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce302303334_red_coerce350351382_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul_add66_rgb_to_hv_vt_const_15_q : STD_LOGIC_VECTOR (12 downto 0);
    signal i_mul_add66_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mux_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_mux_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mux_rgb_to_hv_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond391_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond392_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_or_cond393_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond389_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond390_not_demorgan_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond390_not_demorgan_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond391_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond391_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond392_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond392_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond393_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond393_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond394_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond394_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond395_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond395_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_i_i_zext_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_i_i_zext_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i_i_zext_rgb_to_hv_vt_const_31_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_or_i_i_zext_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i_i_zext_rgb_to_hv_vt_select_26_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_red_coerce350351382_green_coerce302303334_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_red_coerce350351382_green_coerce302303334_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_rgb_to_hv_0_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_1_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_2_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_2_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_3_demorgan_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_3_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_5_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_6_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_7_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_rgb_to_hv_7_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl_i_i_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i_i_rgb_to_hv_vt_select_26_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_shl_rgb_to_hv_vt_const_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_shl_rgb_to_hv_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_rgb_to_hv_vt_select_23_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sub95_rgb_to_hv_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub95_rgb_to_hv_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub95_rgb_to_hv_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub95_rgb_to_hv_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_i_i_i_rgb_to_hv_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hv_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hv_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_i_i_i_rgb_to_hv_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_sub_rgb_to_hv_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hv_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hv_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_hv_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_unnamed_rgb_to_hv23_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv25_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv27_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv27_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_rgb_to_hv29_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_rgb_to_hv29_vt_select_18_b : STD_LOGIC_VECTOR (2 downto 0);
    signal normYNoLeadOne_uid266_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid266_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid267_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid268_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid267_i_div_rgb_to_hv_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid267_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid267_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid270_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid271_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid271_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid272_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid272_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid272_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid277_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid277_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid278_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid279_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid279_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid280_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid281_i_div_rgb_to_hv_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid281_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid281_i_div_rgb_to_hv_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid281_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid284_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid285_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal allOnes_uid285_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid287_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid288_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid291_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid292_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid292_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalM1_uid297_i_div_rgb_to_hv_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid297_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid297_i_div_rgb_to_hv_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid297_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalPostMux_uid298_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalPostMux_uid298_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid299_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinalIntDiv_uid299_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid303_zCount_uid264_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid309_zCount_uid264_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid315_zCount_uid264_i_div_rgb_to_hv_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid319_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid325_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid333_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid334_zCount_uid264_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid338_invTabGen_q : STD_LOGIC_VECTOR (37 downto 0);
    signal yT1_uid353_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid355_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid356_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid358_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid358_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid358_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid358_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid359_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid360_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cIncludingRoundingBit_uid363_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal ts2_uid365_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid365_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid365_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid365_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid366_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rndBit_uid369_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid370_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid373_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal nx_mergedSignalTM_uid377_pT1_uid354_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid389_pT1_uid354_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal topRangeY_mergedSignalTM_uid393_pT1_uid354_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid395_pT1_uid354_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid395_pT1_uid354_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid395_pT1_uid354_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid395_pT1_uid354_invPolyEval_reset : std_logic;
    signal sm0_uid395_pT1_uid354_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid396_pT1_uid354_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid396_pT1_uid354_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal topRangeX_uid410_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid411_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid416_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid419_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_mergedSignalTM_uid423_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomY_uid425_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid429_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_uid429_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid430_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid430_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid431_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid431_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid432_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid432_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid438_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid439_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid440_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid441_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid446_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid447_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid448_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid449_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid460_pT2_uid361_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid460_pT2_uid361_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid460_pT2_uid361_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid460_pT2_uid361_invPolyEval_reset : std_logic;
    signal sm0_uid460_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid461_pT2_uid361_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid461_pT2_uid361_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid461_pT2_uid361_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid461_pT2_uid361_invPolyEval_reset : std_logic;
    signal sm0_uid461_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm1_uid462_pT2_uid361_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid462_pT2_uid361_invPolyEval_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid462_pT2_uid361_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid462_pT2_uid361_invPolyEval_reset : std_logic;
    signal sm1_uid462_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid463_pT2_uid361_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid463_pT2_uid361_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid463_pT2_uid361_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid463_pT2_uid361_invPolyEval_reset : std_logic;
    signal sm0_uid463_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid464_pT2_uid361_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid464_pT2_uid361_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid464_pT2_uid361_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid464_pT2_uid361_invPolyEval_reset : std_logic;
    signal sm1_uid464_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid465_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid465_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid466_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid467_pT2_uid361_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid467_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid467_pT2_uid361_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid467_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid468_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid469_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeA_uid469_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highABits_uid470_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid471_pT2_uid361_invPolyEval_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid471_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid471_pT2_uid361_invPolyEval_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid471_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal lev1_a1_uid472_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid473_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid473_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid474_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid475_pT2_uid361_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid475_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid475_pT2_uid361_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid475_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid476_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lowRangeA_uid477_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid477_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid478_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev3_a0high_uid479_pT2_uid361_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid479_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid479_pT2_uid361_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid479_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid480_pT2_uid361_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid481_pT2_uid361_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid481_pT2_uid361_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal topRangeX_uid495_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid496_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_mergedSignalTM_uid520_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomExtension_uid522_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_mergedSignalTM_uid524_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid530_pT3_uid368_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftX_uid530_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid531_pT3_uid368_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_uid531_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid537_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid538_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid543_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid544_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid549_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid550_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid559_pT3_uid368_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid559_pT3_uid368_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid559_pT3_uid368_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid559_pT3_uid368_invPolyEval_reset : std_logic;
    signal sm0_uid559_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid560_pT3_uid368_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid560_pT3_uid368_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid560_pT3_uid368_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm0_uid560_pT3_uid368_invPolyEval_reset : std_logic;
    signal sm0_uid560_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm1_uid561_pT3_uid368_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid561_pT3_uid368_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid561_pT3_uid368_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm1_uid561_pT3_uid368_invPolyEval_reset : std_logic;
    signal sm1_uid561_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid562_pT3_uid368_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid562_pT3_uid368_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid562_pT3_uid368_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid562_pT3_uid368_invPolyEval_reset : std_logic;
    signal sm0_uid562_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid563_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeB_uid564_pT3_uid368_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid564_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal highBBits_uid565_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0_uid567_pT3_uid368_invPolyEval_q : STD_LOGIC_VECTOR (51 downto 0);
    signal leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid576_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid585_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid594_i_unnamed_rgb_to_hv30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_add66_rgb_to_hv_BitSelect_for_a_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hv_BitSelect_for_b_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hv_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i_i_rgb_to_hv_BitSelect_for_a_b : STD_LOGIC_VECTOR (18 downto 0);
    signal i_shl_i_i_rgb_to_hv_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid617_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2_uid620_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid623_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid632_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2_uid635_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3_uid638_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4_uid641_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5_uid644_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx6Pad6_uid645_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6_uid647_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7_uid650_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im0_reset : std_logic;
    signal prodXInvY_uid282_i_div_rgb_to_hv_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im3_reset : std_logic;
    signal prodXInvY_uid282_i_div_rgb_to_hv_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im6_reset : std_logic;
    signal prodXInvY_uid282_i_div_rgb_to_hv_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im9_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im9_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_im9_reset : std_logic;
    signal prodXInvY_uid282_i_div_rgb_to_hv_im9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_join_12_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_align_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_align_13_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx1_uid677_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid680_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx3Pad48_uid682_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid683_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx4Pad64_uid685_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx4_uid686_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng2_uid692_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid694_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng4_uid695_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx2_uid697_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng6_uid698_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage1Idx3_uid700_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx4Rng8_uid701_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx4_uid703_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx5Rng10_uid704_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx5_uid706_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx6Rng12_uid707_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx6Pad12_uid708_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx6_uid709_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx7Rng14_uid710_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx7Pad14_uid711_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx7_uid712_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng1_uid715_prodPostRightShift_uid283_i_div_rgb_to_hv_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage2Idx1_uid717_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im0_reset : std_logic;
    signal prodResY_uid293_i_div_rgb_to_hv_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im3_reset : std_logic;
    signal prodResY_uid293_i_div_rgb_to_hv_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_bs5_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im6_reset : std_logic;
    signal prodResY_uid293_i_div_rgb_to_hv_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im9_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im9_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_im9_reset : std_logic;
    signal prodResY_uid293_i_div_rgb_to_hv_im9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_join_12_q : STD_LOGIC_VECTOR (63 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_align_13_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_align_13_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal memoryC0_uid336_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid336_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid336_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid336_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid336_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid336_invTabGen_lutmem_r : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid337_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid337_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid337_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid337_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid337_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid337_invTabGen_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid340_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid340_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid340_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid340_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid340_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid340_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid343_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid343_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid343_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid343_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid343_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid343_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid346_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid346_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid346_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid346_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid346_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid346_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_UpperBits_for_a_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid372_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (41 downto 0);
    signal ts3_uid372_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid372_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid372_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid372_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid372_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid372_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid372_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid372_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid372_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid372_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid372_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid372_invPolyEval_BitJoin_for_q_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_a_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_b_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_UpperBits_for_b_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (26 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_d : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitJoin_for_q_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (24 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in : STD_LOGIC_VECTOR (58 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_g : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_h : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_i : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_j : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_k : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_l : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_m : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_o : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_p : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_r : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_t : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_u : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_v : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_w : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_y : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_z : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_bb : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_in : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal redist0_leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist17_leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist19_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist20_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist21_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist22_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist23_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist24_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist27_ts3_uid372_invPolyEval_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_memoryC3_uid346_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist30_memoryC1_uid340_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist31_memoryC0_uid337_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_memoryC0_uid336_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist33_prodResY_uid293_i_div_rgb_to_hv_im9_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist34_prodResY_uid293_i_div_rgb_to_hv_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_prodResY_uid293_i_div_rgb_to_hv_im3_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_prodResY_uid293_i_div_rgb_to_hv_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist37_prodXInvY_uid282_i_div_rgb_to_hv_im9_q_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist38_prodXInvY_uid282_i_div_rgb_to_hv_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_prodXInvY_uid282_i_div_rgb_to_hv_im3_q_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist40_prodXInvY_uid282_i_div_rgb_to_hv_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist41_i_mul_add66_rgb_to_hv_BitSelect_for_a_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist42_lowRangeB_uid564_pT3_uid368_invPolyEval_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist43_sm0_uid562_pT3_uid368_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist46_sm0_uid559_pT3_uid368_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist47_rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist48_topRangeY_uid496_pT3_uid368_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist49_osig_uid481_pT2_uid361_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist51_lowRangeA_uid477_pT2_uid361_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_lev1_a1high_uid471_pT2_uid361_invPolyEval_q_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist53_lowRangeA_uid469_pT2_uid361_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_lowRangeA_uid465_pT2_uid361_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_sm1_uid464_pT2_uid361_invPolyEval_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist58_n0_uid449_pT2_uid361_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist59_n1_uid448_pT2_uid361_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist60_s2_uid366_invPolyEval_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist61_s1_uid359_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist63_rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist71_resFinal_uid292_i_div_rgb_to_hv_q_7_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist74_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist75_normYIsOne_uid271_i_div_rgb_to_hv_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_normYIsOneC2_uid270_i_div_rgb_to_hv_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_normYNoLeadOne_uid266_i_div_rgb_to_hv_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist78_i_unnamed_rgb_to_hv29_vt_select_18_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist79_i_shl_i_i_rgb_to_hv_vt_select_26_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist80_i_reduction_rgb_to_hv_7_rgb_to_hv_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_i_or_cond391_rgb_to_hv_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_i_mux_rgb_to_hv_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_div_rgb_to_hv_vt_select_23_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist85_i_conv52_rgb_to_hv_vt_join_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist86_i_conv52_rgb_to_hv_vt_join_q_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_i_conv52_rgb_to_hv_vt_join_q_37_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist89_i_conv4_i_i_i_rgb_to_hv_vt_select_16_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist90_i_cmp_rgb_to_hv_q_49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_i_cmp_i_i_i80_rgb_to_hv_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_i_acl_18_rgb_to_hv_vt_select_2_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist96_sync_in_aunroll_x_in_c1_eni1_1_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist98_sync_in_aunroll_x_in_c1_eni1_2_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist100_sync_in_aunroll_x_in_c1_eni1_3_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist101_sync_in_aunroll_x_in_i_valid_51_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist103_bgTrunc_i_sub_rgb_to_hv_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_inputreg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_reset0 : std_logic;
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i : signal is true;
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq : std_logic;
    attribute preserve of redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq : signal is true;
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_reset0 : std_logic;
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i : signal is true;
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq : std_logic;
    attribute preserve of redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq : signal is true;
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_reset0 : std_logic;
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i : signal is true;
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq : std_logic;
    attribute preserve of redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq : signal is true;
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_i_conv52_rgb_to_hv_vt_join_q_36_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_reset0 : std_logic;
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i : signal is true;
    signal redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq : std_logic;
    attribute preserve of redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq : signal is true;
    signal redist92_i_acl_8_rgb_to_hv_q_50_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_acl_8_rgb_to_hv_q_50_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_inputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_outputreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_reset0 : std_logic;
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_iq : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i : signal is true;
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq : std_logic;
    attribute preserve of redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq : signal is true;
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist101_sync_in_aunroll_x_in_i_valid_51(DELAY,981)
    redist101_sync_in_aunroll_x_in_i_valid_51 : dspba_delay
    GENERIC MAP ( width => 1, depth => 51, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist101_sync_in_aunroll_x_in_i_valid_51_q, clk => clock, aclr => resetn );

    -- i_or_i_i_zext_rgb_to_hv_vt_const_31(CONSTANT,208)
    i_or_i_i_zext_rgb_to_hv_vt_const_31_q <= "00000";

    -- c_i32_0gr(CONSTANT,100)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x(BITSELECT,574)@51
    leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_in <= bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x_b(23 downto 0);
    leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_b <= leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_in(23 downto 0);

    -- leftShiftStage0Idx1_uid576_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x(BITJOIN,575)@51
    leftShiftStage0Idx1_uid576_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q <= leftShiftStage0Idx1Rng8_uid575_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_b & i_conv_i_i1_rgb_to_hv_vt_const_7_q;

    -- i_mul_add66_rgb_to_hv_vt_const_15(CONSTANT,188)
    i_mul_add66_rgb_to_hv_vt_const_15_q <= "0000000000000";

    -- leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x(BITSELECT,592)@49
    leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_in <= i_acl_24_rgb_to_hv_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_b <= leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid594_i_unnamed_rgb_to_hv30_shift_x(BITJOIN,593)@49
    leftShiftStage0Idx1_uid594_i_unnamed_rgb_to_hv30_shift_x_q <= leftShiftStage0Idx1Rng16_uid593_i_unnamed_rgb_to_hv30_shift_x_b & i_shl_rgb_to_hv_vt_const_15_q;

    -- i_acl_13_rgb_to_hv_vt_const_31(CONSTANT,110)
    i_acl_13_rgb_to_hv_vt_const_31_q <= "00000000000000000000000000000";

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_notEnable(LOGICAL,1039)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_nor(LOGICAL,1040)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_nor_q <= not (redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_notEnable_q or redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_q);

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_last(CONSTANT,1036)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_last_q <= "0100110";

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp(LOGICAL,1037)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_q);
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_q <= "1" WHEN redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_last_q = redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_b ELSE "0";

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg(REG,1038)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg_q <= STD_LOGIC_VECTOR(redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmp_q);
        END IF;
    END PROCESS;

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena(REG,1041)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_nor_q = "1") THEN
                redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_enaAnd(LOGICAL,1042)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_enaAnd_q <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_sticky_ena_q and VCC_q;

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt(COUNTER,1034)
    -- low=0, high=39, step=1, init=0
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i = TO_UNSIGNED(38, 6)) THEN
                redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq <= '1';
            ELSE
                redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq <= '0';
            END IF;
            IF (redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_eq = '1') THEN
                redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i + 25;
            ELSE
                redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_i, 6)));

    -- c_i32_5gr(CONSTANT,107)
    c_i32_5gr_q <= "00000000000000000000000000000101";

    -- c_i32_1gr(CONSTANT,103)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- c_i32_2gr(CONSTANT,104)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- c_i32_3gr(CONSTANT,105)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- i_mux_rgb_to_hv_vt_const_31(CONSTANT,194)
    i_mux_rgb_to_hv_vt_const_31_q <= "0000000000000000000000000000010";

    -- c_i32_4gr(CONSTANT,106)
    c_i32_4gr_q <= "00000000000000000000000000000100";

    -- redist97_sync_in_aunroll_x_in_c1_eni1_2_1(DELAY,977)
    redist97_sync_in_aunroll_x_in_c1_eni1_2_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_2, xout => redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q, clk => clock, aclr => resetn );

    -- redist98_sync_in_aunroll_x_in_c1_eni1_2_2(DELAY,978)
    redist98_sync_in_aunroll_x_in_c1_eni1_2_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q, xout => redist98_sync_in_aunroll_x_in_c1_eni1_2_2_q, clk => clock, aclr => resetn );

    -- redist95_sync_in_aunroll_x_in_c1_eni1_1_1(DELAY,975)
    redist95_sync_in_aunroll_x_in_c1_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_1, xout => redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_rgb_to_hv(COMPARE,163)@1 + 1
    i_cmp_i_i_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_rgb_to_hv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i_rgb_to_hv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_rgb_to_hv_c(0) <= i_cmp_i_i_rgb_to_hv_o(9);

    -- i_green_coerce302303334_red_coerce350351382_rgb_to_hv(MUX,186)@2
    i_green_coerce302303334_red_coerce350351382_rgb_to_hv_s <= i_cmp_i_i_rgb_to_hv_c;
    i_green_coerce302303334_red_coerce350351382_rgb_to_hv_combproc: PROCESS (i_green_coerce302303334_red_coerce350351382_rgb_to_hv_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce302303334_red_coerce350351382_rgb_to_hv_s) IS
            WHEN "0" => i_green_coerce302303334_red_coerce350351382_rgb_to_hv_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_green_coerce302303334_red_coerce350351382_rgb_to_hv_q <= redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce302303334_red_coerce350351382_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist99_sync_in_aunroll_x_in_c1_eni1_3_1(DELAY,979)
    redist99_sync_in_aunroll_x_in_c1_eni1_3_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_3, xout => redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i171_rgb_to_hv(COMPARE,156)@1 + 1
    i_cmp_i_i171_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i171_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i171_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i171_rgb_to_hv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i171_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i171_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i171_rgb_to_hv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i171_rgb_to_hv_c(0) <= i_cmp_i_i171_rgb_to_hv_o(9);

    -- i_blue_coerce254255286_red_coerce350351382_rgb_to_hv(MUX,151)@2
    i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_s <= i_cmp_i_i171_rgb_to_hv_c;
    i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_combproc: PROCESS (i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_s) IS
            WHEN "0" => i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q <= redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i164_rgb_to_hv(COMPARE,155)@1 + 1
    i_cmp_i_i164_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i164_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i164_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i164_rgb_to_hv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i164_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i164_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i164_rgb_to_hv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i164_rgb_to_hv_c(0) <= i_cmp_i_i164_rgb_to_hv_o(9);

    -- i_blue_coerce254255286_green_coerce302303334_rgb_to_hv(MUX,150)@2
    i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_s <= i_cmp_i_i164_rgb_to_hv_c;
    i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_combproc: PROCESS (i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_s, redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_s) IS
            WHEN "0" => i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q <= redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q <= redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i151_rgb_to_hv(COMPARE,154)@1 + 1
    i_cmp_i_i151_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i151_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i151_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i151_rgb_to_hv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i151_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i151_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i151_rgb_to_hv_b));
        END IF;
    END PROCESS;
    i_cmp_i_i151_rgb_to_hv_c(0) <= i_cmp_i_i151_rgb_to_hv_o(9);

    -- i_or_cond389_rgb_to_hv(LOGICAL,200)@2
    i_or_cond389_rgb_to_hv_q <= i_cmp_i_i151_rgb_to_hv_c and i_cmp_i_i164_rgb_to_hv_c;

    -- i_acl_6_rgb_to_hv(MUX,137)@2
    i_acl_6_rgb_to_hv_s <= i_or_cond389_rgb_to_hv_q;
    i_acl_6_rgb_to_hv_combproc: PROCESS (i_acl_6_rgb_to_hv_s, i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q, i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q)
    BEGIN
        CASE (i_acl_6_rgb_to_hv_s) IS
            WHEN "0" => i_acl_6_rgb_to_hv_q <= i_blue_coerce254255286_green_coerce302303334_rgb_to_hv_q;
            WHEN "1" => i_acl_6_rgb_to_hv_q <= i_blue_coerce254255286_red_coerce350351382_rgb_to_hv_q;
            WHEN OTHERS => i_acl_6_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i121_rgb_to_hv(COMPARE,152)@1
    i_cmp_i_i121_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i121_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i121_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i121_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i121_rgb_to_hv_b));
    i_cmp_i_i121_rgb_to_hv_c(0) <= i_cmp_i_i121_rgb_to_hv_o(9);

    -- i_cmp_i_i126_rgb_to_hv(COMPARE,153)@1
    i_cmp_i_i126_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i126_rgb_to_hv_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i126_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i126_rgb_to_hv_a) - UNSIGNED(i_cmp_i_i126_rgb_to_hv_b));
    i_cmp_i_i126_rgb_to_hv_c(0) <= i_cmp_i_i126_rgb_to_hv_o(9);

    -- i_or_cond390_not_demorgan_rgb_to_hv(LOGICAL,201)@1 + 1
    i_or_cond390_not_demorgan_rgb_to_hv_qi <= i_cmp_i_i126_rgb_to_hv_c and i_cmp_i_i121_rgb_to_hv_c;
    i_or_cond390_not_demorgan_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond390_not_demorgan_rgb_to_hv_qi, xout => i_or_cond390_not_demorgan_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_acl_9_rgb_to_hv(MUX,144)@2 + 1
    i_acl_9_rgb_to_hv_s <= i_or_cond390_not_demorgan_rgb_to_hv_q;
    i_acl_9_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_9_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_9_rgb_to_hv_s) IS
                WHEN "0" => i_acl_9_rgb_to_hv_q <= i_acl_6_rgb_to_hv_q;
                WHEN "1" => i_acl_9_rgb_to_hv_q <= i_green_coerce302303334_red_coerce350351382_rgb_to_hv_q;
                WHEN OTHERS => i_acl_9_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i35_rgb_to_hv(LOGICAL,157)@3
    i_cmp_i_i_i35_rgb_to_hv_q <= "1" WHEN i_acl_9_rgb_to_hv_q = redist98_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- redist100_sync_in_aunroll_x_in_c1_eni1_3_2(DELAY,980)
    redist100_sync_in_aunroll_x_in_c1_eni1_3_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q, xout => redist100_sync_in_aunroll_x_in_c1_eni1_3_2_q, clk => clock, aclr => resetn );

    -- i_acl_5_rgb_to_hv(MUX,136)@2
    i_acl_5_rgb_to_hv_s <= i_or_cond389_rgb_to_hv_q;
    i_acl_5_rgb_to_hv_combproc: PROCESS (i_acl_5_rgb_to_hv_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_acl_5_rgb_to_hv_s) IS
            WHEN "0" => i_acl_5_rgb_to_hv_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_acl_5_rgb_to_hv_q <= redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_acl_5_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_8_rgb_to_hv(MUX,139)@2 + 1
    i_acl_8_rgb_to_hv_s <= i_or_cond390_not_demorgan_rgb_to_hv_q;
    i_acl_8_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_8_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_8_rgb_to_hv_s) IS
                WHEN "0" => i_acl_8_rgb_to_hv_q <= i_acl_5_rgb_to_hv_q;
                WHEN "1" => i_acl_8_rgb_to_hv_q <= redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q;
                WHEN OTHERS => i_acl_8_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i_i50_rgb_to_hv(LOGICAL,158)@3
    i_cmp_i_i_i50_rgb_to_hv_q <= "1" WHEN i_acl_8_rgb_to_hv_q = redist100_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- i_or_cond395_rgb_to_hv(LOGICAL,206)@3 + 1
    i_or_cond395_rgb_to_hv_qi <= i_cmp_i_i_i50_rgb_to_hv_q and i_cmp_i_i_i35_rgb_to_hv_q;
    i_or_cond395_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond395_rgb_to_hv_qi, xout => i_or_cond395_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hv(MUX,193)@4
    i_mux_rgb_to_hv_s <= i_or_cond395_rgb_to_hv_q;
    i_mux_rgb_to_hv_combproc: PROCESS (i_mux_rgb_to_hv_s, c_i32_5gr_q, c_i32_4gr_q)
    BEGIN
        CASE (i_mux_rgb_to_hv_s) IS
            WHEN "0" => i_mux_rgb_to_hv_q <= c_i32_5gr_q;
            WHEN "1" => i_mux_rgb_to_hv_q <= c_i32_4gr_q;
            WHEN OTHERS => i_mux_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mux_rgb_to_hv_vt_select_0(BITSELECT,196)@4
    i_mux_rgb_to_hv_vt_select_0_b <= i_mux_rgb_to_hv_q(0 downto 0);

    -- redist82_i_mux_rgb_to_hv_vt_select_0_b_1(DELAY,962)
    redist82_i_mux_rgb_to_hv_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mux_rgb_to_hv_vt_select_0_b, xout => redist82_i_mux_rgb_to_hv_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_mux_rgb_to_hv_vt_join(BITJOIN,195)@5
    i_mux_rgb_to_hv_vt_join_q <= i_mux_rgb_to_hv_vt_const_31_q & redist82_i_mux_rgb_to_hv_vt_select_0_b_1_q;

    -- i_cmp_i_i_i75_rgb_to_hv(LOGICAL,161)@3
    i_cmp_i_i_i75_rgb_to_hv_q <= "1" WHEN i_acl_9_rgb_to_hv_q = redist100_sync_in_aunroll_x_in_c1_eni1_3_2_q ELSE "0";

    -- redist96_sync_in_aunroll_x_in_c1_eni1_1_2(DELAY,976)
    redist96_sync_in_aunroll_x_in_c1_eni1_1_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, xout => redist96_sync_in_aunroll_x_in_c1_eni1_1_2_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_i80_rgb_to_hv(LOGICAL,162)@3
    i_cmp_i_i_i80_rgb_to_hv_q <= "1" WHEN i_acl_8_rgb_to_hv_q = redist96_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";

    -- i_or_cond391_rgb_to_hv(LOGICAL,202)@3 + 1
    i_or_cond391_rgb_to_hv_qi <= i_cmp_i_i_i80_rgb_to_hv_q and i_cmp_i_i_i75_rgb_to_hv_q;
    i_or_cond391_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond391_rgb_to_hv_qi, xout => i_or_cond391_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond391_rgb_to_hv(LOGICAL,197)@4
    i_not_or_cond391_rgb_to_hv_q <= i_or_cond391_rgb_to_hv_q xor VCC_q;

    -- i_cmp_i_i_i55_rgb_to_hv(LOGICAL,159)@3
    i_cmp_i_i_i55_rgb_to_hv_q <= "1" WHEN i_acl_9_rgb_to_hv_q = redist96_sync_in_aunroll_x_in_c1_eni1_1_2_q ELSE "0";

    -- i_or_cond394_rgb_to_hv(LOGICAL,205)@3 + 1
    i_or_cond394_rgb_to_hv_qi <= i_cmp_i_i_i50_rgb_to_hv_q and i_cmp_i_i_i55_rgb_to_hv_q;
    i_or_cond394_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond394_rgb_to_hv_qi, xout => i_or_cond394_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_reduction_rgb_to_hv_1_rgb_to_hv(LOGICAL,215)@4
    i_reduction_rgb_to_hv_1_rgb_to_hv_q <= i_or_cond394_rgb_to_hv_q and i_not_or_cond391_rgb_to_hv_q;

    -- i_cmp_i_i_i70_rgb_to_hv(LOGICAL,160)@3
    i_cmp_i_i_i70_rgb_to_hv_q <= "1" WHEN i_acl_8_rgb_to_hv_q = redist98_sync_in_aunroll_x_in_c1_eni1_2_2_q ELSE "0";

    -- i_or_cond392_rgb_to_hv(LOGICAL,203)@3 + 1
    i_or_cond392_rgb_to_hv_qi <= i_cmp_i_i_i70_rgb_to_hv_q and i_cmp_i_i_i75_rgb_to_hv_q;
    i_or_cond392_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond392_rgb_to_hv_qi, xout => i_or_cond392_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond392_rgb_to_hv(LOGICAL,198)@4
    i_not_or_cond392_rgb_to_hv_q <= i_or_cond392_rgb_to_hv_q xor VCC_q;

    -- i_or_cond393_rgb_to_hv(LOGICAL,204)@3 + 1
    i_or_cond393_rgb_to_hv_qi <= i_cmp_i_i_i70_rgb_to_hv_q and i_cmp_i_i_i55_rgb_to_hv_q;
    i_or_cond393_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond393_rgb_to_hv_qi, xout => i_or_cond393_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_not_or_cond393_rgb_to_hv(LOGICAL,199)@4
    i_not_or_cond393_rgb_to_hv_q <= i_or_cond393_rgb_to_hv_q xor VCC_q;

    -- i_reduction_rgb_to_hv_0_rgb_to_hv(LOGICAL,214)@4
    i_reduction_rgb_to_hv_0_rgb_to_hv_q <= i_not_or_cond393_rgb_to_hv_q and i_not_or_cond392_rgb_to_hv_q;

    -- i_reduction_rgb_to_hv_2_rgb_to_hv(LOGICAL,216)@4 + 1
    i_reduction_rgb_to_hv_2_rgb_to_hv_qi <= i_reduction_rgb_to_hv_0_rgb_to_hv_q and i_reduction_rgb_to_hv_1_rgb_to_hv_q;
    i_reduction_rgb_to_hv_2_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hv_2_rgb_to_hv_qi, xout => i_reduction_rgb_to_hv_2_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_acl_13_rgb_to_hv(MUX,109)@5
    i_acl_13_rgb_to_hv_s <= i_reduction_rgb_to_hv_2_rgb_to_hv_q;
    i_acl_13_rgb_to_hv_combproc: PROCESS (i_acl_13_rgb_to_hv_s, i_mux_rgb_to_hv_vt_join_q, c_i32_3gr_q)
    BEGIN
        CASE (i_acl_13_rgb_to_hv_s) IS
            WHEN "0" => i_acl_13_rgb_to_hv_q <= i_mux_rgb_to_hv_vt_join_q;
            WHEN "1" => i_acl_13_rgb_to_hv_q <= c_i32_3gr_q;
            WHEN OTHERS => i_acl_13_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_13_rgb_to_hv_vt_select_2(BITSELECT,112)@5
    i_acl_13_rgb_to_hv_vt_select_2_b <= i_acl_13_rgb_to_hv_q(2 downto 0);

    -- i_acl_13_rgb_to_hv_vt_join(BITJOIN,111)@5
    i_acl_13_rgb_to_hv_vt_join_q <= i_acl_13_rgb_to_hv_vt_const_31_q & i_acl_13_rgb_to_hv_vt_select_2_b;

    -- i_acl_14_rgb_to_hv(LOGICAL,113)@4
    i_acl_14_rgb_to_hv_q <= i_or_cond393_rgb_to_hv_q and i_not_or_cond392_rgb_to_hv_q;

    -- i_acl_15_rgb_to_hv(LOGICAL,114)@4 + 1
    i_acl_15_rgb_to_hv_qi <= i_acl_14_rgb_to_hv_q and i_not_or_cond391_rgb_to_hv_q;
    i_acl_15_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_15_rgb_to_hv_qi, xout => i_acl_15_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_acl_16_rgb_to_hv(MUX,115)@5
    i_acl_16_rgb_to_hv_s <= i_acl_15_rgb_to_hv_q;
    i_acl_16_rgb_to_hv_combproc: PROCESS (i_acl_16_rgb_to_hv_s, i_acl_13_rgb_to_hv_vt_join_q, c_i32_2gr_q)
    BEGIN
        CASE (i_acl_16_rgb_to_hv_s) IS
            WHEN "0" => i_acl_16_rgb_to_hv_q <= i_acl_13_rgb_to_hv_vt_join_q;
            WHEN "1" => i_acl_16_rgb_to_hv_q <= c_i32_2gr_q;
            WHEN OTHERS => i_acl_16_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_16_rgb_to_hv_vt_select_2(BITSELECT,118)@5
    i_acl_16_rgb_to_hv_vt_select_2_b <= i_acl_16_rgb_to_hv_q(2 downto 0);

    -- i_acl_16_rgb_to_hv_vt_join(BITJOIN,117)@5
    i_acl_16_rgb_to_hv_vt_join_q <= i_acl_13_rgb_to_hv_vt_const_31_q & i_acl_16_rgb_to_hv_vt_select_2_b;

    -- i_acl_17_rgb_to_hv(LOGICAL,119)@4 + 1
    i_acl_17_rgb_to_hv_qi <= i_or_cond392_rgb_to_hv_q and i_not_or_cond391_rgb_to_hv_q;
    i_acl_17_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_17_rgb_to_hv_qi, xout => i_acl_17_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hv(MUX,120)@5
    i_acl_18_rgb_to_hv_s <= i_acl_17_rgb_to_hv_q;
    i_acl_18_rgb_to_hv_combproc: PROCESS (i_acl_18_rgb_to_hv_s, i_acl_16_rgb_to_hv_vt_join_q, c_i32_1gr_q)
    BEGIN
        CASE (i_acl_18_rgb_to_hv_s) IS
            WHEN "0" => i_acl_18_rgb_to_hv_q <= i_acl_16_rgb_to_hv_vt_join_q;
            WHEN "1" => i_acl_18_rgb_to_hv_q <= c_i32_1gr_q;
            WHEN OTHERS => i_acl_18_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_18_rgb_to_hv_vt_select_2(BITSELECT,123)@5
    i_acl_18_rgb_to_hv_vt_select_2_b <= i_acl_18_rgb_to_hv_q(2 downto 0);

    -- redist94_i_acl_18_rgb_to_hv_vt_select_2_b_1(DELAY,974)
    redist94_i_acl_18_rgb_to_hv_vt_select_2_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_18_rgb_to_hv_vt_select_2_b, xout => redist94_i_acl_18_rgb_to_hv_vt_select_2_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_18_rgb_to_hv_vt_join(BITJOIN,122)@6
    i_acl_18_rgb_to_hv_vt_join_q <= i_acl_13_rgb_to_hv_vt_const_31_q & redist94_i_acl_18_rgb_to_hv_vt_select_2_b_1_q;

    -- redist81_i_or_cond391_rgb_to_hv_q_3(DELAY,961)
    redist81_i_or_cond391_rgb_to_hv_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond391_rgb_to_hv_q, xout => redist81_i_or_cond391_rgb_to_hv_q_3_q, clk => clock, aclr => resetn );

    -- i_acl_19_rgb_to_hv(MUX,124)@6
    i_acl_19_rgb_to_hv_s <= redist81_i_or_cond391_rgb_to_hv_q_3_q;
    i_acl_19_rgb_to_hv_combproc: PROCESS (i_acl_19_rgb_to_hv_s, i_acl_18_rgb_to_hv_vt_join_q, c_i32_0gr_q)
    BEGIN
        CASE (i_acl_19_rgb_to_hv_s) IS
            WHEN "0" => i_acl_19_rgb_to_hv_q <= i_acl_18_rgb_to_hv_vt_join_q;
            WHEN "1" => i_acl_19_rgb_to_hv_q <= c_i32_0gr_q;
            WHEN OTHERS => i_acl_19_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_19_rgb_to_hv_vt_select_2(BITSELECT,127)@6
    i_acl_19_rgb_to_hv_vt_select_2_b <= i_acl_19_rgb_to_hv_q(2 downto 0);

    -- i_acl_19_rgb_to_hv_vt_join(BITJOIN,126)@6
    i_acl_19_rgb_to_hv_vt_join_q <= i_acl_13_rgb_to_hv_vt_const_31_q & i_acl_19_rgb_to_hv_vt_select_2_b;

    -- redist91_i_cmp_i_i_i80_rgb_to_hv_q_1(DELAY,971)
    redist91_i_cmp_i_i_i80_rgb_to_hv_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i80_rgb_to_hv_q, xout => redist91_i_cmp_i_i_i80_rgb_to_hv_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_rgb_to_hv_6_rgb_to_hv(LOGICAL,220)@4
    i_reduction_rgb_to_hv_6_rgb_to_hv_q <= i_or_cond391_rgb_to_hv_q xor redist91_i_cmp_i_i_i80_rgb_to_hv_q_1_q;

    -- i_reduction_rgb_to_hv_3_demorgan_rgb_to_hv(LOGICAL,217)@4
    i_reduction_rgb_to_hv_3_demorgan_rgb_to_hv_q <= i_or_cond395_rgb_to_hv_q or i_or_cond394_rgb_to_hv_q;

    -- i_reduction_rgb_to_hv_3_rgb_to_hv(LOGICAL,218)@4
    i_reduction_rgb_to_hv_3_rgb_to_hv_q <= i_reduction_rgb_to_hv_3_demorgan_rgb_to_hv_q xor VCC_q;

    -- i_reduction_rgb_to_hv_5_rgb_to_hv(LOGICAL,219)@4
    i_reduction_rgb_to_hv_5_rgb_to_hv_q <= i_reduction_rgb_to_hv_0_rgb_to_hv_q and i_reduction_rgb_to_hv_3_rgb_to_hv_q;

    -- i_reduction_rgb_to_hv_7_rgb_to_hv(LOGICAL,221)@4 + 1
    i_reduction_rgb_to_hv_7_rgb_to_hv_qi <= i_reduction_rgb_to_hv_5_rgb_to_hv_q and i_reduction_rgb_to_hv_6_rgb_to_hv_q;
    i_reduction_rgb_to_hv_7_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hv_7_rgb_to_hv_qi, xout => i_reduction_rgb_to_hv_7_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist80_i_reduction_rgb_to_hv_7_rgb_to_hv_q_2(DELAY,960)
    redist80_i_reduction_rgb_to_hv_7_rgb_to_hv_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_rgb_to_hv_7_rgb_to_hv_q, xout => redist80_i_reduction_rgb_to_hv_7_rgb_to_hv_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hv(MUX,128)@6
    i_acl_24_rgb_to_hv_s <= redist80_i_reduction_rgb_to_hv_7_rgb_to_hv_q_2_q;
    i_acl_24_rgb_to_hv_combproc: PROCESS (i_acl_24_rgb_to_hv_s, i_acl_19_rgb_to_hv_vt_join_q, c_i32_5gr_q)
    BEGIN
        CASE (i_acl_24_rgb_to_hv_s) IS
            WHEN "0" => i_acl_24_rgb_to_hv_q <= i_acl_19_rgb_to_hv_vt_join_q;
            WHEN "1" => i_acl_24_rgb_to_hv_q <= c_i32_5gr_q;
            WHEN OTHERS => i_acl_24_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_24_rgb_to_hv_vt_select_2(BITSELECT,131)@6
    i_acl_24_rgb_to_hv_vt_select_2_b <= i_acl_24_rgb_to_hv_q(2 downto 0);

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_inputreg(DELAY,1031)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_24_rgb_to_hv_vt_select_2_b, xout => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_inputreg_q, clk => clock, aclr => resetn );

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr(REG,1035)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr_q <= "100111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr_q <= STD_LOGIC_VECTOR(redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem(DUALMEM,1033)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ia <= STD_LOGIC_VECTOR(redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_inputreg_q);
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_aa <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_wraddr_q;
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ab <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_rdcnt_q;
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_reset0 <= not (resetn);
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_dmem : altsyncram
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
        clocken1 => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_reset0,
        clock1 => clock,
        address_a => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_aa,
        data_a => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_ab,
        q_b => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_iq
    );
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_q <= redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_iq(2 downto 0);

    -- redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_outputreg(DELAY,1032)
    redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_outputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_mem_q, xout => redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_outputreg_q, clk => clock, aclr => resetn );

    -- i_acl_24_rgb_to_hv_vt_join(BITJOIN,130)@49
    i_acl_24_rgb_to_hv_vt_join_q <= i_acl_13_rgb_to_hv_vt_const_31_q & redist93_i_acl_24_rgb_to_hv_vt_select_2_b_43_outputreg_q;

    -- leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x(MUX,595)@49
    leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_s <= VCC_q;
    leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_combproc: PROCESS (leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_s, i_acl_24_rgb_to_hv_vt_join_q, leftShiftStage0Idx1_uid594_i_unnamed_rgb_to_hv30_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_q <= i_acl_24_rgb_to_hv_vt_join_q;
            WHEN "1" => leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_q <= leftShiftStage0Idx1_uid594_i_unnamed_rgb_to_hv30_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_rgb_to_hv29_vt_select_18(BITSELECT,240)@49
    i_unnamed_rgb_to_hv29_vt_select_18_b <= leftShiftStage0_uid596_i_unnamed_rgb_to_hv30_shift_x_q(18 downto 16);

    -- redist78_i_unnamed_rgb_to_hv29_vt_select_18_b_2(DELAY,958)
    redist78_i_unnamed_rgb_to_hv29_vt_select_18_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hv29_vt_select_18_b, xout => redist78_i_unnamed_rgb_to_hv29_vt_select_18_b_2_q, clk => clock, aclr => resetn );

    -- i_shl_rgb_to_hv_vt_const_15(CONSTANT,227)
    i_shl_rgb_to_hv_vt_const_15_q <= "0000000000000000";

    -- i_unnamed_rgb_to_hv29_vt_join(BITJOIN,239)@51
    i_unnamed_rgb_to_hv29_vt_join_q <= i_mul_add66_rgb_to_hv_vt_const_15_q & redist78_i_unnamed_rgb_to_hv29_vt_select_18_b_2_q & i_shl_rgb_to_hv_vt_const_15_q;

    -- i_mul_add66_rgb_to_hv_BitSelect_for_b(BITSELECT,608)@51
    i_mul_add66_rgb_to_hv_BitSelect_for_b_b <= i_unnamed_rgb_to_hv29_vt_join_q(18 downto 16);

    -- i_mul_add66_rgb_to_hv_BitSelect_for_a(BITSELECT,607)@49
    i_mul_add66_rgb_to_hv_BitSelect_for_a_b <= i_acl_24_rgb_to_hv_vt_join_q(2 downto 0);

    -- redist41_i_mul_add66_rgb_to_hv_BitSelect_for_a_b_2(DELAY,921)
    redist41_i_mul_add66_rgb_to_hv_BitSelect_for_a_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_add66_rgb_to_hv_BitSelect_for_a_b, xout => redist41_i_mul_add66_rgb_to_hv_BitSelect_for_a_b_2_q, clk => clock, aclr => resetn );

    -- i_mul_add66_rgb_to_hv_join(BITJOIN,609)@51
    i_mul_add66_rgb_to_hv_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_mul_add66_rgb_to_hv_BitSelect_for_b_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & redist41_i_mul_add66_rgb_to_hv_BitSelect_for_a_b_2_q;

    -- i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select(BITSELECT,878)@51
    i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_in <= i_mul_add66_rgb_to_hv_join_q(18 downto 0);
    i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_b <= i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_in(18 downto 16);
    i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_c <= i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_in(2 downto 0);

    -- i_mul_add66_rgb_to_hv_vt_join(BITJOIN,190)@51
    i_mul_add66_rgb_to_hv_vt_join_q <= i_mul_add66_rgb_to_hv_vt_const_15_q & i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_b & i_mul_add66_rgb_to_hv_vt_const_15_q & i_mul_add66_rgb_to_hv_vt_select_18_merged_bit_select_c;

    -- i_conv4_i_i_i_rgb_to_hv_vt_const_31(CONSTANT,166)
    i_conv4_i_i_i_rgb_to_hv_vt_const_31_q <= "000000000000000";

    -- c_i17_65535(CONSTANT,97)
    c_i17_65535_q <= "10000000000000001";

    -- i_sub_i_i_i_rgb_to_hv(SUB,232)@50
    i_sub_i_i_i_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & c_i17_65535_q);
    i_sub_i_i_i_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1_q);
    i_sub_i_i_i_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_i_i_i_rgb_to_hv_a) - UNSIGNED(i_sub_i_i_i_rgb_to_hv_b));
    i_sub_i_i_i_rgb_to_hv_q <= i_sub_i_i_i_rgb_to_hv_o(17 downto 0);

    -- bgTrunc_i_sub_i_i_i_rgb_to_hv_sel_x(BITSELECT,5)@50
    bgTrunc_i_sub_i_i_i_rgb_to_hv_sel_x_b <= STD_LOGIC_VECTOR(i_sub_i_i_i_rgb_to_hv_q(16 downto 0));

    -- i_add_rgb_to_hv_vt_const_31(CONSTANT,147)
    i_add_rgb_to_hv_vt_const_31_q <= "0000000";

    -- cstValOvf_uid291_i_div_rgb_to_hv(CONSTANT,290)
    cstValOvf_uid291_i_div_rgb_to_hv_q <= "11111111111111111111111111111111";

    -- rightShiftStage2Idx1Rng1_uid715_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,714)@38
    rightShiftStage2Idx1Rng1_uid715_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 1);

    -- rightShiftStage2Idx1_uid717_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,716)@38
    rightShiftStage2Idx1_uid717_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= GND_q & rightShiftStage2Idx1Rng1_uid715_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage1Idx7Pad14_uid711_prodPostRightShift_uid283_i_div_rgb_to_hv(CONSTANT,710)
    rightShiftStage1Idx7Pad14_uid711_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= "00000000000000";

    -- rightShiftStage1Idx7Rng14_uid710_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,709)@38
    rightShiftStage1Idx7Rng14_uid710_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 14);

    -- rightShiftStage1Idx7_uid712_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,711)@38
    rightShiftStage1Idx7_uid712_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx7Pad14_uid711_prodPostRightShift_uid283_i_div_rgb_to_hv_q & rightShiftStage1Idx7Rng14_uid710_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage1Idx6Pad12_uid708_prodPostRightShift_uid283_i_div_rgb_to_hv(CONSTANT,707)
    rightShiftStage1Idx6Pad12_uid708_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= "000000000000";

    -- rightShiftStage1Idx6Rng12_uid707_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,706)@38
    rightShiftStage1Idx6Rng12_uid707_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 12);

    -- rightShiftStage1Idx6_uid709_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,708)@38
    rightShiftStage1Idx6_uid709_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx6Pad12_uid708_prodPostRightShift_uid283_i_div_rgb_to_hv_q & rightShiftStage1Idx6Rng12_uid707_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightBottomX_bottomExtension_uid522_pT3_uid368_invPolyEval(CONSTANT,521)
    rightBottomX_bottomExtension_uid522_pT3_uid368_invPolyEval_q <= "0000000000";

    -- rightShiftStage1Idx5Rng10_uid704_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,703)@38
    rightShiftStage1Idx5Rng10_uid704_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 10);

    -- rightShiftStage1Idx5_uid706_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,705)@38
    rightShiftStage1Idx5_uid706_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightBottomX_bottomExtension_uid522_pT3_uid368_invPolyEval_q & rightShiftStage1Idx5Rng10_uid704_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage1Idx4Rng8_uid701_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,700)@38
    rightShiftStage1Idx4Rng8_uid701_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 8);

    -- rightShiftStage1Idx4_uid703_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,702)@38
    rightShiftStage1Idx4_uid703_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= i_conv_i_i1_rgb_to_hv_vt_const_7_q & rightShiftStage1Idx4Rng8_uid701_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- leftShiftStage1Idx6Pad6_uid645_normY_uid265_i_div_rgb_to_hv(CONSTANT,644)
    leftShiftStage1Idx6Pad6_uid645_normY_uid265_i_div_rgb_to_hv_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid698_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,697)@38
    rightShiftStage1Idx3Rng6_uid698_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 6);

    -- rightShiftStage1Idx3_uid700_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,699)@38
    rightShiftStage1Idx3_uid700_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= leftShiftStage1Idx6Pad6_uid645_normY_uid265_i_div_rgb_to_hv_q & rightShiftStage1Idx3Rng6_uid698_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- zs_uid319_zCount_uid264_i_div_rgb_to_hv(CONSTANT,318)
    zs_uid319_zCount_uid264_i_div_rgb_to_hv_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid695_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,694)@38
    rightShiftStage1Idx2Rng4_uid695_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 4);

    -- rightShiftStage1Idx2_uid697_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,696)@38
    rightShiftStage1Idx2_uid697_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= zs_uid319_zCount_uid264_i_div_rgb_to_hv_q & rightShiftStage1Idx2Rng4_uid695_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- zs_uid325_zCount_uid264_i_div_rgb_to_hv(CONSTANT,324)
    zs_uid325_zCount_uid264_i_div_rgb_to_hv_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid692_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,691)@38
    rightShiftStage1Idx1Rng2_uid692_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q(64 downto 2);

    -- rightShiftStage1Idx1_uid694_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,693)@38
    rightShiftStage1Idx1_uid694_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= zs_uid325_zCount_uid264_i_div_rgb_to_hv_q & rightShiftStage1Idx1Rng2_uid692_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv(CONSTANT,686)
    rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= "00000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Pad64_uid685_prodPostRightShift_uid283_i_div_rgb_to_hv(CONSTANT,684)
    rightShiftStage0Idx4Pad64_uid685_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,683)@37
    rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_in <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_in(64 downto 64);

    -- rightShiftStage0Idx4_uid686_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,685)@37
    rightShiftStage0Idx4_uid686_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx4Pad64_uid685_prodPostRightShift_uid283_i_div_rgb_to_hv_q & rightShiftStage0Idx4Rng64_uid684_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage0Idx3Pad48_uid682_prodPostRightShift_uid283_i_div_rgb_to_hv(CONSTANT,681)
    rightShiftStage0Idx3Pad48_uid682_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,680)@37
    rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_in <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_in(64 downto 48);

    -- rightShiftStage0Idx3_uid683_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,682)@37
    rightShiftStage0Idx3_uid683_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx3Pad48_uid682_prodPostRightShift_uid283_i_div_rgb_to_hv_q & rightShiftStage0Idx3Rng48_uid681_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,677)@37
    rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_in <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_in(64 downto 32);

    -- rightShiftStage0Idx2_uid680_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,679)@37
    rightShiftStage0Idx2_uid680_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= c_i32_0gr_q & rightShiftStage0Idx2Rng32_uid678_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv(BITSELECT,674)@37
    rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_in <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_b <= rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_in(64 downto 16);

    -- rightShiftStage0Idx1_uid677_prodPostRightShift_uid283_i_div_rgb_to_hv(BITJOIN,676)@37
    rightShiftStage0Idx1_uid677_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= i_shl_rgb_to_hv_vt_const_15_q & rightShiftStage0Idx1Rng16_uid675_prodPostRightShift_uid283_i_div_rgb_to_hv_b;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_UpperBits_for_b(CONSTANT,788)
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_UpperBits_for_b_q <= "00000000000000000";

    -- i_acl_8_zext_rgb_to_hv_vt_const_31(CONSTANT,141)
    i_acl_8_zext_rgb_to_hv_vt_const_31_q <= "000000000000000000000000";

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0(BITSELECT,854)
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b <= i_acl_8_zext_rgb_to_hv_vt_const_31_q(7 downto 0);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel3_0(BITSELECT,858)
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel3_0_b <= i_acl_8_zext_rgb_to_hv_vt_const_31_q(23 downto 16);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3(MUX,817)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_s <= VCC_q;
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_combproc: PROCESS (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_s, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel3_0_b, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b)
    BEGIN
        CASE (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_s) IS
            WHEN "0" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel3_0_b;
            WHEN "1" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN OTHERS => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_notEnable(LOGICAL,1005)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_nor(LOGICAL,1006)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_nor_q <= not (redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_notEnable_q or redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_q);

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_last(CONSTANT,1002)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_last_q <= "011000";

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp(LOGICAL,1003)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_b <= STD_LOGIC_VECTOR("0" & redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_q);
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_q <= "1" WHEN redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_last_q = redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_b ELSE "0";

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg(REG,1004)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg_q <= STD_LOGIC_VECTOR(redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmp_q);
        END IF;
    END PROCESS;

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena(REG,1007)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_nor_q = "1") THEN
                redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_q <= STD_LOGIC_VECTOR(redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_enaAnd(LOGICAL,1008)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_enaAnd_q <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_sticky_ena_q and VCC_q;

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt(COUNTER,1000)
    -- low=0, high=25, step=1, init=0
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq <= '1';
            ELSE
                redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq <= '0';
            END IF;
            IF (redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_eq = '1') THEN
                redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i + 7;
            ELSE
                redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_i, 5)));

    -- i_red_coerce350351382_green_coerce302303334_rgb_to_hv(MUX,213)@2
    i_red_coerce350351382_green_coerce302303334_rgb_to_hv_s <= i_cmp_i_i_rgb_to_hv_c;
    i_red_coerce350351382_green_coerce302303334_rgb_to_hv_combproc: PROCESS (i_red_coerce350351382_green_coerce302303334_rgb_to_hv_s, redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce350351382_green_coerce302303334_rgb_to_hv_s) IS
            WHEN "0" => i_red_coerce350351382_green_coerce302303334_rgb_to_hv_q <= redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_red_coerce350351382_green_coerce302303334_rgb_to_hv_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce350351382_green_coerce302303334_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_red_coerce350351382_blue_coerce254255286_rgb_to_hv(MUX,212)@2
    i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_s <= i_cmp_i_i171_rgb_to_hv_c;
    i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_combproc: PROCESS (i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_s, redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q)
    BEGIN
        CASE (i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_s) IS
            WHEN "0" => i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q <= redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN OTHERS => i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_green_coerce302303334_blue_coerce254255286_rgb_to_hv(MUX,185)@2
    i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_s <= i_cmp_i_i164_rgb_to_hv_c;
    i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_combproc: PROCESS (i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_s, redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q, redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_s) IS
            WHEN "0" => i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q <= redist99_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN "1" => i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q <= redist97_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_4_rgb_to_hv(MUX,135)@2
    i_acl_4_rgb_to_hv_s <= i_or_cond389_rgb_to_hv_q;
    i_acl_4_rgb_to_hv_combproc: PROCESS (i_acl_4_rgb_to_hv_s, i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q, i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q)
    BEGIN
        CASE (i_acl_4_rgb_to_hv_s) IS
            WHEN "0" => i_acl_4_rgb_to_hv_q <= i_green_coerce302303334_blue_coerce254255286_rgb_to_hv_q;
            WHEN "1" => i_acl_4_rgb_to_hv_q <= i_red_coerce350351382_blue_coerce254255286_rgb_to_hv_q;
            WHEN OTHERS => i_acl_4_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_7_rgb_to_hv(MUX,138)@2 + 1
    i_acl_7_rgb_to_hv_s <= i_or_cond390_not_demorgan_rgb_to_hv_q;
    i_acl_7_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_7_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_7_rgb_to_hv_s) IS
                WHEN "0" => i_acl_7_rgb_to_hv_q <= i_acl_4_rgb_to_hv_q;
                WHEN "1" => i_acl_7_rgb_to_hv_q <= i_red_coerce350351382_green_coerce302303334_rgb_to_hv_q;
                WHEN OTHERS => i_acl_7_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_sub95_rgb_to_hv(SUB,231)@3
    i_sub95_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & i_acl_7_rgb_to_hv_q);
    i_sub95_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hv_q);
    i_sub95_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub95_rgb_to_hv_a) - UNSIGNED(i_sub95_rgb_to_hv_b));
    i_sub95_rgb_to_hv_q <= i_sub95_rgb_to_hv_o(8 downto 0);

    -- bgTrunc_i_sub95_rgb_to_hv_sel_x(BITSELECT,4)@3
    bgTrunc_i_sub95_rgb_to_hv_sel_x_b <= STD_LOGIC_VECTOR(i_sub95_rgb_to_hv_q(7 downto 0));

    -- i_conv96_rgb_to_hv_sel_x(BITSELECT,76)@3
    i_conv96_rgb_to_hv_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_sub95_rgb_to_hv_sel_x_b(7 downto 0)), 32));

    -- i_conv96_rgb_to_hv_vt_select_7(BITSELECT,176)@3
    i_conv96_rgb_to_hv_vt_select_7_b <= i_conv96_rgb_to_hv_sel_x_b(7 downto 0);

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_inputreg(DELAY,998)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv96_rgb_to_hv_vt_select_7_b, xout => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_inputreg_q, clk => clock, aclr => resetn );

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr(REG,1001)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr_q <= "11001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr_q <= STD_LOGIC_VECTOR(redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem(DUALMEM,999)
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ia <= STD_LOGIC_VECTOR(redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_inputreg_q);
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_aa <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_wraddr_q;
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ab <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_rdcnt_q;
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_reset0 <= not (resetn);
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_dmem : altsyncram
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
        clocken1 => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_reset0,
        clock1 => clock,
        address_a => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_aa,
        data_a => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_ab,
        q_b => redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_iq
    );
    redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_q <= redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_iq(7 downto 0);

    -- i_conv96_rgb_to_hv_vt_join(BITJOIN,175)@31
    i_conv96_rgb_to_hv_vt_join_q <= i_acl_8_zext_rgb_to_hv_vt_const_31_q & redist84_i_conv96_rgb_to_hv_vt_select_7_b_28_mem_q;

    -- leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x(BITSELECT,583)@31
    leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_in <= i_conv96_rgb_to_hv_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_b <= leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid585_i_shl_rgb_to_hv_rgb_to_hv22_shift_x(BITJOIN,584)@31
    leftShiftStage0Idx1_uid585_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_q <= leftShiftStage0Idx1Rng16_uid584_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_b & i_shl_rgb_to_hv_vt_const_15_q;

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b(BITSELECT,812)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_d <= leftShiftStage0Idx1_uid585_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_q(23 downto 16);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel2_0(BITSELECT,856)
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel2_0_b <= i_acl_8_zext_rgb_to_hv_vt_const_31_q(15 downto 8);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2(MUX,816)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_s <= VCC_q;
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_combproc: PROCESS (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_s, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel2_0_b, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_d)
    BEGIN
        CASE (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_s) IS
            WHEN "0" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel2_0_b;
            WHEN "1" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_d;
            WHEN OTHERS => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,867)
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b <= i_shl_rgb_to_hv_vt_const_15_q(7 downto 0);
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c <= i_shl_rgb_to_hv_vt_const_15_q(15 downto 8);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1(MUX,815)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_s <= VCC_q;
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_combproc: PROCESS (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_s, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c)
    BEGIN
        CASE (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_s) IS
            WHEN "0" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_tessel1_0_b;
            WHEN "1" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_c;
            WHEN OTHERS => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a(BITSELECT,813)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_b <= i_conv96_rgb_to_hv_vt_join_q(7 downto 0);

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0(MUX,814)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_s <= VCC_q;
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_combproc: PROCESS (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_s, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_b, leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b)
    BEGIN
        CASE (leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_s) IS
            WHEN "0" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_a_b;
            WHEN "1" => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitSelect_for_b_tessel0_0_merged_bit_select_b;
            WHEN OTHERS => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitJoin_for_q(BITJOIN,818)@31
    leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitJoin_for_q_q <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p3_q & leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q & leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p1_q & leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p0_q;

    -- i_shl_rgb_to_hv_vt_select_23(BITSELECT,230)@31
    i_shl_rgb_to_hv_vt_select_23_b <= leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_BitJoin_for_q_q(23 downto 16);

    -- i_shl_rgb_to_hv_vt_join(BITJOIN,229)@31
    i_shl_rgb_to_hv_vt_join_q <= i_conv_i_i1_rgb_to_hv_vt_const_7_q & i_shl_rgb_to_hv_vt_select_23_b & i_shl_rgb_to_hv_vt_const_15_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select(BITSELECT,868)@31
    prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_b <= i_shl_rgb_to_hv_vt_join_q(17 downto 0);
    prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_c <= i_shl_rgb_to_hv_vt_join_q(31 downto 18);

    -- oneInvRes_uid278_i_div_rgb_to_hv(CONSTANT,277)
    oneInvRes_uid278_i_div_rgb_to_hv_q <= "100000000000000000000000000000000";

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b(BITSELECT,769)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b <= STD_LOGIC_VECTOR(redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1_q(33 downto 33));

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_UpperBits_for_b(BITJOIN,770)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_UpperBits_for_b_q <= lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b & lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_b_b;

    -- leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv(BITSELECT,648)@10
    leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(24 downto 0);
    leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_in(24 downto 0);

    -- leftShiftStage1Idx7_uid650_normY_uid265_i_div_rgb_to_hv(BITJOIN,649)@10
    leftShiftStage1Idx7_uid650_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx7Rng7_uid649_normY_uid265_i_div_rgb_to_hv_b & i_add_rgb_to_hv_vt_const_31_q;

    -- leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv(BITSELECT,645)@10
    leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(25 downto 0);
    leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_in(25 downto 0);

    -- leftShiftStage1Idx6_uid647_normY_uid265_i_div_rgb_to_hv(BITJOIN,646)@10
    leftShiftStage1Idx6_uid647_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx6Rng6_uid646_normY_uid265_i_div_rgb_to_hv_b & leftShiftStage1Idx6Pad6_uid645_normY_uid265_i_div_rgb_to_hv_q;

    -- leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv(BITSELECT,642)@10
    leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(26 downto 0);
    leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_in(26 downto 0);

    -- leftShiftStage1Idx5_uid644_normY_uid265_i_div_rgb_to_hv(BITJOIN,643)@10
    leftShiftStage1Idx5_uid644_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx5Rng5_uid643_normY_uid265_i_div_rgb_to_hv_b & i_or_i_i_zext_rgb_to_hv_vt_const_31_q;

    -- leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv(BITSELECT,639)@10
    leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(27 downto 0);
    leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_in(27 downto 0);

    -- leftShiftStage1Idx4_uid641_normY_uid265_i_div_rgb_to_hv(BITJOIN,640)@10
    leftShiftStage1Idx4_uid641_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx4Rng4_uid640_normY_uid265_i_div_rgb_to_hv_b & zs_uid319_zCount_uid264_i_div_rgb_to_hv_q;

    -- leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv(BITSELECT,636)@10
    leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(28 downto 0);
    leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_in(28 downto 0);

    -- leftShiftStage1Idx3_uid638_normY_uid265_i_div_rgb_to_hv(BITJOIN,637)@10
    leftShiftStage1Idx3_uid638_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx3Rng3_uid637_normY_uid265_i_div_rgb_to_hv_b & topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv(BITSELECT,633)@10
    leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(29 downto 0);
    leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_in(29 downto 0);

    -- leftShiftStage1Idx2_uid635_normY_uid265_i_div_rgb_to_hv(BITJOIN,634)@10
    leftShiftStage1Idx2_uid635_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx2Rng2_uid634_normY_uid265_i_div_rgb_to_hv_b & zs_uid325_zCount_uid264_i_div_rgb_to_hv_q;

    -- leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv(BITSELECT,630)@10
    leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_in <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_in(30 downto 0);

    -- leftShiftStage1Idx1_uid632_normY_uid265_i_div_rgb_to_hv(BITJOIN,631)@10
    leftShiftStage1Idx1_uid632_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx1Rng1_uid631_normY_uid265_i_div_rgb_to_hv_b & GND_q;

    -- leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv(BITSELECT,621)@9
    leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_in <= redist86_i_conv52_rgb_to_hv_vt_join_q_5_q(7 downto 0);
    leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_in(7 downto 0);

    -- leftShiftStage0Idx3_uid623_normY_uid265_i_div_rgb_to_hv(BITJOIN,622)@9
    leftShiftStage0Idx3_uid623_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx3Rng24_uid622_normY_uid265_i_div_rgb_to_hv_b & i_acl_8_zext_rgb_to_hv_vt_const_31_q;

    -- leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv(BITSELECT,618)@9
    leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_in <= redist86_i_conv52_rgb_to_hv_vt_join_q_5_q(15 downto 0);
    leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_in(15 downto 0);

    -- leftShiftStage0Idx2_uid620_normY_uid265_i_div_rgb_to_hv(BITJOIN,619)@9
    leftShiftStage0Idx2_uid620_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx2Rng16_uid619_normY_uid265_i_div_rgb_to_hv_b & i_shl_rgb_to_hv_vt_const_15_q;

    -- leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv(BITSELECT,615)@9
    leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_in <= redist86_i_conv52_rgb_to_hv_vt_join_q_5_q(23 downto 0);
    leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_b <= leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_in(23 downto 0);

    -- leftShiftStage0Idx1_uid617_normY_uid265_i_div_rgb_to_hv(BITJOIN,616)@9
    leftShiftStage0Idx1_uid617_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx1Rng8_uid616_normY_uid265_i_div_rgb_to_hv_b & i_conv_i_i1_rgb_to_hv_vt_const_7_q;

    -- i_sub_rgb_to_hv(SUB,233)@3
    i_sub_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & i_acl_8_rgb_to_hv_q);
    i_sub_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & i_acl_9_rgb_to_hv_q);
    i_sub_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_rgb_to_hv_a) - UNSIGNED(i_sub_rgb_to_hv_b));
    i_sub_rgb_to_hv_q <= i_sub_rgb_to_hv_o(8 downto 0);

    -- bgTrunc_i_sub_rgb_to_hv_sel_x(BITSELECT,6)@3
    bgTrunc_i_sub_rgb_to_hv_sel_x_b <= STD_LOGIC_VECTOR(i_sub_rgb_to_hv_q(7 downto 0));

    -- redist103_bgTrunc_i_sub_rgb_to_hv_sel_x_b_1(DELAY,983)
    redist103_bgTrunc_i_sub_rgb_to_hv_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_rgb_to_hv_sel_x_b, xout => redist103_bgTrunc_i_sub_rgb_to_hv_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv52_rgb_to_hv_sel_x(BITSELECT,75)@4
    i_conv52_rgb_to_hv_sel_x_b <= std_logic_vector(resize(unsigned(redist103_bgTrunc_i_sub_rgb_to_hv_sel_x_b_1_q(7 downto 0)), 32));

    -- i_conv52_rgb_to_hv_vt_select_7(BITSELECT,172)@4
    i_conv52_rgb_to_hv_vt_select_7_b <= i_conv52_rgb_to_hv_sel_x_b(7 downto 0);

    -- i_conv52_rgb_to_hv_vt_join(BITJOIN,171)@4
    i_conv52_rgb_to_hv_vt_join_q <= i_acl_8_zext_rgb_to_hv_vt_const_31_q & i_conv52_rgb_to_hv_vt_select_7_b;

    -- redist85_i_conv52_rgb_to_hv_vt_join_q_1(DELAY,965)
    redist85_i_conv52_rgb_to_hv_vt_join_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv52_rgb_to_hv_vt_join_q, xout => redist85_i_conv52_rgb_to_hv_vt_join_q_1_q, clk => clock, aclr => resetn );

    -- redist86_i_conv52_rgb_to_hv_vt_join_q_5(DELAY,966)
    redist86_i_conv52_rgb_to_hv_vt_join_q_5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist85_i_conv52_rgb_to_hv_vt_join_q_1_q, xout => redist86_i_conv52_rgb_to_hv_vt_join_q_5_q, clk => clock, aclr => resetn );

    -- vCount_uid303_zCount_uid264_i_div_rgb_to_hv(LOGICAL,302)@4 + 1
    vCount_uid303_zCount_uid264_i_div_rgb_to_hv_qi <= "1" WHEN i_conv52_rgb_to_hv_vt_join_q = c_i32_0gr_q ELSE "0";
    vCount_uid303_zCount_uid264_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid303_zCount_uid264_i_div_rgb_to_hv_qi, xout => vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist68_vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q_5(DELAY,948)
    redist68_vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q, xout => redist68_vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q_5_q, clk => clock, aclr => resetn );

    -- vStagei_uid306_zCount_uid264_i_div_rgb_to_hv(MUX,305)@5
    vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_s <= vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q;
    vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_combproc: PROCESS (vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_s, redist85_i_conv52_rgb_to_hv_vt_join_q_1_q, cstValOvf_uid291_i_div_rgb_to_hv_q)
    BEGIN
        CASE (vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_s) IS
            WHEN "0" => vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q <= redist85_i_conv52_rgb_to_hv_vt_join_q_1_q;
            WHEN "1" => vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q <= cstValOvf_uid291_i_div_rgb_to_hv_q;
            WHEN OTHERS => vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select(BITSELECT,873)@5
    rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b <= vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q(31 downto 16);
    rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c <= vStagei_uid306_zCount_uid264_i_div_rgb_to_hv_q(15 downto 0);

    -- vCount_uid309_zCount_uid264_i_div_rgb_to_hv(LOGICAL,308)@5 + 1
    vCount_uid309_zCount_uid264_i_div_rgb_to_hv_qi <= "1" WHEN rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b = i_shl_rgb_to_hv_vt_const_15_q ELSE "0";
    vCount_uid309_zCount_uid264_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid309_zCount_uid264_i_div_rgb_to_hv_qi, xout => vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist67_vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q_4(DELAY,947)
    redist67_vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q, xout => redist67_vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q_4_q, clk => clock, aclr => resetn );

    -- redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1(DELAY,884)
    redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c, xout => redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1(DELAY,883)
    redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b, xout => redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid312_zCount_uid264_i_div_rgb_to_hv(MUX,311)@6
    vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_s <= vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q;
    vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_combproc: PROCESS (vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_s, redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q, redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_s) IS
            WHEN "0" => vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q <= redist3_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q <= redist4_rVStage_uid308_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select(BITSELECT,874)@6
    rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b <= vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q(15 downto 8);
    rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c <= vStagei_uid312_zCount_uid264_i_div_rgb_to_hv_q(7 downto 0);

    -- vCount_uid315_zCount_uid264_i_div_rgb_to_hv(LOGICAL,314)@6 + 1
    vCount_uid315_zCount_uid264_i_div_rgb_to_hv_qi <= "1" WHEN rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b = i_conv_i_i1_rgb_to_hv_vt_const_7_q ELSE "0";
    vCount_uid315_zCount_uid264_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid315_zCount_uid264_i_div_rgb_to_hv_qi, xout => vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist66_vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q_3(DELAY,946)
    redist66_vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q, xout => redist66_vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q_3_q, clk => clock, aclr => resetn );

    -- redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1(DELAY,882)
    redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c, xout => redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1(DELAY,881)
    redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b, xout => redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid318_zCount_uid264_i_div_rgb_to_hv(MUX,317)@7
    vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_s <= vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q;
    vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_combproc: PROCESS (vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_s, redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q, redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_s) IS
            WHEN "0" => vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q <= redist1_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q <= redist2_rVStage_uid314_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select(BITSELECT,875)@7
    rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b <= vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q(7 downto 4);
    rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c <= vStagei_uid318_zCount_uid264_i_div_rgb_to_hv_q(3 downto 0);

    -- vCount_uid321_zCount_uid264_i_div_rgb_to_hv(LOGICAL,320)@7
    vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q <= "1" WHEN rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b = zs_uid319_zCount_uid264_i_div_rgb_to_hv_q ELSE "0";

    -- redist65_vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q_2(DELAY,945)
    redist65_vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q, xout => redist65_vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q_2_q, clk => clock, aclr => resetn );

    -- vStagei_uid324_zCount_uid264_i_div_rgb_to_hv(MUX,323)@7 + 1
    vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_s <= vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q;
    vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_s) IS
                WHEN "0" => vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q <= rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b;
                WHEN "1" => vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q <= rVStage_uid320_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select(BITSELECT,876)@8
    rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b <= vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q(3 downto 2);
    rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c <= vStagei_uid324_zCount_uid264_i_div_rgb_to_hv_q(1 downto 0);

    -- vCount_uid327_zCount_uid264_i_div_rgb_to_hv(LOGICAL,326)@8
    vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q <= "1" WHEN rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b = zs_uid325_zCount_uid264_i_div_rgb_to_hv_q ELSE "0";

    -- redist64_vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q_1(DELAY,944)
    redist64_vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q, xout => redist64_vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid330_zCount_uid264_i_div_rgb_to_hv(MUX,329)@8
    vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_s <= vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q;
    vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_combproc: PROCESS (vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_s, rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b, rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_s) IS
            WHEN "0" => vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_q <= rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_b;
            WHEN "1" => vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_q <= rVStage_uid326_zCount_uid264_i_div_rgb_to_hv_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid332_zCount_uid264_i_div_rgb_to_hv(BITSELECT,331)@8
    rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b <= vStagei_uid330_zCount_uid264_i_div_rgb_to_hv_q(1 downto 1);

    -- redist63_rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b_1(DELAY,943)
    redist63_rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b, xout => redist63_rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b_1_q, clk => clock, aclr => resetn );

    -- vCount_uid333_zCount_uid264_i_div_rgb_to_hv(LOGICAL,332)@9
    vCount_uid333_zCount_uid264_i_div_rgb_to_hv_q <= "1" WHEN redist63_rVStage_uid332_zCount_uid264_i_div_rgb_to_hv_b_1_q = GND_q ELSE "0";

    -- r_uid334_zCount_uid264_i_div_rgb_to_hv(BITJOIN,333)@9
    r_uid334_zCount_uid264_i_div_rgb_to_hv_q <= redist68_vCount_uid303_zCount_uid264_i_div_rgb_to_hv_q_5_q & redist67_vCount_uid309_zCount_uid264_i_div_rgb_to_hv_q_4_q & redist66_vCount_uid315_zCount_uid264_i_div_rgb_to_hv_q_3_q & redist65_vCount_uid321_zCount_uid264_i_div_rgb_to_hv_q_2_q & redist64_vCount_uid327_zCount_uid264_i_div_rgb_to_hv_q_1_q & vCount_uid333_zCount_uid264_i_div_rgb_to_hv_q;

    -- leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select(BITSELECT,877)@9
    leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_b <= r_uid334_zCount_uid264_i_div_rgb_to_hv_q(5 downto 3);
    leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c <= r_uid334_zCount_uid264_i_div_rgb_to_hv_q(2 downto 0);

    -- leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv(MUX,628)@9 + 1
    leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_s <= leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_b;
    leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_s) IS
                WHEN "000" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= redist86_i_conv52_rgb_to_hv_vt_join_q_5_q;
                WHEN "001" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx1_uid617_normY_uid265_i_div_rgb_to_hv_q;
                WHEN "010" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx2_uid620_normY_uid265_i_div_rgb_to_hv_q;
                WHEN "011" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0Idx3_uid623_normY_uid265_i_div_rgb_to_hv_q;
                WHEN "100" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= c_i32_0gr_q;
                WHEN "101" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= c_i32_0gr_q;
                WHEN "110" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= c_i32_0gr_q;
                WHEN "111" => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= c_i32_0gr_q;
                WHEN OTHERS => leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c_1(DELAY,880)
    redist0_leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c, xout => redist0_leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv(MUX,651)@10
    leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_s <= redist0_leftShiftStageSel5Dto3_uid628_normY_uid265_i_div_rgb_to_hv_merged_bit_select_c_1_q;
    leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_combproc: PROCESS (leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_s, leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx1_uid632_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx2_uid635_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx3_uid638_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx4_uid641_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx5_uid644_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx6_uid647_normY_uid265_i_div_rgb_to_hv_q, leftShiftStage1Idx7_uid650_normY_uid265_i_div_rgb_to_hv_q)
    BEGIN
        CASE (leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_s) IS
            WHEN "000" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage0_uid629_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "001" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx1_uid632_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "010" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx2_uid635_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "011" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx3_uid638_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "100" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx4_uid641_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "101" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx5_uid644_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "110" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx6_uid647_normY_uid265_i_div_rgb_to_hv_q;
            WHEN "111" => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= leftShiftStage1Idx7_uid650_normY_uid265_i_div_rgb_to_hv_q;
            WHEN OTHERS => leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid266_i_div_rgb_to_hv(BITSELECT,265)@10
    normYNoLeadOne_uid266_i_div_rgb_to_hv_in <= leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q(30 downto 0);
    normYNoLeadOne_uid266_i_div_rgb_to_hv_b <= normYNoLeadOne_uid266_i_div_rgb_to_hv_in(30 downto 0);

    -- yAddr_uid274_i_div_rgb_to_hv_merged_bit_select(BITSELECT,869)@10
    yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b <= normYNoLeadOne_uid266_i_div_rgb_to_hv_b(30 downto 23);
    yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c <= normYNoLeadOne_uid266_i_div_rgb_to_hv_b(22 downto 0);

    -- memoryC3_uid346_invTabGen_lutmem(DUALMEM,743)@10 + 2
    -- in j@20000000
    memoryC3_uid346_invTabGen_lutmem_aa <= yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b;
    memoryC3_uid346_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC3_uid346_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_entA4ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid346_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC3_uid346_invTabGen_lutmem_aa,
        q_a => memoryC3_uid346_invTabGen_lutmem_ir
    );
    memoryC3_uid346_invTabGen_lutmem_r <= memoryC3_uid346_invTabGen_lutmem_ir(13 downto 0);

    -- redist29_memoryC3_uid346_invTabGen_lutmem_r_1(DELAY,909)
    redist29_memoryC3_uid346_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC3_uid346_invTabGen_lutmem_r, xout => redist29_memoryC3_uid346_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval(CONSTANT,390)
    topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q <= "000";

    -- topRangeY_mergedSignalTM_uid393_pT1_uid354_invPolyEval(BITJOIN,392)@13
    topRangeY_mergedSignalTM_uid393_pT1_uid354_invPolyEval_q <= redist29_memoryC3_uid346_invTabGen_lutmem_r_1_q & topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q;

    -- redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3(DELAY,890)
    redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c, xout => redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3_q, clk => clock, aclr => resetn );

    -- yT1_uid353_invPolyEval(BITSELECT,352)@13
    yT1_uid353_invPolyEval_b <= redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3_q(22 downto 9);

    -- nx_mergedSignalTM_uid377_pT1_uid354_invPolyEval(BITJOIN,376)@13
    nx_mergedSignalTM_uid377_pT1_uid354_invPolyEval_q <= GND_q & yT1_uid353_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid389_pT1_uid354_invPolyEval(BITJOIN,388)@13
    topRangeX_mergedSignalTM_uid389_pT1_uid354_invPolyEval_q <= nx_mergedSignalTM_uid377_pT1_uid354_invPolyEval_q & zs_uid325_zCount_uid264_i_div_rgb_to_hv_q;

    -- sm0_uid395_pT1_uid354_invPolyEval(MULT,394)@13 + 2
    sm0_uid395_pT1_uid354_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid389_pT1_uid354_invPolyEval_q);
    sm0_uid395_pT1_uid354_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid393_pT1_uid354_invPolyEval_q);
    sm0_uid395_pT1_uid354_invPolyEval_reset <= not (resetn);
    sm0_uid395_pT1_uid354_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid395_pT1_uid354_invPolyEval_a0,
        datab => sm0_uid395_pT1_uid354_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid395_pT1_uid354_invPolyEval_reset,
        clock => clock,
        result => sm0_uid395_pT1_uid354_invPolyEval_s1
    );
    sm0_uid395_pT1_uid354_invPolyEval_q <= sm0_uid395_pT1_uid354_invPolyEval_s1;

    -- osig_uid396_pT1_uid354_invPolyEval(BITSELECT,395)@15
    osig_uid396_pT1_uid354_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid395_pT1_uid354_invPolyEval_q(32 downto 0));
    osig_uid396_pT1_uid354_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid396_pT1_uid354_invPolyEval_in(32 downto 18));

    -- redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3(DELAY,887)
    redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b, xout => redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3_q, clk => clock, aclr => resetn );

    -- memoryC2_uid343_invTabGen_lutmem(DUALMEM,742)@13 + 2
    -- in j@20000000
    memoryC2_uid343_invTabGen_lutmem_aa <= redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3_q;
    memoryC2_uid343_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC2_uid343_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_entA3ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid343_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC2_uid343_invTabGen_lutmem_aa,
        q_a => memoryC2_uid343_invTabGen_lutmem_ir
    );
    memoryC2_uid343_invTabGen_lutmem_r <= memoryC2_uid343_invTabGen_lutmem_ir(20 downto 0);

    -- rndBit_uid355_invPolyEval(CONSTANT,354)
    rndBit_uid355_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid356_invPolyEval(BITJOIN,355)@15
    cIncludingRoundingBit_uid356_invPolyEval_q <= memoryC2_uid343_invTabGen_lutmem_r & rndBit_uid355_invPolyEval_q;

    -- ts1_uid358_invPolyEval(ADD,357)@15
    ts1_uid358_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid356_invPolyEval_q(22)) & cIncludingRoundingBit_uid356_invPolyEval_q));
    ts1_uid358_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid396_pT1_uid354_invPolyEval_b(14)) & osig_uid396_pT1_uid354_invPolyEval_b));
    ts1_uid358_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid358_invPolyEval_a) + SIGNED(ts1_uid358_invPolyEval_b));
    ts1_uid358_invPolyEval_q <= ts1_uid358_invPolyEval_o(23 downto 0);

    -- s1_uid359_invPolyEval(BITSELECT,358)@15
    s1_uid359_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid358_invPolyEval_q(23 downto 1));

    -- redist61_s1_uid359_invPolyEval_b_1(DELAY,941)
    redist61_s1_uid359_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s1_uid359_invPolyEval_b, xout => redist61_s1_uid359_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid432_pT2_uid361_invPolyEval(BITSELECT,431)@16
    aboveLeftY_uid432_pT2_uid361_invPolyEval_in <= redist61_s1_uid359_invPolyEval_b_1_q(14 downto 0);
    aboveLeftY_uid432_pT2_uid361_invPolyEval_b <= aboveLeftY_uid432_pT2_uid361_invPolyEval_in(14 downto 10);

    -- n1_uid440_pT2_uid361_invPolyEval(BITSELECT,439)@16
    n1_uid440_pT2_uid361_invPolyEval_b <= aboveLeftY_uid432_pT2_uid361_invPolyEval_b(4 downto 1);

    -- n1_uid448_pT2_uid361_invPolyEval(BITSELECT,447)@16
    n1_uid448_pT2_uid361_invPolyEval_b <= n1_uid440_pT2_uid361_invPolyEval_b(3 downto 1);

    -- redist59_n1_uid448_pT2_uid361_invPolyEval_b_2(DELAY,939)
    redist59_n1_uid448_pT2_uid361_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n1_uid448_pT2_uid361_invPolyEval_b, xout => redist59_n1_uid448_pT2_uid361_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6(DELAY,891)
    redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_3_q, xout => redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6_q, clk => clock, aclr => resetn );

    -- yT2_uid360_invPolyEval(BITSELECT,359)@16
    yT2_uid360_invPolyEval_b <= redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6_q(22 downto 2);

    -- nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval(BITJOIN,399)@16
    nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q <= GND_q & yT2_uid360_invPolyEval_b;

    -- aboveLeftX_uid431_pT2_uid361_invPolyEval(BITSELECT,430)@16
    aboveLeftX_uid431_pT2_uid361_invPolyEval_in <= nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q(4 downto 0);
    aboveLeftX_uid431_pT2_uid361_invPolyEval_b <= aboveLeftX_uid431_pT2_uid361_invPolyEval_in(4 downto 0);

    -- n0_uid441_pT2_uid361_invPolyEval(BITSELECT,440)@16
    n0_uid441_pT2_uid361_invPolyEval_b <= aboveLeftX_uid431_pT2_uid361_invPolyEval_b(4 downto 1);

    -- n0_uid449_pT2_uid361_invPolyEval(BITSELECT,448)@16
    n0_uid449_pT2_uid361_invPolyEval_b <= n0_uid441_pT2_uid361_invPolyEval_b(3 downto 1);

    -- redist58_n0_uid449_pT2_uid361_invPolyEval_b_2(DELAY,938)
    redist58_n0_uid449_pT2_uid361_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n0_uid449_pT2_uid361_invPolyEval_b, xout => redist58_n0_uid449_pT2_uid361_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- sm1_uid464_pT2_uid361_invPolyEval(MULT,463)@18 + 2
    sm1_uid464_pT2_uid361_invPolyEval_a0 <= redist58_n0_uid449_pT2_uid361_invPolyEval_b_2_q;
    sm1_uid464_pT2_uid361_invPolyEval_b0 <= redist59_n1_uid448_pT2_uid361_invPolyEval_b_2_q;
    sm1_uid464_pT2_uid361_invPolyEval_reset <= not (resetn);
    sm1_uid464_pT2_uid361_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid464_pT2_uid361_invPolyEval_a0,
        datab => sm1_uid464_pT2_uid361_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid464_pT2_uid361_invPolyEval_reset,
        clock => clock,
        result => sm1_uid464_pT2_uid361_invPolyEval_s1
    );
    sm1_uid464_pT2_uid361_invPolyEval_q <= sm1_uid464_pT2_uid361_invPolyEval_s1;

    -- redist55_sm1_uid464_pT2_uid361_invPolyEval_q_1(DELAY,935)
    redist55_sm1_uid464_pT2_uid361_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid464_pT2_uid361_invPolyEval_q, xout => redist55_sm1_uid464_pT2_uid361_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- rightBottomY_uid430_pT2_uid361_invPolyEval(BITSELECT,429)@16
    rightBottomY_uid430_pT2_uid361_invPolyEval_in <= redist61_s1_uid359_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid430_pT2_uid361_invPolyEval_b <= rightBottomY_uid430_pT2_uid361_invPolyEval_in(5 downto 1);

    -- n1_uid438_pT2_uid361_invPolyEval(BITSELECT,437)@16
    n1_uid438_pT2_uid361_invPolyEval_b <= rightBottomY_uid430_pT2_uid361_invPolyEval_b(4 downto 1);

    -- n1_uid446_pT2_uid361_invPolyEval(BITSELECT,445)@16
    n1_uid446_pT2_uid361_invPolyEval_b <= n1_uid438_pT2_uid361_invPolyEval_b(3 downto 1);

    -- rightBottomX_uid429_pT2_uid361_invPolyEval(BITSELECT,428)@16
    rightBottomX_uid429_pT2_uid361_invPolyEval_in <= nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q(13 downto 0);
    rightBottomX_uid429_pT2_uid361_invPolyEval_b <= rightBottomX_uid429_pT2_uid361_invPolyEval_in(13 downto 9);

    -- n0_uid439_pT2_uid361_invPolyEval(BITSELECT,438)@16
    n0_uid439_pT2_uid361_invPolyEval_b <= rightBottomX_uid429_pT2_uid361_invPolyEval_b(4 downto 1);

    -- n0_uid447_pT2_uid361_invPolyEval(BITSELECT,446)@16
    n0_uid447_pT2_uid361_invPolyEval_b <= n0_uid439_pT2_uid361_invPolyEval_b(3 downto 1);

    -- sm0_uid463_pT2_uid361_invPolyEval(MULT,462)@16 + 2
    sm0_uid463_pT2_uid361_invPolyEval_a0 <= n0_uid447_pT2_uid361_invPolyEval_b;
    sm0_uid463_pT2_uid361_invPolyEval_b0 <= n1_uid446_pT2_uid361_invPolyEval_b;
    sm0_uid463_pT2_uid361_invPolyEval_reset <= not (resetn);
    sm0_uid463_pT2_uid361_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid463_pT2_uid361_invPolyEval_a0,
        datab => sm0_uid463_pT2_uid361_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid463_pT2_uid361_invPolyEval_reset,
        clock => clock,
        result => sm0_uid463_pT2_uid361_invPolyEval_s1
    );
    sm0_uid463_pT2_uid361_invPolyEval_q <= sm0_uid463_pT2_uid361_invPolyEval_s1;

    -- rightBottomY_uid425_pT2_uid361_invPolyEval(BITSELECT,424)@16
    rightBottomY_uid425_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(redist61_s1_uid359_invPolyEval_b_1_q(22 downto 15));

    -- rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval(BITSELECT,421)@16
    rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q(4 downto 0));
    rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_in(4 downto 0));

    -- rightBottomX_mergedSignalTM_uid423_pT2_uid361_invPolyEval(BITJOIN,422)@16
    rightBottomX_mergedSignalTM_uid423_pT2_uid361_invPolyEval_q <= rightBottomX_bottomRange_uid422_pT2_uid361_invPolyEval_b & topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q;

    -- sm1_uid462_pT2_uid361_invPolyEval(MULT,461)@16 + 2
    sm1_uid462_pT2_uid361_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid423_pT2_uid361_invPolyEval_q;
    sm1_uid462_pT2_uid361_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid425_pT2_uid361_invPolyEval_b);
    sm1_uid462_pT2_uid361_invPolyEval_reset <= not (resetn);
    sm1_uid462_pT2_uid361_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid462_pT2_uid361_invPolyEval_a0,
        datab => sm1_uid462_pT2_uid361_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid462_pT2_uid361_invPolyEval_reset,
        clock => clock,
        result => sm1_uid462_pT2_uid361_invPolyEval_s1
    );
    sm1_uid462_pT2_uid361_invPolyEval_q <= sm1_uid462_pT2_uid361_invPolyEval_s1(15 downto 0);

    -- highABits_uid470_pT2_uid361_invPolyEval(BITSELECT,469)@18
    highABits_uid470_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(sm1_uid462_pT2_uid361_invPolyEval_q(15 downto 2));

    -- lev1_a1high_uid471_pT2_uid361_invPolyEval(ADD,470)@18 + 1
    lev1_a1high_uid471_pT2_uid361_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid470_pT2_uid361_invPolyEval_b(13)) & highABits_uid470_pT2_uid361_invPolyEval_b));
    lev1_a1high_uid471_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & sm0_uid463_pT2_uid361_invPolyEval_q));
    lev1_a1high_uid471_pT2_uid361_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a1high_uid471_pT2_uid361_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a1high_uid471_pT2_uid361_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1high_uid471_pT2_uid361_invPolyEval_a) + SIGNED(lev1_a1high_uid471_pT2_uid361_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid471_pT2_uid361_invPolyEval_q <= lev1_a1high_uid471_pT2_uid361_invPolyEval_o(14 downto 0);

    -- redist52_lev1_a1high_uid471_pT2_uid361_invPolyEval_q_2(DELAY,932)
    redist52_lev1_a1high_uid471_pT2_uid361_invPolyEval_q_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev1_a1high_uid471_pT2_uid361_invPolyEval_q, xout => redist52_lev1_a1high_uid471_pT2_uid361_invPolyEval_q_2_q, clk => clock, aclr => resetn );

    -- lowRangeA_uid469_pT2_uid361_invPolyEval(BITSELECT,468)@18
    lowRangeA_uid469_pT2_uid361_invPolyEval_in <= sm1_uid462_pT2_uid361_invPolyEval_q(1 downto 0);
    lowRangeA_uid469_pT2_uid361_invPolyEval_b <= lowRangeA_uid469_pT2_uid361_invPolyEval_in(1 downto 0);

    -- redist53_lowRangeA_uid469_pT2_uid361_invPolyEval_b_2(DELAY,933)
    redist53_lowRangeA_uid469_pT2_uid361_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid469_pT2_uid361_invPolyEval_b, xout => redist53_lowRangeA_uid469_pT2_uid361_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- lev1_a1_uid472_pT2_uid361_invPolyEval(BITJOIN,471)@20
    lev1_a1_uid472_pT2_uid361_invPolyEval_q <= redist52_lev1_a1high_uid471_pT2_uid361_invPolyEval_q_2_q & redist53_lowRangeA_uid469_pT2_uid361_invPolyEval_b_2_q;

    -- aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval(BITSELECT,417)@16
    aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_in <= STD_LOGIC_VECTOR(redist61_s1_uid359_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid419_pT2_uid361_invPolyEval(BITJOIN,418)@16
    aboveLeftY_mergedSignalTM_uid419_pT2_uid361_invPolyEval_q <= aboveLeftY_bottomRange_uid418_pT2_uid361_invPolyEval_b & zs_uid325_zCount_uid264_i_div_rgb_to_hv_q;

    -- aboveLeftX_uid416_pT2_uid361_invPolyEval(BITSELECT,415)@16
    aboveLeftX_uid416_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q(21 downto 14));

    -- sm0_uid461_pT2_uid361_invPolyEval(MULT,460)@16 + 2
    sm0_uid461_pT2_uid361_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid416_pT2_uid361_invPolyEval_b);
    sm0_uid461_pT2_uid361_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid419_pT2_uid361_invPolyEval_q;
    sm0_uid461_pT2_uid361_invPolyEval_reset <= not (resetn);
    sm0_uid461_pT2_uid361_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid461_pT2_uid361_invPolyEval_a0,
        datab => sm0_uid461_pT2_uid361_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid461_pT2_uid361_invPolyEval_reset,
        clock => clock,
        result => sm0_uid461_pT2_uid361_invPolyEval_s1
    );
    sm0_uid461_pT2_uid361_invPolyEval_q <= sm0_uid461_pT2_uid361_invPolyEval_s1(15 downto 0);

    -- redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1(DELAY,936)
    redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid461_pT2_uid361_invPolyEval_q, xout => redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid411_pT2_uid361_invPolyEval(BITSELECT,410)@16
    topRangeY_uid411_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(redist61_s1_uid359_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_uid410_pT2_uid361_invPolyEval(BITSELECT,409)@16
    topRangeX_uid410_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid400_pT2_uid361_invPolyEval_q(21 downto 5));

    -- sm0_uid460_pT2_uid361_invPolyEval(MULT,459)@16 + 2
    sm0_uid460_pT2_uid361_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid410_pT2_uid361_invPolyEval_b);
    sm0_uid460_pT2_uid361_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid411_pT2_uid361_invPolyEval_b);
    sm0_uid460_pT2_uid361_invPolyEval_reset <= not (resetn);
    sm0_uid460_pT2_uid361_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid460_pT2_uid361_invPolyEval_a0,
        datab => sm0_uid460_pT2_uid361_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid460_pT2_uid361_invPolyEval_reset,
        clock => clock,
        result => sm0_uid460_pT2_uid361_invPolyEval_s1
    );
    sm0_uid460_pT2_uid361_invPolyEval_q <= sm0_uid460_pT2_uid361_invPolyEval_s1;

    -- redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1(DELAY,937)
    redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid460_pT2_uid361_invPolyEval_q, xout => redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highABits_uid466_pT2_uid361_invPolyEval(BITSELECT,465)@19
    highABits_uid466_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1_q(33 downto 1));

    -- lev1_a0high_uid467_pT2_uid361_invPolyEval(ADD,466)@19 + 1
    lev1_a0high_uid467_pT2_uid361_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid466_pT2_uid361_invPolyEval_b(32)) & highABits_uid466_pT2_uid361_invPolyEval_b));
    lev1_a0high_uid467_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1_q(15)) & redist56_sm0_uid461_pT2_uid361_invPolyEval_q_1_q));
    lev1_a0high_uid467_pT2_uid361_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0high_uid467_pT2_uid361_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0high_uid467_pT2_uid361_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid467_pT2_uid361_invPolyEval_a) + SIGNED(lev1_a0high_uid467_pT2_uid361_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0high_uid467_pT2_uid361_invPolyEval_q <= lev1_a0high_uid467_pT2_uid361_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid465_pT2_uid361_invPolyEval(BITSELECT,464)@19
    lowRangeA_uid465_pT2_uid361_invPolyEval_in <= redist57_sm0_uid460_pT2_uid361_invPolyEval_q_1_q(0 downto 0);
    lowRangeA_uid465_pT2_uid361_invPolyEval_b <= lowRangeA_uid465_pT2_uid361_invPolyEval_in(0 downto 0);

    -- redist54_lowRangeA_uid465_pT2_uid361_invPolyEval_b_1(DELAY,934)
    redist54_lowRangeA_uid465_pT2_uid361_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid465_pT2_uid361_invPolyEval_b, xout => redist54_lowRangeA_uid465_pT2_uid361_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid468_pT2_uid361_invPolyEval(BITJOIN,467)@20
    lev1_a0_uid468_pT2_uid361_invPolyEval_q <= lev1_a0high_uid467_pT2_uid361_invPolyEval_q & redist54_lowRangeA_uid465_pT2_uid361_invPolyEval_b_1_q;

    -- highABits_uid474_pT2_uid361_invPolyEval(BITSELECT,473)@20
    highABits_uid474_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid468_pT2_uid361_invPolyEval_q(34 downto 1));

    -- lev2_a0high_uid475_pT2_uid361_invPolyEval(ADD,474)@20
    lev2_a0high_uid475_pT2_uid361_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => highABits_uid474_pT2_uid361_invPolyEval_b(33)) & highABits_uid474_pT2_uid361_invPolyEval_b));
    lev2_a0high_uid475_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 17 => lev1_a1_uid472_pT2_uid361_invPolyEval_q(16)) & lev1_a1_uid472_pT2_uid361_invPolyEval_q));
    lev2_a0high_uid475_pT2_uid361_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid475_pT2_uid361_invPolyEval_a) + SIGNED(lev2_a0high_uid475_pT2_uid361_invPolyEval_b));
    lev2_a0high_uid475_pT2_uid361_invPolyEval_q <= lev2_a0high_uid475_pT2_uid361_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid473_pT2_uid361_invPolyEval(BITSELECT,472)@20
    lowRangeA_uid473_pT2_uid361_invPolyEval_in <= lev1_a0_uid468_pT2_uid361_invPolyEval_q(0 downto 0);
    lowRangeA_uid473_pT2_uid361_invPolyEval_b <= lowRangeA_uid473_pT2_uid361_invPolyEval_in(0 downto 0);

    -- lev2_a0_uid476_pT2_uid361_invPolyEval(BITJOIN,475)@20
    lev2_a0_uid476_pT2_uid361_invPolyEval_q <= lev2_a0high_uid475_pT2_uid361_invPolyEval_q & lowRangeA_uid473_pT2_uid361_invPolyEval_b;

    -- highABits_uid478_pT2_uid361_invPolyEval(BITSELECT,477)@20
    highABits_uid478_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(lev2_a0_uid476_pT2_uid361_invPolyEval_q(35 downto 3));

    -- redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1(DELAY,930)
    redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => highABits_uid478_pT2_uid361_invPolyEval_b, xout => redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0high_uid479_pT2_uid361_invPolyEval(ADD,478)@21
    lev3_a0high_uid479_pT2_uid361_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1_q(32)) & redist50_highABits_uid478_pT2_uid361_invPolyEval_b_1_q));
    lev3_a0high_uid479_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & redist55_sm1_uid464_pT2_uid361_invPolyEval_q_1_q));
    lev3_a0high_uid479_pT2_uid361_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0high_uid479_pT2_uid361_invPolyEval_a) + SIGNED(lev3_a0high_uid479_pT2_uid361_invPolyEval_b));
    lev3_a0high_uid479_pT2_uid361_invPolyEval_q <= lev3_a0high_uid479_pT2_uid361_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid477_pT2_uid361_invPolyEval(BITSELECT,476)@20
    lowRangeA_uid477_pT2_uid361_invPolyEval_in <= lev2_a0_uid476_pT2_uid361_invPolyEval_q(2 downto 0);
    lowRangeA_uid477_pT2_uid361_invPolyEval_b <= lowRangeA_uid477_pT2_uid361_invPolyEval_in(2 downto 0);

    -- redist51_lowRangeA_uid477_pT2_uid361_invPolyEval_b_1(DELAY,931)
    redist51_lowRangeA_uid477_pT2_uid361_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid477_pT2_uid361_invPolyEval_b, xout => redist51_lowRangeA_uid477_pT2_uid361_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0_uid480_pT2_uid361_invPolyEval(BITJOIN,479)@21
    lev3_a0_uid480_pT2_uid361_invPolyEval_q <= lev3_a0high_uid479_pT2_uid361_invPolyEval_q & redist51_lowRangeA_uid477_pT2_uid361_invPolyEval_b_1_q;

    -- osig_uid481_pT2_uid361_invPolyEval(BITSELECT,480)@21
    osig_uid481_pT2_uid361_invPolyEval_in <= STD_LOGIC_VECTOR(lev3_a0_uid480_pT2_uid361_invPolyEval_q(32 downto 0));
    osig_uid481_pT2_uid361_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid481_pT2_uid361_invPolyEval_in(32 downto 9));

    -- redist49_osig_uid481_pT2_uid361_invPolyEval_b_1(DELAY,929)
    redist49_osig_uid481_pT2_uid361_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid481_pT2_uid361_invPolyEval_b, xout => redist49_osig_uid481_pT2_uid361_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9(DELAY,888)
    redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_3_q, xout => redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9_q, clk => clock, aclr => resetn );

    -- memoryC1_uid340_invTabGen_lutmem(DUALMEM,741)@19 + 2
    -- in j@20000000
    memoryC1_uid340_invTabGen_lutmem_aa <= redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9_q;
    memoryC1_uid340_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC1_uid340_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_entA2ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid340_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC1_uid340_invTabGen_lutmem_aa,
        q_a => memoryC1_uid340_invTabGen_lutmem_ir
    );
    memoryC1_uid340_invTabGen_lutmem_r <= memoryC1_uid340_invTabGen_lutmem_ir(28 downto 0);

    -- redist30_memoryC1_uid340_invTabGen_lutmem_r_1(DELAY,910)
    redist30_memoryC1_uid340_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC1_uid340_invTabGen_lutmem_r, xout => redist30_memoryC1_uid340_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- cIncludingRoundingBit_uid363_invPolyEval(BITJOIN,362)@22
    cIncludingRoundingBit_uid363_invPolyEval_q <= redist30_memoryC1_uid340_invTabGen_lutmem_r_1_q & rndBit_uid355_invPolyEval_q;

    -- ts2_uid365_invPolyEval(ADD,364)@22
    ts2_uid365_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => cIncludingRoundingBit_uid363_invPolyEval_q(30)) & cIncludingRoundingBit_uid363_invPolyEval_q));
    ts2_uid365_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 24 => redist49_osig_uid481_pT2_uid361_invPolyEval_b_1_q(23)) & redist49_osig_uid481_pT2_uid361_invPolyEval_b_1_q));
    ts2_uid365_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid365_invPolyEval_a) + SIGNED(ts2_uid365_invPolyEval_b));
    ts2_uid365_invPolyEval_q <= ts2_uid365_invPolyEval_o(31 downto 0);

    -- s2_uid366_invPolyEval(BITSELECT,365)@22
    s2_uid366_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid365_invPolyEval_q(31 downto 1));

    -- redist60_s2_uid366_invPolyEval_b_1(DELAY,940)
    redist60_s2_uid366_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s2_uid366_invPolyEval_b, xout => redist60_s2_uid366_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid496_pT3_uid368_invPolyEval(BITSELECT,495)@23
    topRangeY_uid496_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(redist60_s2_uid366_invPolyEval_b_1_q(30 downto 14));

    -- redist48_topRangeY_uid496_pT3_uid368_invPolyEval_b_1(DELAY,928)
    redist48_topRangeY_uid496_pT3_uid368_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => topRangeY_uid496_pT3_uid368_invPolyEval_b, xout => redist48_topRangeY_uid496_pT3_uid368_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_inputreg(DELAY,984)
    redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_6_q, xout => redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_inputreg_q, clk => clock, aclr => resetn );

    -- redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13(DELAY,892)
    redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_inputreg_q, xout => redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_q, clk => clock, aclr => resetn );

    -- nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval(BITJOIN,484)@23
    nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval_q <= GND_q & redist12_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_c_13_q;

    -- rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval(BITSELECT,522)@23
    rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval_q(6 downto 0));
    rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_in(6 downto 0));

    -- redist47_rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b_1(DELAY,927)
    redist47_rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b, xout => redist47_rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- rightBottomX_mergedSignalTM_uid524_pT3_uid368_invPolyEval(BITJOIN,523)@24
    rightBottomX_mergedSignalTM_uid524_pT3_uid368_invPolyEval_q <= redist47_rightBottomX_bottomRange_uid523_pT3_uid368_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid522_pT3_uid368_invPolyEval_q;

    -- sm1_uid561_pT3_uid368_invPolyEval(MULT,560)@24 + 2
    sm1_uid561_pT3_uid368_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid524_pT3_uid368_invPolyEval_q;
    sm1_uid561_pT3_uid368_invPolyEval_b0 <= STD_LOGIC_VECTOR(redist48_topRangeY_uid496_pT3_uid368_invPolyEval_b_1_q);
    sm1_uid561_pT3_uid368_invPolyEval_reset <= not (resetn);
    sm1_uid561_pT3_uid368_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid561_pT3_uid368_invPolyEval_a0,
        datab => sm1_uid561_pT3_uid368_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid561_pT3_uid368_invPolyEval_reset,
        clock => clock,
        result => sm1_uid561_pT3_uid368_invPolyEval_s1
    );
    sm1_uid561_pT3_uid368_invPolyEval_q <= sm1_uid561_pT3_uid368_invPolyEval_s1(33 downto 0);

    -- redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1(DELAY,924)
    redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid561_pT3_uid368_invPolyEval_q, xout => redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_b(BITJOIN,768)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_b_q <= lev2_a0_uid568_pT3_uid368_invPolyEval_UpperBits_for_b_q & redist44_sm1_uid561_pT3_uid368_invPolyEval_q_1_q;

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b(BITSELECT,772)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_b <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_b_q(38 downto 0));
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_b_q(52 downto 39));

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_a(BITSELECT,766)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(lev1_a0_uid567_pT3_uid368_invPolyEval_q(51 downto 51));

    -- aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval(BITSELECT,518)@23
    aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_in <= STD_LOGIC_VECTOR(redist60_s2_uid366_invPolyEval_b_1_q(13 downto 0));
    aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_in(13 downto 0));

    -- aboveLeftY_mergedSignalTM_uid520_pT3_uid368_invPolyEval(BITJOIN,519)@23
    aboveLeftY_mergedSignalTM_uid520_pT3_uid368_invPolyEval_q <= aboveLeftY_bottomRange_uid519_pT3_uid368_invPolyEval_b & topRangeY_bottomExtension_uid391_pT1_uid354_invPolyEval_q;

    -- topRangeX_uid495_pT3_uid368_invPolyEval(BITSELECT,494)@23
    topRangeX_uid495_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval_q(23 downto 7));

    -- sm0_uid560_pT3_uid368_invPolyEval(MULT,559)@23 + 2
    sm0_uid560_pT3_uid368_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid495_pT3_uid368_invPolyEval_b);
    sm0_uid560_pT3_uid368_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid520_pT3_uid368_invPolyEval_q;
    sm0_uid560_pT3_uid368_invPolyEval_reset <= not (resetn);
    sm0_uid560_pT3_uid368_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid560_pT3_uid368_invPolyEval_a0,
        datab => sm0_uid560_pT3_uid368_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid560_pT3_uid368_invPolyEval_reset,
        clock => clock,
        result => sm0_uid560_pT3_uid368_invPolyEval_s1
    );
    sm0_uid560_pT3_uid368_invPolyEval_q <= sm0_uid560_pT3_uid368_invPolyEval_s1(33 downto 0);

    -- redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1(DELAY,925)
    redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid560_pT3_uid368_invPolyEval_q, xout => redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid565_pT3_uid368_invPolyEval(BITSELECT,564)@26
    highBBits_uid565_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1_q(33 downto 13));

    -- sm0_uid559_pT3_uid368_invPolyEval(MULT,558)@23 + 2
    sm0_uid559_pT3_uid368_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid495_pT3_uid368_invPolyEval_b);
    sm0_uid559_pT3_uid368_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid496_pT3_uid368_invPolyEval_b);
    sm0_uid559_pT3_uid368_invPolyEval_reset <= not (resetn);
    sm0_uid559_pT3_uid368_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid559_pT3_uid368_invPolyEval_a0,
        datab => sm0_uid559_pT3_uid368_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid559_pT3_uid368_invPolyEval_reset,
        clock => clock,
        result => sm0_uid559_pT3_uid368_invPolyEval_s1
    );
    sm0_uid559_pT3_uid368_invPolyEval_q <= sm0_uid559_pT3_uid368_invPolyEval_s1;

    -- redist46_sm0_uid559_pT3_uid368_invPolyEval_q_1(DELAY,926)
    redist46_sm0_uid559_pT3_uid368_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid559_pT3_uid368_invPolyEval_q, xout => redist46_sm0_uid559_pT3_uid368_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid531_pT3_uid368_invPolyEval(BITSELECT,530)@23
    aboveLeftY_uid531_pT3_uid368_invPolyEval_in <= redist60_s2_uid366_invPolyEval_b_1_q(13 downto 0);
    aboveLeftY_uid531_pT3_uid368_invPolyEval_b <= aboveLeftY_uid531_pT3_uid368_invPolyEval_in(13 downto 9);

    -- n1_uid537_pT3_uid368_invPolyEval(BITSELECT,536)@23
    n1_uid537_pT3_uid368_invPolyEval_b <= aboveLeftY_uid531_pT3_uid368_invPolyEval_b(4 downto 1);

    -- n1_uid543_pT3_uid368_invPolyEval(BITSELECT,542)@23
    n1_uid543_pT3_uid368_invPolyEval_b <= n1_uid537_pT3_uid368_invPolyEval_b(3 downto 1);

    -- n1_uid549_pT3_uid368_invPolyEval(BITSELECT,548)@23
    n1_uid549_pT3_uid368_invPolyEval_b <= n1_uid543_pT3_uid368_invPolyEval_b(2 downto 1);

    -- aboveLeftX_uid530_pT3_uid368_invPolyEval(BITSELECT,529)@23
    aboveLeftX_uid530_pT3_uid368_invPolyEval_in <= nx_mergedSignalTM_uid485_pT3_uid368_invPolyEval_q(6 downto 0);
    aboveLeftX_uid530_pT3_uid368_invPolyEval_b <= aboveLeftX_uid530_pT3_uid368_invPolyEval_in(6 downto 2);

    -- n0_uid538_pT3_uid368_invPolyEval(BITSELECT,537)@23
    n0_uid538_pT3_uid368_invPolyEval_b <= aboveLeftX_uid530_pT3_uid368_invPolyEval_b(4 downto 1);

    -- n0_uid544_pT3_uid368_invPolyEval(BITSELECT,543)@23
    n0_uid544_pT3_uid368_invPolyEval_b <= n0_uid538_pT3_uid368_invPolyEval_b(3 downto 1);

    -- n0_uid550_pT3_uid368_invPolyEval(BITSELECT,549)@23
    n0_uid550_pT3_uid368_invPolyEval_b <= n0_uid544_pT3_uid368_invPolyEval_b(2 downto 1);

    -- sm0_uid562_pT3_uid368_invPolyEval(MULT,561)@23 + 2
    sm0_uid562_pT3_uid368_invPolyEval_a0 <= n0_uid550_pT3_uid368_invPolyEval_b;
    sm0_uid562_pT3_uid368_invPolyEval_b0 <= n1_uid549_pT3_uid368_invPolyEval_b;
    sm0_uid562_pT3_uid368_invPolyEval_reset <= not (resetn);
    sm0_uid562_pT3_uid368_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid562_pT3_uid368_invPolyEval_a0,
        datab => sm0_uid562_pT3_uid368_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid562_pT3_uid368_invPolyEval_reset,
        clock => clock,
        result => sm0_uid562_pT3_uid368_invPolyEval_s1
    );
    sm0_uid562_pT3_uid368_invPolyEval_q <= sm0_uid562_pT3_uid368_invPolyEval_s1;

    -- redist43_sm0_uid562_pT3_uid368_invPolyEval_q_1(DELAY,923)
    redist43_sm0_uid562_pT3_uid368_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid562_pT3_uid368_invPolyEval_q, xout => redist43_sm0_uid562_pT3_uid368_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- sumAb_uid563_pT3_uid368_invPolyEval(BITJOIN,562)@26
    sumAb_uid563_pT3_uid368_invPolyEval_q <= redist46_sm0_uid559_pT3_uid368_invPolyEval_q_1_q & redist43_sm0_uid562_pT3_uid368_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval(ADD,565)@26 + 1
    lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => sumAb_uid563_pT3_uid368_invPolyEval_q(37)) & sumAb_uid563_pT3_uid368_invPolyEval_q));
    lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 21 => highBBits_uid565_pT3_uid368_invPolyEval_b(20)) & highBBits_uid565_pT3_uid368_invPolyEval_b));
    lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_q <= lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid564_pT3_uid368_invPolyEval(BITSELECT,563)@26
    lowRangeB_uid564_pT3_uid368_invPolyEval_in <= redist45_sm0_uid560_pT3_uid368_invPolyEval_q_1_q(12 downto 0);
    lowRangeB_uid564_pT3_uid368_invPolyEval_b <= lowRangeB_uid564_pT3_uid368_invPolyEval_in(12 downto 0);

    -- redist42_lowRangeB_uid564_pT3_uid368_invPolyEval_b_1(DELAY,922)
    redist42_lowRangeB_uid564_pT3_uid368_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid564_pT3_uid368_invPolyEval_b, xout => redist42_lowRangeB_uid564_pT3_uid368_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid567_pT3_uid368_invPolyEval(BITJOIN,566)@27
    lev1_a0_uid567_pT3_uid368_invPolyEval_q <= lev1_a0sumAHighB_uid566_pT3_uid368_invPolyEval_q & redist42_lowRangeB_uid564_pT3_uid368_invPolyEval_b_1_q;

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_a(BITJOIN,765)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_a_q <= lev2_a0_uid568_pT3_uid368_invPolyEval_SignBit_for_a_b & lev1_a0_uid567_pT3_uid368_invPolyEval_q;

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a(BITSELECT,771)@27
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_BitExpansion_for_a_q(52 downto 39));

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2(ADD,773)@27 + 1
    lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_b);
    lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_b);
    lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_a) + UNSIGNED(lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_c(0) <= lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_o(39);
    lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_q <= lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1(DELAY,905)
    redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c, xout => redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1(DELAY,906)
    redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c, xout => redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2(ADD,774)@28 + 1
    lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_cin <= lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_c;
    lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1_q(13)) & redist26_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1_q(13)) & redist25_lev2_a0_uid568_pT3_uid368_invPolyEval_BitSelect_for_b_c_1_q) & lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_cin(0));
    lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_a) + SIGNED(lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_q <= lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_o(14 downto 1);

    -- ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2(BITSELECT,833)@29
    ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_q(10 downto 10));

    -- ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_1(BITSELECT,832)@29
    ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_p2_of_2_q(10 downto 0));

    -- ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0(BITSELECT,831)@28
    ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(lev2_a0_uid568_pT3_uid368_invPolyEval_p1_of_2_q(38 downto 17));

    -- redist16_ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b_1(DELAY,896)
    redist16_ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b, xout => redist16_ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_b(BITJOIN,839)@29
    ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_b_q <= ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_1_b & redist16_ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q;

    -- ts3_uid372_invPolyEval_SignBit_for_a(BITSELECT,755)@29
    ts3_uid372_invPolyEval_SignBit_for_a_b <= STD_LOGIC_VECTOR(cIncludingRoundingBit_uid370_invPolyEval_q(40 downto 40));

    -- redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16(DELAY,889)
    redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_9_q, xout => redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16_q, clk => clock, aclr => resetn );

    -- memoryC0_uid337_invTabGen_lutmem(DUALMEM,740)@26 + 2
    -- in j@20000000
    memoryC0_uid337_invTabGen_lutmem_aa <= redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16_q;
    memoryC0_uid337_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid337_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_entA1ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid337_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid337_invTabGen_lutmem_aa,
        q_a => memoryC0_uid337_invTabGen_lutmem_ir
    );
    memoryC0_uid337_invTabGen_lutmem_r <= memoryC0_uid337_invTabGen_lutmem_ir(1 downto 0);

    -- redist31_memoryC0_uid337_invTabGen_lutmem_r_1(DELAY,911)
    redist31_memoryC0_uid337_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid337_invTabGen_lutmem_r, xout => redist31_memoryC0_uid337_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- memoryC0_uid336_invTabGen_lutmem(DUALMEM,739)@26 + 2
    -- in j@20000000
    memoryC0_uid336_invTabGen_lutmem_aa <= redist9_yAddr_uid274_i_div_rgb_to_hv_merged_bit_select_b_16_q;
    memoryC0_uid336_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid336_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_hv_c1_entA0ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid336_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid336_invTabGen_lutmem_aa,
        q_a => memoryC0_uid336_invTabGen_lutmem_ir
    );
    memoryC0_uid336_invTabGen_lutmem_r <= memoryC0_uid336_invTabGen_lutmem_ir(35 downto 0);

    -- redist32_memoryC0_uid336_invTabGen_lutmem_r_1(DELAY,912)
    redist32_memoryC0_uid336_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid336_invTabGen_lutmem_r, xout => redist32_memoryC0_uid336_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- os_uid338_invTabGen(BITJOIN,337)@29
    os_uid338_invTabGen_q <= redist31_memoryC0_uid337_invTabGen_lutmem_r_1_q & redist32_memoryC0_uid336_invTabGen_lutmem_r_1_q;

    -- rndBit_uid369_invPolyEval(CONSTANT,368)
    rndBit_uid369_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid370_invPolyEval(BITJOIN,369)@29
    cIncludingRoundingBit_uid370_invPolyEval_q <= os_uid338_invTabGen_q & rndBit_uid369_invPolyEval_q;

    -- ts3_uid372_invPolyEval_BitExpansion_for_a(BITJOIN,754)@29
    ts3_uid372_invPolyEval_BitExpansion_for_a_q <= ts3_uid372_invPolyEval_SignBit_for_a_b & cIncludingRoundingBit_uid370_invPolyEval_q;

    -- ts3_uid372_invPolyEval_BitSelect_for_a(BITSELECT,760)@29
    ts3_uid372_invPolyEval_BitSelect_for_a_b <= STD_LOGIC_VECTOR(ts3_uid372_invPolyEval_BitExpansion_for_a_q(38 downto 0));
    ts3_uid372_invPolyEval_BitSelect_for_a_c <= STD_LOGIC_VECTOR(ts3_uid372_invPolyEval_BitExpansion_for_a_q(41 downto 39));

    -- ts3_uid372_invPolyEval_p1_of_2(ADD,762)@29 + 1
    ts3_uid372_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & ts3_uid372_invPolyEval_BitSelect_for_a_b);
    ts3_uid372_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_b_q);
    ts3_uid372_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid372_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid372_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(ts3_uid372_invPolyEval_p1_of_2_a) + UNSIGNED(ts3_uid372_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid372_invPolyEval_p1_of_2_c(0) <= ts3_uid372_invPolyEval_p1_of_2_o(39);
    ts3_uid372_invPolyEval_p1_of_2_q <= ts3_uid372_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1(DELAY,893)
    redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid372_invPolyEval_BitSelect_for_b_tessel0_2_b, xout => redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_c(BITJOIN,843)@30
    ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_c_q <= redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist13_ts3_uid372_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q;

    -- redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1(DELAY,908)
    redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid372_invPolyEval_BitSelect_for_a_c, xout => redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- ts3_uid372_invPolyEval_p2_of_2(ADD,763)@30 + 1
    ts3_uid372_invPolyEval_p2_of_2_cin <= ts3_uid372_invPolyEval_p1_of_2_c;
    ts3_uid372_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1_q(2)) & redist28_ts3_uid372_invPolyEval_BitSelect_for_a_c_1_q) & '1');
    ts3_uid372_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_c_q(2)) & ts3_uid372_invPolyEval_BitSelect_for_b_BitJoin_for_c_q) & ts3_uid372_invPolyEval_p2_of_2_cin(0));
    ts3_uid372_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid372_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid372_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid372_invPolyEval_p2_of_2_a) + SIGNED(ts3_uid372_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid372_invPolyEval_p2_of_2_q <= ts3_uid372_invPolyEval_p2_of_2_o(3 downto 1);

    -- redist27_ts3_uid372_invPolyEval_p1_of_2_q_1(DELAY,907)
    redist27_ts3_uid372_invPolyEval_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid372_invPolyEval_p1_of_2_q, xout => redist27_ts3_uid372_invPolyEval_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- ts3_uid372_invPolyEval_BitJoin_for_q(BITJOIN,764)@31
    ts3_uid372_invPolyEval_BitJoin_for_q_q <= ts3_uid372_invPolyEval_p2_of_2_q & redist27_ts3_uid372_invPolyEval_p1_of_2_q_1_q;

    -- s3_uid373_invPolyEval(BITSELECT,372)@31
    s3_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(ts3_uid372_invPolyEval_BitJoin_for_q_q(41 downto 1));

    -- fxpInverseRes_uid277_i_div_rgb_to_hv(BITSELECT,276)@31
    fxpInverseRes_uid277_i_div_rgb_to_hv_in <= s3_uid373_invPolyEval_b(38 downto 0);
    fxpInverseRes_uid277_i_div_rgb_to_hv_b <= fxpInverseRes_uid277_i_div_rgb_to_hv_in(38 downto 6);

    -- paddingY_uid267_i_div_rgb_to_hv(CONSTANT,266)
    paddingY_uid267_i_div_rgb_to_hv_q <= "0000000000000000000000000000000";

    -- updatedY_uid268_i_div_rgb_to_hv(BITJOIN,267)@11
    updatedY_uid268_i_div_rgb_to_hv_q <= GND_q & paddingY_uid267_i_div_rgb_to_hv_q;

    -- redist77_normYNoLeadOne_uid266_i_div_rgb_to_hv_b_1(DELAY,957)
    redist77_normYNoLeadOne_uid266_i_div_rgb_to_hv_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYNoLeadOne_uid266_i_div_rgb_to_hv_b, xout => redist77_normYNoLeadOne_uid266_i_div_rgb_to_hv_b_1_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid267_i_div_rgb_to_hv(LOGICAL,268)@11 + 1
    normYIsOneC2_uid267_i_div_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & redist77_normYNoLeadOne_uid266_i_div_rgb_to_hv_b_1_q);
    normYIsOneC2_uid267_i_div_rgb_to_hv_qi <= "1" WHEN normYIsOneC2_uid267_i_div_rgb_to_hv_a = updatedY_uid268_i_div_rgb_to_hv_q ELSE "0";
    normYIsOneC2_uid267_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid267_i_div_rgb_to_hv_qi, xout => normYIsOneC2_uid267_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid270_i_div_rgb_to_hv(BITSELECT,269)@10
    normYIsOneC2_uid270_i_div_rgb_to_hv_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid652_normY_uid265_i_div_rgb_to_hv_q(31 downto 31));

    -- redist76_normYIsOneC2_uid270_i_div_rgb_to_hv_b_2(DELAY,956)
    redist76_normYIsOneC2_uid270_i_div_rgb_to_hv_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid270_i_div_rgb_to_hv_b, xout => redist76_normYIsOneC2_uid270_i_div_rgb_to_hv_b_2_q, clk => clock, aclr => resetn );

    -- normYIsOne_uid271_i_div_rgb_to_hv(LOGICAL,270)@12 + 1
    normYIsOne_uid271_i_div_rgb_to_hv_qi <= redist76_normYIsOneC2_uid270_i_div_rgb_to_hv_b_2_q and normYIsOneC2_uid267_i_div_rgb_to_hv_q;
    normYIsOne_uid271_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid271_i_div_rgb_to_hv_qi, xout => normYIsOne_uid271_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist75_normYIsOne_uid271_i_div_rgb_to_hv_q_19(DELAY,955)
    redist75_normYIsOne_uid271_i_div_rgb_to_hv_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid271_i_div_rgb_to_hv_q, xout => redist75_normYIsOne_uid271_i_div_rgb_to_hv_q_19_q, clk => clock, aclr => resetn );

    -- invResPostOneHandling2_uid279_i_div_rgb_to_hv(MUX,278)@31
    invResPostOneHandling2_uid279_i_div_rgb_to_hv_s <= redist75_normYIsOne_uid271_i_div_rgb_to_hv_q_19_q;
    invResPostOneHandling2_uid279_i_div_rgb_to_hv_combproc: PROCESS (invResPostOneHandling2_uid279_i_div_rgb_to_hv_s, fxpInverseRes_uid277_i_div_rgb_to_hv_b, oneInvRes_uid278_i_div_rgb_to_hv_q)
    BEGIN
        CASE (invResPostOneHandling2_uid279_i_div_rgb_to_hv_s) IS
            WHEN "0" => invResPostOneHandling2_uid279_i_div_rgb_to_hv_q <= fxpInverseRes_uid277_i_div_rgb_to_hv_b;
            WHEN "1" => invResPostOneHandling2_uid279_i_div_rgb_to_hv_q <= oneInvRes_uid278_i_div_rgb_to_hv_q;
            WHEN OTHERS => invResPostOneHandling2_uid279_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select(BITSELECT,870)@31
    prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_b <= invResPostOneHandling2_uid279_i_div_rgb_to_hv_q(17 downto 0);
    prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_c <= invResPostOneHandling2_uid279_i_div_rgb_to_hv_q(32 downto 18);

    -- prodXInvY_uid282_i_div_rgb_to_hv_im6(MULT,659)@31 + 2
    prodXInvY_uid282_i_div_rgb_to_hv_im6_a0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_b;
    prodXInvY_uid282_i_div_rgb_to_hv_im6_b0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_c;
    prodXInvY_uid282_i_div_rgb_to_hv_im6_reset <= not (resetn);
    prodXInvY_uid282_i_div_rgb_to_hv_im6_component : lpm_mult
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
        dataa => prodXInvY_uid282_i_div_rgb_to_hv_im6_a0,
        datab => prodXInvY_uid282_i_div_rgb_to_hv_im6_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid282_i_div_rgb_to_hv_im6_reset,
        clock => clock,
        result => prodXInvY_uid282_i_div_rgb_to_hv_im6_s1
    );
    prodXInvY_uid282_i_div_rgb_to_hv_im6_q <= prodXInvY_uid282_i_div_rgb_to_hv_im6_s1;

    -- redist38_prodXInvY_uid282_i_div_rgb_to_hv_im6_q_2(DELAY,918)
    redist38_prodXInvY_uid282_i_div_rgb_to_hv_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_im6_q, xout => redist38_prodXInvY_uid282_i_div_rgb_to_hv_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_align_15(BITSHIFT,668)@35
    prodXInvY_uid282_i_div_rgb_to_hv_align_15_qint <= redist38_prodXInvY_uid282_i_div_rgb_to_hv_im6_q_2_q & "000000000000000000";
    prodXInvY_uid282_i_div_rgb_to_hv_align_15_q <= prodXInvY_uid282_i_div_rgb_to_hv_align_15_qint(49 downto 0);

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b(BITJOIN,787)@35
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_UpperBits_for_b_q & prodXInvY_uid282_i_div_rgb_to_hv_align_15_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b(BITSELECT,790)@35
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q(66 downto 39);

    -- prodXInvY_uid282_i_div_rgb_to_hv_im3(MULT,656)@31 + 2
    prodXInvY_uid282_i_div_rgb_to_hv_im3_a0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_b;
    prodXInvY_uid282_i_div_rgb_to_hv_im3_b0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_c;
    prodXInvY_uid282_i_div_rgb_to_hv_im3_reset <= not (resetn);
    prodXInvY_uid282_i_div_rgb_to_hv_im3_component : lpm_mult
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
        dataa => prodXInvY_uid282_i_div_rgb_to_hv_im3_a0,
        datab => prodXInvY_uid282_i_div_rgb_to_hv_im3_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid282_i_div_rgb_to_hv_im3_reset,
        clock => clock,
        result => prodXInvY_uid282_i_div_rgb_to_hv_im3_s1
    );
    prodXInvY_uid282_i_div_rgb_to_hv_im3_q <= prodXInvY_uid282_i_div_rgb_to_hv_im3_s1;

    -- redist39_prodXInvY_uid282_i_div_rgb_to_hv_im3_q_1(DELAY,919)
    redist39_prodXInvY_uid282_i_div_rgb_to_hv_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_im3_q, xout => redist39_prodXInvY_uid282_i_div_rgb_to_hv_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_align_13(BITSHIFT,666)@34
    prodXInvY_uid282_i_div_rgb_to_hv_align_13_qint <= redist39_prodXInvY_uid282_i_div_rgb_to_hv_im3_q_1_q & "000000000000000000";
    prodXInvY_uid282_i_div_rgb_to_hv_align_13_q <= prodXInvY_uid282_i_div_rgb_to_hv_align_13_qint(50 downto 0);

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b(BITJOIN,778)@34
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q <= i_conv4_i_i_i_rgb_to_hv_vt_const_31_q & prodXInvY_uid282_i_div_rgb_to_hv_align_13_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b(BITSELECT,781)@34
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q(65 downto 39);

    -- prodXInvY_uid282_i_div_rgb_to_hv_im9(MULT,662)@31 + 2
    prodXInvY_uid282_i_div_rgb_to_hv_im9_a0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_c;
    prodXInvY_uid282_i_div_rgb_to_hv_im9_b0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_c;
    prodXInvY_uid282_i_div_rgb_to_hv_im9_reset <= not (resetn);
    prodXInvY_uid282_i_div_rgb_to_hv_im9_component : lpm_mult
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
        dataa => prodXInvY_uid282_i_div_rgb_to_hv_im9_a0,
        datab => prodXInvY_uid282_i_div_rgb_to_hv_im9_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid282_i_div_rgb_to_hv_im9_reset,
        clock => clock,
        result => prodXInvY_uid282_i_div_rgb_to_hv_im9_s1
    );
    prodXInvY_uid282_i_div_rgb_to_hv_im9_q <= prodXInvY_uid282_i_div_rgb_to_hv_im9_s1;

    -- redist37_prodXInvY_uid282_i_div_rgb_to_hv_im9_q_1(DELAY,917)
    redist37_prodXInvY_uid282_i_div_rgb_to_hv_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_im9_q, xout => redist37_prodXInvY_uid282_i_div_rgb_to_hv_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_im0(MULT,653)@31 + 2
    prodXInvY_uid282_i_div_rgb_to_hv_im0_a0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs1_merged_bit_select_b;
    prodXInvY_uid282_i_div_rgb_to_hv_im0_b0 <= prodXInvY_uid282_i_div_rgb_to_hv_bs2_merged_bit_select_b;
    prodXInvY_uid282_i_div_rgb_to_hv_im0_reset <= not (resetn);
    prodXInvY_uid282_i_div_rgb_to_hv_im0_component : lpm_mult
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
        dataa => prodXInvY_uid282_i_div_rgb_to_hv_im0_a0,
        datab => prodXInvY_uid282_i_div_rgb_to_hv_im0_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid282_i_div_rgb_to_hv_im0_reset,
        clock => clock,
        result => prodXInvY_uid282_i_div_rgb_to_hv_im0_s1
    );
    prodXInvY_uid282_i_div_rgb_to_hv_im0_q <= prodXInvY_uid282_i_div_rgb_to_hv_im0_s1;

    -- redist40_prodXInvY_uid282_i_div_rgb_to_hv_im0_q_1(DELAY,920)
    redist40_prodXInvY_uid282_i_div_rgb_to_hv_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_im0_q, xout => redist40_prodXInvY_uid282_i_div_rgb_to_hv_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_join_12(BITJOIN,665)@34
    prodXInvY_uid282_i_div_rgb_to_hv_join_12_q <= redist37_prodXInvY_uid282_i_div_rgb_to_hv_im9_q_1_q & redist40_prodXInvY_uid282_i_div_rgb_to_hv_im0_q_1_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a(BITJOIN,776)@34
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodXInvY_uid282_i_div_rgb_to_hv_join_12_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a(BITSELECT,780)@34
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q(65 downto 39);

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2(ADD,782)@34 + 1
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c(0) <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o(39);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2(ADD,791)@35 + 1
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c(0) <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o(39);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist22_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1(DELAY,902)
    redist22_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c, xout => redist22_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist23_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1(DELAY,903)
    redist23_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c, xout => redist23_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist24_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1(DELAY,904)
    redist24_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c, xout => redist24_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2(ADD,783)@35 + 1
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist24_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist23_prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q) & prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin(0);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o(27 downto 1);

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,848)@36
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodXInvY_uid282_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q;

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2(ADD,792)@36 + 1
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist22_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q) & prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin(0);
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o(28 downto 1);

    -- redist21_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q_1(DELAY,901)
    redist21_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q, xout => redist21_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q(BITJOIN,793)@37
    prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q & redist21_prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q_1_q;

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_notEnable(LOGICAL,992)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_nor(LOGICAL,993)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_nor_q <= not (redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_notEnable_q or redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_q);

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_last(CONSTANT,989)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_last_q <= "010111";

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp(LOGICAL,990)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_b <= STD_LOGIC_VECTOR("0" & redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_q);
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_q <= "1" WHEN redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_last_q = redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_b ELSE "0";

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg(REG,991)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg_q <= STD_LOGIC_VECTOR(redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmp_q);
        END IF;
    END PROCESS;

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena(REG,994)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_nor_q = "1") THEN
                redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_q <= STD_LOGIC_VECTOR(redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_enaAnd(LOGICAL,995)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_enaAnd_q <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_sticky_ena_q and VCC_q;

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt(COUNTER,987)
    -- low=0, high=24, step=1, init=0
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i = TO_UNSIGNED(23, 5)) THEN
                redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq <= '1';
            ELSE
                redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq <= '0';
            END IF;
            IF (redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_eq = '1') THEN
                redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i + 8;
            ELSE
                redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_i, 5)));

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_inputreg(DELAY,985)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid334_zCount_uid264_i_div_rgb_to_hv_q, xout => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_inputreg_q, clk => clock, aclr => resetn );

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr(REG,988)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr_q <= "11000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr_q <= STD_LOGIC_VECTOR(redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem(DUALMEM,986)
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ia <= STD_LOGIC_VECTOR(redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_inputreg_q);
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_aa <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_wraddr_q;
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ab <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_rdcnt_q;
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_reset0 <= not (resetn);
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_dmem : altsyncram
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
        clocken1 => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_reset0,
        clock1 => clock,
        address_a => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_aa,
        data_a => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_ab,
        q_b => redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_iq
    );
    redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_q <= redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_iq(5 downto 0);

    -- cWOut_uid280_i_div_rgb_to_hv(CONSTANT,279)
    cWOut_uid280_i_div_rgb_to_hv_q <= "11111";

    -- rShiftCount_uid281_i_div_rgb_to_hv(SUB,280)@36 + 1
    rShiftCount_uid281_i_div_rgb_to_hv_a <= STD_LOGIC_VECTOR("00" & cWOut_uid280_i_div_rgb_to_hv_q);
    rShiftCount_uid281_i_div_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & redist62_r_uid334_zCount_uid264_i_div_rgb_to_hv_q_27_mem_q);
    rShiftCount_uid281_i_div_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rShiftCount_uid281_i_div_rgb_to_hv_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            rShiftCount_uid281_i_div_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid281_i_div_rgb_to_hv_a) - UNSIGNED(rShiftCount_uid281_i_div_rgb_to_hv_b));
        END IF;
    END PROCESS;
    rShiftCount_uid281_i_div_rgb_to_hv_q <= rShiftCount_uid281_i_div_rgb_to_hv_o(6 downto 0);

    -- rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select(BITSELECT,871)@37
    rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_b <= rShiftCount_uid281_i_div_rgb_to_hv_q(6 downto 4);
    rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c <= rShiftCount_uid281_i_div_rgb_to_hv_q(3 downto 1);
    rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d <= rShiftCount_uid281_i_div_rgb_to_hv_q(0 downto 0);

    -- rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv(MUX,690)@37 + 1
    rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_s <= rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_b;
    rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_s) IS
                WHEN "000" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= prodXInvY_uid282_i_div_rgb_to_hv_result_add_1_0_BitJoin_for_q_q(64 downto 0);
                WHEN "001" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx1_uid677_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "010" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx2_uid680_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "011" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx3_uid683_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "100" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx4_uid686_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "101" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "110" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN "111" => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0Idx5_uid687_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
                WHEN OTHERS => rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c_1(DELAY,885)
    redist5_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c, xout => redist5_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv(MUX,713)@38
    rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_s <= redist5_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_c_1_q;
    rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_combproc: PROCESS (rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_s, rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx1_uid694_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx2_uid697_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx3_uid700_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx4_uid703_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx5_uid706_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx6_uid709_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage1Idx7_uid712_prodPostRightShift_uid283_i_div_rgb_to_hv_q)
    BEGIN
        CASE (rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_s) IS
            WHEN "000" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage0_uid691_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "001" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx1_uid694_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "010" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx2_uid697_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "011" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx3_uid700_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "100" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx4_uid703_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "101" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx5_uid706_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "110" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx6_uid709_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "111" => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1Idx7_uid712_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN OTHERS => rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d_1(DELAY,886)
    redist6_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d, xout => redist6_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv(MUX,718)@38
    rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_s <= redist6_rightShiftStageSel6Dto4_uid690_prodPostRightShift_uid283_i_div_rgb_to_hv_merged_bit_select_d_1_q;
    rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_combproc: PROCESS (rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_s, rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q, rightShiftStage2Idx1_uid717_prodPostRightShift_uid283_i_div_rgb_to_hv_q)
    BEGIN
        CASE (rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_s) IS
            WHEN "0" => rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage1_uid714_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN "1" => rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= rightShiftStage2Idx1_uid717_prodPostRightShift_uid283_i_div_rgb_to_hv_q;
            WHEN OTHERS => rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid284_i_div_rgb_to_hv(BITSELECT,283)@38
    prodPostRightShiftPost_uid284_i_div_rgb_to_hv_in <= rightShiftStage2_uid719_prodPostRightShift_uid283_i_div_rgb_to_hv_q(63 downto 0);
    prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b <= prodPostRightShiftPost_uid284_i_div_rgb_to_hv_in(63 downto 31);

    -- redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1(DELAY,953)
    redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b, xout => redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1_q, clk => clock, aclr => resetn );

    -- allOnes_uid285_i_div_rgb_to_hv(LOGICAL,284)@39 + 1
    allOnes_uid285_i_div_rgb_to_hv_qi <= "1" WHEN redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1_q = "111111111111111111111111111111111" ELSE "0";
    allOnes_uid285_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => allOnes_uid285_i_div_rgb_to_hv_qi, xout => allOnes_uid285_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- invAllOnes_uid287_i_div_rgb_to_hv(LOGICAL,286)@40
    invAllOnes_uid287_i_div_rgb_to_hv_q <= not (allOnes_uid285_i_div_rgb_to_hv_q);

    -- addOp2_uid288_i_div_rgb_to_hv(LOGICAL,287)@40
    addOp2_uid288_i_div_rgb_to_hv_q <= invAllOnes_uid287_i_div_rgb_to_hv_q and VCC_q;

    -- redist74_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_2(DELAY,954)
    redist74_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_2 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist73_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_1_q, xout => redist74_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_2_q, clk => clock, aclr => resetn );

    -- prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv(ADD,288)@40
    prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & redist74_prodPostRightShiftPost_uid284_i_div_rgb_to_hv_b_2_q);
    prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid288_i_div_rgb_to_hv_q);
    prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_a) + UNSIGNED(prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_b));
    prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_q <= prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv(BITSELECT,289)@40
    prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_in <= prodPostRightShiftPostRnd_uid289_i_div_rgb_to_hv_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b <= prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_in(32 downto 1);

    -- redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1(DELAY,952)
    redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b, xout => redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1_q, clk => clock, aclr => resetn );

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_notEnable(LOGICAL,1017)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_nor(LOGICAL,1018)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_nor_q <= not (redist87_i_conv52_rgb_to_hv_vt_join_q_36_notEnable_q or redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_q);

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_last(CONSTANT,1014)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_last_q <= "011010";

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp(LOGICAL,1015)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_b <= STD_LOGIC_VECTOR("0" & redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_q);
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_q <= "1" WHEN redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_last_q = redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_b ELSE "0";

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg(REG,1016)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg_q <= STD_LOGIC_VECTOR(redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmp_q);
        END IF;
    END PROCESS;

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena(REG,1019)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist87_i_conv52_rgb_to_hv_vt_join_q_36_nor_q = "1") THEN
                redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_q <= STD_LOGIC_VECTOR(redist87_i_conv52_rgb_to_hv_vt_join_q_36_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_enaAnd(LOGICAL,1020)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_enaAnd_q <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_sticky_ena_q and VCC_q;

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt(COUNTER,1012)
    -- low=0, high=27, step=1, init=0
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq <= '1';
            ELSE
                redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq <= '0';
            END IF;
            IF (redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_eq = '1') THEN
                redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i + 5;
            ELSE
                redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_i, 5)));

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_inputreg(DELAY,1009)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist86_i_conv52_rgb_to_hv_vt_join_q_5_q, xout => redist87_i_conv52_rgb_to_hv_vt_join_q_36_inputreg_q, clk => clock, aclr => resetn );

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr(REG,1013)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr_q <= STD_LOGIC_VECTOR(redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem(DUALMEM,1011)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ia <= STD_LOGIC_VECTOR(redist87_i_conv52_rgb_to_hv_vt_join_q_36_inputreg_q);
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_aa <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_wraddr_q;
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ab <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_rdcnt_q;
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_reset0 <= not (resetn);
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_dmem : altsyncram
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
        clocken1 => redist87_i_conv52_rgb_to_hv_vt_join_q_36_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_reset0,
        clock1 => clock,
        address_a => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_aa,
        data_a => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_ab,
        q_b => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_iq
    );
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_q <= redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_iq(31 downto 0);

    -- redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg(DELAY,1010)
    redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist87_i_conv52_rgb_to_hv_vt_join_q_36_mem_q, xout => redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg_q, clk => clock, aclr => resetn );

    -- yIsZero_uid272_i_div_rgb_to_hv(LOGICAL,271)@40 + 1
    yIsZero_uid272_i_div_rgb_to_hv_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid272_i_div_rgb_to_hv_qi <= "1" WHEN redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg_q = yIsZero_uid272_i_div_rgb_to_hv_b ELSE "0";
    yIsZero_uid272_i_div_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yIsZero_uid272_i_div_rgb_to_hv_qi, xout => yIsZero_uid272_i_div_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- resFinal_uid292_i_div_rgb_to_hv(MUX,291)@41
    resFinal_uid292_i_div_rgb_to_hv_s <= yIsZero_uid272_i_div_rgb_to_hv_q;
    resFinal_uid292_i_div_rgb_to_hv_combproc: PROCESS (resFinal_uid292_i_div_rgb_to_hv_s, redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1_q, cstValOvf_uid291_i_div_rgb_to_hv_q)
    BEGIN
        CASE (resFinal_uid292_i_div_rgb_to_hv_s) IS
            WHEN "0" => resFinal_uid292_i_div_rgb_to_hv_q <= redist72_prodPostRightShiftPostRndRange_uid290_i_div_rgb_to_hv_b_1_q;
            WHEN "1" => resFinal_uid292_i_div_rgb_to_hv_q <= cstValOvf_uid291_i_div_rgb_to_hv_q;
            WHEN OTHERS => resFinal_uid292_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_inputreg(DELAY,996)
    redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinal_uid292_i_div_rgb_to_hv_q, xout => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist70_resFinal_uid292_i_div_rgb_to_hv_q_6(DELAY,950)
    redist70_resFinal_uid292_i_div_rgb_to_hv_q_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_inputreg_q, xout => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_q, clk => clock, aclr => resetn );

    -- redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg(DELAY,997)
    redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_q, xout => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg_q, clk => clock, aclr => resetn );

    -- resFinalM1_uid297_i_div_rgb_to_hv(SUB,296)@47
    resFinalM1_uid297_i_div_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg_q);
    resFinalM1_uid297_i_div_rgb_to_hv_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    resFinalM1_uid297_i_div_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalM1_uid297_i_div_rgb_to_hv_a) - UNSIGNED(resFinalM1_uid297_i_div_rgb_to_hv_b));
    resFinalM1_uid297_i_div_rgb_to_hv_q <= resFinalM1_uid297_i_div_rgb_to_hv_o(32 downto 0);

    -- resFinalPostMux_uid298_i_div_rgb_to_hv(BITSELECT,297)@47
    resFinalPostMux_uid298_i_div_rgb_to_hv_in <= resFinalM1_uid297_i_div_rgb_to_hv_q(31 downto 0);
    resFinalPostMux_uid298_i_div_rgb_to_hv_b <= resFinalPostMux_uid298_i_div_rgb_to_hv_in(31 downto 0);

    -- redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1(DELAY,949)
    redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalPostMux_uid298_i_div_rgb_to_hv_b, xout => redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1_q, clk => clock, aclr => resetn );

    -- redist71_resFinal_uid292_i_div_rgb_to_hv_q_7(DELAY,951)
    redist71_resFinal_uid292_i_div_rgb_to_hv_q_7 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_resFinal_uid292_i_div_rgb_to_hv_q_6_outputreg_q, xout => redist71_resFinal_uid292_i_div_rgb_to_hv_q_7_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select(BITSELECT,872)@41
    prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_b <= resFinal_uid292_i_div_rgb_to_hv_q(17 downto 0);
    prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_c <= resFinal_uid292_i_div_rgb_to_hv_q(31 downto 18);

    -- redist88_i_conv52_rgb_to_hv_vt_join_q_37(DELAY,968)
    redist88_i_conv52_rgb_to_hv_vt_join_q_37 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist87_i_conv52_rgb_to_hv_vt_join_q_36_outputreg_q, xout => redist88_i_conv52_rgb_to_hv_vt_join_q_37_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_bs2(BITSELECT,722)@41
    prodResY_uid293_i_div_rgb_to_hv_bs2_in <= redist88_i_conv52_rgb_to_hv_vt_join_q_37_q(17 downto 0);
    prodResY_uid293_i_div_rgb_to_hv_bs2_b <= prodResY_uid293_i_div_rgb_to_hv_bs2_in(17 downto 0);

    -- prodResY_uid293_i_div_rgb_to_hv_im6(MULT,726)@41 + 2
    prodResY_uid293_i_div_rgb_to_hv_im6_a0 <= prodResY_uid293_i_div_rgb_to_hv_bs2_b;
    prodResY_uid293_i_div_rgb_to_hv_im6_b0 <= prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_c;
    prodResY_uid293_i_div_rgb_to_hv_im6_reset <= not (resetn);
    prodResY_uid293_i_div_rgb_to_hv_im6_component : lpm_mult
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
        dataa => prodResY_uid293_i_div_rgb_to_hv_im6_a0,
        datab => prodResY_uid293_i_div_rgb_to_hv_im6_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid293_i_div_rgb_to_hv_im6_reset,
        clock => clock,
        result => prodResY_uid293_i_div_rgb_to_hv_im6_s1
    );
    prodResY_uid293_i_div_rgb_to_hv_im6_q <= prodResY_uid293_i_div_rgb_to_hv_im6_s1;

    -- redist34_prodResY_uid293_i_div_rgb_to_hv_im6_q_2(DELAY,914)
    redist34_prodResY_uid293_i_div_rgb_to_hv_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_im6_q, xout => redist34_prodResY_uid293_i_div_rgb_to_hv_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_align_15(BITSHIFT,735)@45
    prodResY_uid293_i_div_rgb_to_hv_align_15_qint <= redist34_prodResY_uid293_i_div_rgb_to_hv_im6_q_2_q & "000000000000000000";
    prodResY_uid293_i_div_rgb_to_hv_align_15_q <= prodResY_uid293_i_div_rgb_to_hv_align_15_qint(49 downto 0);

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b(BITJOIN,805)@45
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q <= i_shl_rgb_to_hv_vt_const_15_q & prodResY_uid293_i_div_rgb_to_hv_align_15_q;

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b(BITSELECT,808)@45
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitExpansion_for_b_q(65 downto 39);

    -- prodResY_uid293_i_div_rgb_to_hv_bs5(BITSELECT,725)@41
    prodResY_uid293_i_div_rgb_to_hv_bs5_b <= redist88_i_conv52_rgb_to_hv_vt_join_q_37_q(31 downto 18);

    -- prodResY_uid293_i_div_rgb_to_hv_im3(MULT,723)@41 + 2
    prodResY_uid293_i_div_rgb_to_hv_im3_a0 <= prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_b;
    prodResY_uid293_i_div_rgb_to_hv_im3_b0 <= prodResY_uid293_i_div_rgb_to_hv_bs5_b;
    prodResY_uid293_i_div_rgb_to_hv_im3_reset <= not (resetn);
    prodResY_uid293_i_div_rgb_to_hv_im3_component : lpm_mult
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
        dataa => prodResY_uid293_i_div_rgb_to_hv_im3_a0,
        datab => prodResY_uid293_i_div_rgb_to_hv_im3_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid293_i_div_rgb_to_hv_im3_reset,
        clock => clock,
        result => prodResY_uid293_i_div_rgb_to_hv_im3_s1
    );
    prodResY_uid293_i_div_rgb_to_hv_im3_q <= prodResY_uid293_i_div_rgb_to_hv_im3_s1;

    -- redist35_prodResY_uid293_i_div_rgb_to_hv_im3_q_1(DELAY,915)
    redist35_prodResY_uid293_i_div_rgb_to_hv_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_im3_q, xout => redist35_prodResY_uid293_i_div_rgb_to_hv_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_align_13(BITSHIFT,733)@44
    prodResY_uid293_i_div_rgb_to_hv_align_13_qint <= redist35_prodResY_uid293_i_div_rgb_to_hv_im3_q_1_q & "000000000000000000";
    prodResY_uid293_i_div_rgb_to_hv_align_13_q <= prodResY_uid293_i_div_rgb_to_hv_align_13_qint(49 downto 0);

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b(BITJOIN,796)@44
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q <= i_conv4_i_i_i_rgb_to_hv_vt_const_31_q & prodResY_uid293_i_div_rgb_to_hv_align_13_q;

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b(BITSELECT,799)@44
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q(38 downto 0);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_b_q(64 downto 39);

    -- prodResY_uid293_i_div_rgb_to_hv_im9(MULT,729)@41 + 2
    prodResY_uid293_i_div_rgb_to_hv_im9_a0 <= prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_c;
    prodResY_uid293_i_div_rgb_to_hv_im9_b0 <= prodResY_uid293_i_div_rgb_to_hv_bs5_b;
    prodResY_uid293_i_div_rgb_to_hv_im9_reset <= not (resetn);
    prodResY_uid293_i_div_rgb_to_hv_im9_component : lpm_mult
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
        dataa => prodResY_uid293_i_div_rgb_to_hv_im9_a0,
        datab => prodResY_uid293_i_div_rgb_to_hv_im9_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid293_i_div_rgb_to_hv_im9_reset,
        clock => clock,
        result => prodResY_uid293_i_div_rgb_to_hv_im9_s1
    );
    prodResY_uid293_i_div_rgb_to_hv_im9_q <= prodResY_uid293_i_div_rgb_to_hv_im9_s1;

    -- redist33_prodResY_uid293_i_div_rgb_to_hv_im9_q_1(DELAY,913)
    redist33_prodResY_uid293_i_div_rgb_to_hv_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_im9_q, xout => redist33_prodResY_uid293_i_div_rgb_to_hv_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_im0(MULT,720)@41 + 2
    prodResY_uid293_i_div_rgb_to_hv_im0_a0 <= prodResY_uid293_i_div_rgb_to_hv_bs1_merged_bit_select_b;
    prodResY_uid293_i_div_rgb_to_hv_im0_b0 <= prodResY_uid293_i_div_rgb_to_hv_bs2_b;
    prodResY_uid293_i_div_rgb_to_hv_im0_reset <= not (resetn);
    prodResY_uid293_i_div_rgb_to_hv_im0_component : lpm_mult
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
        dataa => prodResY_uid293_i_div_rgb_to_hv_im0_a0,
        datab => prodResY_uid293_i_div_rgb_to_hv_im0_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid293_i_div_rgb_to_hv_im0_reset,
        clock => clock,
        result => prodResY_uid293_i_div_rgb_to_hv_im0_s1
    );
    prodResY_uid293_i_div_rgb_to_hv_im0_q <= prodResY_uid293_i_div_rgb_to_hv_im0_s1;

    -- redist36_prodResY_uid293_i_div_rgb_to_hv_im0_q_1(DELAY,916)
    redist36_prodResY_uid293_i_div_rgb_to_hv_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_im0_q, xout => redist36_prodResY_uid293_i_div_rgb_to_hv_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_join_12(BITJOIN,732)@44
    prodResY_uid293_i_div_rgb_to_hv_join_12_q <= redist33_prodResY_uid293_i_div_rgb_to_hv_im9_q_1_q & redist36_prodResY_uid293_i_div_rgb_to_hv_im0_q_1_q;

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a(BITJOIN,794)@44
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q <= GND_q & prodResY_uid293_i_div_rgb_to_hv_join_12_q;

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a(BITSELECT,798)@44
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q(38 downto 0);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitExpansion_for_a_q(64 downto 39);

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2(ADD,800)@44 + 1
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_b);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_b);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_a) + UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c(0) <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o(39);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2(ADD,809)@45 + 1
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_q);
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_b);
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_a) + UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c(0) <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o(39);
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist17_leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q_15(DELAY,897)
    redist17_leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 15, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q, xout => redist17_leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q_15_q, clk => clock, aclr => resetn );

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_BitJoin_for_b(BITJOIN,823)@46
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_BitJoin_for_b_q <= prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_b & i_conv_i_i1_rgb_to_hv_vt_const_7_q & redist17_leftShiftStage0_uid587_i_shl_rgb_to_hv_rgb_to_hv22_shift_x_p2_q_15_q & i_shl_rgb_to_hv_vt_const_15_q;

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2(COMPARE,750)@46 + 1
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_BitJoin_for_b_q);
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_q);
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_a) - UNSIGNED(prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_c(0) <= prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_o(39);

    -- redist18_prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1(DELAY,898)
    redist18_prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c, xout => redist18_prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist19_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1(DELAY,899)
    redist19_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c, xout => redist19_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q, clk => clock, aclr => resetn );

    -- redist20_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1(DELAY,900)
    redist20_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c, xout => redist20_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2(ADD,801)@45 + 1
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p1_of_2_c;
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist20_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_a_c_1_q) & '1';
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist19_prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_BitSelect_for_b_c_1_q) & prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_cin(0);
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_a) + UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q <= prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_o(26 downto 1);

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,853)@46
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodResY_uid293_i_div_rgb_to_hv_result_add_0_0_p2_of_2_q;

    -- prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2(ADD,810)@46 + 1
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p1_of_2_c;
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist18_prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_BitSelect_for_b_c_1_q) & prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_cin(0);
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_a) + UNSIGNED(prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q <= prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_o(27 downto 1);

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_tessel1_0(BITSELECT,828)@47
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(prodResY_uid293_i_div_rgb_to_hv_result_add_1_0_p2_of_2_q(24 downto 0));

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_BitJoin_for_c(BITJOIN,830)@47
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_BitJoin_for_c_q <= GND_q & prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_tessel1_0_b;

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_UpperBits_for_a(CONSTANT,745)
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_UpperBits_for_a_q <= "000000000000000000000000000000000";

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select(BITSELECT,879)
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_b <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid294_i_div_rgb_to_hv_UpperBits_for_a_q(6 downto 0));
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_c <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid294_i_div_rgb_to_hv_UpperBits_for_a_q(32 downto 7));

    -- prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2(COMPARE,751)@47 + 1
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_cin <= prod_qy_GT_x_uid294_i_div_rgb_to_hv_p1_of_2_c;
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_a_tessel0_3_merged_bit_select_c) & '0';
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid294_i_div_rgb_to_hv_BitSelect_for_b_BitJoin_for_c_q) & prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_cin(0);
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_a) - UNSIGNED(prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_c(0) <= prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_o(27);

    -- resFinalIntDiv_uid299_i_div_rgb_to_hv(MUX,298)@48
    resFinalIntDiv_uid299_i_div_rgb_to_hv_s <= prod_qy_GT_x_uid294_i_div_rgb_to_hv_p2_of_2_c;
    resFinalIntDiv_uid299_i_div_rgb_to_hv_combproc: PROCESS (resFinalIntDiv_uid299_i_div_rgb_to_hv_s, redist71_resFinal_uid292_i_div_rgb_to_hv_q_7_q, redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1_q)
    BEGIN
        CASE (resFinalIntDiv_uid299_i_div_rgb_to_hv_s) IS
            WHEN "0" => resFinalIntDiv_uid299_i_div_rgb_to_hv_q <= redist71_resFinal_uid292_i_div_rgb_to_hv_q_7_q;
            WHEN "1" => resFinalIntDiv_uid299_i_div_rgb_to_hv_q <= redist69_resFinalPostMux_uid298_i_div_rgb_to_hv_b_1_q;
            WHEN OTHERS => resFinalIntDiv_uid299_i_div_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_div_rgb_to_hv_vt_select_23(BITSELECT,184)@48
    i_div_rgb_to_hv_vt_select_23_b <= resFinalIntDiv_uid299_i_div_rgb_to_hv_q(23 downto 0);

    -- redist83_i_div_rgb_to_hv_vt_select_23_b_1(DELAY,963)
    redist83_i_div_rgb_to_hv_vt_select_23_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_rgb_to_hv_vt_select_23_b, xout => redist83_i_div_rgb_to_hv_vt_select_23_b_1_q, clk => clock, aclr => resetn );

    -- i_div_rgb_to_hv_vt_join(BITJOIN,183)@49
    i_div_rgb_to_hv_vt_join_q <= i_conv_i_i1_rgb_to_hv_vt_const_7_q & redist83_i_div_rgb_to_hv_vt_select_23_b_1_q;

    -- i_add_rgb_to_hv(ADD,146)@49
    i_add_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & i_div_rgb_to_hv_vt_join_q);
    i_add_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_add_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_rgb_to_hv_a) + UNSIGNED(i_add_rgb_to_hv_b));
    i_add_rgb_to_hv_q <= i_add_rgb_to_hv_o(32 downto 0);

    -- bgTrunc_i_add_rgb_to_hv_sel_x(BITSELECT,3)@49
    bgTrunc_i_add_rgb_to_hv_sel_x_b <= i_add_rgb_to_hv_q(31 downto 0);

    -- i_add_rgb_to_hv_vt_select_24(BITSELECT,149)@49
    i_add_rgb_to_hv_vt_select_24_b <= bgTrunc_i_add_rgb_to_hv_sel_x_b(24 downto 0);

    -- i_add_rgb_to_hv_vt_join(BITJOIN,148)@49
    i_add_rgb_to_hv_vt_join_q <= i_add_rgb_to_hv_vt_const_31_q & i_add_rgb_to_hv_vt_select_24_b;

    -- i_conv_i_i_i22_rgb_to_hv_sel_x(BITSELECT,81)@49
    i_conv_i_i_i22_rgb_to_hv_sel_x_b <= i_add_rgb_to_hv_vt_join_q(16 downto 0);

    -- redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1(DELAY,982)
    redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv_i_i_i22_rgb_to_hv_sel_x_b, xout => redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_hv27(LOGICAL,236)@49 + 1
    i_unnamed_rgb_to_hv27_qi <= "1" WHEN i_acl_24_rgb_to_hv_vt_join_q = c_i32_1gr_q ELSE "0";
    i_unnamed_rgb_to_hv27_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hv27_qi, xout => i_unnamed_rgb_to_hv27_q, clk => clock, aclr => resetn );

    -- i_unnamed_rgb_to_hv25(LOGICAL,235)@49 + 1
    i_unnamed_rgb_to_hv25_qi <= "1" WHEN i_acl_24_rgb_to_hv_vt_join_q = c_i32_3gr_q ELSE "0";
    i_unnamed_rgb_to_hv25_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hv25_qi, xout => i_unnamed_rgb_to_hv25_q, clk => clock, aclr => resetn );

    -- i_acl_25_rgb_to_hv(LOGICAL,132)@50
    i_acl_25_rgb_to_hv_q <= i_unnamed_rgb_to_hv25_q or i_unnamed_rgb_to_hv27_q;

    -- i_unnamed_rgb_to_hv23(LOGICAL,234)@49 + 1
    i_unnamed_rgb_to_hv23_qi <= "1" WHEN i_acl_24_rgb_to_hv_vt_join_q = c_i32_5gr_q ELSE "0";
    i_unnamed_rgb_to_hv23_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_rgb_to_hv23_qi, xout => i_unnamed_rgb_to_hv23_q, clk => clock, aclr => resetn );

    -- i_acl_26_rgb_to_hv(LOGICAL,133)@50
    i_acl_26_rgb_to_hv_q <= i_unnamed_rgb_to_hv23_q or i_acl_25_rgb_to_hv_q;

    -- i_acl_27_rgb_to_hv(MUX,134)@50
    i_acl_27_rgb_to_hv_s <= i_acl_26_rgb_to_hv_q;
    i_acl_27_rgb_to_hv_combproc: PROCESS (i_acl_27_rgb_to_hv_s, redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1_q, bgTrunc_i_sub_i_i_i_rgb_to_hv_sel_x_b)
    BEGIN
        CASE (i_acl_27_rgb_to_hv_s) IS
            WHEN "0" => i_acl_27_rgb_to_hv_q <= redist102_i_conv_i_i_i22_rgb_to_hv_sel_x_b_1_q;
            WHEN "1" => i_acl_27_rgb_to_hv_q <= bgTrunc_i_sub_i_i_i_rgb_to_hv_sel_x_b;
            WHEN OTHERS => i_acl_27_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv4_i_i_i_rgb_to_hv_sel_x(BITSELECT,74)@50
    i_conv4_i_i_i_rgb_to_hv_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_27_rgb_to_hv_q(16 downto 0)), 32));

    -- i_conv4_i_i_i_rgb_to_hv_vt_select_16(BITSELECT,168)@50
    i_conv4_i_i_i_rgb_to_hv_vt_select_16_b <= i_conv4_i_i_i_rgb_to_hv_sel_x_b(16 downto 0);

    -- redist89_i_conv4_i_i_i_rgb_to_hv_vt_select_16_b_1(DELAY,969)
    redist89_i_conv4_i_i_i_rgb_to_hv_vt_select_16_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv4_i_i_i_rgb_to_hv_vt_select_16_b, xout => redist89_i_conv4_i_i_i_rgb_to_hv_vt_select_16_b_1_q, clk => clock, aclr => resetn );

    -- i_conv4_i_i_i_rgb_to_hv_vt_join(BITJOIN,167)@51
    i_conv4_i_i_i_rgb_to_hv_vt_join_q <= i_conv4_i_i_i_rgb_to_hv_vt_const_31_q & redist89_i_conv4_i_i_i_rgb_to_hv_vt_select_16_b_1_q;

    -- i_add_i_i_i_rgb_to_hv(ADD,145)@51
    i_add_i_i_i_rgb_to_hv_a <= STD_LOGIC_VECTOR("0" & i_conv4_i_i_i_rgb_to_hv_vt_join_q);
    i_add_i_i_i_rgb_to_hv_b <= STD_LOGIC_VECTOR("0" & i_mul_add66_rgb_to_hv_vt_join_q);
    i_add_i_i_i_rgb_to_hv_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_i_i_i_rgb_to_hv_a) + UNSIGNED(i_add_i_i_i_rgb_to_hv_b));
    i_add_i_i_i_rgb_to_hv_q <= i_add_i_i_i_rgb_to_hv_o(32 downto 0);

    -- bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x(BITSELECT,2)@51
    bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x_b <= i_add_i_i_i_rgb_to_hv_q(31 downto 0);

    -- leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x(MUX,577)@51
    leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_s <= VCC_q;
    leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_combproc: PROCESS (leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_s, bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x_b, leftShiftStage0Idx1_uid576_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q <= bgTrunc_i_add_i_i_i_rgb_to_hv_sel_x_b;
            WHEN "1" => leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q <= leftShiftStage0Idx1_uid576_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv_i_i1_rgb_to_hv_vt_select_31(BITSELECT,179)@51
    i_conv_i_i1_rgb_to_hv_vt_select_31_b <= leftShiftStage0_uid578_i_conv_i_i1_rgb_to_hv_rgb_to_hv31_shift_x_q(31 downto 8);

    -- i_conv_i_i1_rgb_to_hv_vt_join(BITJOIN,178)@51
    i_conv_i_i1_rgb_to_hv_vt_join_q <= i_conv_i_i1_rgb_to_hv_vt_select_31_b & i_conv_i_i1_rgb_to_hv_vt_const_7_q;

    -- i_shl_i_i_rgb_to_hv_BitSelect_for_a(BITSELECT,610)@51
    i_shl_i_i_rgb_to_hv_BitSelect_for_a_b <= i_conv_i_i1_rgb_to_hv_vt_join_q(26 downto 8);

    -- i_shl_i_i_rgb_to_hv_join(BITJOIN,611)@51
    i_shl_i_i_rgb_to_hv_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & i_shl_i_i_rgb_to_hv_BitSelect_for_a_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q;

    -- i_shl_i_i_rgb_to_hv_vt_select_26(BITSELECT,226)@51
    i_shl_i_i_rgb_to_hv_vt_select_26_b <= i_shl_i_i_rgb_to_hv_join_q(26 downto 8);

    -- redist79_i_shl_i_i_rgb_to_hv_vt_select_26_b_1(DELAY,959)
    redist79_i_shl_i_i_rgb_to_hv_vt_select_26_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_shl_i_i_rgb_to_hv_vt_select_26_b, xout => redist79_i_shl_i_i_rgb_to_hv_vt_select_26_b_1_q, clk => clock, aclr => resetn );

    -- i_shl_i_i_rgb_to_hv_vt_join(BITJOIN,225)@52
    i_shl_i_i_rgb_to_hv_vt_join_q <= i_or_i_i_zext_rgb_to_hv_vt_const_31_q & redist79_i_shl_i_i_rgb_to_hv_vt_select_26_b_1_q & i_conv_i_i1_rgb_to_hv_vt_const_7_q;

    -- i_cmp_rgb_to_hv(LOGICAL,164)@3 + 1
    i_cmp_rgb_to_hv_qi <= "1" WHEN i_acl_8_rgb_to_hv_q = i_acl_9_rgb_to_hv_q ELSE "0";
    i_cmp_rgb_to_hv_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hv_qi, xout => i_cmp_rgb_to_hv_q, clk => clock, aclr => resetn );

    -- redist90_i_cmp_rgb_to_hv_q_49(DELAY,970)
    redist90_i_cmp_rgb_to_hv_q_49 : dspba_delay
    GENERIC MAP ( width => 1, depth => 48, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_hv_q, xout => redist90_i_cmp_rgb_to_hv_q_49_q, clk => clock, aclr => resetn );

    -- i_or_i_i_zext_rgb_to_hv(MUX,207)@52
    i_or_i_i_zext_rgb_to_hv_s <= redist90_i_cmp_rgb_to_hv_q_49_q;
    i_or_i_i_zext_rgb_to_hv_combproc: PROCESS (i_or_i_i_zext_rgb_to_hv_s, i_shl_i_i_rgb_to_hv_vt_join_q, c_i32_0gr_q)
    BEGIN
        CASE (i_or_i_i_zext_rgb_to_hv_s) IS
            WHEN "0" => i_or_i_i_zext_rgb_to_hv_q <= i_shl_i_i_rgb_to_hv_vt_join_q;
            WHEN "1" => i_or_i_i_zext_rgb_to_hv_q <= c_i32_0gr_q;
            WHEN OTHERS => i_or_i_i_zext_rgb_to_hv_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_or_i_i_zext_rgb_to_hv_vt_select_26(BITSELECT,211)@52
    i_or_i_i_zext_rgb_to_hv_vt_select_26_b <= i_or_i_i_zext_rgb_to_hv_q(26 downto 8);

    -- i_conv_i_i1_rgb_to_hv_vt_const_7(CONSTANT,177)
    i_conv_i_i1_rgb_to_hv_vt_const_7_q <= "00000000";

    -- i_or_i_i_zext_rgb_to_hv_vt_join(BITJOIN,210)@52
    i_or_i_i_zext_rgb_to_hv_vt_join_q <= i_or_i_i_zext_rgb_to_hv_vt_const_31_q & i_or_i_i_zext_rgb_to_hv_vt_select_26_b & i_conv_i_i1_rgb_to_hv_vt_const_7_q;

    -- redist92_i_acl_8_rgb_to_hv_q_50_notEnable(LOGICAL,1027)
    redist92_i_acl_8_rgb_to_hv_q_50_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist92_i_acl_8_rgb_to_hv_q_50_nor(LOGICAL,1028)
    redist92_i_acl_8_rgb_to_hv_q_50_nor_q <= not (redist92_i_acl_8_rgb_to_hv_q_50_notEnable_q or redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_q);

    -- redist92_i_acl_8_rgb_to_hv_q_50_mem_last(CONSTANT,1024)
    redist92_i_acl_8_rgb_to_hv_q_50_mem_last_q <= "0101110";

    -- redist92_i_acl_8_rgb_to_hv_q_50_cmp(LOGICAL,1025)
    redist92_i_acl_8_rgb_to_hv_q_50_cmp_b <= STD_LOGIC_VECTOR("0" & redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_q);
    redist92_i_acl_8_rgb_to_hv_q_50_cmp_q <= "1" WHEN redist92_i_acl_8_rgb_to_hv_q_50_mem_last_q = redist92_i_acl_8_rgb_to_hv_q_50_cmp_b ELSE "0";

    -- redist92_i_acl_8_rgb_to_hv_q_50_cmpReg(REG,1026)
    redist92_i_acl_8_rgb_to_hv_q_50_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_cmpReg_q <= STD_LOGIC_VECTOR(redist92_i_acl_8_rgb_to_hv_q_50_cmp_q);
        END IF;
    END PROCESS;

    -- redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena(REG,1029)
    redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist92_i_acl_8_rgb_to_hv_q_50_nor_q = "1") THEN
                redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_q <= STD_LOGIC_VECTOR(redist92_i_acl_8_rgb_to_hv_q_50_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist92_i_acl_8_rgb_to_hv_q_50_enaAnd(LOGICAL,1030)
    redist92_i_acl_8_rgb_to_hv_q_50_enaAnd_q <= redist92_i_acl_8_rgb_to_hv_q_50_sticky_ena_q and VCC_q;

    -- redist92_i_acl_8_rgb_to_hv_q_50_rdcnt(COUNTER,1022)
    -- low=0, high=47, step=1, init=0
    redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i = TO_UNSIGNED(46, 6)) THEN
                redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq <= '1';
            ELSE
                redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq <= '0';
            END IF;
            IF (redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_eq = '1') THEN
                redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i <= redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i + 17;
            ELSE
                redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i <= redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_i, 6)));

    -- redist92_i_acl_8_rgb_to_hv_q_50_wraddr(REG,1023)
    redist92_i_acl_8_rgb_to_hv_q_50_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_wraddr_q <= "101111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist92_i_acl_8_rgb_to_hv_q_50_wraddr_q <= STD_LOGIC_VECTOR(redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist92_i_acl_8_rgb_to_hv_q_50_mem(DUALMEM,1021)
    redist92_i_acl_8_rgb_to_hv_q_50_mem_ia <= STD_LOGIC_VECTOR(i_acl_8_rgb_to_hv_q);
    redist92_i_acl_8_rgb_to_hv_q_50_mem_aa <= redist92_i_acl_8_rgb_to_hv_q_50_wraddr_q;
    redist92_i_acl_8_rgb_to_hv_q_50_mem_ab <= redist92_i_acl_8_rgb_to_hv_q_50_rdcnt_q;
    redist92_i_acl_8_rgb_to_hv_q_50_mem_reset0 <= not (resetn);
    redist92_i_acl_8_rgb_to_hv_q_50_mem_dmem : altsyncram
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
        clocken1 => redist92_i_acl_8_rgb_to_hv_q_50_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist92_i_acl_8_rgb_to_hv_q_50_mem_reset0,
        clock1 => clock,
        address_a => redist92_i_acl_8_rgb_to_hv_q_50_mem_aa,
        data_a => redist92_i_acl_8_rgb_to_hv_q_50_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist92_i_acl_8_rgb_to_hv_q_50_mem_ab,
        q_b => redist92_i_acl_8_rgb_to_hv_q_50_mem_iq
    );
    redist92_i_acl_8_rgb_to_hv_q_50_mem_q <= redist92_i_acl_8_rgb_to_hv_q_50_mem_iq(7 downto 0);

    -- i_acl_8_zext_rgb_to_hv_sel_x(BITSELECT,73)@52
    i_acl_8_zext_rgb_to_hv_sel_x_b <= std_logic_vector(resize(unsigned(redist92_i_acl_8_rgb_to_hv_q_50_mem_q(7 downto 0)), 32));

    -- i_acl_8_zext_rgb_to_hv_vt_select_7(BITSELECT,143)@52
    i_acl_8_zext_rgb_to_hv_vt_select_7_b <= i_acl_8_zext_rgb_to_hv_sel_x_b(7 downto 0);

    -- i_acl_8_zext_rgb_to_hv_vt_join(BITJOIN,142)@52
    i_acl_8_zext_rgb_to_hv_vt_join_q <= i_acl_8_zext_rgb_to_hv_vt_const_31_q & i_acl_8_zext_rgb_to_hv_vt_select_7_b;

    -- i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_vec_1_join_x(BITJOIN,71)@52
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_vec_1_join_x_q <= i_or_i_i_zext_rgb_to_hv_vt_join_q & i_acl_8_zext_rgb_to_hv_vt_join_q;

    -- i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select(BITSELECT,866)@52
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_vec_1_join_x_q(58 downto 0);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_b <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(0 downto 0);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_c <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(1 downto 1);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_d <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(2 downto 2);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_e <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(3 downto 3);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_f <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(4 downto 4);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_g <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(40 downto 40);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_h <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(41 downto 41);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_i <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(42 downto 42);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_j <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(43 downto 43);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_k <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(44 downto 44);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_l <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(45 downto 45);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_m <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(46 downto 46);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_n <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(47 downto 47);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_o <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(48 downto 48);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_p <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(49 downto 49);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_q <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(5 downto 5);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_r <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(50 downto 50);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_s <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(51 downto 51);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_t <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(52 downto 52);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_u <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(53 downto 53);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_v <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(54 downto 54);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_w <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(55 downto 55);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_x <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(56 downto 56);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_y <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(57 downto 57);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_z <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(58 downto 58);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_aa <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(6 downto 6);
    i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_bb <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_in(7 downto 7);

    -- i_acl_28_compressed_rgb_to_hv_rgb_to_hv33_acl_28_shuffle_join_x(BITJOIN,72)@52
    i_acl_28_compressed_rgb_to_hv_rgb_to_hv33_acl_28_shuffle_join_x_q <= i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_z & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_y & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_x & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_w & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_v & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_u & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_t & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_s & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_r & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_p & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_o & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_n & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_m & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_l & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_k & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_j & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_i & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_h & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_g & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_bb & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_aa & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_q & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_f & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_e & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_d & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_c & i_acl_28_bitvec_rgb_to_hv_rgb_to_hv32_acl_28_bitvec_select_0_x_merged_bit_select_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,91)@52
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_acl_28_compressed_rgb_to_hv_rgb_to_hv33_acl_28_shuffle_join_x_q;
    out_o_valid <= redist101_sync_in_aunroll_x_in_i_valid_51_q;

END normal;

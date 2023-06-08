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

-- VHDL created from i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enter_rgb_to_s13
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

entity i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enter_rgb_to_s13 is
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
end i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enter_rgb_to_s13;

architecture normal of i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enter_rgb_to_s13 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_sub58_rgb_to_sgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_rgb_to_sgr_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv52_rgb_to_sgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv59_rgb_to_sgr_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_i_i2_rgb_to_sgr_sel_x_b : STD_LOGIC_VECTOR (55 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_45875_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i56_0gr_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_2_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_2_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_3_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_3_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_4_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_4_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_5_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_5_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_6_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_6_rgb_to_sgr_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_6_rgb_to_sgr_vt_const_55_q : STD_LOGIC_VECTOR (54 downto 0);
    signal i_acl_6_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_6_rgb_to_sgr_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cmp60_rgb_to_sgr_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp60_rgb_to_sgr_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp60_rgb_to_sgr_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp60_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i27_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i27_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i27_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i27_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i32_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i32_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i32_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i32_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i57_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i57_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i57_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i57_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i70_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i70_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i70_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i70_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i77_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i77_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i77_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i77_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_rgb_to_sgr_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_sgr_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_sgr_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i_rgb_to_sgr_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv52_rgb_to_sgr_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv52_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv52_rgb_to_sgr_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv59_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv59_rgb_to_sgr_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_i2_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv_i_i2_rgb_to_sgr_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_or_cond199_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond200_not_demorgan_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond200_not_demorgan_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl_rgb_to_sgr_vt_const_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_shl_rgb_to_sgr_vt_const_31_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_shl_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_rgb_to_sgr_vt_select_23_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sub58_rgb_to_sgr_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub58_rgb_to_sgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub58_rgb_to_sgr_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub58_rgb_to_sgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub58_rgb_to_sgr_vt_const_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sub58_rgb_to_sgr_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sub58_rgb_to_sgr_vt_select_31_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sub_rgb_to_sgr_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_sgr_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_sgr_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sub_rgb_to_sgr_q : STD_LOGIC_VECTOR (8 downto 0);
    signal normYNoLeadOne_uid70_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid70_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid71_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid72_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid71_i_div_rgb_to_sgr_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid71_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid71_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid74_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid75_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid75_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid76_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid76_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid76_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid81_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid81_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid82_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid83_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid84_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid85_i_div_rgb_to_sgr_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid85_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid85_i_div_rgb_to_sgr_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid85_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid89_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal allOnes_uid89_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid91_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid92_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid95_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid96_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid96_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalM1_uid101_i_div_rgb_to_sgr_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid101_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid101_i_div_rgb_to_sgr_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid101_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalPostMux_uid102_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalPostMux_uid102_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid103_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinalIntDiv_uid103_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid123_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid131_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid136_zCount_uid68_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid137_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid138_zCount_uid68_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid157_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid159_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid160_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid162_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid162_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid162_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid162_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid163_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cIncludingRoundingBit_uid167_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal ts2_uid169_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid169_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid169_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid169_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid170_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rndBit_uid173_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal s3_uid177_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal nx_mergedSignalTM_uid181_pT1_uid158_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid193_pT1_uid158_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal topRangeY_mergedSignalTM_uid197_pT1_uid158_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid199_pT1_uid158_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid199_pT1_uid158_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid199_pT1_uid158_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid199_pT1_uid158_invPolyEval_reset : std_logic;
    signal sm0_uid199_pT1_uid158_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid200_pT1_uid158_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid200_pT1_uid158_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal topRangeX_uid214_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid215_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid220_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid223_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_mergedSignalTM_uid227_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomY_uid229_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid233_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_uid233_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid234_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid234_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid235_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid235_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid236_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid236_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid242_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid243_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid244_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid245_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid250_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid251_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid252_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid253_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid264_pT2_uid165_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid264_pT2_uid165_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid264_pT2_uid165_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid264_pT2_uid165_invPolyEval_reset : std_logic;
    signal sm0_uid264_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid265_pT2_uid165_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid265_pT2_uid165_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid265_pT2_uid165_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid265_pT2_uid165_invPolyEval_reset : std_logic;
    signal sm0_uid265_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm1_uid266_pT2_uid165_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid266_pT2_uid165_invPolyEval_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid266_pT2_uid165_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid266_pT2_uid165_invPolyEval_reset : std_logic;
    signal sm1_uid266_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid267_pT2_uid165_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid267_pT2_uid165_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid267_pT2_uid165_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid267_pT2_uid165_invPolyEval_reset : std_logic;
    signal sm0_uid267_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid268_pT2_uid165_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid268_pT2_uid165_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm1_uid268_pT2_uid165_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm1_uid268_pT2_uid165_invPolyEval_reset : std_logic;
    signal sm1_uid268_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid269_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid269_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid270_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid271_pT2_uid165_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid271_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid271_pT2_uid165_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid271_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid272_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid273_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeA_uid273_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highABits_uid274_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid275_pT2_uid165_invPolyEval_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid275_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid275_pT2_uid165_invPolyEval_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev1_a1high_uid275_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal lev1_a1_uid276_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid277_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid277_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid278_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid279_pT2_uid165_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid279_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid279_pT2_uid165_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid279_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid280_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lowRangeA_uid281_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid281_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid282_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev3_a0high_uid283_pT2_uid165_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid283_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid283_pT2_uid165_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid283_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid284_pT2_uid165_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid285_pT2_uid165_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid285_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal topRangeX_uid299_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid300_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_mergedSignalTM_uid324_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomExtension_uid326_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_mergedSignalTM_uid328_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid334_pT3_uid172_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftX_uid334_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid335_pT3_uid172_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_uid335_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid341_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid342_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid347_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid348_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid353_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid354_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid363_pT3_uid172_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid363_pT3_uid172_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid363_pT3_uid172_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid363_pT3_uid172_invPolyEval_reset : std_logic;
    signal sm0_uid363_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid364_pT3_uid172_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid364_pT3_uid172_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid364_pT3_uid172_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm0_uid364_pT3_uid172_invPolyEval_reset : std_logic;
    signal sm0_uid364_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm1_uid365_pT3_uid172_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid365_pT3_uid172_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid365_pT3_uid172_invPolyEval_s1 : STD_LOGIC_VECTOR (34 downto 0);
    signal sm1_uid365_pT3_uid172_invPolyEval_reset : std_logic;
    signal sm1_uid365_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid366_pT3_uid172_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid366_pT3_uid172_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid366_pT3_uid172_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid366_pT3_uid172_invPolyEval_reset : std_logic;
    signal sm0_uid366_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid367_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid380_i_shl_rgb_to_s_rgb_to_s16_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid393_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2_uid396_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid399_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid408_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx2_uid411_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx3_uid414_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx4_uid417_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Pad5_uid418_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx5_uid420_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx6Pad6_uid421_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx6_uid423_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx7Pad7_uid424_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx7_uid426_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im0_reset : std_logic;
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im3_reset : std_logic;
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im6_reset : std_logic;
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im9_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im9_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im9_reset : std_logic;
    signal prodXInvY_uid86_i_div_rgb_to_sgr_im9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_align_13_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_align_13_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx1_uid453_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid456_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx3Pad48_uid458_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid459_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx4Pad64_uid461_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx4_uid462_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng2_uid468_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid470_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng4_uid471_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx2_uid473_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng6_uid474_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage1Idx3_uid476_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx4Rng8_uid477_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx4_uid479_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx5Rng10_uid480_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx5_uid482_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx6Rng12_uid483_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx6Pad12_uid484_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx6_uid485_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx7Rng14_uid486_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx7Pad14_uid487_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx7_uid488_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng1_uid491_prodPostRightShift_uid87_i_div_rgb_to_sgr_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage2Idx1_uid493_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im0_reset : std_logic;
    signal prodResY_uid97_i_div_rgb_to_sgr_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im3_reset : std_logic;
    signal prodResY_uid97_i_div_rgb_to_sgr_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_bs5_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im6_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im6_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im6_reset : std_logic;
    signal prodResY_uid97_i_div_rgb_to_sgr_im6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im9_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im9_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im9_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_im9_reset : std_logic;
    signal prodResY_uid97_i_div_rgb_to_sgr_im9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_align_13_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_align_13_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal memoryC0_uid140_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid140_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid140_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid140_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid140_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid140_invTabGen_lutmem_r : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid141_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid141_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid141_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid141_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid141_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC0_uid141_invTabGen_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid144_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid144_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid144_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid144_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid144_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid144_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid147_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid147_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid147_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid147_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid147_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid147_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid150_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid150_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid150_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid150_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid150_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid150_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_UpperBits_for_a_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid176_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid176_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid176_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal ts3_uid176_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid176_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid176_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid176_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid176_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal ts3_uid176_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid176_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid176_invPolyEval_BitJoin_for_q_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (39 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (24 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel0_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (20 downto 0);
    signal highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (24 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (38 downto 0);
    signal prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal redist0_prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist1_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist2_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist3_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist4_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist5_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist6_highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist7_leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist12_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist41_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist42_ts3_uid176_invPolyEval_p1_of_2_q_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist43_memoryC3_uid150_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist44_memoryC1_uid144_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist45_memoryC0_uid141_invTabGen_lutmem_r_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_memoryC0_uid140_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist48_prodResY_uid97_i_div_rgb_to_sgr_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_prodResY_uid97_i_div_rgb_to_sgr_im3_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_prodResY_uid97_i_div_rgb_to_sgr_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist52_prodXInvY_uid86_i_div_rgb_to_sgr_im6_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_prodXInvY_uid86_i_div_rgb_to_sgr_im3_q_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist54_prodXInvY_uid86_i_div_rgb_to_sgr_im0_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist55_sm0_uid366_pT3_uid172_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist58_sm0_uid363_pT3_uid172_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist59_rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist60_topRangeY_uid300_pT3_uid172_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist61_osig_uid285_pT2_uid165_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist63_lowRangeA_uid281_pT2_uid165_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist64_lev1_a1high_uid275_pT2_uid165_invPolyEval_q_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist65_lowRangeA_uid273_pT2_uid165_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist66_lowRangeA_uid269_pT2_uid165_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_sm1_uid268_pT2_uid165_invPolyEval_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist70_n0_uid253_pT2_uid165_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist71_n1_uid252_pT2_uid165_invPolyEval_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist72_s2_uid170_invPolyEval_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist73_s1_uid163_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist76_vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_resFinalPostMux_uid102_i_div_rgb_to_sgr_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist82_resFinal_uid96_i_div_rgb_to_sgr_q_7_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist85_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist86_normYIsOne_uid75_i_div_rgb_to_sgr_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_normYIsOneC2_uid74_i_div_rgb_to_sgr_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_normYNoLeadOne_uid70_i_div_rgb_to_sgr_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist89_i_sub58_rgb_to_sgr_vt_select_31_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist90_i_conv59_rgb_to_sgr_vt_join_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist93_i_conv59_rgb_to_sgr_vt_join_q_37_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist94_i_cmp_rgb_to_sgr_q_46_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist98_sync_in_aunroll_x_in_i_valid_48_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_inputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_outputreg_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_reset0 : std_logic;
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i : signal is true;
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq : std_logic;
    attribute preserve of redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq : signal is true;
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_inputreg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_reset0 : std_logic;
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i : signal is true;
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq : std_logic;
    attribute preserve of redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq : signal is true;
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_reset0 : std_logic;
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i : signal is true;
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq : std_logic;
    attribute preserve of redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq : signal is true;
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_i_conv59_rgb_to_sgr_vt_join_q_36_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_reset0 : std_logic;
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i : signal is true;
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq : std_logic;
    attribute preserve of redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq : signal is true;
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist98_sync_in_aunroll_x_in_i_valid_48(DELAY,804)
    redist98_sync_in_aunroll_x_in_i_valid_48 : dspba_delay
    GENERIC MAP ( width => 1, depth => 48, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist98_sync_in_aunroll_x_in_i_valid_48_q, clk => clock, aclr => resetn );

    -- i_acl_6_rgb_to_sgr_vt_const_55(CONSTANT,25)
    i_acl_6_rgb_to_sgr_vt_const_55_q <= "0000000000000000000000000000000000000000000000000000000";

    -- c_i56_0gr(CONSTANT,19)
    c_i56_0gr_q <= "00000000000000000000000000000000000000000000000000000000";

    -- cstValOvf_uid95_i_div_rgb_to_sgr(CONSTANT,94)
    cstValOvf_uid95_i_div_rgb_to_sgr_q <= "11111111111111111111111111111111";

    -- rightShiftStage2Idx1Rng1_uid491_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,490)@37
    rightShiftStage2Idx1Rng1_uid491_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 1);

    -- rightShiftStage2Idx1_uid493_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,492)@37
    rightShiftStage2Idx1_uid493_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= GND_q & rightShiftStage2Idx1Rng1_uid491_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- rightShiftStage1Idx7Pad14_uid487_prodPostRightShift_uid87_i_div_rgb_to_sgr(CONSTANT,486)
    rightShiftStage1Idx7Pad14_uid487_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= "00000000000000";

    -- rightShiftStage1Idx7Rng14_uid486_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,485)@37
    rightShiftStage1Idx7Rng14_uid486_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 14);

    -- rightShiftStage1Idx7_uid488_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,487)@37
    rightShiftStage1Idx7_uid488_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx7Pad14_uid487_prodPostRightShift_uid87_i_div_rgb_to_sgr_q & rightShiftStage1Idx7Rng14_uid486_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- rightShiftStage1Idx6Pad12_uid484_prodPostRightShift_uid87_i_div_rgb_to_sgr(CONSTANT,483)
    rightShiftStage1Idx6Pad12_uid484_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= "000000000000";

    -- rightShiftStage1Idx6Rng12_uid483_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,482)@37
    rightShiftStage1Idx6Rng12_uid483_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 12);

    -- rightShiftStage1Idx6_uid485_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,484)@37
    rightShiftStage1Idx6_uid485_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx6Pad12_uid484_prodPostRightShift_uid87_i_div_rgb_to_sgr_q & rightShiftStage1Idx6Rng12_uid483_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- rightBottomX_bottomExtension_uid326_pT3_uid172_invPolyEval(CONSTANT,325)
    rightBottomX_bottomExtension_uid326_pT3_uid172_invPolyEval_q <= "0000000000";

    -- rightShiftStage1Idx5Rng10_uid480_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,479)@37
    rightShiftStage1Idx5Rng10_uid480_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 10);

    -- rightShiftStage1Idx5_uid482_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,481)@37
    rightShiftStage1Idx5_uid482_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightBottomX_bottomExtension_uid326_pT3_uid172_invPolyEval_q & rightShiftStage1Idx5Rng10_uid480_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- i_shl_rgb_to_sgr_vt_const_31(CONSTANT,55)
    i_shl_rgb_to_sgr_vt_const_31_q <= "00000000";

    -- rightShiftStage1Idx4Rng8_uid477_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,476)@37
    rightShiftStage1Idx4Rng8_uid477_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 8);

    -- rightShiftStage1Idx4_uid479_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,478)@37
    rightShiftStage1Idx4_uid479_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= i_shl_rgb_to_sgr_vt_const_31_q & rightShiftStage1Idx4Rng8_uid477_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- leftShiftStage1Idx6Pad6_uid421_normY_uid69_i_div_rgb_to_sgr(CONSTANT,420)
    leftShiftStage1Idx6Pad6_uid421_normY_uid69_i_div_rgb_to_sgr_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid474_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,473)@37
    rightShiftStage1Idx3Rng6_uid474_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 6);

    -- rightShiftStage1Idx3_uid476_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,475)@37
    rightShiftStage1Idx3_uid476_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= leftShiftStage1Idx6Pad6_uid421_normY_uid69_i_div_rgb_to_sgr_q & rightShiftStage1Idx3Rng6_uid474_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- zs_uid123_zCount_uid68_i_div_rgb_to_sgr(CONSTANT,122)
    zs_uid123_zCount_uid68_i_div_rgb_to_sgr_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid471_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,470)@37
    rightShiftStage1Idx2Rng4_uid471_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 4);

    -- rightShiftStage1Idx2_uid473_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,472)@37
    rightShiftStage1Idx2_uid473_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= zs_uid123_zCount_uid68_i_div_rgb_to_sgr_q & rightShiftStage1Idx2Rng4_uid471_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- zs_uid129_zCount_uid68_i_div_rgb_to_sgr(CONSTANT,128)
    zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid468_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,467)@37
    rightShiftStage1Idx1Rng2_uid468_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(64 downto 2);

    -- rightShiftStage1Idx1_uid470_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,469)@37
    rightShiftStage1Idx1_uid470_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q & rightShiftStage1Idx1Rng2_uid468_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr(CONSTANT,462)
    rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= "00000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Pad64_uid461_prodPostRightShift_uid87_i_div_rgb_to_sgr(CONSTANT,460)
    rightShiftStage0Idx4Pad64_uid461_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,459)@36
    rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_in <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_in(64 downto 64);

    -- rightShiftStage0Idx4_uid462_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,461)@36
    rightShiftStage0Idx4_uid462_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx4Pad64_uid461_prodPostRightShift_uid87_i_div_rgb_to_sgr_q & rightShiftStage0Idx4Rng64_uid460_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- rightShiftStage0Idx3Pad48_uid458_prodPostRightShift_uid87_i_div_rgb_to_sgr(CONSTANT,457)
    rightShiftStage0Idx3Pad48_uid458_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,456)@36
    rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_in <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_in(64 downto 48);

    -- rightShiftStage0Idx3_uid459_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,458)@36
    rightShiftStage0Idx3_uid459_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx3Pad48_uid458_prodPostRightShift_uid87_i_div_rgb_to_sgr_q & rightShiftStage0Idx3Rng48_uid457_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- zs_uid105_zCount_uid68_i_div_rgb_to_sgr(CONSTANT,104)
    zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,453)@36
    rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_in <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_in(64 downto 32);

    -- rightShiftStage0Idx2_uid456_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,455)@36
    rightShiftStage0Idx2_uid456_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q & rightShiftStage0Idx2Rng32_uid454_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- i_shl_rgb_to_sgr_vt_const_15(CONSTANT,54)
    i_shl_rgb_to_sgr_vt_const_15_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITSELECT,450)@36
    rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_in <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
    rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_b <= rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_in(64 downto 16);

    -- rightShiftStage0Idx1_uid453_prodPostRightShift_uid87_i_div_rgb_to_sgr(BITJOIN,452)@36
    rightShiftStage0Idx1_uid453_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= i_shl_rgb_to_sgr_vt_const_15_q & rightShiftStage0Idx1Rng16_uid451_prodPostRightShift_uid87_i_div_rgb_to_sgr_b;

    -- c_i32_1gr(CONSTANT,17)
    c_i32_1gr_q <= "11111111111111111111111111111111";

    -- leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x(BITSELECT,378)@29
    leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_in <= i_conv52_rgb_to_sgr_vt_join_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_b <= leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_in(15 downto 0);

    -- leftShiftStage0Idx1_uid380_i_shl_rgb_to_s_rgb_to_s16_shift_x(BITJOIN,379)@29
    leftShiftStage0Idx1_uid380_i_shl_rgb_to_s_rgb_to_s16_shift_x_q <= leftShiftStage0Idx1Rng16_uid379_i_shl_rgb_to_s_rgb_to_s16_shift_x_b & i_shl_rgb_to_sgr_vt_const_15_q;

    -- i_conv52_rgb_to_sgr_vt_const_31(CONSTANT,39)
    i_conv52_rgb_to_sgr_vt_const_31_q <= "000000000000000000000000";

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_notEnable(LOGICAL,851)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_nor(LOGICAL,852)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_nor_q <= not (redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_notEnable_q or redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_q);

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_last(CONSTANT,848)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_last_q <= "010110";

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp(LOGICAL,849)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_b <= STD_LOGIC_VECTOR("0" & redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_q);
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_q <= "1" WHEN redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_last_q = redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_b ELSE "0";

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg(REG,850)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg_q <= STD_LOGIC_VECTOR(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmp_q);
        END IF;
    END PROCESS;

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena(REG,853)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_nor_q = "1") THEN
                redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_q <= STD_LOGIC_VECTOR(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_enaAnd(LOGICAL,854)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_enaAnd_q <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_sticky_ena_q and VCC_q;

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt(COUNTER,846)
    -- low=0, high=23, step=1, init=0
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i = TO_UNSIGNED(22, 5)) THEN
                redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq <= '1';
            ELSE
                redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq <= '0';
            END IF;
            IF (redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_eq = '1') THEN
                redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i + 9;
            ELSE
                redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_i, 5)));

    -- redist96_sync_in_aunroll_x_in_c1_eni1_2_1(DELAY,802)
    redist96_sync_in_aunroll_x_in_c1_eni1_2_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_2, xout => redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q, clk => clock, aclr => resetn );

    -- redist95_sync_in_aunroll_x_in_c1_eni1_1_1(DELAY,801)
    redist95_sync_in_aunroll_x_in_c1_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_1, xout => redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i_rgb_to_sgr(COMPARE,36)@1 + 1
    i_cmp_i_i_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_rgb_to_sgr_c(0) <= i_cmp_i_i_rgb_to_sgr_o(9);

    -- i_green_coerce135136159_red_coerce171172195_rgb_to_sgr(MUX,51)@2
    i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_s <= i_cmp_i_i_rgb_to_sgr_c;
    i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_combproc: PROCESS (i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_s) IS
            WHEN "0" => i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist97_sync_in_aunroll_x_in_c1_eni1_3_1(DELAY,803)
    redist97_sync_in_aunroll_x_in_c1_eni1_3_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni1_3, xout => redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q, clk => clock, aclr => resetn );

    -- i_cmp_i_i77_rgb_to_sgr(COMPARE,35)@1 + 1
    i_cmp_i_i77_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i77_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i77_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i77_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i77_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i77_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i77_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i77_rgb_to_sgr_c(0) <= i_cmp_i_i77_rgb_to_sgr_o(9);

    -- i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr(MUX,29)@2
    i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_s <= i_cmp_i_i77_rgb_to_sgr_c;
    i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_combproc: PROCESS (i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_s) IS
            WHEN "0" => i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q <= redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i70_rgb_to_sgr(COMPARE,34)@1 + 1
    i_cmp_i_i70_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i70_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i70_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i70_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i70_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i70_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i70_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i70_rgb_to_sgr_c(0) <= i_cmp_i_i70_rgb_to_sgr_o(9);

    -- i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr(MUX,28)@2
    i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_s <= i_cmp_i_i70_rgb_to_sgr_c;
    i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_combproc: PROCESS (i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_s, redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q, redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q)
    BEGIN
        CASE (i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_s) IS
            WHEN "0" => i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN "1" => i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q <= redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q;
            WHEN OTHERS => i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i57_rgb_to_sgr(COMPARE,33)@1 + 1
    i_cmp_i_i57_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i57_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i57_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i57_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i57_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i57_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i57_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    i_cmp_i_i57_rgb_to_sgr_c(0) <= i_cmp_i_i57_rgb_to_sgr_o(9);

    -- i_or_cond199_rgb_to_sgr(LOGICAL,52)@2
    i_or_cond199_rgb_to_sgr_q <= i_cmp_i_i57_rgb_to_sgr_c and i_cmp_i_i70_rgb_to_sgr_c;

    -- i_acl_3_rgb_to_sgr(MUX,21)@2
    i_acl_3_rgb_to_sgr_s <= i_or_cond199_rgb_to_sgr_q;
    i_acl_3_rgb_to_sgr_combproc: PROCESS (i_acl_3_rgb_to_sgr_s, i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q, i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q)
    BEGIN
        CASE (i_acl_3_rgb_to_sgr_s) IS
            WHEN "0" => i_acl_3_rgb_to_sgr_q <= i_blue_coerce99100123_green_coerce135136159_rgb_to_sgr_q;
            WHEN "1" => i_acl_3_rgb_to_sgr_q <= i_blue_coerce99100123_red_coerce171172195_rgb_to_sgr_q;
            WHEN OTHERS => i_acl_3_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i27_rgb_to_sgr(COMPARE,31)@1
    i_cmp_i_i27_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_2);
    i_cmp_i_i27_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i27_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i27_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i27_rgb_to_sgr_b));
    i_cmp_i_i27_rgb_to_sgr_c(0) <= i_cmp_i_i27_rgb_to_sgr_o(9);

    -- i_cmp_i_i32_rgb_to_sgr(COMPARE,32)@1
    i_cmp_i_i32_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & in_c1_eni1_1);
    i_cmp_i_i32_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & in_c1_eni1_3);
    i_cmp_i_i32_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i32_rgb_to_sgr_a) - UNSIGNED(i_cmp_i_i32_rgb_to_sgr_b));
    i_cmp_i_i32_rgb_to_sgr_c(0) <= i_cmp_i_i32_rgb_to_sgr_o(9);

    -- i_or_cond200_not_demorgan_rgb_to_sgr(LOGICAL,53)@1 + 1
    i_or_cond200_not_demorgan_rgb_to_sgr_qi <= i_cmp_i_i32_rgb_to_sgr_c and i_cmp_i_i27_rgb_to_sgr_c;
    i_or_cond200_not_demorgan_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond200_not_demorgan_rgb_to_sgr_qi, xout => i_or_cond200_not_demorgan_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- i_acl_5_rgb_to_sgr(MUX,23)@2 + 1
    i_acl_5_rgb_to_sgr_s <= i_or_cond200_not_demorgan_rgb_to_sgr_q;
    i_acl_5_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_5_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_5_rgb_to_sgr_s) IS
                WHEN "0" => i_acl_5_rgb_to_sgr_q <= i_acl_3_rgb_to_sgr_q;
                WHEN "1" => i_acl_5_rgb_to_sgr_q <= i_green_coerce135136159_red_coerce171172195_rgb_to_sgr_q;
                WHEN OTHERS => i_acl_5_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_acl_2_rgb_to_sgr(MUX,20)@2
    i_acl_2_rgb_to_sgr_s <= i_or_cond199_rgb_to_sgr_q;
    i_acl_2_rgb_to_sgr_combproc: PROCESS (i_acl_2_rgb_to_sgr_s, redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q, redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q)
    BEGIN
        CASE (i_acl_2_rgb_to_sgr_s) IS
            WHEN "0" => i_acl_2_rgb_to_sgr_q <= redist95_sync_in_aunroll_x_in_c1_eni1_1_1_q;
            WHEN "1" => i_acl_2_rgb_to_sgr_q <= redist96_sync_in_aunroll_x_in_c1_eni1_2_1_q;
            WHEN OTHERS => i_acl_2_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_4_rgb_to_sgr(MUX,22)@2 + 1
    i_acl_4_rgb_to_sgr_s <= i_or_cond200_not_demorgan_rgb_to_sgr_q;
    i_acl_4_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_4_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_4_rgb_to_sgr_s) IS
                WHEN "0" => i_acl_4_rgb_to_sgr_q <= i_acl_2_rgb_to_sgr_q;
                WHEN "1" => i_acl_4_rgb_to_sgr_q <= redist97_sync_in_aunroll_x_in_c1_eni1_3_1_q;
                WHEN OTHERS => i_acl_4_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_sub_rgb_to_sgr(SUB,62)@3
    i_sub_rgb_to_sgr_a <= STD_LOGIC_VECTOR("0" & i_acl_4_rgb_to_sgr_q);
    i_sub_rgb_to_sgr_b <= STD_LOGIC_VECTOR("0" & i_acl_5_rgb_to_sgr_q);
    i_sub_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_rgb_to_sgr_a) - UNSIGNED(i_sub_rgb_to_sgr_b));
    i_sub_rgb_to_sgr_q <= i_sub_rgb_to_sgr_o(8 downto 0);

    -- bgTrunc_i_sub_rgb_to_sgr_sel_x(BITSELECT,3)@3
    bgTrunc_i_sub_rgb_to_sgr_sel_x_b <= STD_LOGIC_VECTOR(i_sub_rgb_to_sgr_q(7 downto 0));

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_inputreg(DELAY,844)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_rgb_to_sgr_sel_x_b, xout => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_inputreg_q, clk => clock, aclr => resetn );

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr(REG,847)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr_q <= "10111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr_q <= STD_LOGIC_VECTOR(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem(DUALMEM,845)
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ia <= STD_LOGIC_VECTOR(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_inputreg_q);
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_aa <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_wraddr_q;
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ab <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_rdcnt_q;
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_reset0 <= not (resetn);
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 24,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 24,
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
        clocken1 => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_reset0,
        clock1 => clock,
        address_a => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_aa,
        data_a => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_ab,
        q_b => redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_iq
    );
    redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_q <= redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_iq(7 downto 0);

    -- i_conv52_rgb_to_sgr_sel_x(BITSELECT,4)@29
    i_conv52_rgb_to_sgr_sel_x_b <= std_logic_vector(resize(unsigned(redist99_bgTrunc_i_sub_rgb_to_sgr_sel_x_b_26_mem_q(7 downto 0)), 32));

    -- i_conv52_rgb_to_sgr_vt_select_7(BITSELECT,41)@29
    i_conv52_rgb_to_sgr_vt_select_7_b <= i_conv52_rgb_to_sgr_sel_x_b(7 downto 0);

    -- i_conv52_rgb_to_sgr_vt_join(BITJOIN,40)@29
    i_conv52_rgb_to_sgr_vt_join_q <= i_conv52_rgb_to_sgr_vt_const_31_q & i_conv52_rgb_to_sgr_vt_select_7_b;

    -- leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x(MUX,381)@29
    leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_s <= VCC_q;
    leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_combproc: PROCESS (leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_s, i_conv52_rgb_to_sgr_vt_join_q, leftShiftStage0Idx1_uid380_i_shl_rgb_to_s_rgb_to_s16_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_q <= i_conv52_rgb_to_sgr_vt_join_q;
            WHEN "1" => leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_q <= leftShiftStage0Idx1_uid380_i_shl_rgb_to_s_rgb_to_s16_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl_rgb_to_sgr_vt_select_23(BITSELECT,57)@29
    i_shl_rgb_to_sgr_vt_select_23_b <= leftShiftStage0_uid382_i_shl_rgb_to_s_rgb_to_s16_shift_x_q(23 downto 16);

    -- i_shl_rgb_to_sgr_vt_join(BITJOIN,56)@29
    i_shl_rgb_to_sgr_vt_join_q <= i_shl_rgb_to_sgr_vt_const_31_q & i_shl_rgb_to_sgr_vt_select_23_b & i_shl_rgb_to_sgr_vt_const_15_q;

    -- i_sub58_rgb_to_sgr(ADD,58)@29
    i_sub58_rgb_to_sgr_a <= STD_LOGIC_VECTOR("0" & i_shl_rgb_to_sgr_vt_join_q);
    i_sub58_rgb_to_sgr_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_sub58_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub58_rgb_to_sgr_a) + UNSIGNED(i_sub58_rgb_to_sgr_b));
    i_sub58_rgb_to_sgr_q <= i_sub58_rgb_to_sgr_o(32 downto 0);

    -- bgTrunc_i_sub58_rgb_to_sgr_sel_x(BITSELECT,2)@29
    bgTrunc_i_sub58_rgb_to_sgr_sel_x_b <= i_sub58_rgb_to_sgr_q(31 downto 0);

    -- i_sub58_rgb_to_sgr_vt_select_31(BITSELECT,61)@29
    i_sub58_rgb_to_sgr_vt_select_31_b <= bgTrunc_i_sub58_rgb_to_sgr_sel_x_b(31 downto 16);

    -- redist89_i_sub58_rgb_to_sgr_vt_select_31_b_1(DELAY,795)
    redist89_i_sub58_rgb_to_sgr_vt_select_31_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_sub58_rgb_to_sgr_vt_select_31_b, xout => redist89_i_sub58_rgb_to_sgr_vt_select_31_b_1_q, clk => clock, aclr => resetn );

    -- i_sub58_rgb_to_sgr_vt_const_15(CONSTANT,59)
    i_sub58_rgb_to_sgr_vt_const_15_q <= "1111111111111111";

    -- i_sub58_rgb_to_sgr_vt_join(BITJOIN,60)@30
    i_sub58_rgb_to_sgr_vt_join_q <= redist89_i_sub58_rgb_to_sgr_vt_select_31_b_1_q & i_sub58_rgb_to_sgr_vt_const_15_q;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select(BITSELECT,688)@30
    prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_b <= i_sub58_rgb_to_sgr_vt_join_q(17 downto 0);
    prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_c <= i_sub58_rgb_to_sgr_vt_join_q(31 downto 18);

    -- oneInvRes_uid82_i_div_rgb_to_sgr(CONSTANT,81)
    oneInvRes_uid82_i_div_rgb_to_sgr_q <= "100000000000000000000000000000000";

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1(BITSELECT,625)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1_q(33 downto 33));

    -- leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr(BITSELECT,424)@9
    leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(24 downto 0);
    leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_in(24 downto 0);

    -- leftShiftStage1Idx7Pad7_uid424_normY_uid69_i_div_rgb_to_sgr(CONSTANT,423)
    leftShiftStage1Idx7Pad7_uid424_normY_uid69_i_div_rgb_to_sgr_q <= "0000000";

    -- leftShiftStage1Idx7_uid426_normY_uid69_i_div_rgb_to_sgr(BITJOIN,425)@9
    leftShiftStage1Idx7_uid426_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx7Rng7_uid425_normY_uid69_i_div_rgb_to_sgr_b & leftShiftStage1Idx7Pad7_uid424_normY_uid69_i_div_rgb_to_sgr_q;

    -- leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr(BITSELECT,421)@9
    leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(25 downto 0);
    leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_in(25 downto 0);

    -- leftShiftStage1Idx6_uid423_normY_uid69_i_div_rgb_to_sgr(BITJOIN,422)@9
    leftShiftStage1Idx6_uid423_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx6Rng6_uid422_normY_uid69_i_div_rgb_to_sgr_b & leftShiftStage1Idx6Pad6_uid421_normY_uid69_i_div_rgb_to_sgr_q;

    -- leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr(BITSELECT,418)@9
    leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(26 downto 0);
    leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_in(26 downto 0);

    -- leftShiftStage1Idx5Pad5_uid418_normY_uid69_i_div_rgb_to_sgr(CONSTANT,417)
    leftShiftStage1Idx5Pad5_uid418_normY_uid69_i_div_rgb_to_sgr_q <= "00000";

    -- leftShiftStage1Idx5_uid420_normY_uid69_i_div_rgb_to_sgr(BITJOIN,419)@9
    leftShiftStage1Idx5_uid420_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx5Rng5_uid419_normY_uid69_i_div_rgb_to_sgr_b & leftShiftStage1Idx5Pad5_uid418_normY_uid69_i_div_rgb_to_sgr_q;

    -- leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr(BITSELECT,415)@9
    leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(27 downto 0);
    leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_in(27 downto 0);

    -- leftShiftStage1Idx4_uid417_normY_uid69_i_div_rgb_to_sgr(BITJOIN,416)@9
    leftShiftStage1Idx4_uid417_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx4Rng4_uid416_normY_uid69_i_div_rgb_to_sgr_b & zs_uid123_zCount_uid68_i_div_rgb_to_sgr_q;

    -- leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr(BITSELECT,412)@9
    leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(28 downto 0);
    leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_in(28 downto 0);

    -- leftShiftStage1Idx3_uid414_normY_uid69_i_div_rgb_to_sgr(BITJOIN,413)@9
    leftShiftStage1Idx3_uid414_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx3Rng3_uid413_normY_uid69_i_div_rgb_to_sgr_b & topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr(BITSELECT,409)@9
    leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(29 downto 0);
    leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_in(29 downto 0);

    -- leftShiftStage1Idx2_uid411_normY_uid69_i_div_rgb_to_sgr(BITJOIN,410)@9
    leftShiftStage1Idx2_uid411_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx2Rng2_uid410_normY_uid69_i_div_rgb_to_sgr_b & zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q;

    -- leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr(BITSELECT,406)@9
    leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_in <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_in(30 downto 0);

    -- leftShiftStage1Idx1_uid408_normY_uid69_i_div_rgb_to_sgr(BITJOIN,407)@9
    leftShiftStage1Idx1_uid408_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx1Rng1_uid407_normY_uid69_i_div_rgb_to_sgr_b & GND_q;

    -- leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr(BITSELECT,397)@8
    leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_in <= redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q(7 downto 0);
    leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_in(7 downto 0);

    -- leftShiftStage0Idx3_uid399_normY_uid69_i_div_rgb_to_sgr(BITJOIN,398)@8
    leftShiftStage0Idx3_uid399_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx3Rng24_uid398_normY_uid69_i_div_rgb_to_sgr_b & i_conv52_rgb_to_sgr_vt_const_31_q;

    -- leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr(BITSELECT,394)@8
    leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_in <= redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q(15 downto 0);
    leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_in(15 downto 0);

    -- leftShiftStage0Idx2_uid396_normY_uid69_i_div_rgb_to_sgr(BITJOIN,395)@8
    leftShiftStage0Idx2_uid396_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx2Rng16_uid395_normY_uid69_i_div_rgb_to_sgr_b & i_shl_rgb_to_sgr_vt_const_15_q;

    -- leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr(BITSELECT,391)@8
    leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_in <= redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q(23 downto 0);
    leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_b <= leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_in(23 downto 0);

    -- leftShiftStage0Idx1_uid393_normY_uid69_i_div_rgb_to_sgr(BITJOIN,392)@8
    leftShiftStage0Idx1_uid393_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx1Rng8_uid392_normY_uid69_i_div_rgb_to_sgr_b & i_shl_rgb_to_sgr_vt_const_31_q;

    -- i_conv59_rgb_to_sgr_sel_x(BITSELECT,5)@3
    i_conv59_rgb_to_sgr_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_4_rgb_to_sgr_q(7 downto 0)), 32));

    -- i_conv59_rgb_to_sgr_vt_select_7(BITSELECT,45)@3
    i_conv59_rgb_to_sgr_vt_select_7_b <= i_conv59_rgb_to_sgr_sel_x_b(7 downto 0);

    -- i_conv59_rgb_to_sgr_vt_join(BITJOIN,44)@3
    i_conv59_rgb_to_sgr_vt_join_q <= i_conv52_rgb_to_sgr_vt_const_31_q & i_conv59_rgb_to_sgr_vt_select_7_b;

    -- redist90_i_conv59_rgb_to_sgr_vt_join_q_1(DELAY,796)
    redist90_i_conv59_rgb_to_sgr_vt_join_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv59_rgb_to_sgr_vt_join_q, xout => redist90_i_conv59_rgb_to_sgr_vt_join_q_1_q, clk => clock, aclr => resetn );

    -- redist91_i_conv59_rgb_to_sgr_vt_join_q_5(DELAY,797)
    redist91_i_conv59_rgb_to_sgr_vt_join_q_5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist90_i_conv59_rgb_to_sgr_vt_join_q_1_q, xout => redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q, clk => clock, aclr => resetn );

    -- vCount_uid107_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,106)@3 + 1
    vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_qi <= "1" WHEN i_conv59_rgb_to_sgr_vt_join_q = zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q ELSE "0";
    vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_qi, xout => vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- redist79_vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q_4(DELAY,785)
    redist79_vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q, xout => redist79_vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q_4_q, clk => clock, aclr => resetn );

    -- vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr(MUX,109)@4
    vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_s <= vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q;
    vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_combproc: PROCESS (vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_s, redist90_i_conv59_rgb_to_sgr_vt_join_q_1_q, cstValOvf_uid95_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_s) IS
            WHEN "0" => vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q <= redist90_i_conv59_rgb_to_sgr_vt_join_q_1_q;
            WHEN "1" => vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q <= cstValOvf_uid95_i_div_rgb_to_sgr_q;
            WHEN OTHERS => vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,693)@4
    rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b <= vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q(31 downto 16);
    rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c <= vStagei_uid110_zCount_uid68_i_div_rgb_to_sgr_q(15 downto 0);

    -- vCount_uid113_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,112)@4 + 1
    vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_qi <= "1" WHEN rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b = i_shl_rgb_to_sgr_vt_const_15_q ELSE "0";
    vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_qi, xout => vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- redist78_vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q_3(DELAY,784)
    redist78_vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q, xout => redist78_vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q_3_q, clk => clock, aclr => resetn );

    -- redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1(DELAY,717)
    redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c, xout => redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1(DELAY,716)
    redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b, xout => redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr(MUX,115)@5
    vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_s <= vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q;
    vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_combproc: PROCESS (vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_s, redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q, redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_s) IS
            WHEN "0" => vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q <= redist10_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q <= redist11_rVStage_uid112_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,694)@5
    rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b <= vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q(15 downto 8);
    rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c <= vStagei_uid116_zCount_uid68_i_div_rgb_to_sgr_q(7 downto 0);

    -- vCount_uid119_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,118)@5 + 1
    vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_qi <= "1" WHEN rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b = i_shl_rgb_to_sgr_vt_const_31_q ELSE "0";
    vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_qi, xout => vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- redist77_vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q_2(DELAY,783)
    redist77_vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q, xout => redist77_vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q_2_q, clk => clock, aclr => resetn );

    -- redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1(DELAY,715)
    redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c, xout => redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1(DELAY,714)
    redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b, xout => redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr(MUX,121)@6
    vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_s <= vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q;
    vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_combproc: PROCESS (vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_s, redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q, redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_s) IS
            WHEN "0" => vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q <= redist8_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q <= redist9_rVStage_uid118_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,695)@6
    rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b <= vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q(7 downto 4);
    rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c <= vStagei_uid122_zCount_uid68_i_div_rgb_to_sgr_q(3 downto 0);

    -- vCount_uid125_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,124)@6
    vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q <= "1" WHEN rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b = zs_uid123_zCount_uid68_i_div_rgb_to_sgr_q ELSE "0";

    -- redist76_vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q_1(DELAY,782)
    redist76_vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q, xout => redist76_vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q_1_q, clk => clock, aclr => resetn );

    -- vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr(MUX,127)@6 + 1
    vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_s <= vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q;
    vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_s) IS
                WHEN "0" => vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q <= rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b;
                WHEN "1" => vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q <= rVStage_uid124_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,696)@7
    rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b <= vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q(3 downto 2);
    rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c <= vStagei_uid128_zCount_uid68_i_div_rgb_to_sgr_q(1 downto 0);

    -- vCount_uid131_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,130)@7
    vCount_uid131_zCount_uid68_i_div_rgb_to_sgr_q <= "1" WHEN rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b = zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q ELSE "0";

    -- vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr(MUX,133)@7
    vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_s <= vCount_uid131_zCount_uid68_i_div_rgb_to_sgr_q;
    vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_combproc: PROCESS (vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_s, rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b, rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_s) IS
            WHEN "0" => vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_q <= rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_b;
            WHEN "1" => vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_q <= rVStage_uid130_zCount_uid68_i_div_rgb_to_sgr_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid136_zCount_uid68_i_div_rgb_to_sgr(BITSELECT,135)@7
    rVStage_uid136_zCount_uid68_i_div_rgb_to_sgr_b <= vStagei_uid134_zCount_uid68_i_div_rgb_to_sgr_q(1 downto 1);

    -- vCount_uid137_zCount_uid68_i_div_rgb_to_sgr(LOGICAL,136)@7
    vCount_uid137_zCount_uid68_i_div_rgb_to_sgr_q <= "1" WHEN rVStage_uid136_zCount_uid68_i_div_rgb_to_sgr_b = GND_q ELSE "0";

    -- r_uid138_zCount_uid68_i_div_rgb_to_sgr(BITJOIN,137)@7
    r_uid138_zCount_uid68_i_div_rgb_to_sgr_q <= redist79_vCount_uid107_zCount_uid68_i_div_rgb_to_sgr_q_4_q & redist78_vCount_uid113_zCount_uid68_i_div_rgb_to_sgr_q_3_q & redist77_vCount_uid119_zCount_uid68_i_div_rgb_to_sgr_q_2_q & redist76_vCount_uid125_zCount_uid68_i_div_rgb_to_sgr_q_1_q & vCount_uid131_zCount_uid68_i_div_rgb_to_sgr_q & vCount_uid137_zCount_uid68_i_div_rgb_to_sgr_q;

    -- redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1(DELAY,780)
    redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid138_zCount_uid68_i_div_rgb_to_sgr_q, xout => redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1_q, clk => clock, aclr => resetn );

    -- leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,697)@8
    leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_b <= redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1_q(5 downto 3);
    leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c <= redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1_q(2 downto 0);

    -- leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr(MUX,404)@8 + 1
    leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_s <= leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_b;
    leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_s) IS
                WHEN "000" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q;
                WHEN "001" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx1_uid393_normY_uid69_i_div_rgb_to_sgr_q;
                WHEN "010" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx2_uid396_normY_uid69_i_div_rgb_to_sgr_q;
                WHEN "011" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0Idx3_uid399_normY_uid69_i_div_rgb_to_sgr_q;
                WHEN "100" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q;
                WHEN "101" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q;
                WHEN "110" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q;
                WHEN "111" => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= zs_uid105_zCount_uid68_i_div_rgb_to_sgr_q;
                WHEN OTHERS => leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist7_leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c_1(DELAY,713)
    redist7_leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c, xout => redist7_leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr(MUX,427)@9
    leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_s <= redist7_leftShiftStageSel5Dto3_uid404_normY_uid69_i_div_rgb_to_sgr_merged_bit_select_c_1_q;
    leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_combproc: PROCESS (leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_s, leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx1_uid408_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx2_uid411_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx3_uid414_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx4_uid417_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx5_uid420_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx6_uid423_normY_uid69_i_div_rgb_to_sgr_q, leftShiftStage1Idx7_uid426_normY_uid69_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_s) IS
            WHEN "000" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage0_uid405_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "001" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx1_uid408_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "010" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx2_uid411_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "011" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx3_uid414_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "100" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx4_uid417_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "101" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx5_uid420_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "110" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx6_uid423_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN "111" => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= leftShiftStage1Idx7_uid426_normY_uid69_i_div_rgb_to_sgr_q;
            WHEN OTHERS => leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid70_i_div_rgb_to_sgr(BITSELECT,69)@9
    normYNoLeadOne_uid70_i_div_rgb_to_sgr_in <= leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q(30 downto 0);
    normYNoLeadOne_uid70_i_div_rgb_to_sgr_b <= normYNoLeadOne_uid70_i_div_rgb_to_sgr_in(30 downto 0);

    -- yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,689)@9
    yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b <= normYNoLeadOne_uid70_i_div_rgb_to_sgr_b(30 downto 23);
    yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c <= normYNoLeadOne_uid70_i_div_rgb_to_sgr_b(22 downto 0);

    -- memoryC3_uid150_invTabGen_lutmem(DUALMEM,519)@9 + 2
    -- in j@20000000
    memoryC3_uid150_invTabGen_lutmem_aa <= yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b;
    memoryC3_uid150_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC3_uid150_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enteA4ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid150_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC3_uid150_invTabGen_lutmem_aa,
        q_a => memoryC3_uid150_invTabGen_lutmem_ir
    );
    memoryC3_uid150_invTabGen_lutmem_r <= memoryC3_uid150_invTabGen_lutmem_ir(13 downto 0);

    -- redist43_memoryC3_uid150_invTabGen_lutmem_r_1(DELAY,749)
    redist43_memoryC3_uid150_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC3_uid150_invTabGen_lutmem_r, xout => redist43_memoryC3_uid150_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval(CONSTANT,194)
    topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q <= "000";

    -- topRangeY_mergedSignalTM_uid197_pT1_uid158_invPolyEval(BITJOIN,196)@12
    topRangeY_mergedSignalTM_uid197_pT1_uid158_invPolyEval_q <= redist43_memoryC3_uid150_invTabGen_lutmem_r_1_q & topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q;

    -- redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3(DELAY,723)
    redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c, xout => redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3_q, clk => clock, aclr => resetn );

    -- yT1_uid157_invPolyEval(BITSELECT,156)@12
    yT1_uid157_invPolyEval_b <= redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3_q(22 downto 9);

    -- nx_mergedSignalTM_uid181_pT1_uid158_invPolyEval(BITJOIN,180)@12
    nx_mergedSignalTM_uid181_pT1_uid158_invPolyEval_q <= GND_q & yT1_uid157_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid193_pT1_uid158_invPolyEval(BITJOIN,192)@12
    topRangeX_mergedSignalTM_uid193_pT1_uid158_invPolyEval_q <= nx_mergedSignalTM_uid181_pT1_uid158_invPolyEval_q & zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q;

    -- sm0_uid199_pT1_uid158_invPolyEval(MULT,198)@12 + 2
    sm0_uid199_pT1_uid158_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid193_pT1_uid158_invPolyEval_q);
    sm0_uid199_pT1_uid158_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid197_pT1_uid158_invPolyEval_q);
    sm0_uid199_pT1_uid158_invPolyEval_reset <= not (resetn);
    sm0_uid199_pT1_uid158_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid199_pT1_uid158_invPolyEval_a0,
        datab => sm0_uid199_pT1_uid158_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid199_pT1_uid158_invPolyEval_reset,
        clock => clock,
        result => sm0_uid199_pT1_uid158_invPolyEval_s1
    );
    sm0_uid199_pT1_uid158_invPolyEval_q <= sm0_uid199_pT1_uid158_invPolyEval_s1;

    -- osig_uid200_pT1_uid158_invPolyEval(BITSELECT,199)@14
    osig_uid200_pT1_uid158_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid199_pT1_uid158_invPolyEval_q(32 downto 0));
    osig_uid200_pT1_uid158_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid200_pT1_uid158_invPolyEval_in(32 downto 18));

    -- redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3(DELAY,720)
    redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b, xout => redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3_q, clk => clock, aclr => resetn );

    -- memoryC2_uid147_invTabGen_lutmem(DUALMEM,518)@12 + 2
    -- in j@20000000
    memoryC2_uid147_invTabGen_lutmem_aa <= redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3_q;
    memoryC2_uid147_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC2_uid147_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enteA3ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid147_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC2_uid147_invTabGen_lutmem_aa,
        q_a => memoryC2_uid147_invTabGen_lutmem_ir
    );
    memoryC2_uid147_invTabGen_lutmem_r <= memoryC2_uid147_invTabGen_lutmem_ir(20 downto 0);

    -- rndBit_uid159_invPolyEval(CONSTANT,158)
    rndBit_uid159_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid160_invPolyEval(BITJOIN,159)@14
    cIncludingRoundingBit_uid160_invPolyEval_q <= memoryC2_uid147_invTabGen_lutmem_r & rndBit_uid159_invPolyEval_q;

    -- ts1_uid162_invPolyEval(ADD,161)@14
    ts1_uid162_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid160_invPolyEval_q(22)) & cIncludingRoundingBit_uid160_invPolyEval_q));
    ts1_uid162_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid200_pT1_uid158_invPolyEval_b(14)) & osig_uid200_pT1_uid158_invPolyEval_b));
    ts1_uid162_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid162_invPolyEval_a) + SIGNED(ts1_uid162_invPolyEval_b));
    ts1_uid162_invPolyEval_q <= ts1_uid162_invPolyEval_o(23 downto 0);

    -- s1_uid163_invPolyEval(BITSELECT,162)@14
    s1_uid163_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid162_invPolyEval_q(23 downto 1));

    -- redist73_s1_uid163_invPolyEval_b_1(DELAY,779)
    redist73_s1_uid163_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s1_uid163_invPolyEval_b, xout => redist73_s1_uid163_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid236_pT2_uid165_invPolyEval(BITSELECT,235)@15
    aboveLeftY_uid236_pT2_uid165_invPolyEval_in <= redist73_s1_uid163_invPolyEval_b_1_q(14 downto 0);
    aboveLeftY_uid236_pT2_uid165_invPolyEval_b <= aboveLeftY_uid236_pT2_uid165_invPolyEval_in(14 downto 10);

    -- n1_uid244_pT2_uid165_invPolyEval(BITSELECT,243)@15
    n1_uid244_pT2_uid165_invPolyEval_b <= aboveLeftY_uid236_pT2_uid165_invPolyEval_b(4 downto 1);

    -- n1_uid252_pT2_uid165_invPolyEval(BITSELECT,251)@15
    n1_uid252_pT2_uid165_invPolyEval_b <= n1_uid244_pT2_uid165_invPolyEval_b(3 downto 1);

    -- redist71_n1_uid252_pT2_uid165_invPolyEval_b_2(DELAY,777)
    redist71_n1_uid252_pT2_uid165_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n1_uid252_pT2_uid165_invPolyEval_b, xout => redist71_n1_uid252_pT2_uid165_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6(DELAY,724)
    redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_3_q, xout => redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6_q, clk => clock, aclr => resetn );

    -- yT2_uid164_invPolyEval(BITSELECT,163)@15
    yT2_uid164_invPolyEval_b <= redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6_q(22 downto 2);

    -- nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval(BITJOIN,203)@15
    nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q <= GND_q & yT2_uid164_invPolyEval_b;

    -- aboveLeftX_uid235_pT2_uid165_invPolyEval(BITSELECT,234)@15
    aboveLeftX_uid235_pT2_uid165_invPolyEval_in <= nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q(4 downto 0);
    aboveLeftX_uid235_pT2_uid165_invPolyEval_b <= aboveLeftX_uid235_pT2_uid165_invPolyEval_in(4 downto 0);

    -- n0_uid245_pT2_uid165_invPolyEval(BITSELECT,244)@15
    n0_uid245_pT2_uid165_invPolyEval_b <= aboveLeftX_uid235_pT2_uid165_invPolyEval_b(4 downto 1);

    -- n0_uid253_pT2_uid165_invPolyEval(BITSELECT,252)@15
    n0_uid253_pT2_uid165_invPolyEval_b <= n0_uid245_pT2_uid165_invPolyEval_b(3 downto 1);

    -- redist70_n0_uid253_pT2_uid165_invPolyEval_b_2(DELAY,776)
    redist70_n0_uid253_pT2_uid165_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => n0_uid253_pT2_uid165_invPolyEval_b, xout => redist70_n0_uid253_pT2_uid165_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- sm1_uid268_pT2_uid165_invPolyEval(MULT,267)@17 + 2
    sm1_uid268_pT2_uid165_invPolyEval_a0 <= redist70_n0_uid253_pT2_uid165_invPolyEval_b_2_q;
    sm1_uid268_pT2_uid165_invPolyEval_b0 <= redist71_n1_uid252_pT2_uid165_invPolyEval_b_2_q;
    sm1_uid268_pT2_uid165_invPolyEval_reset <= not (resetn);
    sm1_uid268_pT2_uid165_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid268_pT2_uid165_invPolyEval_a0,
        datab => sm1_uid268_pT2_uid165_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid268_pT2_uid165_invPolyEval_reset,
        clock => clock,
        result => sm1_uid268_pT2_uid165_invPolyEval_s1
    );
    sm1_uid268_pT2_uid165_invPolyEval_q <= sm1_uid268_pT2_uid165_invPolyEval_s1;

    -- redist67_sm1_uid268_pT2_uid165_invPolyEval_q_1(DELAY,773)
    redist67_sm1_uid268_pT2_uid165_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid268_pT2_uid165_invPolyEval_q, xout => redist67_sm1_uid268_pT2_uid165_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- rightBottomY_uid234_pT2_uid165_invPolyEval(BITSELECT,233)@15
    rightBottomY_uid234_pT2_uid165_invPolyEval_in <= redist73_s1_uid163_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid234_pT2_uid165_invPolyEval_b <= rightBottomY_uid234_pT2_uid165_invPolyEval_in(5 downto 1);

    -- n1_uid242_pT2_uid165_invPolyEval(BITSELECT,241)@15
    n1_uid242_pT2_uid165_invPolyEval_b <= rightBottomY_uid234_pT2_uid165_invPolyEval_b(4 downto 1);

    -- n1_uid250_pT2_uid165_invPolyEval(BITSELECT,249)@15
    n1_uid250_pT2_uid165_invPolyEval_b <= n1_uid242_pT2_uid165_invPolyEval_b(3 downto 1);

    -- rightBottomX_uid233_pT2_uid165_invPolyEval(BITSELECT,232)@15
    rightBottomX_uid233_pT2_uid165_invPolyEval_in <= nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q(13 downto 0);
    rightBottomX_uid233_pT2_uid165_invPolyEval_b <= rightBottomX_uid233_pT2_uid165_invPolyEval_in(13 downto 9);

    -- n0_uid243_pT2_uid165_invPolyEval(BITSELECT,242)@15
    n0_uid243_pT2_uid165_invPolyEval_b <= rightBottomX_uid233_pT2_uid165_invPolyEval_b(4 downto 1);

    -- n0_uid251_pT2_uid165_invPolyEval(BITSELECT,250)@15
    n0_uid251_pT2_uid165_invPolyEval_b <= n0_uid243_pT2_uid165_invPolyEval_b(3 downto 1);

    -- sm0_uid267_pT2_uid165_invPolyEval(MULT,266)@15 + 2
    sm0_uid267_pT2_uid165_invPolyEval_a0 <= n0_uid251_pT2_uid165_invPolyEval_b;
    sm0_uid267_pT2_uid165_invPolyEval_b0 <= n1_uid250_pT2_uid165_invPolyEval_b;
    sm0_uid267_pT2_uid165_invPolyEval_reset <= not (resetn);
    sm0_uid267_pT2_uid165_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid267_pT2_uid165_invPolyEval_a0,
        datab => sm0_uid267_pT2_uid165_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid267_pT2_uid165_invPolyEval_reset,
        clock => clock,
        result => sm0_uid267_pT2_uid165_invPolyEval_s1
    );
    sm0_uid267_pT2_uid165_invPolyEval_q <= sm0_uid267_pT2_uid165_invPolyEval_s1;

    -- rightBottomY_uid229_pT2_uid165_invPolyEval(BITSELECT,228)@15
    rightBottomY_uid229_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(redist73_s1_uid163_invPolyEval_b_1_q(22 downto 15));

    -- rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval(BITSELECT,225)@15
    rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q(4 downto 0));
    rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_in(4 downto 0));

    -- rightBottomX_mergedSignalTM_uid227_pT2_uid165_invPolyEval(BITJOIN,226)@15
    rightBottomX_mergedSignalTM_uid227_pT2_uid165_invPolyEval_q <= rightBottomX_bottomRange_uid226_pT2_uid165_invPolyEval_b & topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q;

    -- sm1_uid266_pT2_uid165_invPolyEval(MULT,265)@15 + 2
    sm1_uid266_pT2_uid165_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid227_pT2_uid165_invPolyEval_q;
    sm1_uid266_pT2_uid165_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid229_pT2_uid165_invPolyEval_b);
    sm1_uid266_pT2_uid165_invPolyEval_reset <= not (resetn);
    sm1_uid266_pT2_uid165_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid266_pT2_uid165_invPolyEval_a0,
        datab => sm1_uid266_pT2_uid165_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid266_pT2_uid165_invPolyEval_reset,
        clock => clock,
        result => sm1_uid266_pT2_uid165_invPolyEval_s1
    );
    sm1_uid266_pT2_uid165_invPolyEval_q <= sm1_uid266_pT2_uid165_invPolyEval_s1(15 downto 0);

    -- highABits_uid274_pT2_uid165_invPolyEval(BITSELECT,273)@17
    highABits_uid274_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(sm1_uid266_pT2_uid165_invPolyEval_q(15 downto 2));

    -- lev1_a1high_uid275_pT2_uid165_invPolyEval(ADD,274)@17 + 1
    lev1_a1high_uid275_pT2_uid165_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid274_pT2_uid165_invPolyEval_b(13)) & highABits_uid274_pT2_uid165_invPolyEval_b));
    lev1_a1high_uid275_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & sm0_uid267_pT2_uid165_invPolyEval_q));
    lev1_a1high_uid275_pT2_uid165_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a1high_uid275_pT2_uid165_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a1high_uid275_pT2_uid165_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1high_uid275_pT2_uid165_invPolyEval_a) + SIGNED(lev1_a1high_uid275_pT2_uid165_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid275_pT2_uid165_invPolyEval_q <= lev1_a1high_uid275_pT2_uid165_invPolyEval_o(14 downto 0);

    -- redist64_lev1_a1high_uid275_pT2_uid165_invPolyEval_q_2(DELAY,770)
    redist64_lev1_a1high_uid275_pT2_uid165_invPolyEval_q_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev1_a1high_uid275_pT2_uid165_invPolyEval_q, xout => redist64_lev1_a1high_uid275_pT2_uid165_invPolyEval_q_2_q, clk => clock, aclr => resetn );

    -- lowRangeA_uid273_pT2_uid165_invPolyEval(BITSELECT,272)@17
    lowRangeA_uid273_pT2_uid165_invPolyEval_in <= sm1_uid266_pT2_uid165_invPolyEval_q(1 downto 0);
    lowRangeA_uid273_pT2_uid165_invPolyEval_b <= lowRangeA_uid273_pT2_uid165_invPolyEval_in(1 downto 0);

    -- redist65_lowRangeA_uid273_pT2_uid165_invPolyEval_b_2(DELAY,771)
    redist65_lowRangeA_uid273_pT2_uid165_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid273_pT2_uid165_invPolyEval_b, xout => redist65_lowRangeA_uid273_pT2_uid165_invPolyEval_b_2_q, clk => clock, aclr => resetn );

    -- lev1_a1_uid276_pT2_uid165_invPolyEval(BITJOIN,275)@19
    lev1_a1_uid276_pT2_uid165_invPolyEval_q <= redist64_lev1_a1high_uid275_pT2_uid165_invPolyEval_q_2_q & redist65_lowRangeA_uid273_pT2_uid165_invPolyEval_b_2_q;

    -- aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval(BITSELECT,221)@15
    aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_in <= STD_LOGIC_VECTOR(redist73_s1_uid163_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid223_pT2_uid165_invPolyEval(BITJOIN,222)@15
    aboveLeftY_mergedSignalTM_uid223_pT2_uid165_invPolyEval_q <= aboveLeftY_bottomRange_uid222_pT2_uid165_invPolyEval_b & zs_uid129_zCount_uid68_i_div_rgb_to_sgr_q;

    -- aboveLeftX_uid220_pT2_uid165_invPolyEval(BITSELECT,219)@15
    aboveLeftX_uid220_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q(21 downto 14));

    -- sm0_uid265_pT2_uid165_invPolyEval(MULT,264)@15 + 2
    sm0_uid265_pT2_uid165_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid220_pT2_uid165_invPolyEval_b);
    sm0_uid265_pT2_uid165_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid223_pT2_uid165_invPolyEval_q;
    sm0_uid265_pT2_uid165_invPolyEval_reset <= not (resetn);
    sm0_uid265_pT2_uid165_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid265_pT2_uid165_invPolyEval_a0,
        datab => sm0_uid265_pT2_uid165_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid265_pT2_uid165_invPolyEval_reset,
        clock => clock,
        result => sm0_uid265_pT2_uid165_invPolyEval_s1
    );
    sm0_uid265_pT2_uid165_invPolyEval_q <= sm0_uid265_pT2_uid165_invPolyEval_s1(15 downto 0);

    -- redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1(DELAY,774)
    redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid265_pT2_uid165_invPolyEval_q, xout => redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid215_pT2_uid165_invPolyEval(BITSELECT,214)@15
    topRangeY_uid215_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(redist73_s1_uid163_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_uid214_pT2_uid165_invPolyEval(BITSELECT,213)@15
    topRangeX_uid214_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid204_pT2_uid165_invPolyEval_q(21 downto 5));

    -- sm0_uid264_pT2_uid165_invPolyEval(MULT,263)@15 + 2
    sm0_uid264_pT2_uid165_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid214_pT2_uid165_invPolyEval_b);
    sm0_uid264_pT2_uid165_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid215_pT2_uid165_invPolyEval_b);
    sm0_uid264_pT2_uid165_invPolyEval_reset <= not (resetn);
    sm0_uid264_pT2_uid165_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid264_pT2_uid165_invPolyEval_a0,
        datab => sm0_uid264_pT2_uid165_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid264_pT2_uid165_invPolyEval_reset,
        clock => clock,
        result => sm0_uid264_pT2_uid165_invPolyEval_s1
    );
    sm0_uid264_pT2_uid165_invPolyEval_q <= sm0_uid264_pT2_uid165_invPolyEval_s1;

    -- redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1(DELAY,775)
    redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid264_pT2_uid165_invPolyEval_q, xout => redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highABits_uid270_pT2_uid165_invPolyEval(BITSELECT,269)@18
    highABits_uid270_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1_q(33 downto 1));

    -- lev1_a0high_uid271_pT2_uid165_invPolyEval(ADD,270)@18 + 1
    lev1_a0high_uid271_pT2_uid165_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid270_pT2_uid165_invPolyEval_b(32)) & highABits_uid270_pT2_uid165_invPolyEval_b));
    lev1_a0high_uid271_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1_q(15)) & redist68_sm0_uid265_pT2_uid165_invPolyEval_q_1_q));
    lev1_a0high_uid271_pT2_uid165_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0high_uid271_pT2_uid165_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0high_uid271_pT2_uid165_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid271_pT2_uid165_invPolyEval_a) + SIGNED(lev1_a0high_uid271_pT2_uid165_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0high_uid271_pT2_uid165_invPolyEval_q <= lev1_a0high_uid271_pT2_uid165_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid269_pT2_uid165_invPolyEval(BITSELECT,268)@18
    lowRangeA_uid269_pT2_uid165_invPolyEval_in <= redist69_sm0_uid264_pT2_uid165_invPolyEval_q_1_q(0 downto 0);
    lowRangeA_uid269_pT2_uid165_invPolyEval_b <= lowRangeA_uid269_pT2_uid165_invPolyEval_in(0 downto 0);

    -- redist66_lowRangeA_uid269_pT2_uid165_invPolyEval_b_1(DELAY,772)
    redist66_lowRangeA_uid269_pT2_uid165_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid269_pT2_uid165_invPolyEval_b, xout => redist66_lowRangeA_uid269_pT2_uid165_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid272_pT2_uid165_invPolyEval(BITJOIN,271)@19
    lev1_a0_uid272_pT2_uid165_invPolyEval_q <= lev1_a0high_uid271_pT2_uid165_invPolyEval_q & redist66_lowRangeA_uid269_pT2_uid165_invPolyEval_b_1_q;

    -- highABits_uid278_pT2_uid165_invPolyEval(BITSELECT,277)@19
    highABits_uid278_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid272_pT2_uid165_invPolyEval_q(34 downto 1));

    -- lev2_a0high_uid279_pT2_uid165_invPolyEval(ADD,278)@19
    lev2_a0high_uid279_pT2_uid165_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => highABits_uid278_pT2_uid165_invPolyEval_b(33)) & highABits_uid278_pT2_uid165_invPolyEval_b));
    lev2_a0high_uid279_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 17 => lev1_a1_uid276_pT2_uid165_invPolyEval_q(16)) & lev1_a1_uid276_pT2_uid165_invPolyEval_q));
    lev2_a0high_uid279_pT2_uid165_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid279_pT2_uid165_invPolyEval_a) + SIGNED(lev2_a0high_uid279_pT2_uid165_invPolyEval_b));
    lev2_a0high_uid279_pT2_uid165_invPolyEval_q <= lev2_a0high_uid279_pT2_uid165_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid277_pT2_uid165_invPolyEval(BITSELECT,276)@19
    lowRangeA_uid277_pT2_uid165_invPolyEval_in <= lev1_a0_uid272_pT2_uid165_invPolyEval_q(0 downto 0);
    lowRangeA_uid277_pT2_uid165_invPolyEval_b <= lowRangeA_uid277_pT2_uid165_invPolyEval_in(0 downto 0);

    -- lev2_a0_uid280_pT2_uid165_invPolyEval(BITJOIN,279)@19
    lev2_a0_uid280_pT2_uid165_invPolyEval_q <= lev2_a0high_uid279_pT2_uid165_invPolyEval_q & lowRangeA_uid277_pT2_uid165_invPolyEval_b;

    -- highABits_uid282_pT2_uid165_invPolyEval(BITSELECT,281)@19
    highABits_uid282_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(lev2_a0_uid280_pT2_uid165_invPolyEval_q(35 downto 3));

    -- redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1(DELAY,768)
    redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => highABits_uid282_pT2_uid165_invPolyEval_b, xout => redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0high_uid283_pT2_uid165_invPolyEval(ADD,282)@20
    lev3_a0high_uid283_pT2_uid165_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1_q(32)) & redist62_highABits_uid282_pT2_uid165_invPolyEval_b_1_q));
    lev3_a0high_uid283_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & redist67_sm1_uid268_pT2_uid165_invPolyEval_q_1_q));
    lev3_a0high_uid283_pT2_uid165_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0high_uid283_pT2_uid165_invPolyEval_a) + SIGNED(lev3_a0high_uid283_pT2_uid165_invPolyEval_b));
    lev3_a0high_uid283_pT2_uid165_invPolyEval_q <= lev3_a0high_uid283_pT2_uid165_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid281_pT2_uid165_invPolyEval(BITSELECT,280)@19
    lowRangeA_uid281_pT2_uid165_invPolyEval_in <= lev2_a0_uid280_pT2_uid165_invPolyEval_q(2 downto 0);
    lowRangeA_uid281_pT2_uid165_invPolyEval_b <= lowRangeA_uid281_pT2_uid165_invPolyEval_in(2 downto 0);

    -- redist63_lowRangeA_uid281_pT2_uid165_invPolyEval_b_1(DELAY,769)
    redist63_lowRangeA_uid281_pT2_uid165_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeA_uid281_pT2_uid165_invPolyEval_b, xout => redist63_lowRangeA_uid281_pT2_uid165_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- lev3_a0_uid284_pT2_uid165_invPolyEval(BITJOIN,283)@20
    lev3_a0_uid284_pT2_uid165_invPolyEval_q <= lev3_a0high_uid283_pT2_uid165_invPolyEval_q & redist63_lowRangeA_uid281_pT2_uid165_invPolyEval_b_1_q;

    -- osig_uid285_pT2_uid165_invPolyEval(BITSELECT,284)@20
    osig_uid285_pT2_uid165_invPolyEval_in <= STD_LOGIC_VECTOR(lev3_a0_uid284_pT2_uid165_invPolyEval_q(32 downto 0));
    osig_uid285_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid285_pT2_uid165_invPolyEval_in(32 downto 9));

    -- redist61_osig_uid285_pT2_uid165_invPolyEval_b_1(DELAY,767)
    redist61_osig_uid285_pT2_uid165_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid285_pT2_uid165_invPolyEval_b, xout => redist61_osig_uid285_pT2_uid165_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9(DELAY,721)
    redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_3_q, xout => redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9_q, clk => clock, aclr => resetn );

    -- memoryC1_uid144_invTabGen_lutmem(DUALMEM,517)@18 + 2
    -- in j@20000000
    memoryC1_uid144_invTabGen_lutmem_aa <= redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9_q;
    memoryC1_uid144_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC1_uid144_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enteA2ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid144_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC1_uid144_invTabGen_lutmem_aa,
        q_a => memoryC1_uid144_invTabGen_lutmem_ir
    );
    memoryC1_uid144_invTabGen_lutmem_r <= memoryC1_uid144_invTabGen_lutmem_ir(28 downto 0);

    -- redist44_memoryC1_uid144_invTabGen_lutmem_r_1(DELAY,750)
    redist44_memoryC1_uid144_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC1_uid144_invTabGen_lutmem_r, xout => redist44_memoryC1_uid144_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- cIncludingRoundingBit_uid167_invPolyEval(BITJOIN,166)@21
    cIncludingRoundingBit_uid167_invPolyEval_q <= redist44_memoryC1_uid144_invTabGen_lutmem_r_1_q & rndBit_uid159_invPolyEval_q;

    -- ts2_uid169_invPolyEval(ADD,168)@21
    ts2_uid169_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => cIncludingRoundingBit_uid167_invPolyEval_q(30)) & cIncludingRoundingBit_uid167_invPolyEval_q));
    ts2_uid169_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 24 => redist61_osig_uid285_pT2_uid165_invPolyEval_b_1_q(23)) & redist61_osig_uid285_pT2_uid165_invPolyEval_b_1_q));
    ts2_uid169_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid169_invPolyEval_a) + SIGNED(ts2_uid169_invPolyEval_b));
    ts2_uid169_invPolyEval_q <= ts2_uid169_invPolyEval_o(31 downto 0);

    -- s2_uid170_invPolyEval(BITSELECT,169)@21
    s2_uid170_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid169_invPolyEval_q(31 downto 1));

    -- redist72_s2_uid170_invPolyEval_b_1(DELAY,778)
    redist72_s2_uid170_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => s2_uid170_invPolyEval_b, xout => redist72_s2_uid170_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- topRangeY_uid300_pT3_uid172_invPolyEval(BITSELECT,299)@22
    topRangeY_uid300_pT3_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(redist72_s2_uid170_invPolyEval_b_1_q(30 downto 14));

    -- redist60_topRangeY_uid300_pT3_uid172_invPolyEval_b_1(DELAY,766)
    redist60_topRangeY_uid300_pT3_uid172_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => topRangeY_uid300_pT3_uid172_invPolyEval_b, xout => redist60_topRangeY_uid300_pT3_uid172_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_inputreg(DELAY,806)
    redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_6_q, xout => redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_inputreg_q, clk => clock, aclr => resetn );

    -- redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13(DELAY,725)
    redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_inputreg_q, xout => redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_q, clk => clock, aclr => resetn );

    -- nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval(BITJOIN,288)@22
    nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval_q <= GND_q & redist19_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_c_13_q;

    -- rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval(BITSELECT,326)@22
    rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval_q(6 downto 0));
    rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_in(6 downto 0));

    -- redist59_rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b_1(DELAY,765)
    redist59_rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b, xout => redist59_rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- rightBottomX_mergedSignalTM_uid328_pT3_uid172_invPolyEval(BITJOIN,327)@23
    rightBottomX_mergedSignalTM_uid328_pT3_uid172_invPolyEval_q <= redist59_rightBottomX_bottomRange_uid327_pT3_uid172_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid326_pT3_uid172_invPolyEval_q;

    -- sm1_uid365_pT3_uid172_invPolyEval(MULT,364)@23 + 2
    sm1_uid365_pT3_uid172_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid328_pT3_uid172_invPolyEval_q;
    sm1_uid365_pT3_uid172_invPolyEval_b0 <= STD_LOGIC_VECTOR(redist60_topRangeY_uid300_pT3_uid172_invPolyEval_b_1_q);
    sm1_uid365_pT3_uid172_invPolyEval_reset <= not (resetn);
    sm1_uid365_pT3_uid172_invPolyEval_component : lpm_mult
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
        dataa => sm1_uid365_pT3_uid172_invPolyEval_a0,
        datab => sm1_uid365_pT3_uid172_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid365_pT3_uid172_invPolyEval_reset,
        clock => clock,
        result => sm1_uid365_pT3_uid172_invPolyEval_s1
    );
    sm1_uid365_pT3_uid172_invPolyEval_q <= sm1_uid365_pT3_uid172_invPolyEval_s1(33 downto 0);

    -- redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1(DELAY,762)
    redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm1_uid365_pT3_uid172_invPolyEval_q, xout => redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_b(BITJOIN,630)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_b_q <= lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b & redist56_sm1_uid365_pT3_uid172_invPolyEval_q_1_q;

    -- aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval(BITSELECT,322)@22
    aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_in <= STD_LOGIC_VECTOR(redist72_s2_uid170_invPolyEval_b_1_q(13 downto 0));
    aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_in(13 downto 0));

    -- aboveLeftY_mergedSignalTM_uid324_pT3_uid172_invPolyEval(BITJOIN,323)@22
    aboveLeftY_mergedSignalTM_uid324_pT3_uid172_invPolyEval_q <= aboveLeftY_bottomRange_uid323_pT3_uid172_invPolyEval_b & topRangeY_bottomExtension_uid195_pT1_uid158_invPolyEval_q;

    -- topRangeX_uid299_pT3_uid172_invPolyEval(BITSELECT,298)@22
    topRangeX_uid299_pT3_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval_q(23 downto 7));

    -- sm0_uid364_pT3_uid172_invPolyEval(MULT,363)@22 + 2
    sm0_uid364_pT3_uid172_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid299_pT3_uid172_invPolyEval_b);
    sm0_uid364_pT3_uid172_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid324_pT3_uid172_invPolyEval_q;
    sm0_uid364_pT3_uid172_invPolyEval_reset <= not (resetn);
    sm0_uid364_pT3_uid172_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid364_pT3_uid172_invPolyEval_a0,
        datab => sm0_uid364_pT3_uid172_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid364_pT3_uid172_invPolyEval_reset,
        clock => clock,
        result => sm0_uid364_pT3_uid172_invPolyEval_s1
    );
    sm0_uid364_pT3_uid172_invPolyEval_q <= sm0_uid364_pT3_uid172_invPolyEval_s1(33 downto 0);

    -- redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1(DELAY,763)
    redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid364_pT3_uid172_invPolyEval_q, xout => redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select(BITSELECT,698)@25
    highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1_q(33 downto 13));
    highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(redist57_sm0_uid364_pT3_uid172_invPolyEval_q_1_q(12 downto 0));

    -- sm0_uid363_pT3_uid172_invPolyEval(MULT,362)@22 + 2
    sm0_uid363_pT3_uid172_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid299_pT3_uid172_invPolyEval_b);
    sm0_uid363_pT3_uid172_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid300_pT3_uid172_invPolyEval_b);
    sm0_uid363_pT3_uid172_invPolyEval_reset <= not (resetn);
    sm0_uid363_pT3_uid172_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid363_pT3_uid172_invPolyEval_a0,
        datab => sm0_uid363_pT3_uid172_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid363_pT3_uid172_invPolyEval_reset,
        clock => clock,
        result => sm0_uid363_pT3_uid172_invPolyEval_s1
    );
    sm0_uid363_pT3_uid172_invPolyEval_q <= sm0_uid363_pT3_uid172_invPolyEval_s1;

    -- redist58_sm0_uid363_pT3_uid172_invPolyEval_q_1(DELAY,764)
    redist58_sm0_uid363_pT3_uid172_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid363_pT3_uid172_invPolyEval_q, xout => redist58_sm0_uid363_pT3_uid172_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- aboveLeftY_uid335_pT3_uid172_invPolyEval(BITSELECT,334)@22
    aboveLeftY_uid335_pT3_uid172_invPolyEval_in <= redist72_s2_uid170_invPolyEval_b_1_q(13 downto 0);
    aboveLeftY_uid335_pT3_uid172_invPolyEval_b <= aboveLeftY_uid335_pT3_uid172_invPolyEval_in(13 downto 9);

    -- n1_uid341_pT3_uid172_invPolyEval(BITSELECT,340)@22
    n1_uid341_pT3_uid172_invPolyEval_b <= aboveLeftY_uid335_pT3_uid172_invPolyEval_b(4 downto 1);

    -- n1_uid347_pT3_uid172_invPolyEval(BITSELECT,346)@22
    n1_uid347_pT3_uid172_invPolyEval_b <= n1_uid341_pT3_uid172_invPolyEval_b(3 downto 1);

    -- n1_uid353_pT3_uid172_invPolyEval(BITSELECT,352)@22
    n1_uid353_pT3_uid172_invPolyEval_b <= n1_uid347_pT3_uid172_invPolyEval_b(2 downto 1);

    -- aboveLeftX_uid334_pT3_uid172_invPolyEval(BITSELECT,333)@22
    aboveLeftX_uid334_pT3_uid172_invPolyEval_in <= nx_mergedSignalTM_uid289_pT3_uid172_invPolyEval_q(6 downto 0);
    aboveLeftX_uid334_pT3_uid172_invPolyEval_b <= aboveLeftX_uid334_pT3_uid172_invPolyEval_in(6 downto 2);

    -- n0_uid342_pT3_uid172_invPolyEval(BITSELECT,341)@22
    n0_uid342_pT3_uid172_invPolyEval_b <= aboveLeftX_uid334_pT3_uid172_invPolyEval_b(4 downto 1);

    -- n0_uid348_pT3_uid172_invPolyEval(BITSELECT,347)@22
    n0_uid348_pT3_uid172_invPolyEval_b <= n0_uid342_pT3_uid172_invPolyEval_b(3 downto 1);

    -- n0_uid354_pT3_uid172_invPolyEval(BITSELECT,353)@22
    n0_uid354_pT3_uid172_invPolyEval_b <= n0_uid348_pT3_uid172_invPolyEval_b(2 downto 1);

    -- sm0_uid366_pT3_uid172_invPolyEval(MULT,365)@22 + 2
    sm0_uid366_pT3_uid172_invPolyEval_a0 <= n0_uid354_pT3_uid172_invPolyEval_b;
    sm0_uid366_pT3_uid172_invPolyEval_b0 <= n1_uid353_pT3_uid172_invPolyEval_b;
    sm0_uid366_pT3_uid172_invPolyEval_reset <= not (resetn);
    sm0_uid366_pT3_uid172_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid366_pT3_uid172_invPolyEval_a0,
        datab => sm0_uid366_pT3_uid172_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid366_pT3_uid172_invPolyEval_reset,
        clock => clock,
        result => sm0_uid366_pT3_uid172_invPolyEval_s1
    );
    sm0_uid366_pT3_uid172_invPolyEval_q <= sm0_uid366_pT3_uid172_invPolyEval_s1;

    -- redist55_sm0_uid366_pT3_uid172_invPolyEval_q_1(DELAY,761)
    redist55_sm0_uid366_pT3_uid172_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sm0_uid366_pT3_uid172_invPolyEval_q, xout => redist55_sm0_uid366_pT3_uid172_invPolyEval_q_1_q, clk => clock, aclr => resetn );

    -- sumAb_uid367_pT3_uid172_invPolyEval(BITJOIN,366)@25
    sumAb_uid367_pT3_uid172_invPolyEval_q <= redist58_sm0_uid363_pT3_uid172_invPolyEval_q_1_q & redist55_sm0_uid366_pT3_uid172_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval(ADD,369)@25 + 1
    lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => sumAb_uid367_pT3_uid172_invPolyEval_q(37)) & sumAb_uid367_pT3_uid172_invPolyEval_q));
    lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 21 => highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_b(20)) & highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_b));
    lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_q <= lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_o(38 downto 0);

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel0_1(BITSELECT,619)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel0_1_b <= STD_LOGIC_VECTOR(lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_q(25 downto 0));

    -- redist6_highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c_1(DELAY,712)
    redist6_highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c, xout => redist6_highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_b(BITJOIN,620)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_b_q <= lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel0_1_b & redist6_highBBits_uid369_pT3_uid172_invPolyEval_merged_bit_select_c_1_q;

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2(ADD,549)@26 + 1
    lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_b_q);
    lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_b_q);
    lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_a) + UNSIGNED(lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_c(0) <= lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_o(39);
    lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_q <= lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1(DELAY,726)
    redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel0_1_b, xout => redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_c(BITJOIN,645)@27
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_c_q <= redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q & redist20_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_tessel1_13_b_1_q;

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1(BITSELECT,622)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_q(38 downto 38));

    -- redist34_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b_1(DELAY,740)
    redist34_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b, xout => redist34_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0(BITSELECT,621)@26
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(lev1_a0sumAHighB_uid370_pT3_uid172_invPolyEval_q(38 downto 26));

    -- redist35_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b_1(DELAY,741)
    redist35_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b, xout => redist35_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b_1_q, clk => clock, aclr => resetn );

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_c(BITJOIN,623)@27
    lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_c_q <= redist34_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_1_b_1_q & redist35_lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_tessel1_0_b_1_q;

    -- lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2(ADD,550)@27 + 1
    lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_cin <= lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_c;
    lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_c_q(13)) & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_a_BitJoin_for_c_q) & '1');
    lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_c_q(13)) & lev2_a0_uid372_pT3_uid172_invPolyEval_BitSelect_for_b_BitJoin_for_c_q) & lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_cin(0));
    lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_a) + SIGNED(lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_q <= lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_o(14 downto 1);

    -- ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2(BITSELECT,607)@28
    ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b <= STD_LOGIC_VECTOR(lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_q(10 downto 10));

    -- ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_1(BITSELECT,606)@28
    ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(lev2_a0_uid372_pT3_uid172_invPolyEval_p2_of_2_q(10 downto 0));

    -- ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0(BITSELECT,605)@27
    ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(lev2_a0_uid372_pT3_uid172_invPolyEval_p1_of_2_q(38 downto 17));

    -- redist39_ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b_1(DELAY,745)
    redist39_ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b, xout => redist39_ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_b(BITJOIN,613)@28
    ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_b_q <= ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b & ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_1_b & redist39_ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_0_b_1_q;

    -- redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16(DELAY,722)
    redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist15_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_9_q, xout => redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16_q, clk => clock, aclr => resetn );

    -- memoryC0_uid140_invTabGen_lutmem(DUALMEM,515)@25 + 2
    -- in j@20000000
    memoryC0_uid140_invTabGen_lutmem_aa <= redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16_q;
    memoryC0_uid140_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid140_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enteA0ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid140_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid140_invTabGen_lutmem_aa,
        q_a => memoryC0_uid140_invTabGen_lutmem_ir
    );
    memoryC0_uid140_invTabGen_lutmem_r <= memoryC0_uid140_invTabGen_lutmem_ir(35 downto 0);

    -- redist46_memoryC0_uid140_invTabGen_lutmem_r_1(DELAY,752)
    redist46_memoryC0_uid140_invTabGen_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid140_invTabGen_lutmem_r, xout => redist46_memoryC0_uid140_invTabGen_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- rndBit_uid173_invPolyEval(CONSTANT,172)
    rndBit_uid173_invPolyEval_q <= "001";

    -- ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_b(BITJOIN,601)@28
    ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_b_q <= redist46_memoryC0_uid140_invTabGen_lutmem_r_1_q & rndBit_uid173_invPolyEval_q;

    -- ts3_uid176_invPolyEval_p1_of_2(ADD,538)@28 + 1
    ts3_uid176_invPolyEval_p1_of_2_a <= STD_LOGIC_VECTOR("0" & ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_b_q);
    ts3_uid176_invPolyEval_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_b_q);
    ts3_uid176_invPolyEval_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid176_invPolyEval_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid176_invPolyEval_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(ts3_uid176_invPolyEval_p1_of_2_a) + UNSIGNED(ts3_uid176_invPolyEval_p1_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid176_invPolyEval_p1_of_2_c(0) <= ts3_uid176_invPolyEval_p1_of_2_o(39);
    ts3_uid176_invPolyEval_p1_of_2_q <= ts3_uid176_invPolyEval_p1_of_2_o(38 downto 0);

    -- redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1(DELAY,742)
    redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid176_invPolyEval_BitSelect_for_b_tessel0_2_b, xout => redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q, clk => clock, aclr => resetn );

    -- ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_c(BITJOIN,617)@29
    ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_c_q <= redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q & redist36_ts3_uid176_invPolyEval_BitSelect_for_b_tessel1_2_b_1_q;

    -- ts3_uid176_invPolyEval_BitSelect_for_a_tessel1_1(BITSELECT,603)@29
    ts3_uid176_invPolyEval_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(redist45_memoryC0_uid141_invTabGen_lutmem_r_2_q(1 downto 1));

    -- memoryC0_uid141_invTabGen_lutmem(DUALMEM,516)@25 + 2
    -- in j@20000000
    memoryC0_uid141_invTabGen_lutmem_aa <= redist16_yAddr_uid78_i_div_rgb_to_sgr_merged_bit_select_b_16_q;
    memoryC0_uid141_invTabGen_lutmem_reset0 <= not (resetn);
    memoryC0_uid141_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "i_sfc_logic_c1_wt_entry_rgb_to_s_c1_enteA1ZinvTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid141_invTabGen_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid141_invTabGen_lutmem_aa,
        q_a => memoryC0_uid141_invTabGen_lutmem_ir
    );
    memoryC0_uid141_invTabGen_lutmem_r <= memoryC0_uid141_invTabGen_lutmem_ir(1 downto 0);

    -- redist45_memoryC0_uid141_invTabGen_lutmem_r_2(DELAY,751)
    redist45_memoryC0_uid141_invTabGen_lutmem_r_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid141_invTabGen_lutmem_r, xout => redist45_memoryC0_uid141_invTabGen_lutmem_r_2_q, clk => clock, aclr => resetn );

    -- ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_c(BITJOIN,604)@29
    ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_c_q <= ts3_uid176_invPolyEval_BitSelect_for_a_tessel1_1_b & redist45_memoryC0_uid141_invTabGen_lutmem_r_2_q;

    -- ts3_uid176_invPolyEval_p2_of_2(ADD,539)@29 + 1
    ts3_uid176_invPolyEval_p2_of_2_cin <= ts3_uid176_invPolyEval_p1_of_2_c;
    ts3_uid176_invPolyEval_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_c_q(2)) & ts3_uid176_invPolyEval_BitSelect_for_a_BitJoin_for_c_q) & '1');
    ts3_uid176_invPolyEval_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_c_q(2)) & ts3_uid176_invPolyEval_BitSelect_for_b_BitJoin_for_c_q) & ts3_uid176_invPolyEval_p2_of_2_cin(0));
    ts3_uid176_invPolyEval_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ts3_uid176_invPolyEval_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ts3_uid176_invPolyEval_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid176_invPolyEval_p2_of_2_a) + SIGNED(ts3_uid176_invPolyEval_p2_of_2_b));
        END IF;
    END PROCESS;
    ts3_uid176_invPolyEval_p2_of_2_q <= ts3_uid176_invPolyEval_p2_of_2_o(3 downto 1);

    -- redist42_ts3_uid176_invPolyEval_p1_of_2_q_1(DELAY,748)
    redist42_ts3_uid176_invPolyEval_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => ts3_uid176_invPolyEval_p1_of_2_q, xout => redist42_ts3_uid176_invPolyEval_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- ts3_uid176_invPolyEval_BitJoin_for_q(BITJOIN,540)@30
    ts3_uid176_invPolyEval_BitJoin_for_q_q <= ts3_uid176_invPolyEval_p2_of_2_q & redist42_ts3_uid176_invPolyEval_p1_of_2_q_1_q;

    -- s3_uid177_invPolyEval(BITSELECT,176)@30
    s3_uid177_invPolyEval_b <= STD_LOGIC_VECTOR(ts3_uid176_invPolyEval_BitJoin_for_q_q(41 downto 1));

    -- fxpInverseRes_uid81_i_div_rgb_to_sgr(BITSELECT,80)@30
    fxpInverseRes_uid81_i_div_rgb_to_sgr_in <= s3_uid177_invPolyEval_b(38 downto 0);
    fxpInverseRes_uid81_i_div_rgb_to_sgr_b <= fxpInverseRes_uid81_i_div_rgb_to_sgr_in(38 downto 6);

    -- paddingY_uid71_i_div_rgb_to_sgr(CONSTANT,70)
    paddingY_uid71_i_div_rgb_to_sgr_q <= "0000000000000000000000000000000";

    -- updatedY_uid72_i_div_rgb_to_sgr(BITJOIN,71)@10
    updatedY_uid72_i_div_rgb_to_sgr_q <= GND_q & paddingY_uid71_i_div_rgb_to_sgr_q;

    -- redist88_normYNoLeadOne_uid70_i_div_rgb_to_sgr_b_1(DELAY,794)
    redist88_normYNoLeadOne_uid70_i_div_rgb_to_sgr_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYNoLeadOne_uid70_i_div_rgb_to_sgr_b, xout => redist88_normYNoLeadOne_uid70_i_div_rgb_to_sgr_b_1_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid71_i_div_rgb_to_sgr(LOGICAL,72)@10 + 1
    normYIsOneC2_uid71_i_div_rgb_to_sgr_a <= STD_LOGIC_VECTOR("0" & redist88_normYNoLeadOne_uid70_i_div_rgb_to_sgr_b_1_q);
    normYIsOneC2_uid71_i_div_rgb_to_sgr_qi <= "1" WHEN normYIsOneC2_uid71_i_div_rgb_to_sgr_a = updatedY_uid72_i_div_rgb_to_sgr_q ELSE "0";
    normYIsOneC2_uid71_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid71_i_div_rgb_to_sgr_qi, xout => normYIsOneC2_uid71_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- normYIsOneC2_uid74_i_div_rgb_to_sgr(BITSELECT,73)@9
    normYIsOneC2_uid74_i_div_rgb_to_sgr_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid428_normY_uid69_i_div_rgb_to_sgr_q(31 downto 31));

    -- redist87_normYIsOneC2_uid74_i_div_rgb_to_sgr_b_2(DELAY,793)
    redist87_normYIsOneC2_uid74_i_div_rgb_to_sgr_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOneC2_uid74_i_div_rgb_to_sgr_b, xout => redist87_normYIsOneC2_uid74_i_div_rgb_to_sgr_b_2_q, clk => clock, aclr => resetn );

    -- normYIsOne_uid75_i_div_rgb_to_sgr(LOGICAL,74)@11 + 1
    normYIsOne_uid75_i_div_rgb_to_sgr_qi <= redist87_normYIsOneC2_uid74_i_div_rgb_to_sgr_b_2_q and normYIsOneC2_uid71_i_div_rgb_to_sgr_q;
    normYIsOne_uid75_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid75_i_div_rgb_to_sgr_qi, xout => normYIsOne_uid75_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- redist86_normYIsOne_uid75_i_div_rgb_to_sgr_q_19(DELAY,792)
    redist86_normYIsOne_uid75_i_div_rgb_to_sgr_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => normYIsOne_uid75_i_div_rgb_to_sgr_q, xout => redist86_normYIsOne_uid75_i_div_rgb_to_sgr_q_19_q, clk => clock, aclr => resetn );

    -- invResPostOneHandling2_uid83_i_div_rgb_to_sgr(MUX,82)@30
    invResPostOneHandling2_uid83_i_div_rgb_to_sgr_s <= redist86_normYIsOne_uid75_i_div_rgb_to_sgr_q_19_q;
    invResPostOneHandling2_uid83_i_div_rgb_to_sgr_combproc: PROCESS (invResPostOneHandling2_uid83_i_div_rgb_to_sgr_s, fxpInverseRes_uid81_i_div_rgb_to_sgr_b, oneInvRes_uid82_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (invResPostOneHandling2_uid83_i_div_rgb_to_sgr_s) IS
            WHEN "0" => invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q <= fxpInverseRes_uid81_i_div_rgb_to_sgr_b;
            WHEN "1" => invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q <= oneInvRes_uid82_i_div_rgb_to_sgr_q;
            WHEN OTHERS => invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select(BITSELECT,690)@30
    prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_b <= invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q(17 downto 0);
    prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_c <= invResPostOneHandling2_uid83_i_div_rgb_to_sgr_q(32 downto 18);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_im6(MULT,435)@30 + 2
    prodXInvY_uid86_i_div_rgb_to_sgr_im6_a0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_b;
    prodXInvY_uid86_i_div_rgb_to_sgr_im6_b0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_im6_reset <= not (resetn);
    prodXInvY_uid86_i_div_rgb_to_sgr_im6_component : lpm_mult
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
        dataa => prodXInvY_uid86_i_div_rgb_to_sgr_im6_a0,
        datab => prodXInvY_uid86_i_div_rgb_to_sgr_im6_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid86_i_div_rgb_to_sgr_im6_reset,
        clock => clock,
        result => prodXInvY_uid86_i_div_rgb_to_sgr_im6_s1
    );
    prodXInvY_uid86_i_div_rgb_to_sgr_im6_q <= prodXInvY_uid86_i_div_rgb_to_sgr_im6_s1;

    -- redist52_prodXInvY_uid86_i_div_rgb_to_sgr_im6_q_2(DELAY,758)
    redist52_prodXInvY_uid86_i_div_rgb_to_sgr_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_im6_q, xout => redist52_prodXInvY_uid86_i_div_rgb_to_sgr_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_align_15(BITSHIFT,444)@34
    prodXInvY_uid86_i_div_rgb_to_sgr_align_15_qint <= redist52_prodXInvY_uid86_i_div_rgb_to_sgr_im6_q_2_q & "000000000000000000";
    prodXInvY_uid86_i_div_rgb_to_sgr_align_15_q <= prodXInvY_uid86_i_div_rgb_to_sgr_align_15_qint(49 downto 0);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,701)@34
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(prodXInvY_uid86_i_div_rgb_to_sgr_align_15_q(38 downto 0));
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(prodXInvY_uid86_i_div_rgb_to_sgr_align_15_q(49 downto 39));

    -- prodXInvY_uid86_i_div_rgb_to_sgr_im3(MULT,432)@30 + 2
    prodXInvY_uid86_i_div_rgb_to_sgr_im3_a0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_b;
    prodXInvY_uid86_i_div_rgb_to_sgr_im3_b0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_im3_reset <= not (resetn);
    prodXInvY_uid86_i_div_rgb_to_sgr_im3_component : lpm_mult
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
        dataa => prodXInvY_uid86_i_div_rgb_to_sgr_im3_a0,
        datab => prodXInvY_uid86_i_div_rgb_to_sgr_im3_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid86_i_div_rgb_to_sgr_im3_reset,
        clock => clock,
        result => prodXInvY_uid86_i_div_rgb_to_sgr_im3_s1
    );
    prodXInvY_uid86_i_div_rgb_to_sgr_im3_q <= prodXInvY_uid86_i_div_rgb_to_sgr_im3_s1;

    -- redist53_prodXInvY_uid86_i_div_rgb_to_sgr_im3_q_1(DELAY,759)
    redist53_prodXInvY_uid86_i_div_rgb_to_sgr_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_im3_q, xout => redist53_prodXInvY_uid86_i_div_rgb_to_sgr_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_align_13(BITSHIFT,442)@33
    prodXInvY_uid86_i_div_rgb_to_sgr_align_13_qint <= redist53_prodXInvY_uid86_i_div_rgb_to_sgr_im3_q_1_q & "000000000000000000";
    prodXInvY_uid86_i_div_rgb_to_sgr_align_13_q <= prodXInvY_uid86_i_div_rgb_to_sgr_align_13_qint(50 downto 0);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,700)@33
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(prodXInvY_uid86_i_div_rgb_to_sgr_align_13_q(38 downto 0));
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(prodXInvY_uid86_i_div_rgb_to_sgr_align_13_q(50 downto 39));

    -- prodXInvY_uid86_i_div_rgb_to_sgr_im9(MULT,438)@30 + 2
    prodXInvY_uid86_i_div_rgb_to_sgr_im9_a0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_im9_b0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_im9_reset <= not (resetn);
    prodXInvY_uid86_i_div_rgb_to_sgr_im9_component : lpm_mult
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
        dataa => prodXInvY_uid86_i_div_rgb_to_sgr_im9_a0,
        datab => prodXInvY_uid86_i_div_rgb_to_sgr_im9_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid86_i_div_rgb_to_sgr_im9_reset,
        clock => clock,
        result => prodXInvY_uid86_i_div_rgb_to_sgr_im9_s1
    );
    prodXInvY_uid86_i_div_rgb_to_sgr_im9_q <= prodXInvY_uid86_i_div_rgb_to_sgr_im9_s1;

    -- redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1(DELAY,757)
    redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_im9_q, xout => redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,699)@33
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1_q(2 downto 0));
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist51_prodXInvY_uid86_i_div_rgb_to_sgr_im9_q_1_q(28 downto 3));

    -- prodXInvY_uid86_i_div_rgb_to_sgr_im0(MULT,429)@30 + 2
    prodXInvY_uid86_i_div_rgb_to_sgr_im0_a0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs1_merged_bit_select_b;
    prodXInvY_uid86_i_div_rgb_to_sgr_im0_b0 <= prodXInvY_uid86_i_div_rgb_to_sgr_bs2_merged_bit_select_b;
    prodXInvY_uid86_i_div_rgb_to_sgr_im0_reset <= not (resetn);
    prodXInvY_uid86_i_div_rgb_to_sgr_im0_component : lpm_mult
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
        dataa => prodXInvY_uid86_i_div_rgb_to_sgr_im0_a0,
        datab => prodXInvY_uid86_i_div_rgb_to_sgr_im0_b0,
        clken => VCC_q(0),
        aclr => prodXInvY_uid86_i_div_rgb_to_sgr_im0_reset,
        clock => clock,
        result => prodXInvY_uid86_i_div_rgb_to_sgr_im0_s1
    );
    prodXInvY_uid86_i_div_rgb_to_sgr_im0_q <= prodXInvY_uid86_i_div_rgb_to_sgr_im0_s1;

    -- redist54_prodXInvY_uid86_i_div_rgb_to_sgr_im0_q_1(DELAY,760)
    redist54_prodXInvY_uid86_i_div_rgb_to_sgr_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_im0_q, xout => redist54_prodXInvY_uid86_i_div_rgb_to_sgr_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,648)@33
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist54_prodXInvY_uid86_i_div_rgb_to_sgr_im0_q_1_q;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2(ADD,558)@33 + 1
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c(0) <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o(39);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2(ADD,567)@34 + 1
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a) + UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c(0) <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o(39);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o(38 downto 0);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_UpperBits_for_b(CONSTANT,564)
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_UpperBits_for_b_q <= "00000000000000000";

    -- redist3_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,709)
    redist3_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist3_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,666)@35
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_UpperBits_for_b_q & redist3_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_UpperBits_for_b(CONSTANT,555)
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_UpperBits_for_b_q <= "000000000000000";

    -- redist4_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,710)
    redist4_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist4_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,656)@34
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_UpperBits_for_b_q & redist4_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist5_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,711)
    redist5_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist5_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,651)@34
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist5_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2(ADD,559)@34 + 1
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin(0);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o(27 downto 1);

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,661)@35
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q;

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2(ADD,568)@35 + 1
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q) & prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin(0);
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a) + UNSIGNED(prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o(28 downto 1);

    -- redist41_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q_1(DELAY,747)
    redist41_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q, xout => redist41_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q_1_q, clk => clock, aclr => resetn );

    -- prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q(BITJOIN,569)@36
    prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q & redist41_prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q_1_q;

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_notEnable(LOGICAL,826)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_nor(LOGICAL,827)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_nor_q <= not (redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_notEnable_q or redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_q);

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_last(CONSTANT,823)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_last_q <= "010111";

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp(LOGICAL,824)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_b <= STD_LOGIC_VECTOR("0" & redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_q);
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_q <= "1" WHEN redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_last_q = redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_b ELSE "0";

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg(REG,825)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg_q <= STD_LOGIC_VECTOR(redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmp_q);
        END IF;
    END PROCESS;

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena(REG,828)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_nor_q = "1") THEN
                redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_q <= STD_LOGIC_VECTOR(redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_enaAnd(LOGICAL,829)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_enaAnd_q <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_sticky_ena_q and VCC_q;

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt(COUNTER,821)
    -- low=0, high=24, step=1, init=0
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i = TO_UNSIGNED(23, 5)) THEN
                redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq <= '1';
            ELSE
                redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq <= '0';
            END IF;
            IF (redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_eq = '1') THEN
                redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i + 8;
            ELSE
                redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_i, 5)));

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_inputreg(DELAY,819)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist74_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_1_q, xout => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_inputreg_q, clk => clock, aclr => resetn );

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr(REG,822)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr_q <= "11000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr_q <= STD_LOGIC_VECTOR(redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem(DUALMEM,820)
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ia <= STD_LOGIC_VECTOR(redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_inputreg_q);
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_aa <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_wraddr_q;
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ab <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_rdcnt_q;
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_reset0 <= not (resetn);
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_dmem : altsyncram
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
        clocken1 => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_reset0,
        clock1 => clock,
        address_a => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_aa,
        data_a => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_ab,
        q_b => redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_iq
    );
    redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_q <= redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_iq(5 downto 0);

    -- cWOut_uid84_i_div_rgb_to_sgr(CONSTANT,83)
    cWOut_uid84_i_div_rgb_to_sgr_q <= "11111";

    -- rShiftCount_uid85_i_div_rgb_to_sgr(SUB,84)@35 + 1
    rShiftCount_uid85_i_div_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & cWOut_uid84_i_div_rgb_to_sgr_q);
    rShiftCount_uid85_i_div_rgb_to_sgr_b <= STD_LOGIC_VECTOR("0" & redist75_r_uid138_zCount_uid68_i_div_rgb_to_sgr_q_28_mem_q);
    rShiftCount_uid85_i_div_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rShiftCount_uid85_i_div_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            rShiftCount_uid85_i_div_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid85_i_div_rgb_to_sgr_a) - UNSIGNED(rShiftCount_uid85_i_div_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    rShiftCount_uid85_i_div_rgb_to_sgr_q <= rShiftCount_uid85_i_div_rgb_to_sgr_o(6 downto 0);

    -- rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select(BITSELECT,691)@36
    rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_b <= rShiftCount_uid85_i_div_rgb_to_sgr_q(6 downto 4);
    rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c <= rShiftCount_uid85_i_div_rgb_to_sgr_q(3 downto 1);
    rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d <= rShiftCount_uid85_i_div_rgb_to_sgr_q(0 downto 0);

    -- rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr(MUX,466)@36 + 1
    rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_s <= rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_b;
    rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_s) IS
                WHEN "000" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_1_0_BitJoin_for_q_q(64 downto 0);
                WHEN "001" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx1_uid453_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "010" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx2_uid456_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "011" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx3_uid459_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "100" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx4_uid462_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "101" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "110" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN "111" => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0Idx5_uid463_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
                WHEN OTHERS => rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist12_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c_1(DELAY,718)
    redist12_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c, xout => redist12_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr(MUX,489)@37
    rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_s <= redist12_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_c_1_q;
    rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_combproc: PROCESS (rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_s, rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx1_uid470_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx2_uid473_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx3_uid476_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx4_uid479_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx5_uid482_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx6_uid485_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage1Idx7_uid488_prodPostRightShift_uid87_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_s) IS
            WHEN "000" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage0_uid467_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "001" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx1_uid470_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "010" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx2_uid473_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "011" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx3_uid476_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "100" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx4_uid479_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "101" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx5_uid482_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "110" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx6_uid485_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "111" => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1Idx7_uid488_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN OTHERS => rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist13_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d_1(DELAY,719)
    redist13_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d, xout => redist13_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d_1_q, clk => clock, aclr => resetn );

    -- rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr(MUX,494)@37
    rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_s <= redist13_rightShiftStageSel6Dto4_uid466_prodPostRightShift_uid87_i_div_rgb_to_sgr_merged_bit_select_d_1_q;
    rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_combproc: PROCESS (rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_s, rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q, rightShiftStage2Idx1_uid493_prodPostRightShift_uid87_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_s) IS
            WHEN "0" => rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage1_uid490_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN "1" => rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= rightShiftStage2Idx1_uid493_prodPostRightShift_uid87_i_div_rgb_to_sgr_q;
            WHEN OTHERS => rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid88_i_div_rgb_to_sgr(BITSELECT,87)@37
    prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_in <= rightShiftStage2_uid495_prodPostRightShift_uid87_i_div_rgb_to_sgr_q(63 downto 0);
    prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b <= prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_in(63 downto 31);

    -- redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1(DELAY,790)
    redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b, xout => redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1_q, clk => clock, aclr => resetn );

    -- allOnes_uid89_i_div_rgb_to_sgr(LOGICAL,88)@38 + 1
    allOnes_uid89_i_div_rgb_to_sgr_qi <= "1" WHEN redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1_q = "111111111111111111111111111111111" ELSE "0";
    allOnes_uid89_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => allOnes_uid89_i_div_rgb_to_sgr_qi, xout => allOnes_uid89_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- invAllOnes_uid91_i_div_rgb_to_sgr(LOGICAL,90)@39
    invAllOnes_uid91_i_div_rgb_to_sgr_q <= not (allOnes_uid89_i_div_rgb_to_sgr_q);

    -- addOp2_uid92_i_div_rgb_to_sgr(LOGICAL,91)@39
    addOp2_uid92_i_div_rgb_to_sgr_q <= invAllOnes_uid91_i_div_rgb_to_sgr_q and VCC_q;

    -- redist85_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_2(DELAY,791)
    redist85_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_2 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist84_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_1_q, xout => redist85_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_2_q, clk => clock, aclr => resetn );

    -- prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr(ADD,92)@39
    prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_a <= STD_LOGIC_VECTOR("0" & redist85_prodPostRightShiftPost_uid88_i_div_rgb_to_sgr_b_2_q);
    prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid92_i_div_rgb_to_sgr_q);
    prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_a) + UNSIGNED(prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_b));
    prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_q <= prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr(BITSELECT,93)@39
    prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_in <= prodPostRightShiftPostRnd_uid93_i_div_rgb_to_sgr_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b <= prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_in(32 downto 1);

    -- redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1(DELAY,789)
    redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b, xout => redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1_q, clk => clock, aclr => resetn );

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_notEnable(LOGICAL,840)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_nor(LOGICAL,841)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_nor_q <= not (redist92_i_conv59_rgb_to_sgr_vt_join_q_36_notEnable_q or redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_q);

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_last(CONSTANT,837)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_last_q <= "011010";

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp(LOGICAL,838)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_b <= STD_LOGIC_VECTOR("0" & redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_q);
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_q <= "1" WHEN redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_last_q = redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_b ELSE "0";

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg(REG,839)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg_q <= STD_LOGIC_VECTOR(redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmp_q);
        END IF;
    END PROCESS;

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena(REG,842)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist92_i_conv59_rgb_to_sgr_vt_join_q_36_nor_q = "1") THEN
                redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_q <= STD_LOGIC_VECTOR(redist92_i_conv59_rgb_to_sgr_vt_join_q_36_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_enaAnd(LOGICAL,843)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_enaAnd_q <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_sticky_ena_q and VCC_q;

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt(COUNTER,835)
    -- low=0, high=27, step=1, init=0
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq <= '1';
            ELSE
                redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq <= '0';
            END IF;
            IF (redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_eq = '1') THEN
                redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i + 5;
            ELSE
                redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_i, 5)));

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_inputreg(DELAY,832)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist91_i_conv59_rgb_to_sgr_vt_join_q_5_q, xout => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_inputreg_q, clk => clock, aclr => resetn );

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr(REG,836)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr_q <= STD_LOGIC_VECTOR(redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem(DUALMEM,834)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ia <= STD_LOGIC_VECTOR(redist92_i_conv59_rgb_to_sgr_vt_join_q_36_inputreg_q);
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_aa <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_wraddr_q;
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ab <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_rdcnt_q;
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_reset0 <= not (resetn);
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_dmem : altsyncram
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
        clocken1 => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_reset0,
        clock1 => clock,
        address_a => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_aa,
        data_a => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_ab,
        q_b => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_iq
    );
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_q <= redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_iq(31 downto 0);

    -- redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg(DELAY,833)
    redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_mem_q, xout => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg_q, clk => clock, aclr => resetn );

    -- yIsZero_uid76_i_div_rgb_to_sgr(LOGICAL,75)@39 + 1
    yIsZero_uid76_i_div_rgb_to_sgr_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid76_i_div_rgb_to_sgr_qi <= "1" WHEN redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg_q = yIsZero_uid76_i_div_rgb_to_sgr_b ELSE "0";
    yIsZero_uid76_i_div_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yIsZero_uid76_i_div_rgb_to_sgr_qi, xout => yIsZero_uid76_i_div_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- resFinal_uid96_i_div_rgb_to_sgr(MUX,95)@40
    resFinal_uid96_i_div_rgb_to_sgr_s <= yIsZero_uid76_i_div_rgb_to_sgr_q;
    resFinal_uid96_i_div_rgb_to_sgr_combproc: PROCESS (resFinal_uid96_i_div_rgb_to_sgr_s, redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1_q, cstValOvf_uid95_i_div_rgb_to_sgr_q)
    BEGIN
        CASE (resFinal_uid96_i_div_rgb_to_sgr_s) IS
            WHEN "0" => resFinal_uid96_i_div_rgb_to_sgr_q <= redist83_prodPostRightShiftPostRndRange_uid94_i_div_rgb_to_sgr_b_1_q;
            WHEN "1" => resFinal_uid96_i_div_rgb_to_sgr_q <= cstValOvf_uid95_i_div_rgb_to_sgr_q;
            WHEN OTHERS => resFinal_uid96_i_div_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_inputreg(DELAY,830)
    redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinal_uid96_i_div_rgb_to_sgr_q, xout => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6(DELAY,787)
    redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_inputreg_q, xout => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_q, clk => clock, aclr => resetn );

    -- redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg(DELAY,831)
    redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_q, xout => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg_q, clk => clock, aclr => resetn );

    -- resFinalM1_uid101_i_div_rgb_to_sgr(SUB,100)@46
    resFinalM1_uid101_i_div_rgb_to_sgr_a <= STD_LOGIC_VECTOR("0" & redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg_q);
    resFinalM1_uid101_i_div_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    resFinalM1_uid101_i_div_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalM1_uid101_i_div_rgb_to_sgr_a) - UNSIGNED(resFinalM1_uid101_i_div_rgb_to_sgr_b));
    resFinalM1_uid101_i_div_rgb_to_sgr_q <= resFinalM1_uid101_i_div_rgb_to_sgr_o(32 downto 0);

    -- resFinalPostMux_uid102_i_div_rgb_to_sgr(BITSELECT,101)@46
    resFinalPostMux_uid102_i_div_rgb_to_sgr_in <= resFinalM1_uid101_i_div_rgb_to_sgr_q(31 downto 0);
    resFinalPostMux_uid102_i_div_rgb_to_sgr_b <= resFinalPostMux_uid102_i_div_rgb_to_sgr_in(31 downto 0);

    -- redist80_resFinalPostMux_uid102_i_div_rgb_to_sgr_b_1(DELAY,786)
    redist80_resFinalPostMux_uid102_i_div_rgb_to_sgr_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalPostMux_uid102_i_div_rgb_to_sgr_b, xout => redist80_resFinalPostMux_uid102_i_div_rgb_to_sgr_b_1_q, clk => clock, aclr => resetn );

    -- redist82_resFinal_uid96_i_div_rgb_to_sgr_q_7(DELAY,788)
    redist82_resFinal_uid96_i_div_rgb_to_sgr_q_7 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist81_resFinal_uid96_i_div_rgb_to_sgr_q_6_outputreg_q, xout => redist82_resFinal_uid96_i_div_rgb_to_sgr_q_7_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select(BITSELECT,692)@40
    prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_b <= resFinal_uid96_i_div_rgb_to_sgr_q(17 downto 0);
    prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_c <= resFinal_uid96_i_div_rgb_to_sgr_q(31 downto 18);

    -- redist93_i_conv59_rgb_to_sgr_vt_join_q_37(DELAY,799)
    redist93_i_conv59_rgb_to_sgr_vt_join_q_37 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist92_i_conv59_rgb_to_sgr_vt_join_q_36_outputreg_q, xout => redist93_i_conv59_rgb_to_sgr_vt_join_q_37_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_bs2(BITSELECT,498)@40
    prodResY_uid97_i_div_rgb_to_sgr_bs2_in <= redist93_i_conv59_rgb_to_sgr_vt_join_q_37_q(17 downto 0);
    prodResY_uid97_i_div_rgb_to_sgr_bs2_b <= prodResY_uid97_i_div_rgb_to_sgr_bs2_in(17 downto 0);

    -- prodResY_uid97_i_div_rgb_to_sgr_im6(MULT,502)@40 + 2
    prodResY_uid97_i_div_rgb_to_sgr_im6_a0 <= prodResY_uid97_i_div_rgb_to_sgr_bs2_b;
    prodResY_uid97_i_div_rgb_to_sgr_im6_b0 <= prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_c;
    prodResY_uid97_i_div_rgb_to_sgr_im6_reset <= not (resetn);
    prodResY_uid97_i_div_rgb_to_sgr_im6_component : lpm_mult
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
        dataa => prodResY_uid97_i_div_rgb_to_sgr_im6_a0,
        datab => prodResY_uid97_i_div_rgb_to_sgr_im6_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid97_i_div_rgb_to_sgr_im6_reset,
        clock => clock,
        result => prodResY_uid97_i_div_rgb_to_sgr_im6_s1
    );
    prodResY_uid97_i_div_rgb_to_sgr_im6_q <= prodResY_uid97_i_div_rgb_to_sgr_im6_s1;

    -- redist48_prodResY_uid97_i_div_rgb_to_sgr_im6_q_2(DELAY,754)
    redist48_prodResY_uid97_i_div_rgb_to_sgr_im6_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_im6_q, xout => redist48_prodResY_uid97_i_div_rgb_to_sgr_im6_q_2_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_align_15(BITSHIFT,511)@44
    prodResY_uid97_i_div_rgb_to_sgr_align_15_qint <= redist48_prodResY_uid97_i_div_rgb_to_sgr_im6_q_2_q & "000000000000000000";
    prodResY_uid97_i_div_rgb_to_sgr_align_15_q <= prodResY_uid97_i_div_rgb_to_sgr_align_15_qint(49 downto 0);

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,704)@44
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(prodResY_uid97_i_div_rgb_to_sgr_align_15_q(38 downto 0));
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(prodResY_uid97_i_div_rgb_to_sgr_align_15_q(49 downto 39));

    -- prodResY_uid97_i_div_rgb_to_sgr_bs5(BITSELECT,501)@40
    prodResY_uid97_i_div_rgb_to_sgr_bs5_b <= redist93_i_conv59_rgb_to_sgr_vt_join_q_37_q(31 downto 18);

    -- prodResY_uid97_i_div_rgb_to_sgr_im3(MULT,499)@40 + 2
    prodResY_uid97_i_div_rgb_to_sgr_im3_a0 <= prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_b;
    prodResY_uid97_i_div_rgb_to_sgr_im3_b0 <= prodResY_uid97_i_div_rgb_to_sgr_bs5_b;
    prodResY_uid97_i_div_rgb_to_sgr_im3_reset <= not (resetn);
    prodResY_uid97_i_div_rgb_to_sgr_im3_component : lpm_mult
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
        dataa => prodResY_uid97_i_div_rgb_to_sgr_im3_a0,
        datab => prodResY_uid97_i_div_rgb_to_sgr_im3_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid97_i_div_rgb_to_sgr_im3_reset,
        clock => clock,
        result => prodResY_uid97_i_div_rgb_to_sgr_im3_s1
    );
    prodResY_uid97_i_div_rgb_to_sgr_im3_q <= prodResY_uid97_i_div_rgb_to_sgr_im3_s1;

    -- redist49_prodResY_uid97_i_div_rgb_to_sgr_im3_q_1(DELAY,755)
    redist49_prodResY_uid97_i_div_rgb_to_sgr_im3_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_im3_q, xout => redist49_prodResY_uid97_i_div_rgb_to_sgr_im3_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_align_13(BITSHIFT,509)@43
    prodResY_uid97_i_div_rgb_to_sgr_align_13_qint <= redist49_prodResY_uid97_i_div_rgb_to_sgr_im3_q_1_q & "000000000000000000";
    prodResY_uid97_i_div_rgb_to_sgr_align_13_q <= prodResY_uid97_i_div_rgb_to_sgr_align_13_qint(49 downto 0);

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,703)@43
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(prodResY_uid97_i_div_rgb_to_sgr_align_13_q(38 downto 0));
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(prodResY_uid97_i_div_rgb_to_sgr_align_13_q(49 downto 39));

    -- prodResY_uid97_i_div_rgb_to_sgr_im9(MULT,505)@40 + 2
    prodResY_uid97_i_div_rgb_to_sgr_im9_a0 <= prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_c;
    prodResY_uid97_i_div_rgb_to_sgr_im9_b0 <= prodResY_uid97_i_div_rgb_to_sgr_bs5_b;
    prodResY_uid97_i_div_rgb_to_sgr_im9_reset <= not (resetn);
    prodResY_uid97_i_div_rgb_to_sgr_im9_component : lpm_mult
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
        dataa => prodResY_uid97_i_div_rgb_to_sgr_im9_a0,
        datab => prodResY_uid97_i_div_rgb_to_sgr_im9_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid97_i_div_rgb_to_sgr_im9_reset,
        clock => clock,
        result => prodResY_uid97_i_div_rgb_to_sgr_im9_s1
    );
    prodResY_uid97_i_div_rgb_to_sgr_im9_q <= prodResY_uid97_i_div_rgb_to_sgr_im9_s1;

    -- redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1(DELAY,753)
    redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_im9_q, xout => redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,702)@43
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1_q(2 downto 0));
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist47_prodResY_uid97_i_div_rgb_to_sgr_im9_q_1_q(27 downto 3));

    -- prodResY_uid97_i_div_rgb_to_sgr_im0(MULT,496)@40 + 2
    prodResY_uid97_i_div_rgb_to_sgr_im0_a0 <= prodResY_uid97_i_div_rgb_to_sgr_bs1_merged_bit_select_b;
    prodResY_uid97_i_div_rgb_to_sgr_im0_b0 <= prodResY_uid97_i_div_rgb_to_sgr_bs2_b;
    prodResY_uid97_i_div_rgb_to_sgr_im0_reset <= not (resetn);
    prodResY_uid97_i_div_rgb_to_sgr_im0_component : lpm_mult
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
        dataa => prodResY_uid97_i_div_rgb_to_sgr_im0_a0,
        datab => prodResY_uid97_i_div_rgb_to_sgr_im0_b0,
        clken => VCC_q(0),
        aclr => prodResY_uid97_i_div_rgb_to_sgr_im0_reset,
        clock => clock,
        result => prodResY_uid97_i_div_rgb_to_sgr_im0_s1
    );
    prodResY_uid97_i_div_rgb_to_sgr_im0_q <= prodResY_uid97_i_div_rgb_to_sgr_im0_s1;

    -- redist50_prodResY_uid97_i_div_rgb_to_sgr_im0_q_1(DELAY,756)
    redist50_prodResY_uid97_i_div_rgb_to_sgr_im0_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_im0_q, xout => redist50_prodResY_uid97_i_div_rgb_to_sgr_im0_q_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,669)@43
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist50_prodResY_uid97_i_div_rgb_to_sgr_im0_q_1_q;

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2(ADD,576)@43 + 1
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_a) + UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c(0) <= prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o(39);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q <= prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_o(38 downto 0);

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2(ADD,585)@44 + 1
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_q);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_a) + UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c(0) <= prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o(39);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q <= prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_o(38 downto 0);

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_notEnable(LOGICAL,815)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_nor(LOGICAL,816)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_nor_q <= not (redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_notEnable_q or redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_q);

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_last(CONSTANT,812)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_last_q <= "01011";

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp(LOGICAL,813)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_q);
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_q <= "1" WHEN redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_last_q = redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_b ELSE "0";

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg(REG,814)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg_q <= STD_LOGIC_VECTOR(redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena(REG,817)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_nor_q = "1") THEN
                redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_enaAnd(LOGICAL,818)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_enaAnd_q <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_sticky_ena_q and VCC_q;

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt(COUNTER,810)
    -- low=0, high=12, step=1, init=0
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq <= '1';
            ELSE
                redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq <= '0';
            END IF;
            IF (redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_eq = '1') THEN
                redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i + 4;
            ELSE
                redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_i, 4)));

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1(BITSELECT,589)@29
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b <= STD_LOGIC_VECTOR(i_sub58_rgb_to_sgr_q(31 downto 16));

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_inputreg(DELAY,807)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b, xout => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_inputreg_q, clk => clock, aclr => resetn );

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr(REG,811)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem(DUALMEM,809)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ia <= STD_LOGIC_VECTOR(redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_inputreg_q);
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_aa <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_wraddr_q;
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ab <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_rdcnt_q;
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_reset0 <= not (resetn);
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 16,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_reset0,
        clock1 => clock,
        address_a => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_aa,
        data_a => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_ab,
        q_b => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_iq
    );
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_q <= redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_iq(15 downto 0);

    -- redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_outputreg(DELAY,808)
    redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_outputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_mem_q, xout => redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_outputreg_q, clk => clock, aclr => resetn );

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_BitJoin_for_b(BITJOIN,591)@45
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_BitJoin_for_b_q <= prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_b & redist40_prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_1_b_16_outputreg_q & i_sub58_rgb_to_sgr_vt_const_15_q;

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2(COMPARE,526)@45 + 1
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_BitJoin_for_b_q);
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_q);
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_a) - UNSIGNED(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_c(0) <= prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_o(39);

    -- redist0_prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,706)
    redist0_prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist0_prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,687)@45
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q <= i_shl_rgb_to_sgr_vt_const_15_q & redist0_prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist1_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,707)
    redist1_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist1_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,677)@44
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= prodXInvY_uid86_i_div_rgb_to_sgr_result_add_0_0_UpperBits_for_b_q & redist1_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist2_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,708)
    redist2_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist2_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,672)@44
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist2_prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2(ADD,577)@44 + 1
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin <= prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p1_of_2_c;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_cin(0);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_a) + UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q <= prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_o(26 downto 1);

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,682)@45
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & prodResY_uid97_i_div_rgb_to_sgr_result_add_0_0_p2_of_2_q;

    -- prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2(ADD,586)@45 + 1
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin <= prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p1_of_2_c;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q) & prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_cin(0);
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_a) + UNSIGNED(prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q <= prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_o(27 downto 1);

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_tessel1_0(BITSELECT,596)@46
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(prodResY_uid97_i_div_rgb_to_sgr_result_add_1_0_p2_of_2_q(24 downto 0));

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_BitJoin_for_c(BITJOIN,598)@46
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_BitJoin_for_c_q <= GND_q & prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_tessel1_0_b;

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_UpperBits_for_a(CONSTANT,521)
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_UpperBits_for_a_q <= "000000000000000000000000000000000";

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select(BITSELECT,705)
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_b <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_UpperBits_for_a_q(6 downto 0));
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_c <= STD_LOGIC_VECTOR(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_UpperBits_for_a_q(32 downto 7));

    -- prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2(COMPARE,527)@46 + 1
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_cin <= prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p1_of_2_c;
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_a <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_a_tessel0_2_merged_bit_select_c) & '0';
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_b <= STD_LOGIC_VECTOR("0" & prod_qy_GT_x_uid98_i_div_rgb_to_sgr_BitSelect_for_b_BitJoin_for_c_q) & prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_cin(0);
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_a) - UNSIGNED(prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_b));
        END IF;
    END PROCESS;
    prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_c(0) <= prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_o(27);

    -- resFinalIntDiv_uid103_i_div_rgb_to_sgr(MUX,102)@47 + 1
    resFinalIntDiv_uid103_i_div_rgb_to_sgr_s <= prod_qy_GT_x_uid98_i_div_rgb_to_sgr_p2_of_2_c;
    resFinalIntDiv_uid103_i_div_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            resFinalIntDiv_uid103_i_div_rgb_to_sgr_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (resFinalIntDiv_uid103_i_div_rgb_to_sgr_s) IS
                WHEN "0" => resFinalIntDiv_uid103_i_div_rgb_to_sgr_q <= redist82_resFinal_uid96_i_div_rgb_to_sgr_q_7_q;
                WHEN "1" => resFinalIntDiv_uid103_i_div_rgb_to_sgr_q <= redist80_resFinalPostMux_uid102_i_div_rgb_to_sgr_b_1_q;
                WHEN OTHERS => resFinalIntDiv_uid103_i_div_rgb_to_sgr_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- c_i32_45875(CONSTANT,18)
    c_i32_45875_q <= "00000000000000001011001100110011";

    -- i_cmp60_rgb_to_sgr(COMPARE,30)@48 + 1
    i_cmp60_rgb_to_sgr_a <= STD_LOGIC_VECTOR("00" & c_i32_45875_q);
    i_cmp60_rgb_to_sgr_b <= STD_LOGIC_VECTOR("00" & resFinalIntDiv_uid103_i_div_rgb_to_sgr_q);
    i_cmp60_rgb_to_sgr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp60_rgb_to_sgr_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp60_rgb_to_sgr_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp60_rgb_to_sgr_a) - UNSIGNED(i_cmp60_rgb_to_sgr_b));
        END IF;
    END PROCESS;
    i_cmp60_rgb_to_sgr_c(0) <= i_cmp60_rgb_to_sgr_o(33);

    -- i_conv_i_i2_rgb_to_sgr_sel_x(BITSELECT,6)@49
    i_conv_i_i2_rgb_to_sgr_sel_x_b <= std_logic_vector(resize(unsigned(i_cmp60_rgb_to_sgr_c(0 downto 0)), 56));

    -- i_conv_i_i2_rgb_to_sgr_vt_select_0(BITSELECT,49)@49
    i_conv_i_i2_rgb_to_sgr_vt_select_0_b <= i_conv_i_i2_rgb_to_sgr_sel_x_b(0 downto 0);

    -- i_conv_i_i2_rgb_to_sgr_vt_join(BITJOIN,48)@49
    i_conv_i_i2_rgb_to_sgr_vt_join_q <= i_acl_6_rgb_to_sgr_vt_const_55_q & i_conv_i_i2_rgb_to_sgr_vt_select_0_b;

    -- i_cmp_rgb_to_sgr(LOGICAL,37)@3 + 1
    i_cmp_rgb_to_sgr_qi <= "1" WHEN i_acl_4_rgb_to_sgr_q = i_acl_5_rgb_to_sgr_q ELSE "0";
    i_cmp_rgb_to_sgr_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_sgr_qi, xout => i_cmp_rgb_to_sgr_q, clk => clock, aclr => resetn );

    -- redist94_i_cmp_rgb_to_sgr_q_46(DELAY,800)
    redist94_i_cmp_rgb_to_sgr_q_46 : dspba_delay
    GENERIC MAP ( width => 1, depth => 45, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_rgb_to_sgr_q, xout => redist94_i_cmp_rgb_to_sgr_q_46_q, clk => clock, aclr => resetn );

    -- i_acl_6_rgb_to_sgr(MUX,24)@49
    i_acl_6_rgb_to_sgr_s <= redist94_i_cmp_rgb_to_sgr_q_46_q;
    i_acl_6_rgb_to_sgr_combproc: PROCESS (i_acl_6_rgb_to_sgr_s, i_conv_i_i2_rgb_to_sgr_vt_join_q, c_i56_0gr_q)
    BEGIN
        CASE (i_acl_6_rgb_to_sgr_s) IS
            WHEN "0" => i_acl_6_rgb_to_sgr_q <= i_conv_i_i2_rgb_to_sgr_vt_join_q;
            WHEN "1" => i_acl_6_rgb_to_sgr_q <= c_i56_0gr_q;
            WHEN OTHERS => i_acl_6_rgb_to_sgr_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_6_rgb_to_sgr_vt_select_0(BITSELECT,27)@49
    i_acl_6_rgb_to_sgr_vt_select_0_b <= i_acl_6_rgb_to_sgr_q(0 downto 0);

    -- i_acl_6_rgb_to_sgr_vt_join(BITJOIN,26)@49
    i_acl_6_rgb_to_sgr_vt_join_q <= i_acl_6_rgb_to_sgr_vt_const_55_q & i_acl_6_rgb_to_sgr_vt_select_0_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,12)@49
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_acl_6_rgb_to_sgr_vt_join_q;
    out_o_valid <= redist98_sync_in_aunroll_x_in_i_valid_48_q;

END normal;

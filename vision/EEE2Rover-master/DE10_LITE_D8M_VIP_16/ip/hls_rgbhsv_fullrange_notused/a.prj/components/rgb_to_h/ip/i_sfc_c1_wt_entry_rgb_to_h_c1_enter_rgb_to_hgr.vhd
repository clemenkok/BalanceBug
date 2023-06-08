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

-- VHDL created from i_sfc_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_hgr
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

entity i_sfc_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_hgr is
    port (
        in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c1_eni1_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_1 : out std_logic_vector(55 downto 0);  -- ufix56
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_hgr;

architecture normal of i_sfc_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_hgr is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_h31 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(55 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(55 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13 is
        port (
            in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni1_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c1_eni1_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c1_eni1_3 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi1_1 : out std_logic_vector(55 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (55 downto 0);
    signal i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_1 : STD_LOGIC_VECTOR (55 downto 0);
    signal i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,7)
    not_stall_out_q <= not (i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,6)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x(BLACKBOX,5)@1
    -- out out_c1_exi1_0@51
    -- out out_c1_exi1_1@51
    -- out out_o_valid@51
    thei_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x : i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13
    PORT MAP (
        in_c1_eni1_0 => in_c1_eni1_0,
        in_c1_eni1_1 => in_c1_eni1_1,
        in_c1_eni1_2 => in_c1_eni1_2,
        in_c1_eni1_3 => in_c1_eni1_3,
        in_i_valid => input_accepted_and_q,
        out_c1_exi1_0 => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_0,
        out_c1_exi1_1 => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_1,
        out_o_valid => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x(BLACKBOX,4)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x : i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_h31
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_0,
        in_data_in_1 => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_c1_exi1_1,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c1_wt_entry_rgb_to_h_c1_enter_rgb_to_h13_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_1,
        out_stall_entry => i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@54
    out_c1_exit_0 <= i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_0;
    out_c1_exit_1 <= i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_data_out_1;
    out_o_valid <= i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,9)@20000000
    out_o_stall <= i_acl_sfc_exit_c1_wt_entry_rgb_to_h_c1_exit_rgb_to_hgr_aunroll_x_out_stall_entry;

END normal;

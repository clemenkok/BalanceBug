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

-- VHDL created from bb_rgb_to_hv_B0_runOnce
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

entity bb_rgb_to_hv_B0_runOnce is
    port (
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_rgb_to_hv_B0_runOnce;

architecture normal of bb_rgb_to_hv_B0_runOnce is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_rgb_to_hv_B0_runOnce_stall_region is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component rgb_to_hv_B0_runOnce_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component rgb_to_hv_B0_runOnce_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_rgb_to_hv_B0_runOnce_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hv_B0_runOnce_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_hv_B0_runOnce_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_hv_B0_runOnce_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_hv_B0_runOnce_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_hv_B0_runOnce_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- rgb_to_hv_B0_runOnce_branch(BLACKBOX,7)
    thergb_to_hv_B0_runOnce_branch : rgb_to_hv_B0_runOnce_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_rgb_to_hv_B0_runOnce_stall_region_out_valid_out,
        out_stall_out => rgb_to_hv_B0_runOnce_branch_out_stall_out,
        out_valid_out_0 => rgb_to_hv_B0_runOnce_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_rgb_to_hv_B0_runOnce_stall_region(BLACKBOX,2)
    thebb_rgb_to_hv_B0_runOnce_stall_region : bb_rgb_to_hv_B0_runOnce_stall_region
    PORT MAP (
        in_stall_in => rgb_to_hv_B0_runOnce_branch_out_stall_out,
        in_valid_in => rgb_to_hv_B0_runOnce_merge_out_valid_out,
        out_stall_out => bb_rgb_to_hv_B0_runOnce_stall_region_out_stall_out,
        out_valid_out => bb_rgb_to_hv_B0_runOnce_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- rgb_to_hv_B0_runOnce_merge(BLACKBOX,8)
    thergb_to_hv_B0_runOnce_merge : rgb_to_hv_B0_runOnce_merge
    PORT MAP (
        in_stall_in => bb_rgb_to_hv_B0_runOnce_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_stall_out_0 => rgb_to_hv_B0_runOnce_merge_out_stall_out_0,
        out_valid_out => rgb_to_hv_B0_runOnce_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_stall_out_0(GPOUT,5)
    out_stall_out_0 <= rgb_to_hv_B0_runOnce_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,6)
    out_valid_out_0 <= rgb_to_hv_B0_runOnce_branch_out_valid_out_0;

END normal;

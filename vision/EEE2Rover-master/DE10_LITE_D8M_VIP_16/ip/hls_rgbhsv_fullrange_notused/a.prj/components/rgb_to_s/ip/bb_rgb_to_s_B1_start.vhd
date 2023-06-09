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

-- VHDL created from bb_rgb_to_s_B1_start
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

entity bb_rgb_to_s_B1_start is
    port (
        in_iord_bl_do_i_fifodata : in std_logic_vector(23 downto 0);  -- ufix24
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return1_o_fifodata : out std_logic_vector(55 downto 0);  -- ufix56
        out_iowr_nb_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_rgb_to_s_B1_start;

architecture normal of bb_rgb_to_s_B1_start is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_rgb_to_s_B1_start_stall_region is
        port (
            in_iord_bl_do_i_fifodata : in std_logic_vector(23 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifodata : out std_logic_vector(55 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component rgb_to_s_B1_start_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component rgb_to_s_B1_start_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifodata : STD_LOGIC_VECTOR (55 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_s_B1_start_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_s_B1_start_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_s_B1_start_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_s_B1_start_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_s_B1_start_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_s_B1_start_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- rgb_to_s_B1_start_merge(BLACKBOX,19)
    thergb_to_s_B1_start_merge : rgb_to_s_B1_start_merge
    PORT MAP (
        in_stall_in => bb_rgb_to_s_B1_start_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_stall_out_0 => rgb_to_s_B1_start_merge_out_stall_out_0,
        out_stall_out_1 => rgb_to_s_B1_start_merge_out_stall_out_1,
        out_valid_out => rgb_to_s_B1_start_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- rgb_to_s_B1_start_branch(BLACKBOX,18)
    thergb_to_s_B1_start_branch : rgb_to_s_B1_start_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_rgb_to_s_B1_start_stall_region_out_valid_out,
        out_stall_out => rgb_to_s_B1_start_branch_out_stall_out,
        out_valid_out_0 => rgb_to_s_B1_start_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_rgb_to_s_B1_start_stall_region(BLACKBOX,2)
    thebb_rgb_to_s_B1_start_stall_region : bb_rgb_to_s_B1_start_stall_region
    PORT MAP (
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => rgb_to_s_B1_start_branch_out_stall_out,
        in_valid_in => rgb_to_s_B1_start_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_stall_out => bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_valid_out => bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_valid_out,
        out_iord_bl_do_o_fifoready => bb_rgb_to_s_B1_start_stall_region_out_iord_bl_do_o_fifoready,
        out_iowr_nb_return1_o_fifodata => bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifodata,
        out_iowr_nb_return1_o_fifovalid => bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifovalid,
        out_pipeline_valid_out => bb_rgb_to_s_B1_start_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_rgb_to_s_B1_start_stall_region_out_stall_out,
        out_valid_out => bb_rgb_to_s_B1_start_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_exiting_stall_out(GPOUT,8)
    out_exiting_stall_out <= bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,9)
    out_exiting_valid_out <= bb_rgb_to_s_B1_start_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_rgb_to_sgr_exiting_valid_out;

    -- out_iord_bl_do_o_fifoready(GPOUT,10)
    out_iord_bl_do_o_fifoready <= bb_rgb_to_s_B1_start_stall_region_out_iord_bl_do_o_fifoready;

    -- out_iowr_nb_return1_o_fifodata(GPOUT,11)
    out_iowr_nb_return1_o_fifodata <= bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifodata;

    -- out_iowr_nb_return1_o_fifovalid(GPOUT,12)
    out_iowr_nb_return1_o_fifovalid <= bb_rgb_to_s_B1_start_stall_region_out_iowr_nb_return1_o_fifovalid;

    -- out_stall_out_0(GPOUT,13)
    out_stall_out_0 <= rgb_to_s_B1_start_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,14)
    out_stall_out_1 <= rgb_to_s_B1_start_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,15)
    out_valid_out_0 <= rgb_to_s_B1_start_branch_out_valid_out_0;

    -- pipeline_valid_out_sync(GPOUT,17)
    out_pipeline_valid_out <= bb_rgb_to_s_B1_start_stall_region_out_pipeline_valid_out;

END normal;

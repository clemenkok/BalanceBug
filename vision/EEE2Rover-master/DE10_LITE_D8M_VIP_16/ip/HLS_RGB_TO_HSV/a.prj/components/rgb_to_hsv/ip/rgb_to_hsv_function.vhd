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

-- VHDL created from rgb_to_hsv_function
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

entity rgb_to_hsv_function is
    port (
        in_arg_do : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_return1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_iord_bl_do_i_fifodata : in std_logic_vector(31 downto 0);  -- ufix32
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return1_o_fifodata : out std_logic_vector(27 downto 0);  -- ufix28
        out_iowr_nb_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end rgb_to_hsv_function;

architecture normal of rgb_to_hsv_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_rgb_to_hsv_B0_runOnce is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_rgb_to_hsv_B1_start is
        port (
            in_iord_bl_do_i_fifodata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifodata : out std_logic_vector(27 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_rgb_to_hsv_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hsv_B0_runOnce_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hsv_B1_start_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifodata : STD_LOGIC_VECTOR (27 downto 0);
    signal bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hsv_B1_start_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_rgb_to_hsv_B1_start_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i2_0gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c_i2_0gr(CONSTANT,8)
    c_i2_0gr_q <= "00";

    -- i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo(BLACKBOX,11)
    thei_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo : i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo
    PORT MAP (
        in_data_in => c_i2_0gr_q,
        in_stall_in => bb_rgb_to_hsv_B1_start_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_acl_pipeline_keep_going_rgb_to_hsv_sr(BLACKBOX,10)
    thei_acl_pipeline_keep_going_rgb_to_hsv_sr : i_acl_pipeline_keep_going_rgb_to_hsv_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_stall_out,
        in_i_valid => bb_rgb_to_hsv_B1_start_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_rgb_to_hsv_B1_start(BLACKBOX,5)
    thebb_rgb_to_hsv_B1_start : bb_rgb_to_hsv_B1_start
    PORT MAP (
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        in_pipeline_stall_in => i_acl_pipeline_keep_going_rgb_to_hsv_sr_out_o_stall,
        in_stall_in_0 => GND_q,
        in_valid_in_0 => i_acl_pipeline_keep_going_rgb_to_hsv_valid_fifo_out_valid_out,
        in_valid_in_1 => VCC_q,
        out_iord_bl_do_o_fifoready => bb_rgb_to_hsv_B1_start_out_iord_bl_do_o_fifoready,
        out_iowr_nb_return1_o_fifodata => bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifodata,
        out_iowr_nb_return1_o_fifovalid => bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifovalid,
        out_pipeline_valid_out => bb_rgb_to_hsv_B1_start_out_pipeline_valid_out,
        out_stall_out_0 => bb_rgb_to_hsv_B1_start_out_stall_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_iord_bl_do_o_fifoready(GPOUT,18)
    out_iord_bl_do_o_fifoready <= bb_rgb_to_hsv_B1_start_out_iord_bl_do_o_fifoready;

    -- out_iowr_nb_return1_o_fifodata(GPOUT,19)
    out_iowr_nb_return1_o_fifodata <= bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifodata;

    -- out_iowr_nb_return1_o_fifovalid(GPOUT,20)
    out_iowr_nb_return1_o_fifovalid <= bb_rgb_to_hsv_B1_start_out_iowr_nb_return1_o_fifovalid;

    -- bb_rgb_to_hsv_B0_runOnce(BLACKBOX,4)
    thebb_rgb_to_hsv_B0_runOnce : bb_rgb_to_hsv_B0_runOnce
    PORT MAP (
        in_stall_in_0 => GND_q,
        in_valid_in_0 => in_valid_in,
        out_stall_out_0 => bb_rgb_to_hsv_B0_runOnce_out_stall_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_stall_out(GPOUT,21)
    out_stall_out <= bb_rgb_to_hsv_B0_runOnce_out_stall_out_0;

    -- out_valid_out(GPOUT,22)
    out_valid_out <= GND_q;

END normal;

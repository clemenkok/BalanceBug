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

-- VHDL created from rgb_to_h_function_wrapper
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

entity rgb_to_h_function_wrapper is
    port (
        avst_iord_bl_do_data : in std_logic_vector(23 downto 0);  -- ufix24
        avst_iord_bl_do_valid : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_nb_return1_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        blue : in std_logic_vector(7 downto 0);  -- ufix8
        green : in std_logic_vector(7 downto 0);  -- ufix8
        red : in std_logic_vector(7 downto 0);  -- ufix8
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_do_ready : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_nb_return1_data : out std_logic_vector(55 downto 0);  -- ufix56
        avst_iowr_nb_return1_valid : out std_logic_vector(0 downto 0);  -- ufix1
        returndata : out std_logic_vector(55 downto 0);  -- ufix56
        clock : in std_logic;
        resetn : in std_logic
    );
end rgb_to_h_function_wrapper;

architecture normal of rgb_to_h_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component rgb_to_h_function is
        port (
            in_arg_do : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_return1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(23 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifodata : out std_logic_vector(55 downto 0);  -- Fixed Point
            out_iowr_nb_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal do_const_q : STD_LOGIC_VECTOR (63 downto 0);
    signal implicit_input_q : STD_LOGIC_VECTOR (23 downto 0);
    signal return_bits_b : STD_LOGIC_VECTOR (55 downto 0);
    signal rgb_to_h_function_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal rgb_to_h_function_out_iowr_nb_return1_o_fifodata : STD_LOGIC_VECTOR (55 downto 0);
    signal rgb_to_h_function_out_iowr_nb_return1_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- implicit_input(BITJOIN,5)
    implicit_input_q <= blue & green & red;

    -- do_const(CONSTANT,4)
    do_const_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rgb_to_h_function(BLACKBOX,21)
    thergb_to_h_function : rgb_to_h_function
    PORT MAP (
        in_arg_do => do_const_q,
        in_arg_return1 => do_const_q,
        in_iord_bl_do_i_fifodata => implicit_input_q,
        in_iord_bl_do_i_fifovalid => VCC_q,
        in_stall_in => GND_q,
        in_valid_in => VCC_q,
        out_iord_bl_do_o_fifoready => rgb_to_h_function_out_iord_bl_do_o_fifoready,
        out_iowr_nb_return1_o_fifodata => rgb_to_h_function_out_iowr_nb_return1_o_fifodata,
        out_iowr_nb_return1_o_fifovalid => rgb_to_h_function_out_iowr_nb_return1_o_fifovalid,
        clock => clock,
        resetn => resetn
    );

    -- avst_iord_bl_do_ready(GPOUT,15)
    avst_iord_bl_do_ready <= rgb_to_h_function_out_iord_bl_do_o_fifoready;

    -- avst_iowr_nb_return1_data(GPOUT,16)
    avst_iowr_nb_return1_data <= rgb_to_h_function_out_iowr_nb_return1_o_fifodata;

    -- avst_iowr_nb_return1_valid(GPOUT,17)
    avst_iowr_nb_return1_valid <= rgb_to_h_function_out_iowr_nb_return1_o_fifovalid;

    -- return_bits(BITSELECT,20)
    return_bits_b <= rgb_to_h_function_out_iowr_nb_return1_o_fifodata(55 downto 0);

    -- returndata(GPOUT,18)
    returndata <= return_bits_b;

END normal;

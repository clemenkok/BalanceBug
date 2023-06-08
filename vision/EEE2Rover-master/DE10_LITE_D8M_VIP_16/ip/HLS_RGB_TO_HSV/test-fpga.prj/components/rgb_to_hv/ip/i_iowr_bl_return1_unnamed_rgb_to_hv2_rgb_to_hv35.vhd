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

-- VHDL created from i_iowr_bl_return1_unnamed_rgb_to_hv2_rgb_to_hv35
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

entity i_iowr_bl_return1_unnamed_rgb_to_hv2_rgb_to_hv35 is
    port (
        in_i_data_0 : in std_logic_vector(26 downto 0);  -- ufix27
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_return1_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_ack : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_return1_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_return1_o_fifodata : out std_logic_vector(26 downto 0);  -- ufix27
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_iowr_bl_return1_unnamed_rgb_to_hv2_rgb_to_hv35;

architecture normal of i_iowr_bl_return1_unnamed_rgb_to_hv2_rgb_to_hv35 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component st_write is
        generic (
            DATA_WIDTH : INTEGER := 27;
            DELAY_READY : INTEGER := 0;
            ENABLED : INTEGER := 0;
            NON_BLOCKING : INTEGER := 0
        );
        port (
            i_data : in std_logic_vector(26 downto 0);
            i_endofpacket : in std_logic;
            i_fifoready : in std_logic;
            i_fifosize : in std_logic_vector(31 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_startofpacket : in std_logic;
            i_valid : in std_logic;
            o_ack : out std_logic;
            o_fifodata : out std_logic_vector(26 downto 0);
            o_fifovalid : out std_logic;
            o_stall : out std_logic;
            o_valid : out std_logic;
            profile_total_fifo_size_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal agg_adapt_to_ufixed_cast_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bit_select_in_b : STD_LOGIC_VECTOR (26 downto 0);
    signal c32_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i5_0gr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (31 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (31 downto 0);
    signal iowr_i_data : STD_LOGIC_VECTOR (26 downto 0);
    signal iowr_i_endofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_endofpacket_bitsignaltemp : std_logic;
    signal iowr_i_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_fifoready_bitsignaltemp : std_logic;
    signal iowr_i_fifosize : STD_LOGIC_VECTOR (31 downto 0);
    signal iowr_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_predicate_bitsignaltemp : std_logic;
    signal iowr_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_stall_bitsignaltemp : std_logic;
    signal iowr_i_startofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_startofpacket_bitsignaltemp : std_logic;
    signal iowr_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_valid_bitsignaltemp : std_logic;
    signal iowr_o_ack : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_ack_bitsignaltemp : std_logic;
    signal iowr_o_fifodata : STD_LOGIC_VECTOR (26 downto 0);
    signal iowr_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_fifovalid_bitsignaltemp : std_logic;
    signal iowr_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_stall_bitsignaltemp : std_logic;
    signal iowr_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_valid_bitsignaltemp : std_logic;
    signal iowr_profile_total_fifo_size_incr : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c32_0(CONSTANT,10)
    c32_0_q <= "00000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- c_i5_0gr(CONSTANT,12)
    c_i5_0gr_q <= "00000";

    -- element_extension(BITJOIN,15)
    element_extension_q <= c_i5_0gr_q & in_i_data_0;

    -- dupName_1_dsdk_ip_adapt_bitjoin_x(BITJOIN,7)
    dupName_1_dsdk_ip_adapt_bitjoin_x_q <= element_extension_q;

    -- agg_adapt_to_ufixed_cast(BITSELECT,8)
    agg_adapt_to_ufixed_cast_b <= dupName_1_dsdk_ip_adapt_bitjoin_x_q(31 downto 0);

    -- dupName_0_dsdk_ip_adapt_bitjoin_x(BITJOIN,4)
    dupName_0_dsdk_ip_adapt_bitjoin_x_q <= agg_adapt_to_ufixed_cast_b;

    -- dupName_0_agg_adapt_to_ufixed_cast_x(BITSELECT,3)
    dupName_0_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_adapt_bitjoin_x_q(31 downto 0);

    -- dsdk_ip_adapt_bitjoin(BITJOIN,14)
    dsdk_ip_adapt_bitjoin_q <= dupName_0_agg_adapt_to_ufixed_cast_x_b;

    -- bit_select_in(BITSELECT,9)
    bit_select_in_b <= dsdk_ip_adapt_bitjoin_q(26 downto 0);

    -- iowr(EXTIFACE,16)
    iowr_i_data <= bit_select_in_b;
    iowr_i_endofpacket <= GND_q;
    iowr_i_fifoready <= in_iowr_bl_return1_i_fifoready;
    iowr_i_fifosize <= c32_0_q;
    iowr_i_predicate <= GND_q;
    iowr_i_stall <= in_i_stall;
    iowr_i_startofpacket <= GND_q;
    iowr_i_valid <= in_i_valid;
    iowr_i_endofpacket_bitsignaltemp <= iowr_i_endofpacket(0);
    iowr_i_fifoready_bitsignaltemp <= iowr_i_fifoready(0);
    iowr_i_predicate_bitsignaltemp <= iowr_i_predicate(0);
    iowr_i_stall_bitsignaltemp <= iowr_i_stall(0);
    iowr_i_startofpacket_bitsignaltemp <= iowr_i_startofpacket(0);
    iowr_i_valid_bitsignaltemp <= iowr_i_valid(0);
    iowr_o_ack(0) <= iowr_o_ack_bitsignaltemp;
    iowr_o_fifovalid(0) <= iowr_o_fifovalid_bitsignaltemp;
    iowr_o_stall(0) <= iowr_o_stall_bitsignaltemp;
    iowr_o_valid(0) <= iowr_o_valid_bitsignaltemp;
    theiowr : st_write
    GENERIC MAP (
        DATA_WIDTH => 27,
        DELAY_READY => 0,
        ENABLED => 0,
        NON_BLOCKING => 0
    )
    PORT MAP (
        i_data => bit_select_in_b,
        i_endofpacket => iowr_i_endofpacket_bitsignaltemp,
        i_fifoready => iowr_i_fifoready_bitsignaltemp,
        i_fifosize => c32_0_q,
        i_predicate => iowr_i_predicate_bitsignaltemp,
        i_stall => iowr_i_stall_bitsignaltemp,
        i_startofpacket => iowr_i_startofpacket_bitsignaltemp,
        i_valid => iowr_i_valid_bitsignaltemp,
        o_ack => iowr_o_ack_bitsignaltemp,
        o_fifodata => iowr_o_fifodata,
        o_fifovalid => iowr_o_fifovalid_bitsignaltemp,
        o_stall => iowr_o_stall_bitsignaltemp,
        o_valid => iowr_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_iowr_bl_return1_o_fifovalid <= iowr_o_fifovalid;

    -- dupName_0_sync_out_x(GPOUT,6)@55
    out_o_ack <= iowr_o_ack;
    out_o_valid <= iowr_o_valid;

    -- regfree_osync(GPOUT,18)
    out_iowr_bl_return1_o_fifodata <= iowr_o_fifodata;

    -- sync_out(GPOUT,20)@20000000
    out_o_stall <= iowr_o_stall;

END normal;

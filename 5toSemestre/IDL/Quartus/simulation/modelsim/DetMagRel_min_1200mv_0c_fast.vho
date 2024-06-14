-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/17/2023 10:09:13"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DetMagRel1bit IS
    PORT (
	M : OUT std_logic;
	X : IN std_logic;
	Y : IN std_logic;
	N : OUT std_logic;
	P : OUT std_logic
	);
END DetMagRel1bit;

-- Design Ports Information
-- M	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DetMagRel1bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_M : std_logic;
SIGNAL ww_X : std_logic;
SIGNAL ww_Y : std_logic;
SIGNAL ww_N : std_logic;
SIGNAL ww_P : std_logic;
SIGNAL \M~output_o\ : std_logic;
SIGNAL \N~output_o\ : std_logic;
SIGNAL \P~output_o\ : std_logic;
SIGNAL \X~input_o\ : std_logic;
SIGNAL \Y~input_o\ : std_logic;
SIGNAL \inst2~combout\ : std_logic;
SIGNAL \inst3~combout\ : std_logic;
SIGNAL \inst4~combout\ : std_logic;
SIGNAL \ALT_INV_inst2~combout\ : std_logic;

BEGIN

M <= ww_M;
ww_X <= X;
ww_Y <= Y;
N <= ww_N;
P <= ww_P;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_inst2~combout\ <= NOT \inst2~combout\;

-- Location: IOOBUF_X12_Y0_N9
\M~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_inst2~combout\,
	devoe => ww_devoe,
	o => \M~output_o\);

-- Location: IOOBUF_X22_Y31_N9
\N~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~combout\,
	devoe => ww_devoe,
	o => \N~output_o\);

-- Location: IOOBUF_X22_Y31_N2
\P~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~combout\,
	devoe => ww_devoe,
	o => \P~output_o\);

-- Location: IOIBUF_X20_Y0_N1
\X~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X,
	o => \X~input_o\);

-- Location: IOIBUF_X29_Y0_N8
\Y~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y,
	o => \Y~input_o\);

-- Location: LCCOMB_X23_Y2_N16
inst2 : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2~combout\ = \X~input_o\ $ (\Y~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \X~input_o\,
	datac => \Y~input_o\,
	combout => \inst2~combout\);

-- Location: LCCOMB_X23_Y2_N2
inst3 : cycloneiv_lcell_comb
-- Equation(s):
-- \inst3~combout\ = (\X~input_o\ & !\Y~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \X~input_o\,
	datac => \Y~input_o\,
	combout => \inst3~combout\);

-- Location: LCCOMB_X23_Y2_N4
inst4 : cycloneiv_lcell_comb
-- Equation(s):
-- \inst4~combout\ = (!\X~input_o\ & \Y~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \X~input_o\,
	datac => \Y~input_o\,
	combout => \inst4~combout\);

ww_M <= \M~output_o\;

ww_N <= \N~output_o\;

ww_P <= \P~output_o\;
END structure;



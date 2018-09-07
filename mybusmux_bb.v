// megafunction wizard: %LPM_MUX%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_MUX 

// ============================================================
// File Name: mybusmux.v
// Megafunction Name(s):
// 			LPM_MUX
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 15.1.0 Build 185 10/21/2015 SJ Lite Edition
// ************************************************************

//Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus Prime License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.

module mybusmux (
	data0x,
	data10x,
	data1x,
	data2x,
	data3x,
	data4x,
	data5x,
	data6x,
	data7x,
	data8x,
	data9x,
	sel,
	result);

	input	[15:0]  data0x;
	input	[15:0]  data10x;
	input	[15:0]  data1x;
	input	[15:0]  data2x;
	input	[15:0]  data3x;
	input	[15:0]  data4x;
	input	[15:0]  data5x;
	input	[15:0]  data6x;
	input	[15:0]  data7x;
	input	[15:0]  data8x;
	input	[15:0]  data9x;
	input	[3:0]  sel;
	output	[15:0]  result;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "11"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "16"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "4"
// Retrieval info: USED_PORT: data0x 0 0 16 0 INPUT NODEFVAL "data0x[15..0]"
// Retrieval info: USED_PORT: data10x 0 0 16 0 INPUT NODEFVAL "data10x[15..0]"
// Retrieval info: USED_PORT: data1x 0 0 16 0 INPUT NODEFVAL "data1x[15..0]"
// Retrieval info: USED_PORT: data2x 0 0 16 0 INPUT NODEFVAL "data2x[15..0]"
// Retrieval info: USED_PORT: data3x 0 0 16 0 INPUT NODEFVAL "data3x[15..0]"
// Retrieval info: USED_PORT: data4x 0 0 16 0 INPUT NODEFVAL "data4x[15..0]"
// Retrieval info: USED_PORT: data5x 0 0 16 0 INPUT NODEFVAL "data5x[15..0]"
// Retrieval info: USED_PORT: data6x 0 0 16 0 INPUT NODEFVAL "data6x[15..0]"
// Retrieval info: USED_PORT: data7x 0 0 16 0 INPUT NODEFVAL "data7x[15..0]"
// Retrieval info: USED_PORT: data8x 0 0 16 0 INPUT NODEFVAL "data8x[15..0]"
// Retrieval info: USED_PORT: data9x 0 0 16 0 INPUT NODEFVAL "data9x[15..0]"
// Retrieval info: USED_PORT: result 0 0 16 0 OUTPUT NODEFVAL "result[15..0]"
// Retrieval info: USED_PORT: sel 0 0 4 0 INPUT NODEFVAL "sel[3..0]"
// Retrieval info: CONNECT: @data 0 0 16 0 data0x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 160 data10x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 16 data1x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 32 data2x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 48 data3x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 64 data4x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 80 data5x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 96 data6x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 112 data7x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 128 data8x 0 0 16 0
// Retrieval info: CONNECT: @data 0 0 16 144 data9x 0 0 16 0
// Retrieval info: CONNECT: @sel 0 0 4 0 sel 0 0 4 0
// Retrieval info: CONNECT: result 0 0 16 0 @result 0 0 16 0
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mybusmux_bb.v TRUE
// Retrieval info: LIB_FILE: lpm

// WARNING: Do NOT edit the input and output ports in this file in a text
// editor if you plan to continue editing the block that represents it in
// the Block Editor! File corruption is VERY likely to occur.

// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions
// and other software and tools, and its AMPP partner logic
// functions, and any output files from any of the foregoing
// (including device programming or simulation files), and any
// associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other
// applicable license agreement, including, without limitation,
// that your use is for the sole purpose of programming logic
// devices manufactured by Altera and sold by Altera or its
// authorized distributors.  Please refer to the applicable
// agreement for further details.


// Generated by Quartus Prime Version 16.0 (Build Build 211 04/27/2016)
// Created on Fri Sep 23 11:46:32 2016

//  Module Declaration
module power_saver
(
// {{ALTERA_ARGS_BEGIN}} DO NOT REMOVE THIS LINE!
P, T, H, F
// {{ALTERA_ARGS_END}} DO NOT REMOVE THIS LINE!
);
// Port Declaration

// {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
input P;
input T;
input H;
output F;
// {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!



assign F = T & H & P;



endmodule

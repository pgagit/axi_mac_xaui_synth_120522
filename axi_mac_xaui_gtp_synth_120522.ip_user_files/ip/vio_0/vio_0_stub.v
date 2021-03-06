// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Wed May 25 13:20:57 2022
// Host        : pc-140-151-2 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/alexander.kohn/MYREPO2/4_axi_mac_xaui_gtp_synth_120522/axi_mac_xaui_gtp_synth_120522.srcs/sources_1/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tifbv676-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.1" *)
module vio_0(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_out0, probe_out1, probe_out2, probe_out3, probe_out4, 
  probe_out5, probe_out6, probe_out7, probe_out8, probe_out9, probe_out10, probe_out11, 
  probe_out12, probe_out13, probe_out14)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[0:0],probe_in1[0:0],probe_in2[0:0],probe_in3[0:0],probe_in4[0:0],probe_in5[0:0],probe_in6[0:0],probe_out0[0:0],probe_out1[0:0],probe_out2[3:0],probe_out3[0:0],probe_out4[0:0],probe_out5[0:0],probe_out6[0:0],probe_out7[79:0],probe_out8[79:0],probe_out9[0:0],probe_out10[0:0],probe_out11[0:0],probe_out12[15:0],probe_out13[31:0],probe_out14[3:0]" */;
  input clk;
  input [0:0]probe_in0;
  input [0:0]probe_in1;
  input [0:0]probe_in2;
  input [0:0]probe_in3;
  input [0:0]probe_in4;
  input [0:0]probe_in5;
  input [0:0]probe_in6;
  output [0:0]probe_out0;
  output [0:0]probe_out1;
  output [3:0]probe_out2;
  output [0:0]probe_out3;
  output [0:0]probe_out4;
  output [0:0]probe_out5;
  output [0:0]probe_out6;
  output [79:0]probe_out7;
  output [79:0]probe_out8;
  output [0:0]probe_out9;
  output [0:0]probe_out10;
  output [0:0]probe_out11;
  output [15:0]probe_out12;
  output [31:0]probe_out13;
  output [3:0]probe_out14;
endmodule

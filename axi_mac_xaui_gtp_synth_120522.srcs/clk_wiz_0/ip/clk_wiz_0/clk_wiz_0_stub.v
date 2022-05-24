// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue May 10 07:35:43 2022
// Host        : pc-140-151-2 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/alexander.kohn/MYREPO2/axi_mac_xaui_GTP_synth/axi_mac_xaui_GTP_synth.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tifbv676-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_wiz_50MHz_out, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_wiz_50MHz_out,reset,locked,clk_in1" */;
  output clk_wiz_50MHz_out;
  input reset;
  output locked;
  input clk_in1;
endmodule

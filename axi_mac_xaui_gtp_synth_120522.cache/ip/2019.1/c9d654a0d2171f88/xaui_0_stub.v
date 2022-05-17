// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue May 17 07:09:14 2022
// Host        : pc-140-151-2 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xaui_0_stub.v
// Design      : xaui_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tifbv676-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xaui_v12_3_6,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(dclk, reset, clk156_out, clk156_lock, refclk, 
  xgmii_txd, xgmii_txc, xgmii_rxd, xgmii_rxc, xaui_tx_l0_p, xaui_tx_l0_n, xaui_tx_l1_p, 
  xaui_tx_l1_n, xaui_tx_l2_p, xaui_tx_l2_n, xaui_tx_l3_p, xaui_tx_l3_n, xaui_rx_l0_p, 
  xaui_rx_l0_n, xaui_rx_l1_p, xaui_rx_l1_n, xaui_rx_l2_p, xaui_rx_l2_n, xaui_rx_l3_p, 
  xaui_rx_l3_n, signal_detect, debug, gt0_drpaddr, gt0_drpen, gt0_drpdi, gt0_drpdo, gt0_drprdy, 
  gt0_drpwe, gt0_drp_busy, gt0_txpmareset_in, gt0_txpcsreset_in, gt0_txresetdone_out, 
  gt0_rxpmareset_in, gt0_rxpcsreset_in, gt0_rxpmaresetdone_out, gt0_rxresetdone_out, 
  gt0_rxbufstatus_out, gt0_txphaligndone_out, gt0_txphinitdone_out, 
  gt0_txdlysresetdone_out, gt_qplllock_out, gt0_eyescantrigger_in, gt0_eyescanreset_in, 
  gt0_eyescandataerror_out, gt0_rxrate_in, gt0_loopback_in, gt0_rxpolarity_in, 
  gt0_txpolarity_in, gt0_rxlpmreset_in, gt0_rxlpmhfhold_in, gt0_rxlpmhfovrden_in, 
  gt0_rxlpmlfhold_in, gt0_rxlpmlfovrden_in, gt0_txpostcursor_in, gt0_txprecursor_in, 
  gt0_txdiffctrl_in, gt0_txinhibit_in, gt0_rxprbscntreset_in, gt0_rxprbserr_out, 
  gt0_rxprbssel_in, gt0_txprbssel_in, gt0_txprbsforceerr_in, gt0_rxcdrhold_in, 
  gt0_dmonitorout_out, gt0_rxdisperr_out, gt0_rxnotintable_out, gt0_rxcommadet_out, 
  gt1_drpaddr, gt1_drpen, gt1_drpdi, gt1_drpdo, gt1_drprdy, gt1_drpwe, gt1_drp_busy, 
  gt1_txpmareset_in, gt1_txpcsreset_in, gt1_txresetdone_out, gt1_rxpmareset_in, 
  gt1_rxpcsreset_in, gt1_rxpmaresetdone_out, gt1_rxresetdone_out, gt1_rxbufstatus_out, 
  gt1_txphaligndone_out, gt1_txphinitdone_out, gt1_txdlysresetdone_out, 
  gt1_eyescantrigger_in, gt1_eyescanreset_in, gt1_eyescandataerror_out, gt1_rxrate_in, 
  gt1_loopback_in, gt1_rxpolarity_in, gt1_txpolarity_in, gt1_rxlpmreset_in, 
  gt1_rxlpmhfhold_in, gt1_rxlpmhfovrden_in, gt1_rxlpmlfhold_in, gt1_rxlpmlfovrden_in, 
  gt1_txpostcursor_in, gt1_txprecursor_in, gt1_txdiffctrl_in, gt1_txinhibit_in, 
  gt1_rxprbscntreset_in, gt1_rxprbserr_out, gt1_rxprbssel_in, gt1_txprbssel_in, 
  gt1_txprbsforceerr_in, gt1_rxcdrhold_in, gt1_dmonitorout_out, gt1_rxdisperr_out, 
  gt1_rxnotintable_out, gt1_rxcommadet_out, gt2_drpaddr, gt2_drpen, gt2_drpdi, gt2_drpdo, 
  gt2_drprdy, gt2_drpwe, gt2_drp_busy, gt2_txpmareset_in, gt2_txpcsreset_in, 
  gt2_txresetdone_out, gt2_rxpmareset_in, gt2_rxpcsreset_in, gt2_rxpmaresetdone_out, 
  gt2_rxresetdone_out, gt2_rxbufstatus_out, gt2_txphaligndone_out, gt2_txphinitdone_out, 
  gt2_txdlysresetdone_out, gt2_eyescantrigger_in, gt2_eyescanreset_in, 
  gt2_eyescandataerror_out, gt2_rxrate_in, gt2_loopback_in, gt2_rxpolarity_in, 
  gt2_txpolarity_in, gt2_rxlpmreset_in, gt2_rxlpmhfhold_in, gt2_rxlpmhfovrden_in, 
  gt2_rxlpmlfhold_in, gt2_rxlpmlfovrden_in, gt2_txpostcursor_in, gt2_txprecursor_in, 
  gt2_txdiffctrl_in, gt2_txinhibit_in, gt2_rxprbscntreset_in, gt2_rxprbserr_out, 
  gt2_rxprbssel_in, gt2_txprbssel_in, gt2_txprbsforceerr_in, gt2_rxcdrhold_in, 
  gt2_dmonitorout_out, gt2_rxdisperr_out, gt2_rxnotintable_out, gt2_rxcommadet_out, 
  gt3_drpaddr, gt3_drpen, gt3_drpdi, gt3_drpdo, gt3_drprdy, gt3_drpwe, gt3_drp_busy, 
  gt3_txpmareset_in, gt3_txpcsreset_in, gt3_txresetdone_out, gt3_rxpmareset_in, 
  gt3_rxpcsreset_in, gt3_rxpmaresetdone_out, gt3_rxresetdone_out, gt3_rxbufstatus_out, 
  gt3_txphaligndone_out, gt3_txphinitdone_out, gt3_txdlysresetdone_out, 
  gt3_eyescantrigger_in, gt3_eyescanreset_in, gt3_eyescandataerror_out, gt3_rxrate_in, 
  gt3_loopback_in, gt3_rxpolarity_in, gt3_txpolarity_in, gt3_rxlpmreset_in, 
  gt3_rxlpmhfhold_in, gt3_rxlpmhfovrden_in, gt3_rxlpmlfhold_in, gt3_rxlpmlfovrden_in, 
  gt3_txpostcursor_in, gt3_txprecursor_in, gt3_txdiffctrl_in, gt3_txinhibit_in, 
  gt3_rxprbscntreset_in, gt3_rxprbserr_out, gt3_rxprbssel_in, gt3_txprbssel_in, 
  gt3_txprbsforceerr_in, gt3_rxcdrhold_in, gt3_dmonitorout_out, gt3_rxdisperr_out, 
  gt3_rxnotintable_out, gt3_rxcommadet_out, configuration_vector, status_vector)
/* synthesis syn_black_box black_box_pad_pin="dclk,reset,clk156_out,clk156_lock,refclk,xgmii_txd[63:0],xgmii_txc[7:0],xgmii_rxd[63:0],xgmii_rxc[7:0],xaui_tx_l0_p,xaui_tx_l0_n,xaui_tx_l1_p,xaui_tx_l1_n,xaui_tx_l2_p,xaui_tx_l2_n,xaui_tx_l3_p,xaui_tx_l3_n,xaui_rx_l0_p,xaui_rx_l0_n,xaui_rx_l1_p,xaui_rx_l1_n,xaui_rx_l2_p,xaui_rx_l2_n,xaui_rx_l3_p,xaui_rx_l3_n,signal_detect[3:0],debug[5:0],gt0_drpaddr[8:0],gt0_drpen,gt0_drpdi[15:0],gt0_drpdo[15:0],gt0_drprdy,gt0_drpwe,gt0_drp_busy,gt0_txpmareset_in,gt0_txpcsreset_in,gt0_txresetdone_out,gt0_rxpmareset_in,gt0_rxpcsreset_in,gt0_rxpmaresetdone_out,gt0_rxresetdone_out,gt0_rxbufstatus_out[2:0],gt0_txphaligndone_out,gt0_txphinitdone_out,gt0_txdlysresetdone_out,gt_qplllock_out,gt0_eyescantrigger_in,gt0_eyescanreset_in,gt0_eyescandataerror_out,gt0_rxrate_in[2:0],gt0_loopback_in[2:0],gt0_rxpolarity_in,gt0_txpolarity_in,gt0_rxlpmreset_in,gt0_rxlpmhfhold_in,gt0_rxlpmhfovrden_in,gt0_rxlpmlfhold_in,gt0_rxlpmlfovrden_in,gt0_txpostcursor_in[4:0],gt0_txprecursor_in[4:0],gt0_txdiffctrl_in[3:0],gt0_txinhibit_in,gt0_rxprbscntreset_in,gt0_rxprbserr_out,gt0_rxprbssel_in[2:0],gt0_txprbssel_in[2:0],gt0_txprbsforceerr_in,gt0_rxcdrhold_in,gt0_dmonitorout_out[14:0],gt0_rxdisperr_out[1:0],gt0_rxnotintable_out[1:0],gt0_rxcommadet_out,gt1_drpaddr[8:0],gt1_drpen,gt1_drpdi[15:0],gt1_drpdo[15:0],gt1_drprdy,gt1_drpwe,gt1_drp_busy,gt1_txpmareset_in,gt1_txpcsreset_in,gt1_txresetdone_out,gt1_rxpmareset_in,gt1_rxpcsreset_in,gt1_rxpmaresetdone_out,gt1_rxresetdone_out,gt1_rxbufstatus_out[2:0],gt1_txphaligndone_out,gt1_txphinitdone_out,gt1_txdlysresetdone_out,gt1_eyescantrigger_in,gt1_eyescanreset_in,gt1_eyescandataerror_out,gt1_rxrate_in[2:0],gt1_loopback_in[2:0],gt1_rxpolarity_in,gt1_txpolarity_in,gt1_rxlpmreset_in,gt1_rxlpmhfhold_in,gt1_rxlpmhfovrden_in,gt1_rxlpmlfhold_in,gt1_rxlpmlfovrden_in,gt1_txpostcursor_in[4:0],gt1_txprecursor_in[4:0],gt1_txdiffctrl_in[3:0],gt1_txinhibit_in,gt1_rxprbscntreset_in,gt1_rxprbserr_out,gt1_rxprbssel_in[2:0],gt1_txprbssel_in[2:0],gt1_txprbsforceerr_in,gt1_rxcdrhold_in,gt1_dmonitorout_out[14:0],gt1_rxdisperr_out[1:0],gt1_rxnotintable_out[1:0],gt1_rxcommadet_out,gt2_drpaddr[8:0],gt2_drpen,gt2_drpdi[15:0],gt2_drpdo[15:0],gt2_drprdy,gt2_drpwe,gt2_drp_busy,gt2_txpmareset_in,gt2_txpcsreset_in,gt2_txresetdone_out,gt2_rxpmareset_in,gt2_rxpcsreset_in,gt2_rxpmaresetdone_out,gt2_rxresetdone_out,gt2_rxbufstatus_out[2:0],gt2_txphaligndone_out,gt2_txphinitdone_out,gt2_txdlysresetdone_out,gt2_eyescantrigger_in,gt2_eyescanreset_in,gt2_eyescandataerror_out,gt2_rxrate_in[2:0],gt2_loopback_in[2:0],gt2_rxpolarity_in,gt2_txpolarity_in,gt2_rxlpmreset_in,gt2_rxlpmhfhold_in,gt2_rxlpmhfovrden_in,gt2_rxlpmlfhold_in,gt2_rxlpmlfovrden_in,gt2_txpostcursor_in[4:0],gt2_txprecursor_in[4:0],gt2_txdiffctrl_in[3:0],gt2_txinhibit_in,gt2_rxprbscntreset_in,gt2_rxprbserr_out,gt2_rxprbssel_in[2:0],gt2_txprbssel_in[2:0],gt2_txprbsforceerr_in,gt2_rxcdrhold_in,gt2_dmonitorout_out[14:0],gt2_rxdisperr_out[1:0],gt2_rxnotintable_out[1:0],gt2_rxcommadet_out,gt3_drpaddr[8:0],gt3_drpen,gt3_drpdi[15:0],gt3_drpdo[15:0],gt3_drprdy,gt3_drpwe,gt3_drp_busy,gt3_txpmareset_in,gt3_txpcsreset_in,gt3_txresetdone_out,gt3_rxpmareset_in,gt3_rxpcsreset_in,gt3_rxpmaresetdone_out,gt3_rxresetdone_out,gt3_rxbufstatus_out[2:0],gt3_txphaligndone_out,gt3_txphinitdone_out,gt3_txdlysresetdone_out,gt3_eyescantrigger_in,gt3_eyescanreset_in,gt3_eyescandataerror_out,gt3_rxrate_in[2:0],gt3_loopback_in[2:0],gt3_rxpolarity_in,gt3_txpolarity_in,gt3_rxlpmreset_in,gt3_rxlpmhfhold_in,gt3_rxlpmhfovrden_in,gt3_rxlpmlfhold_in,gt3_rxlpmlfovrden_in,gt3_txpostcursor_in[4:0],gt3_txprecursor_in[4:0],gt3_txdiffctrl_in[3:0],gt3_txinhibit_in,gt3_rxprbscntreset_in,gt3_rxprbserr_out,gt3_rxprbssel_in[2:0],gt3_txprbssel_in[2:0],gt3_txprbsforceerr_in,gt3_rxcdrhold_in,gt3_dmonitorout_out[14:0],gt3_rxdisperr_out[1:0],gt3_rxnotintable_out[1:0],gt3_rxcommadet_out,configuration_vector[6:0],status_vector[7:0]" */;
  input dclk;
  input reset;
  output clk156_out;
  output clk156_lock;
  input refclk;
  input [63:0]xgmii_txd;
  input [7:0]xgmii_txc;
  output [63:0]xgmii_rxd;
  output [7:0]xgmii_rxc;
  output xaui_tx_l0_p;
  output xaui_tx_l0_n;
  output xaui_tx_l1_p;
  output xaui_tx_l1_n;
  output xaui_tx_l2_p;
  output xaui_tx_l2_n;
  output xaui_tx_l3_p;
  output xaui_tx_l3_n;
  input xaui_rx_l0_p;
  input xaui_rx_l0_n;
  input xaui_rx_l1_p;
  input xaui_rx_l1_n;
  input xaui_rx_l2_p;
  input xaui_rx_l2_n;
  input xaui_rx_l3_p;
  input xaui_rx_l3_n;
  input [3:0]signal_detect;
  output [5:0]debug;
  input [8:0]gt0_drpaddr;
  input gt0_drpen;
  input [15:0]gt0_drpdi;
  output [15:0]gt0_drpdo;
  output gt0_drprdy;
  input gt0_drpwe;
  output gt0_drp_busy;
  input gt0_txpmareset_in;
  input gt0_txpcsreset_in;
  output gt0_txresetdone_out;
  input gt0_rxpmareset_in;
  input gt0_rxpcsreset_in;
  output gt0_rxpmaresetdone_out;
  output gt0_rxresetdone_out;
  output [2:0]gt0_rxbufstatus_out;
  output gt0_txphaligndone_out;
  output gt0_txphinitdone_out;
  output gt0_txdlysresetdone_out;
  output gt_qplllock_out;
  input gt0_eyescantrigger_in;
  input gt0_eyescanreset_in;
  output gt0_eyescandataerror_out;
  input [2:0]gt0_rxrate_in;
  input [2:0]gt0_loopback_in;
  input gt0_rxpolarity_in;
  input gt0_txpolarity_in;
  input gt0_rxlpmreset_in;
  input gt0_rxlpmhfhold_in;
  input gt0_rxlpmhfovrden_in;
  input gt0_rxlpmlfhold_in;
  input gt0_rxlpmlfovrden_in;
  input [4:0]gt0_txpostcursor_in;
  input [4:0]gt0_txprecursor_in;
  input [3:0]gt0_txdiffctrl_in;
  input gt0_txinhibit_in;
  input gt0_rxprbscntreset_in;
  output gt0_rxprbserr_out;
  input [2:0]gt0_rxprbssel_in;
  input [2:0]gt0_txprbssel_in;
  input gt0_txprbsforceerr_in;
  input gt0_rxcdrhold_in;
  output [14:0]gt0_dmonitorout_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  output gt0_rxcommadet_out;
  input [8:0]gt1_drpaddr;
  input gt1_drpen;
  input [15:0]gt1_drpdi;
  output [15:0]gt1_drpdo;
  output gt1_drprdy;
  input gt1_drpwe;
  output gt1_drp_busy;
  input gt1_txpmareset_in;
  input gt1_txpcsreset_in;
  output gt1_txresetdone_out;
  input gt1_rxpmareset_in;
  input gt1_rxpcsreset_in;
  output gt1_rxpmaresetdone_out;
  output gt1_rxresetdone_out;
  output [2:0]gt1_rxbufstatus_out;
  output gt1_txphaligndone_out;
  output gt1_txphinitdone_out;
  output gt1_txdlysresetdone_out;
  input gt1_eyescantrigger_in;
  input gt1_eyescanreset_in;
  output gt1_eyescandataerror_out;
  input [2:0]gt1_rxrate_in;
  input [2:0]gt1_loopback_in;
  input gt1_rxpolarity_in;
  input gt1_txpolarity_in;
  input gt1_rxlpmreset_in;
  input gt1_rxlpmhfhold_in;
  input gt1_rxlpmhfovrden_in;
  input gt1_rxlpmlfhold_in;
  input gt1_rxlpmlfovrden_in;
  input [4:0]gt1_txpostcursor_in;
  input [4:0]gt1_txprecursor_in;
  input [3:0]gt1_txdiffctrl_in;
  input gt1_txinhibit_in;
  input gt1_rxprbscntreset_in;
  output gt1_rxprbserr_out;
  input [2:0]gt1_rxprbssel_in;
  input [2:0]gt1_txprbssel_in;
  input gt1_txprbsforceerr_in;
  input gt1_rxcdrhold_in;
  output [14:0]gt1_dmonitorout_out;
  output [1:0]gt1_rxdisperr_out;
  output [1:0]gt1_rxnotintable_out;
  output gt1_rxcommadet_out;
  input [8:0]gt2_drpaddr;
  input gt2_drpen;
  input [15:0]gt2_drpdi;
  output [15:0]gt2_drpdo;
  output gt2_drprdy;
  input gt2_drpwe;
  output gt2_drp_busy;
  input gt2_txpmareset_in;
  input gt2_txpcsreset_in;
  output gt2_txresetdone_out;
  input gt2_rxpmareset_in;
  input gt2_rxpcsreset_in;
  output gt2_rxpmaresetdone_out;
  output gt2_rxresetdone_out;
  output [2:0]gt2_rxbufstatus_out;
  output gt2_txphaligndone_out;
  output gt2_txphinitdone_out;
  output gt2_txdlysresetdone_out;
  input gt2_eyescantrigger_in;
  input gt2_eyescanreset_in;
  output gt2_eyescandataerror_out;
  input [2:0]gt2_rxrate_in;
  input [2:0]gt2_loopback_in;
  input gt2_rxpolarity_in;
  input gt2_txpolarity_in;
  input gt2_rxlpmreset_in;
  input gt2_rxlpmhfhold_in;
  input gt2_rxlpmhfovrden_in;
  input gt2_rxlpmlfhold_in;
  input gt2_rxlpmlfovrden_in;
  input [4:0]gt2_txpostcursor_in;
  input [4:0]gt2_txprecursor_in;
  input [3:0]gt2_txdiffctrl_in;
  input gt2_txinhibit_in;
  input gt2_rxprbscntreset_in;
  output gt2_rxprbserr_out;
  input [2:0]gt2_rxprbssel_in;
  input [2:0]gt2_txprbssel_in;
  input gt2_txprbsforceerr_in;
  input gt2_rxcdrhold_in;
  output [14:0]gt2_dmonitorout_out;
  output [1:0]gt2_rxdisperr_out;
  output [1:0]gt2_rxnotintable_out;
  output gt2_rxcommadet_out;
  input [8:0]gt3_drpaddr;
  input gt3_drpen;
  input [15:0]gt3_drpdi;
  output [15:0]gt3_drpdo;
  output gt3_drprdy;
  input gt3_drpwe;
  output gt3_drp_busy;
  input gt3_txpmareset_in;
  input gt3_txpcsreset_in;
  output gt3_txresetdone_out;
  input gt3_rxpmareset_in;
  input gt3_rxpcsreset_in;
  output gt3_rxpmaresetdone_out;
  output gt3_rxresetdone_out;
  output [2:0]gt3_rxbufstatus_out;
  output gt3_txphaligndone_out;
  output gt3_txphinitdone_out;
  output gt3_txdlysresetdone_out;
  input gt3_eyescantrigger_in;
  input gt3_eyescanreset_in;
  output gt3_eyescandataerror_out;
  input [2:0]gt3_rxrate_in;
  input [2:0]gt3_loopback_in;
  input gt3_rxpolarity_in;
  input gt3_txpolarity_in;
  input gt3_rxlpmreset_in;
  input gt3_rxlpmhfhold_in;
  input gt3_rxlpmhfovrden_in;
  input gt3_rxlpmlfhold_in;
  input gt3_rxlpmlfovrden_in;
  input [4:0]gt3_txpostcursor_in;
  input [4:0]gt3_txprecursor_in;
  input [3:0]gt3_txdiffctrl_in;
  input gt3_txinhibit_in;
  input gt3_rxprbscntreset_in;
  output gt3_rxprbserr_out;
  input [2:0]gt3_rxprbssel_in;
  input [2:0]gt3_txprbssel_in;
  input gt3_txprbsforceerr_in;
  input gt3_rxcdrhold_in;
  output [14:0]gt3_dmonitorout_out;
  output [1:0]gt3_rxdisperr_out;
  output [1:0]gt3_rxnotintable_out;
  output gt3_rxcommadet_out;
  input [6:0]configuration_vector;
  output [7:0]status_vector;
endmodule

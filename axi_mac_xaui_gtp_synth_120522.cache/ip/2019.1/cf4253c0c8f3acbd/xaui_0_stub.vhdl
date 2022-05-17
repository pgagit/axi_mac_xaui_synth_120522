-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue May 17 06:39:01 2022
-- Host        : pc-140-151-2 running 64-bit Ubuntu 20.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xaui_0_stub.vhdl
-- Design      : xaui_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tifbv676-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    dclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk156_out : out STD_LOGIC;
    clk156_lock : out STD_LOGIC;
    refclk : in STD_LOGIC;
    xgmii_txd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xgmii_rxd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    xaui_tx_l0_p : out STD_LOGIC;
    xaui_tx_l0_n : out STD_LOGIC;
    xaui_tx_l1_p : out STD_LOGIC;
    xaui_tx_l1_n : out STD_LOGIC;
    xaui_tx_l2_p : out STD_LOGIC;
    xaui_tx_l2_n : out STD_LOGIC;
    xaui_tx_l3_p : out STD_LOGIC;
    xaui_tx_l3_n : out STD_LOGIC;
    xaui_rx_l0_p : in STD_LOGIC;
    xaui_rx_l0_n : in STD_LOGIC;
    xaui_rx_l1_p : in STD_LOGIC;
    xaui_rx_l1_n : in STD_LOGIC;
    xaui_rx_l2_p : in STD_LOGIC;
    xaui_rx_l2_n : in STD_LOGIC;
    xaui_rx_l3_p : in STD_LOGIC;
    xaui_rx_l3_n : in STD_LOGIC;
    signal_detect : in STD_LOGIC_VECTOR ( 3 downto 0 );
    debug : out STD_LOGIC_VECTOR ( 5 downto 0 );
    gt0_drpaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpen : in STD_LOGIC;
    gt0_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drprdy : out STD_LOGIC;
    gt0_drpwe : in STD_LOGIC;
    gt0_drp_busy : out STD_LOGIC;
    gt0_txpmareset_in : in STD_LOGIC;
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_txresetdone_out : out STD_LOGIC;
    gt0_rxpmareset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxpmaresetdone_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_txphaligndone_out : out STD_LOGIC;
    gt0_txphinitdone_out : out STD_LOGIC;
    gt0_txdlysresetdone_out : out STD_LOGIC;
    gt_qplllock_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxpolarity_in : in STD_LOGIC;
    gt0_txpolarity_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmhfovrden_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxlpmlfovrden_in : in STD_LOGIC;
    gt0_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt0_txinhibit_in : in STD_LOGIC;
    gt0_rxprbscntreset_in : in STD_LOGIC;
    gt0_rxprbserr_out : out STD_LOGIC;
    gt0_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_txprbsforceerr_in : in STD_LOGIC;
    gt0_rxcdrhold_in : in STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcommadet_out : out STD_LOGIC;
    gt1_drpaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpen : in STD_LOGIC;
    gt1_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drprdy : out STD_LOGIC;
    gt1_drpwe : in STD_LOGIC;
    gt1_drp_busy : out STD_LOGIC;
    gt1_txpmareset_in : in STD_LOGIC;
    gt1_txpcsreset_in : in STD_LOGIC;
    gt1_txresetdone_out : out STD_LOGIC;
    gt1_rxpmareset_in : in STD_LOGIC;
    gt1_rxpcsreset_in : in STD_LOGIC;
    gt1_rxpmaresetdone_out : out STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_txphaligndone_out : out STD_LOGIC;
    gt1_txphinitdone_out : out STD_LOGIC;
    gt1_txdlysresetdone_out : out STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxpolarity_in : in STD_LOGIC;
    gt1_txpolarity_in : in STD_LOGIC;
    gt1_rxlpmreset_in : in STD_LOGIC;
    gt1_rxlpmhfhold_in : in STD_LOGIC;
    gt1_rxlpmhfovrden_in : in STD_LOGIC;
    gt1_rxlpmlfhold_in : in STD_LOGIC;
    gt1_rxlpmlfovrden_in : in STD_LOGIC;
    gt1_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt1_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt1_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt1_txinhibit_in : in STD_LOGIC;
    gt1_rxprbscntreset_in : in STD_LOGIC;
    gt1_rxprbserr_out : out STD_LOGIC;
    gt1_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_txprbsforceerr_in : in STD_LOGIC;
    gt1_rxcdrhold_in : in STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcommadet_out : out STD_LOGIC;
    gt2_drpaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpen : in STD_LOGIC;
    gt2_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drprdy : out STD_LOGIC;
    gt2_drpwe : in STD_LOGIC;
    gt2_drp_busy : out STD_LOGIC;
    gt2_txpmareset_in : in STD_LOGIC;
    gt2_txpcsreset_in : in STD_LOGIC;
    gt2_txresetdone_out : out STD_LOGIC;
    gt2_rxpmareset_in : in STD_LOGIC;
    gt2_rxpcsreset_in : in STD_LOGIC;
    gt2_rxpmaresetdone_out : out STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_txphaligndone_out : out STD_LOGIC;
    gt2_txphinitdone_out : out STD_LOGIC;
    gt2_txdlysresetdone_out : out STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxpolarity_in : in STD_LOGIC;
    gt2_txpolarity_in : in STD_LOGIC;
    gt2_rxlpmreset_in : in STD_LOGIC;
    gt2_rxlpmhfhold_in : in STD_LOGIC;
    gt2_rxlpmhfovrden_in : in STD_LOGIC;
    gt2_rxlpmlfhold_in : in STD_LOGIC;
    gt2_rxlpmlfovrden_in : in STD_LOGIC;
    gt2_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt2_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt2_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt2_txinhibit_in : in STD_LOGIC;
    gt2_rxprbscntreset_in : in STD_LOGIC;
    gt2_rxprbserr_out : out STD_LOGIC;
    gt2_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_txprbsforceerr_in : in STD_LOGIC;
    gt2_rxcdrhold_in : in STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcommadet_out : out STD_LOGIC;
    gt3_drpaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpen : in STD_LOGIC;
    gt3_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drprdy : out STD_LOGIC;
    gt3_drpwe : in STD_LOGIC;
    gt3_drp_busy : out STD_LOGIC;
    gt3_txpmareset_in : in STD_LOGIC;
    gt3_txpcsreset_in : in STD_LOGIC;
    gt3_txresetdone_out : out STD_LOGIC;
    gt3_rxpmareset_in : in STD_LOGIC;
    gt3_rxpcsreset_in : in STD_LOGIC;
    gt3_rxpmaresetdone_out : out STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_txphaligndone_out : out STD_LOGIC;
    gt3_txphinitdone_out : out STD_LOGIC;
    gt3_txdlysresetdone_out : out STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxpolarity_in : in STD_LOGIC;
    gt3_txpolarity_in : in STD_LOGIC;
    gt3_rxlpmreset_in : in STD_LOGIC;
    gt3_rxlpmhfhold_in : in STD_LOGIC;
    gt3_rxlpmhfovrden_in : in STD_LOGIC;
    gt3_rxlpmlfhold_in : in STD_LOGIC;
    gt3_rxlpmlfovrden_in : in STD_LOGIC;
    gt3_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt3_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt3_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt3_txinhibit_in : in STD_LOGIC;
    gt3_rxprbscntreset_in : in STD_LOGIC;
    gt3_rxprbserr_out : out STD_LOGIC;
    gt3_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_txprbsforceerr_in : in STD_LOGIC;
    gt3_rxcdrhold_in : in STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcommadet_out : out STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 6 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dclk,reset,clk156_out,clk156_lock,refclk,xgmii_txd[63:0],xgmii_txc[7:0],xgmii_rxd[63:0],xgmii_rxc[7:0],xaui_tx_l0_p,xaui_tx_l0_n,xaui_tx_l1_p,xaui_tx_l1_n,xaui_tx_l2_p,xaui_tx_l2_n,xaui_tx_l3_p,xaui_tx_l3_n,xaui_rx_l0_p,xaui_rx_l0_n,xaui_rx_l1_p,xaui_rx_l1_n,xaui_rx_l2_p,xaui_rx_l2_n,xaui_rx_l3_p,xaui_rx_l3_n,signal_detect[3:0],debug[5:0],gt0_drpaddr[8:0],gt0_drpen,gt0_drpdi[15:0],gt0_drpdo[15:0],gt0_drprdy,gt0_drpwe,gt0_drp_busy,gt0_txpmareset_in,gt0_txpcsreset_in,gt0_txresetdone_out,gt0_rxpmareset_in,gt0_rxpcsreset_in,gt0_rxpmaresetdone_out,gt0_rxresetdone_out,gt0_rxbufstatus_out[2:0],gt0_txphaligndone_out,gt0_txphinitdone_out,gt0_txdlysresetdone_out,gt_qplllock_out,gt0_eyescantrigger_in,gt0_eyescanreset_in,gt0_eyescandataerror_out,gt0_rxrate_in[2:0],gt0_loopback_in[2:0],gt0_rxpolarity_in,gt0_txpolarity_in,gt0_rxlpmreset_in,gt0_rxlpmhfhold_in,gt0_rxlpmhfovrden_in,gt0_rxlpmlfhold_in,gt0_rxlpmlfovrden_in,gt0_txpostcursor_in[4:0],gt0_txprecursor_in[4:0],gt0_txdiffctrl_in[3:0],gt0_txinhibit_in,gt0_rxprbscntreset_in,gt0_rxprbserr_out,gt0_rxprbssel_in[2:0],gt0_txprbssel_in[2:0],gt0_txprbsforceerr_in,gt0_rxcdrhold_in,gt0_dmonitorout_out[14:0],gt0_rxdisperr_out[1:0],gt0_rxnotintable_out[1:0],gt0_rxcommadet_out,gt1_drpaddr[8:0],gt1_drpen,gt1_drpdi[15:0],gt1_drpdo[15:0],gt1_drprdy,gt1_drpwe,gt1_drp_busy,gt1_txpmareset_in,gt1_txpcsreset_in,gt1_txresetdone_out,gt1_rxpmareset_in,gt1_rxpcsreset_in,gt1_rxpmaresetdone_out,gt1_rxresetdone_out,gt1_rxbufstatus_out[2:0],gt1_txphaligndone_out,gt1_txphinitdone_out,gt1_txdlysresetdone_out,gt1_eyescantrigger_in,gt1_eyescanreset_in,gt1_eyescandataerror_out,gt1_rxrate_in[2:0],gt1_loopback_in[2:0],gt1_rxpolarity_in,gt1_txpolarity_in,gt1_rxlpmreset_in,gt1_rxlpmhfhold_in,gt1_rxlpmhfovrden_in,gt1_rxlpmlfhold_in,gt1_rxlpmlfovrden_in,gt1_txpostcursor_in[4:0],gt1_txprecursor_in[4:0],gt1_txdiffctrl_in[3:0],gt1_txinhibit_in,gt1_rxprbscntreset_in,gt1_rxprbserr_out,gt1_rxprbssel_in[2:0],gt1_txprbssel_in[2:0],gt1_txprbsforceerr_in,gt1_rxcdrhold_in,gt1_dmonitorout_out[14:0],gt1_rxdisperr_out[1:0],gt1_rxnotintable_out[1:0],gt1_rxcommadet_out,gt2_drpaddr[8:0],gt2_drpen,gt2_drpdi[15:0],gt2_drpdo[15:0],gt2_drprdy,gt2_drpwe,gt2_drp_busy,gt2_txpmareset_in,gt2_txpcsreset_in,gt2_txresetdone_out,gt2_rxpmareset_in,gt2_rxpcsreset_in,gt2_rxpmaresetdone_out,gt2_rxresetdone_out,gt2_rxbufstatus_out[2:0],gt2_txphaligndone_out,gt2_txphinitdone_out,gt2_txdlysresetdone_out,gt2_eyescantrigger_in,gt2_eyescanreset_in,gt2_eyescandataerror_out,gt2_rxrate_in[2:0],gt2_loopback_in[2:0],gt2_rxpolarity_in,gt2_txpolarity_in,gt2_rxlpmreset_in,gt2_rxlpmhfhold_in,gt2_rxlpmhfovrden_in,gt2_rxlpmlfhold_in,gt2_rxlpmlfovrden_in,gt2_txpostcursor_in[4:0],gt2_txprecursor_in[4:0],gt2_txdiffctrl_in[3:0],gt2_txinhibit_in,gt2_rxprbscntreset_in,gt2_rxprbserr_out,gt2_rxprbssel_in[2:0],gt2_txprbssel_in[2:0],gt2_txprbsforceerr_in,gt2_rxcdrhold_in,gt2_dmonitorout_out[14:0],gt2_rxdisperr_out[1:0],gt2_rxnotintable_out[1:0],gt2_rxcommadet_out,gt3_drpaddr[8:0],gt3_drpen,gt3_drpdi[15:0],gt3_drpdo[15:0],gt3_drprdy,gt3_drpwe,gt3_drp_busy,gt3_txpmareset_in,gt3_txpcsreset_in,gt3_txresetdone_out,gt3_rxpmareset_in,gt3_rxpcsreset_in,gt3_rxpmaresetdone_out,gt3_rxresetdone_out,gt3_rxbufstatus_out[2:0],gt3_txphaligndone_out,gt3_txphinitdone_out,gt3_txdlysresetdone_out,gt3_eyescantrigger_in,gt3_eyescanreset_in,gt3_eyescandataerror_out,gt3_rxrate_in[2:0],gt3_loopback_in[2:0],gt3_rxpolarity_in,gt3_txpolarity_in,gt3_rxlpmreset_in,gt3_rxlpmhfhold_in,gt3_rxlpmhfovrden_in,gt3_rxlpmlfhold_in,gt3_rxlpmlfovrden_in,gt3_txpostcursor_in[4:0],gt3_txprecursor_in[4:0],gt3_txdiffctrl_in[3:0],gt3_txinhibit_in,gt3_rxprbscntreset_in,gt3_rxprbserr_out,gt3_rxprbssel_in[2:0],gt3_txprbssel_in[2:0],gt3_txprbsforceerr_in,gt3_rxcdrhold_in,gt3_dmonitorout_out[14:0],gt3_rxdisperr_out[1:0],gt3_rxnotintable_out[1:0],gt3_rxcommadet_out,configuration_vector[6:0],status_vector[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xaui_v12_3_6,Vivado 2019.1";
begin
end;


-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity xaui_0_example_design is
    port (
      dclk_sf2                     : in  std_logic;
    --  reset                    : in  std_logic;
     -- xgmii_txd                : in  std_logic_vector(63 downto 0);
     -- xgmii_txc                : in  std_logic_vector(7 downto 0);
     -- xgmii_rxd                : out std_logic_vector(63 downto 0);
     -- xgmii_rxc                : out std_logic_vector(7 downto 0);
     -- clk156_out               : out std_logic;
      refclk_p                 : in  std_logic;
      refclk_n                 : in  std_logic;
     
      xaui_tx_l0_p             : out std_logic;
      xaui_tx_l0_n             : out std_logic;
      xaui_tx_l1_p             : out std_logic;
      xaui_tx_l1_n             : out std_logic;
      xaui_tx_l2_p             : out std_logic;
      xaui_tx_l2_n             : out std_logic;
      xaui_tx_l3_p             : out std_logic;
      xaui_tx_l3_n             : out std_logic;
      xaui_rx_l0_p             : in  std_logic;
      xaui_rx_l0_n             : in  std_logic;
      xaui_rx_l1_p             : in  std_logic;
      xaui_rx_l1_n             : in  std_logic;
      xaui_rx_l2_p             : in  std_logic;
      xaui_rx_l2_n             : in  std_logic;
      xaui_rx_l3_p             : in  std_logic;
      xaui_rx_l3_n             : in  std_logic
      --signal_detect            : in  std_logic_vector(3 downto 0);
      --align_status             : out std_logic;
      --sync_status              : out std_logic_vector(3 downto 0);
      --mgt_tx_ready             : out std_logic;
      --configuration_vector     : in  std_logic_vector(6 downto 0);
     -- status_vector            : out std_logic_vector(7 downto 0)
);
end xaui_0_example_design;

library ieee;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

architecture wrapper of xaui_0_example_design is
---------------------------
----------------------------------------------------------------------------
-- Component Declaration for the XAUI block level.
----------------------------------------------------------------------------
COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out5 : OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out6 : OUT  STD_LOGIC_VECTOR(0 DOWNTO 0)

  );
END COMPONENT;
COMPONENT ila_1

PORT (
	clk : IN STD_LOGIC;

	probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
    probe1 : IN STD_LOGIC_VECTOR(5 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(6 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe8 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe9 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe13 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe14 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe15 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe18 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe19 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	probe20 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe21 : IN STD_LOGIC_VECTOR(25 DOWNTO 0); 
	probe22 : IN STD_LOGIC_VECTOR(29 DOWNTO 0); 
	probe23 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe24 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe25 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe26 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe27 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe28 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe29 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe30 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
	probe31 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	probe32 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	probe33 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe34 : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
	probe35 : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
    probe36 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe37 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe38 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe39 : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
	
	

	
	
	
	
);
END COMPONENT  ;

-----------------------------------------------------------------------------
   -- AXI
   ------------------------------------
component MY_AXI_GEN_MASTER_TOP is
port (
        m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- whic lane is valid
		m_axis_tvalid_o : OUT STD_LOGIC;
		m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0); -- 4 byte
		m_axis_tready : IN STD_LOGIC; -- is mac ready to receive?
		m_axis_clk : IN STD_LOGIC;
		axi_start : IN STD_LOGIC;
		axi_reset : IN STD_LOGIC;
		m_axis_tlast_o : OUT STD_LOGIC;
		axi_modus : IN STD_LOGIC; -- 0 is normal 1 is const
		axi_gen_ether_type_in : IN unsigned (15 DOWNTO 0);
		AXI_CRC_CHECK_ENABLE : IN std_logic;
		interframe_gap_delay_clk_cycles : IN unsigned (7 downto 0 );
		insert_error_by_wrong_crc : IN std_logic
);
end component;



---- AXI checker should check the incoming data
 component AXI_CHECKER IS
    PORT (
        m_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- whic lane is valid
        m_axis_tvalid : IN STD_LOGIC;
        m_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0); -- 4 byte
        m_axis_tready : OUT STD_LOGIC; -- anyway 10GMAC dont sends this bit! It doesnt care about client state 
        m_axis_clk : IN STD_LOGIC;
        axi_start : IN STD_LOGIC;
        axi_reset : IN STD_LOGIC;
        m_axis_tlast : IN STD_LOGIC;
		axi_crc_check_ok : out std_logic
    );
END component AXI_CHECKER;

-----------------------------------------------------------------------------
   -- 10 GEMAC
   ------------------------------------


COMPONENT ten_gig_eth_mac_0
  PORT (
   tx_clk0 : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    tx_axis_aresetn : IN STD_LOGIC;
    tx_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    tx_axis_tvalid : IN STD_LOGIC;
    tx_axis_tlast : IN STD_LOGIC;
    tx_axis_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_axis_tready : OUT STD_LOGIC;
    tx_statistics_vector : OUT STD_LOGIC_VECTOR(25 DOWNTO 0);
    tx_statistics_valid : OUT STD_LOGIC;
    
    rx_axis_aresetn : IN STD_LOGIC;
    rx_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rx_axis_tvalid : OUT STD_LOGIC;
    rx_axis_tuser : OUT STD_LOGIC;
    rx_axis_tlast : OUT STD_LOGIC;
    rx_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_statistics_vector : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    rx_statistics_valid : OUT STD_LOGIC;
    pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    pause_req : IN STD_LOGIC;
    tx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
    rx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
    status_vector : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    tx_dcm_locked : IN STD_LOGIC;
    
    xgmii_txd : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    xgmii_txc : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_clk0 : IN STD_LOGIC;
    rx_dcm_locked : IN STD_LOGIC;
    xgmii_rxd : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    xgmii_rxc : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
   clk_wiz_50MHz_out          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;
 component xaui_0_support is
    port (
      dclk                     : in  std_logic;
      reset                    : in  std_logic;
      clk156_out               : out std_logic;
      clk156_lock              : out std_logic;
      refclk_p                 : in  std_logic;
      refclk_n                 : in  std_logic;
      refclk_out               : out std_logic;
      xgmii_txd                : in  std_logic_vector(63 downto 0);
      xgmii_txc                : in  std_logic_vector(7 downto 0);
      xgmii_rxd                : out std_logic_vector(63 downto 0);
      xgmii_rxc                : out std_logic_vector(7 downto 0);
      xaui_tx_l0_p             : out std_logic;
      xaui_tx_l0_n             : out std_logic;
      xaui_tx_l1_p             : out std_logic;
      xaui_tx_l1_n             : out std_logic;
      xaui_tx_l2_p             : out std_logic;
      xaui_tx_l2_n             : out std_logic;
      xaui_tx_l3_p             : out std_logic;
      xaui_tx_l3_n             : out std_logic;
      xaui_rx_l0_p             : in  std_logic;
      xaui_rx_l0_n             : in  std_logic;
      xaui_rx_l1_p             : in  std_logic;
      xaui_rx_l1_n             : in  std_logic;
      xaui_rx_l2_p             : in  std_logic;
      xaui_rx_l2_n             : in  std_logic;
      xaui_rx_l3_p             : in  std_logic;
      xaui_rx_l3_n             : in  std_logic;
      signal_detect            : in  std_logic_vector(3 downto 0);
      debug                    : out std_logic_vector(5 downto 0);
   -- GT Control Ports
   -- DRP
      gt0_drpaddr              : in  std_logic_vector(8 downto 0);
      gt0_drpen                : in  std_logic;
      gt0_drpdi                : in  std_logic_vector(15 downto 0);
      gt0_drpdo                : out std_logic_vector(15 downto 0);
      gt0_drprdy               : out std_logic;
      gt0_drpwe                : in  std_logic;
      gt0_drp_busy             : out std_logic;
   -- TX Reset and Initialisation
      gt0_txpmareset_in        : in std_logic;
      gt0_txpcsreset_in        : in std_logic;
      gt0_txresetdone_out      : out std_logic;
   -- RX Reset and Initialisation
      gt0_rxpmareset_in        : in std_logic;
      gt0_rxpcsreset_in        : in std_logic;
      gt0_rxpmaresetdone_out   : out std_logic;
      gt0_rxresetdone_out      : out std_logic;
   -- Clocking
      gt0_rxbufstatus_out      : out std_logic_vector(2 downto 0);
      gt0_txphaligndone_out    : out std_logic;
      gt0_txphinitdone_out     : out std_logic;
      gt0_txdlysresetdone_out  : out std_logic;
      gt_qplllock_out          : out std_logic;
   -- Signal Integrity adn Functionality
   -- Eye Scan
      gt0_eyescantrigger_in    : in  std_logic;
      gt0_eyescanreset_in      : in  std_logic;
      gt0_eyescandataerror_out : out std_logic;
      gt0_rxrate_in            : in  std_logic_vector(2 downto 0);
   -- Loopback
      gt0_loopback_in          : in  std_logic_vector(2 downto 0);
   -- Polarity
      gt0_rxpolarity_in        : in  std_logic;
      gt0_txpolarity_in        : in  std_logic;
   -- RX Decision Feedback Equalizer(DFE)
      gt0_rxlpmreset_in        : in  std_logic;
      gt0_rxlpmhfhold_in       : in  std_logic;
      gt0_rxlpmhfovrden_in     : in  std_logic;
      gt0_rxlpmlfhold_in       : in  std_logic;
      gt0_rxlpmlfovrden_in     : in  std_logic;
   -- TX Driver
      gt0_txpostcursor_in      : in std_logic_vector(4 downto 0);
      gt0_txprecursor_in       : in std_logic_vector(4 downto 0);
      gt0_txdiffctrl_in        : in std_logic_vector(3 downto 0);
      gt0_txinhibit_in         : in  std_logic;
   -- PRBS
      gt0_rxprbscntreset_in    : in  std_logic;
      gt0_rxprbserr_out        : out std_logic;
      gt0_rxprbssel_in         : in std_logic_vector(2 downto 0);
      gt0_txprbssel_in         : in std_logic_vector(2 downto 0);
      gt0_txprbsforceerr_in    : in std_logic;

      gt0_rxcdrhold_in         : in std_logic;

      gt0_dmonitorout_out      : out  std_logic_vector(14 downto 0);

   -- Status
      gt0_rxdisperr_out        : out std_logic_vector(1 downto 0);
      gt0_rxnotintable_out     : out std_logic_vector(1 downto 0);
      gt0_rxcommadet_out       : out std_logic;
   -- DRP
      gt1_drpaddr              : in  std_logic_vector(8 downto 0);
      gt1_drpen                : in  std_logic;
      gt1_drpdi                : in  std_logic_vector(15 downto 0);
      gt1_drpdo                : out std_logic_vector(15 downto 0);
      gt1_drprdy               : out std_logic;
      gt1_drpwe                : in  std_logic;
      gt1_drp_busy             : out std_logic;
   -- TX Reset and Initialisation
      gt1_txpmareset_in        : in std_logic;
      gt1_txpcsreset_in        : in std_logic;
      gt1_txresetdone_out      : out std_logic;
   -- RX Reset and Initialisation
      gt1_rxpmareset_in        : in std_logic;
      gt1_rxpcsreset_in        : in std_logic;
      gt1_rxpmaresetdone_out   : out std_logic;
      gt1_rxresetdone_out      : out std_logic;
   -- Clocking
      gt1_rxbufstatus_out      : out std_logic_vector(2 downto 0);
      gt1_txphaligndone_out    : out std_logic;
      gt1_txphinitdone_out     : out std_logic;
      gt1_txdlysresetdone_out  : out std_logic;
   -- Signal Integrity adn Functionality
   -- Eye Scan
      gt1_eyescantrigger_in    : in  std_logic;
      gt1_eyescanreset_in      : in  std_logic;
      gt1_eyescandataerror_out : out std_logic;
      gt1_rxrate_in            : in  std_logic_vector(2 downto 0);
   -- Loopback
      gt1_loopback_in          : in  std_logic_vector(2 downto 0);
   -- Polarity
      gt1_rxpolarity_in        : in  std_logic;
      gt1_txpolarity_in        : in  std_logic;
   -- RX Decision Feedback Equalizer(DFE)
      gt1_rxlpmreset_in        : in  std_logic;
      gt1_rxlpmhfhold_in       : in  std_logic;
      gt1_rxlpmhfovrden_in     : in  std_logic;
      gt1_rxlpmlfhold_in       : in  std_logic;
      gt1_rxlpmlfovrden_in     : in  std_logic;
   -- TX Driver
      gt1_txpostcursor_in      : in std_logic_vector(4 downto 0);
      gt1_txprecursor_in       : in std_logic_vector(4 downto 0);
      gt1_txdiffctrl_in        : in std_logic_vector(3 downto 0);
      gt1_txinhibit_in         : in  std_logic;
   -- PRBS
      gt1_rxprbscntreset_in    : in  std_logic;
      gt1_rxprbserr_out        : out std_logic;
      gt1_rxprbssel_in         : in std_logic_vector(2 downto 0);
      gt1_txprbssel_in         : in std_logic_vector(2 downto 0);
      gt1_txprbsforceerr_in    : in std_logic;

      gt1_rxcdrhold_in         : in std_logic;

      gt1_dmonitorout_out      : out  std_logic_vector(14 downto 0);

   -- Status
      gt1_rxdisperr_out        : out std_logic_vector(1 downto 0);
      gt1_rxnotintable_out     : out std_logic_vector(1 downto 0);
      gt1_rxcommadet_out       : out std_logic;
   -- DRP
      gt2_drpaddr              : in  std_logic_vector(8 downto 0);
      gt2_drpen                : in  std_logic;
      gt2_drpdi                : in  std_logic_vector(15 downto 0);
      gt2_drpdo                : out std_logic_vector(15 downto 0);
      gt2_drprdy               : out std_logic;
      gt2_drpwe                : in  std_logic;
      gt2_drp_busy             : out std_logic;
   -- TX Reset and Initialisation
      gt2_txpmareset_in        : in std_logic;
      gt2_txpcsreset_in        : in std_logic;
      gt2_txresetdone_out      : out std_logic;
   -- RX Reset and Initialisation
      gt2_rxpmareset_in        : in std_logic;
      gt2_rxpcsreset_in        : in std_logic;
      gt2_rxpmaresetdone_out   : out std_logic;
      gt2_rxresetdone_out      : out std_logic;
   -- Clocking
      gt2_rxbufstatus_out      : out std_logic_vector(2 downto 0);
      gt2_txphaligndone_out    : out std_logic;
      gt2_txphinitdone_out     : out std_logic;
      gt2_txdlysresetdone_out  : out std_logic;
   -- Signal Integrity adn Functionality
   -- Eye Scan
      gt2_eyescantrigger_in    : in  std_logic;
      gt2_eyescanreset_in      : in  std_logic;
      gt2_eyescandataerror_out : out std_logic;
      gt2_rxrate_in            : in  std_logic_vector(2 downto 0);
   -- Loopback
      gt2_loopback_in          : in  std_logic_vector(2 downto 0);
   -- Polarity
      gt2_rxpolarity_in        : in  std_logic;
      gt2_txpolarity_in        : in  std_logic;
   -- RX Decision Feedback Equalizer(DFE)
      gt2_rxlpmreset_in        : in  std_logic;
      gt2_rxlpmhfhold_in       : in  std_logic;
      gt2_rxlpmhfovrden_in     : in  std_logic;
      gt2_rxlpmlfhold_in       : in  std_logic;
      gt2_rxlpmlfovrden_in     : in  std_logic;
   -- TX Driver
      gt2_txpostcursor_in      : in std_logic_vector(4 downto 0);
      gt2_txprecursor_in       : in std_logic_vector(4 downto 0);
      gt2_txdiffctrl_in        : in std_logic_vector(3 downto 0);
      gt2_txinhibit_in         : in  std_logic;
   -- PRBS
      gt2_rxprbscntreset_in    : in  std_logic;
      gt2_rxprbserr_out        : out std_logic;
      gt2_rxprbssel_in         : in std_logic_vector(2 downto 0);
      gt2_txprbssel_in         : in std_logic_vector(2 downto 0);
      gt2_txprbsforceerr_in    : in std_logic;

      gt2_rxcdrhold_in         : in std_logic;

      gt2_dmonitorout_out      : out  std_logic_vector(14 downto 0);

   -- Status
      gt2_rxdisperr_out        : out std_logic_vector(1 downto 0);
      gt2_rxnotintable_out     : out std_logic_vector(1 downto 0);
      gt2_rxcommadet_out       : out std_logic;
   -- DRP
      gt3_drpaddr              : in  std_logic_vector(8 downto 0);
      gt3_drpen                : in  std_logic;
      gt3_drpdi                : in  std_logic_vector(15 downto 0);
      gt3_drpdo                : out std_logic_vector(15 downto 0);
      gt3_drprdy               : out std_logic;
      gt3_drpwe                : in  std_logic;
      gt3_drp_busy             : out std_logic;
   -- TX Reset and Initialisation
      gt3_txpmareset_in        : in std_logic;
      gt3_txpcsreset_in        : in std_logic;
      gt3_txresetdone_out      : out std_logic;
   -- RX Reset and Initialisation
      gt3_rxpmareset_in        : in std_logic;
      gt3_rxpcsreset_in        : in std_logic;
      gt3_rxpmaresetdone_out   : out std_logic;
      gt3_rxresetdone_out      : out std_logic;
   -- Clocking
      gt3_rxbufstatus_out      : out std_logic_vector(2 downto 0);
      gt3_txphaligndone_out    : out std_logic;
      gt3_txphinitdone_out     : out std_logic;
      gt3_txdlysresetdone_out  : out std_logic;
   -- Signal Integrity adn Functionality
   -- Eye Scan
      gt3_eyescantrigger_in    : in  std_logic;
      gt3_eyescanreset_in      : in  std_logic;
      gt3_eyescandataerror_out : out std_logic;
      gt3_rxrate_in            : in  std_logic_vector(2 downto 0);
   -- Loopback
      gt3_loopback_in          : in  std_logic_vector(2 downto 0);
   -- Polarity
      gt3_rxpolarity_in        : in  std_logic;
      gt3_txpolarity_in        : in  std_logic;
   -- RX Decision Feedback Equalizer(DFE)
      gt3_rxlpmreset_in        : in  std_logic;
      gt3_rxlpmhfhold_in       : in  std_logic;
      gt3_rxlpmhfovrden_in     : in  std_logic;
      gt3_rxlpmlfhold_in       : in  std_logic;
      gt3_rxlpmlfovrden_in     : in  std_logic;
   -- TX Driver
      gt3_txpostcursor_in      : in std_logic_vector(4 downto 0);
      gt3_txprecursor_in       : in std_logic_vector(4 downto 0);
      gt3_txdiffctrl_in        : in std_logic_vector(3 downto 0);
      gt3_txinhibit_in         : in  std_logic;
   -- PRBS
      gt3_rxprbscntreset_in    : in  std_logic;
      gt3_rxprbserr_out        : out std_logic;
      gt3_rxprbssel_in         : in std_logic_vector(2 downto 0);
      gt3_txprbssel_in         : in std_logic_vector(2 downto 0);
      gt3_txprbsforceerr_in    : in std_logic;

      gt3_rxcdrhold_in         : in std_logic;

      gt3_dmonitorout_out      : out  std_logic_vector(14 downto 0);

   -- Status
      gt3_rxdisperr_out        : out std_logic_vector(1 downto 0);
      gt3_rxnotintable_out     : out std_logic_vector(1 downto 0);
      gt3_rxcommadet_out       : out std_logic;
      configuration_vector     : in  std_logic_vector(6 downto 0);
      status_vector            : out std_logic_vector(7 downto 0)
);
end component;


----------------------------------------------------------------------------
-- Signal declarations.
----------------------------------------------------------------------------

    signal axi_crc_result_ok_vio : std_logic_vector(0 downto 0); 
    signal rx_polarities_vio : std_logic_vector( 3 downto 0);
    signal mac_started_ila : std_logic_vector(0 downto 0);
    signal mac_started : std_logic := '0';
    signal status_notaligned : std_logic := '1'; 
    signal status_aligned : std_logic:='0';
    signal dclk_counter : unsigned (7 downto 0) := (others =>  '0');

  SIGNAL pattern_generator_enable : STD_LOGIC := '1'; -- for enabling the pattern generator..

  SIGNAL toggle : STD_LOGIC := '0';

  SIGNAL dut_ready : STD_LOGIC := '0';
  SIGNAL enable_send_idle : unsigned (0 downto 0) := "1";
  SIGNAL configuration_vector : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  SIGNAL status_vector_design : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
  signal   signal_detect            :   std_logic_vector(3 downto 0);
 signal align_status             :  std_logic;
 signal sync_status              :  std_logic_vector(3 downto 0);
 signal mgt_tx_ready             :  std_logic;
 --signal configuration_vector     :   std_logic_vector(6 downto 0);
  signal status_vector            :  std_logic_vector(7 downto 0);
  signal reset : std_logic := '1';
  signal set_reset_flag : std_logic := '0';
  signal clk156_xaui_out               : std_logic;
  signal refclk                : std_logic;
  signal dclk_i                : std_logic;
  signal debug                 : std_logic_vector(5 downto 0);

  signal xgmii_txd_pipe        : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_txc_pipe        : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_rxd_pipe4       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_rxc_pipe4       : std_logic_vector(7 downto 0)  := (others => '0');

  signal xgmii_rxd_int         : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_rxc_int         : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_txd_pipe2       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_txd_pipe3       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_txd_pipe4       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_txc_pipe2       : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_txc_pipe3       : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_txc_pipe4       : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_rxd_pipe        : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_rxd_pipe2       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_rxc_pipe        : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_rxc_pipe2       : std_logic_vector(7 downto 0)  := (others => '0');
  signal xgmii_rxd_pipe3       : std_logic_vector(63 downto 0) := (others => '0');
  signal xgmii_rxc_pipe3       : std_logic_vector(7 downto 0)  := (others => '0');

  signal configuration_vector_pipe  : std_logic_vector(6 downto 0);
  signal configuration_vector_pipe2 : std_logic_vector(6 downto 0);
  signal configuration_vector_pipe3 : std_logic_vector(6 downto 0);
  signal signal_detect_pipe    : std_logic_vector(3 downto 0);
  signal signal_detect_pipe2   : std_logic_vector(3 downto 0);
  signal signal_detect_pipe3   : std_logic_vector(3 downto 0);
  SIGNAL counter_idle : unsigned(30 DOWNTO 0) := (others => '0'); -- counting idle frames
  SIGNAL enable_frame_send : unsigned (0 downto 0):= "1"; -- 
  signal reset_cnt : unsigned (20 downto 0) := (others => '0'); -- should count reset;
  signal reset_cnt2 : unsigned (20 downto 0) := (others => '0'); -- should count reset;

signal gt3_txresetdone_out : std_logic;
signal gt2_txresetdone_out : std_logic;
signal gt1_txresetdone_out : std_logic;
signal gt0_txresetdone_out : std_logic;

signal gt3_txresetdone_out_ila : std_logic_vector (0 downto 0);
signal gt2_txresetdone_out_ila : std_logic_vector (0 downto 0);
signal gt1_txresetdone_out_ila : std_logic_vector (0 downto 0);
signal gt0_txresetdone_out_ila : std_logic_vector (0 downto 0);

signal gtcharisk : std_logic_vector (0 downto 0);
signal gt_commadetect_ila : std_logic_vector(3 downto 0);


signal gt_tx_resetdone_out_ila : std_logic_vector( 3 downto 0);
signal status_mac_out : std_logic_vector( 2 downto 0);
signal tx_configuration_vector_mac : STD_LOGIC_VECTOR(79 DOWNTO 0):= X"0605040302da00000022";
signal rx_configuration_vector_mac : STD_LOGIC_VECTOR(79 DOWNTO 0):= X"0605040302da00000022"; 
signal reset_mac_tx : std_logic_vector (0 downto 0);
signal reset_mac_rx : std_logic_vector (0 downto 0);



signal gt0_rxnotintable_out_ila : std_logic_vector (1 downto 0);
signal gt1_rxnotintable_out_ila : std_logic_vector (1 downto 0);
signal gt2_rxnotintable_out_ila : std_logic_vector (1 downto 0);
signal gt3_rxnotintable_out_ila : std_logic_vector (1 downto 0);
--
signal gt0_rxdisperr_out_ila : std_logic_vector (1 downto 0);
signal gt1_rxdisperr_out_ila : std_logic_vector (1 downto 0);
signal gt2_rxdisperr_out_ila : std_logic_vector (1 downto 0);
signal gt3_rxdisperr_out_ila : std_logic_vector (1 downto 0);
--
  attribute SHREG_EXTRACT : string;

  attribute SHREG_EXTRACT of xgmii_txd_pipe : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txc_pipe : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxd_pipe4 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxc_pipe4 : signal is "no";

  attribute SHREG_EXTRACT of xgmii_txd_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txc_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txd_pipe3 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txc_pipe3 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txd_pipe4 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_txc_pipe4 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxd_pipe : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxc_pipe : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxd_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxc_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxd_pipe3 : signal is "no";
  attribute SHREG_EXTRACT of xgmii_rxc_pipe3 : signal is "no";

  attribute SHREG_EXTRACT of configuration_vector_pipe  : signal is "no";
  attribute SHREG_EXTRACT of configuration_vector_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of configuration_vector_pipe3 : signal is "no";
  attribute SHREG_EXTRACT of signal_detect_pipe  : signal is "no";
  attribute SHREG_EXTRACT of signal_detect_pipe2 : signal is "no";
  attribute SHREG_EXTRACT of signal_detect_pipe3 : signal is "no";
    SIGNAL xgmii_txd_simple_gen2 : STD_LOGIC_VECTOR(63 DOWNTO 0) := X"0707070707070707";
    SIGNAL xgmii_txc_simple_gen2 : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"FF";


SIGNAL xgmii_txd_mac_o : STD_LOGIC_VECTOR(63 DOWNTO 0) := X"0707070707070707";
SIGNAL xgmii_txc_mac_o : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"FF";
SIGNAL xgmii_txd_simple_gen_o : STD_LOGIC_VECTOR(63 DOWNTO 0) := X"0707070707070707";
SIGNAL xgmii_txc_simple_gen_o : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"FF";
signal clk_111m111 : std_logic;
signal clk_counter : unsigned (7 downto 0) := (others => '0');
signal clk156_counter : unsigned ( 7 downto 0) := ( others => '0');
signal clk156_counter2 : unsigned ( 30 downto 0) := ( others => '0');

signal ila_idle : std_logic_vector(0 downto 0) := "0";
signal clk156_lock : std_logic := '0';
signal clk156_locked_ila : std_logic_vector (0 downto 0) := (others => '0');
  SIGNAL counter_frame_send : unsigned(6 DOWNTO 0) := "0000000"; -- counting  frames
signal refclk_out_xaui_o : std_logic;
signal xgmii_txd_mac_i : std_logic_vector( 63 downto 0) :=(others => '0') ;
signal xgmii_txc_mac_i : std_logic_vector( 7 downto 0) :=(others => '0') ;
signal clk_wiz_50Hz_o : std_logic;
---axi
signal tx_axis_fifo_tdata           : std_logic_vector(63 downto 0);
signal tx_axis_fifo_tkeep           : std_logic_vector(7 downto 0);
signal tx_axis_fifo_tvalid          : std_logic;
signal tx_axis_fifo_tlast           : std_logic;
signal tx_axis_fifo_ready           : std_logic;
signal aresetn : std_logic := '0';
signal reset_ila : std_logic_vector ( 0 downto 0);
signal aresetn_ila : std_logic_vector ( 0 downto 0);
signal mac_status_vector_ila: std_logic_vector ( 2 downto 0);
--
signal vio_reset : std_logic_vector(0 downto 0);
signal MAC_RESET_IN : std_logic;
signal vio_MAC_reset : std_logic_vector(0 downto 0);
--rx 
signal rx_axis_tdata_mac_out : std_logic_vector(63 downto 0);
signal rx_axis_tkeep_mac_out : std_logic_vector(7 downto 0);
signal rx_axis_tvalid_mac_out : std_logic;
signal rx_axis_tlast_mac_out : std_logic;
--
signal tx_statistics_mac_out : std_logic_vector(25 downto 0);
signal rx_statistics_mac_out : std_logic_vector(29 downto 0);
signal rx_mac_stat_valid_out : std_logic;
signal tx_mac_stat_valid_out : std_logic;
signal rx_mac_stat_valid_out_ila : std_logic_vector(0 downto 0);
signal tx_mac_stat_valid_out_ila : std_logic_vector(0 downto 0);

signal axi_modus_vio : std_logic_vector(0 downto 0) := "1" ; -- init with one.. but why doesnt it work with 0?
signal axi_modus :std_logic;
signal insert_axo_crc_error : std_logic_vector(0 downto 0) := "0";

-----------------------------
--- begin architecture

begin

--axi_modus <= axi_modus xor axi_modus_vio(0);
MAC_RESET_IN<=vio_MAC_reset(0) or reset;
axi_modus <= '1';
rx_mac_stat_valid_out_ila(0) <= rx_mac_stat_valid_out;
tx_mac_stat_valid_out_ila(0) <= tx_mac_stat_valid_out;

clk156_locked_ila (0) <= clk156_lock;
gt3_txresetdone_out_ila(0) <= gt3_txresetdone_out;
gt2_txresetdone_out_ila(0) <= gt2_txresetdone_out;
gt1_txresetdone_out_ila(0) <= gt1_txresetdone_out;
gt0_txresetdone_out_ila(0) <= gt0_txresetdone_out;

mac_started_ila (0) <= mac_started;

--

aresetn<=not(reset);
reset_ila (0)<=  reset;
aresetn_ila (0)<= aresetn;
status_vector_design <= status_vector;

myvio : vio_0
  PORT MAP (
    clk => clk_111m111,
    probe_in0 => "0",
    probe_out0 => vio_reset,
    probe_in1 =>  "0",
    probe_in2 => insert_axo_crc_error, --- change it to output!
    probe_in3 =>  "0",
    probe_in4 =>  "0",
    probe_in5 =>  "0",
    probe_in6 =>  "0",
    probe_out1 => axi_modus_vio, ---- constant values = 1 or generator 64 .. 1500 = 0
    probe_out2 => rx_polarities_vio,
    probe_out3 => insert_axo_crc_error,
    probe_out4 => vio_MAC_reset,
    probe_out5 => reset_mac_rx,
    probe_out6 =>  reset_mac_tx

    
  );
  
ilacore2 : ila_1
PORT MAP (
	clk => refclk_out_xaui_o,

	probe0 => std_logic_vector(dclk_counter),
	probe1 => debug, 
	probe2 => status_vector, 
	probe3 => configuration_vector, 
	probe4 => xgmii_txd_mac_o, 
	probe5 => clk156_locked_ila, 
	probe6 => std_logic_vector(enable_frame_send),
	probe7 => std_logic_vector(enable_send_idle),
	probe8 => std_logic_vector(clk156_counter),
	probe9 => xgmii_rxd_int,
	probe10 =>reset_ila,
	probe11 => aresetn_ila, 
	--gtp
	probe12  => gt3_txresetdone_out_ila,-- 
	--
	probe13 => mac_status_vector_ila,
	--gtp
    probe14  => gt2_txresetdone_out_ila,-- 
	probe15  => gt1_txresetdone_out_ila,-- 
	probe16  => gt0_txresetdone_out_ila,-- 
    probe17 => ila_idle,
    probe18 => xgmii_txc_mac_o,
    probe19 => rx_axis_tdata_mac_out,
	probe20 => rx_axis_tkeep_mac_out,
	probe21 => tx_statistics_mac_out,
	probe22 =>rx_statistics_mac_out,
	probe23 => rx_mac_stat_valid_out_ila,
	probe24 => tx_mac_stat_valid_out_ila, 
	-- gtp
    probe25 => gt0_rxnotintable_out_ila,
    probe26 => gt1_rxnotintable_out_ila,
    probe27 => gt2_rxnotintable_out_ila,
    probe28 => gt3_rxnotintable_out_ila,
    ---- gtp
    probe29 =>gt0_rxdisperr_out_ila,
    probe30 =>gt1_rxdisperr_out_ila,
    probe31 =>gt2_rxdisperr_out_ila,
    probe32 =>gt3_rxdisperr_out_ila,
    --
    probe33 => mac_started_ila,
    probe34 => tx_configuration_vector_mac,
    probe35 => rx_configuration_vector_mac,
    probe36 => xgmii_rxc_int,
    probe37 =>gt_commadetect_ila,
    probe38 => axi_crc_result_ok_vio,
    probe39 => tx_axis_fifo_tdata
	-- add some status vector..
);
 -----------------------------------------------------------------------------
   --AXI Generator
   ------------------------------------
  
  axi_generator : MY_AXI_GEN_MASTER_TOP
port map(
    m_axis_tkeep => tx_axis_fifo_tkeep,
    m_axis_tvalid_o => tx_axis_fifo_tvalid,
    m_axis_tdata => tx_axis_fifo_tdata,
    m_axis_tready => tx_axis_fifo_ready, 
    ---
    m_axis_clk  => clk156_xaui_out,  -- transmitter clk..
    axi_start => '1',
    axi_reset => reset,
    m_axis_tlast_o => tx_axis_fifo_tlast ,
    axi_modus => axi_modus_vio(0), --- 1 for const mode , 0 for counting mode 
    axi_gen_ether_type_in => X"0080",
    AXI_CRC_CHECK_ENABLE => '1',
    interframe_gap_delay_clk_cycles => X"0A", -- clock cycles waiting before next frame sending
    insert_error_by_wrong_crc => insert_axo_crc_error(0)
  ); 
  
  
      -- AXI pattern Checker
    -- connect it to axi rx out of MAC
   my_axi_checker : AXI_CHECKER port map (
    m_axis_tkeep => rx_axis_tkeep_mac_out,
    m_axis_tvalid => rx_axis_tvalid_mac_out,
    m_axis_tdata => rx_axis_tdata_mac_out,
    m_axis_tready => open,--rx_axis_fifo_tready, 
    m_axis_clk  => clk156_xaui_out, 
    axi_start => '1',
    axi_reset => '0',
    m_axis_tlast => rx_axis_tlast_mac_out,  
    axi_crc_check_ok => axi_crc_result_ok_vio(0) 

  ); 
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
---- 10gemac 10gmac
mac1 : ten_gig_eth_mac_0
  PORT MAP (
       tx_clk0 => clk156_xaui_out,
    reset => MAC_RESET_IN,
    tx_axis_aresetn => aresetn, --aresetn.. is 1
    
    tx_axis_tdata => tx_axis_fifo_tdata,
    tx_axis_tvalid => tx_axis_fifo_tvalid,
    tx_axis_tlast => tx_axis_fifo_tlast,
    tx_axis_tuser => (others => '0'),
    --
    tx_ifg_delay => X"ff",
    tx_axis_tkeep => tx_axis_fifo_tkeep,
    tx_axis_tready => tx_axis_fifo_ready,
    --statistics TX
    tx_statistics_vector => tx_statistics_mac_out,
    tx_statistics_valid => tx_mac_stat_valid_out,
    -------------- RX
    rx_axis_aresetn => aresetn,
    --data
    rx_axis_tdata => rx_axis_tdata_mac_out,
    rx_axis_tvalid => rx_axis_tvalid_mac_out,
    rx_axis_tuser => open,
    rx_axis_tlast => rx_axis_tlast_mac_out,
    rx_axis_tkeep => rx_axis_tkeep_mac_out,
    --statistics
    rx_statistics_vector => rx_statistics_mac_out,
    rx_statistics_valid => rx_mac_stat_valid_out,
    pause_val => X"abcd",
    pause_req => '0',
    --
    tx_configuration_vector =>tx_configuration_vector_mac,-- bit 8 = 1 
    rx_configuration_vector => rx_configuration_vector_mac,
    
    status_vector => mac_status_vector_ila,
    tx_dcm_locked => '1',
    
    xgmii_txd => xgmii_txd_mac_o,--, --- goes to xaui input!
    xgmii_txc => xgmii_txc_mac_o,--xgmii_txc_i,
    
    rx_clk0 => clk156_xaui_out,
    rx_dcm_locked => '1',
    xgmii_rxd => xgmii_rxd_int, -- from xaui
    xgmii_rxc => xgmii_rxc_int
  );
      ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
--clkwiz_SF2_111_to_50MHz : clk_wiz_0
--   port map ( 
--  -- Clock out ports  
--   clk_wiz_50MHz_out => dclk_i,
--  -- Status and control signals                
--   reset => '0',
--   locked => open,
--   -- Clock in ports
--   clk_in1 => clk_111m111
-- );

    sf2_clk_buf: bufg
        port map (
            i => dclk_sf2,
            o => clk_111m111
        );

  xaui_support_i : xaui_0_support
    port map (
      dclk                      => clk_wiz_50Hz_o,
      reset                     => reset,
      clk156_out                => clk156_xaui_out,
      clk156_lock               => clk156_lock,
      --
      refclk_p                  => refclk_p,
      refclk_n                  => refclk_n,
      --
      refclk_out                => refclk_out_xaui_o,
      -- xaui input
      xgmii_txd                 => xgmii_txd_mac_o,
      xgmii_txc                 => xgmii_txc_mac_o,
      -- xaui output
      xgmii_rxd                 => xgmii_rxd_int,
      xgmii_rxc                 => xgmii_rxc_int,
      --
      xaui_tx_l0_p              => xaui_tx_l0_p,
      xaui_tx_l0_n              => xaui_tx_l0_n,
      xaui_tx_l1_p              => xaui_tx_l1_p,
      xaui_tx_l1_n              => xaui_tx_l1_n,
      xaui_tx_l2_p              => xaui_tx_l2_p,
      xaui_tx_l2_n              => xaui_tx_l2_n,
      xaui_tx_l3_p              => xaui_tx_l3_p,
      xaui_tx_l3_n              => xaui_tx_l3_n,
      --
      xaui_rx_l0_p              => xaui_rx_l0_p,
      xaui_rx_l0_n              => xaui_rx_l0_n,
      xaui_rx_l1_p              => xaui_rx_l1_p,
      xaui_rx_l1_n              => xaui_rx_l1_n,
      xaui_rx_l2_p              => xaui_rx_l2_p,
      xaui_rx_l2_n              => xaui_rx_l2_n,
      xaui_rx_l3_p              => xaui_rx_l3_p,
      xaui_rx_l3_n              => xaui_rx_l3_n,
      --
      signal_detect             => "1111",
      debug                     => debug,
   -- GT Control Ports
   -- DRP
       gt0_drpaddr              => (others => '0'),
       gt0_drpen                => '0', 
       gt0_drpdi                => (others => '0'),
       gt0_drpdo                => open,
       gt0_drprdy               => open,
       gt0_drpwe                => '0',
       gt0_drp_busy             => open,
   -- TX Reset and Initialisation
       gt0_txpmareset_in        => reset,--'0',-----------------------reset
       gt0_txpcsreset_in        => reset,--'0',
       gt0_txresetdone_out      => gt0_txresetdone_out,
   -- RX Reset and Initialisation
       gt0_rxpmareset_in        => '0',
       gt0_rxpcsreset_in        => '0',
       gt0_rxpmaresetdone_out   => open,
       gt0_rxresetdone_out      => open,
   -- Clocking
       gt0_rxbufstatus_out      => open,
       gt0_txphaligndone_out    => open,
       gt0_txphinitdone_out     => open,
       gt0_txdlysresetdone_out  => open,
       gt_qplllock_out                => open,
   -- Signal Integrity adn Functionality
   -- Eye Scan
       gt0_eyescantrigger_in    => '0',
       gt0_eyescanreset_in      => '0',
       gt0_eyescandataerror_out => open,
       gt0_rxrate_in            => "000",
   -- Loopback
       gt0_loopback_in          => "000",
   -- Polarity-------------------------------------Polarity
       gt0_rxpolarity_in        => rx_polarities_vio(0), --
       gt0_txpolarity_in        => '0',
   -- RX Decision Feedback Equalizer(DFE)
       gt0_rxlpmreset_in        => '0',
       gt0_rxlpmhfhold_in       => '0',
       gt0_rxlpmhfovrden_in     => '0',
       gt0_rxlpmlfhold_in       => '0',
       gt0_rxlpmlfovrden_in     => '0',
   -- TX Driver
       gt0_txdiffctrl_in        => "1000",
       gt0_txpostcursor_in      => "00000",
       gt0_txprecursor_in       => "00000",
       gt0_txinhibit_in         => '0',
   -- PRBS - GT
       gt0_rxprbscntreset_in    => '0',
       gt0_rxprbserr_out        => open,
       gt0_rxprbssel_in         => "000",
       gt0_txprbssel_in         => "000",
       gt0_txprbsforceerr_in    => '0',

       gt0_rxcdrhold_in         => '0',

       gt0_dmonitorout_out      => open,

   ------------------------------------------------- Status
       gt0_rxdisperr_out        => gt0_rxdisperr_out_ila,
       gt0_rxnotintable_out     => gt0_rxnotintable_out_ila,
       gt0_rxcommadet_out       => gt_commadetect_ila(0),
   -- DRP
       gt1_drpaddr              => (others => '0'),
       gt1_drpen                => '0',
       gt1_drpdi                => (others => '0'),
       gt1_drpdo                => open,
       gt1_drprdy               => open,
       gt1_drpwe                => '0',
       gt1_drp_busy             => open,
   -- TX Reset and Initialisation
       gt1_txpmareset_in        => reset,--'0',------------------reset
       gt1_txpcsreset_in        => reset,----'0',
       gt1_txresetdone_out      => gt1_txresetdone_out,
   -- RX Reset and Initialisation
       gt1_rxpmareset_in        => '0',
       gt1_rxpcsreset_in        => '0',
       gt1_rxpmaresetdone_out   => open,
       gt1_rxresetdone_out      => open,
   -- Clocking
       gt1_rxbufstatus_out      => open,
       gt1_txphaligndone_out    => open,
       gt1_txphinitdone_out     => open,
       gt1_txdlysresetdone_out  => open,
   -- Signal Integrity adn Functionality
   -- Eye Scan
       gt1_eyescantrigger_in    => '0',
       gt1_eyescanreset_in      => '0',
       gt1_eyescandataerror_out => open,
       gt1_rxrate_in            => "000",
   -- Loopback
       gt1_loopback_in          => "000",
   -- Polarity---------------------------------------Polarity
       gt1_rxpolarity_in        => rx_polarities_vio(1),
       gt1_txpolarity_in        => '1',
   -- RX Decision Feedback Equalizer(DFE)
       gt1_rxlpmreset_in        => '0',
       gt1_rxlpmhfhold_in       => '0',
       gt1_rxlpmhfovrden_in     => '0',
       gt1_rxlpmlfhold_in       => '0',
       gt1_rxlpmlfovrden_in     => '0',
   -- TX Driver
       gt1_txdiffctrl_in        => "1000",
       gt1_txpostcursor_in      => "00000",
       gt1_txprecursor_in       => "00000",
       gt1_txinhibit_in         => '0',
   -- PRBS - GT
       gt1_rxprbscntreset_in    => '0',
       gt1_rxprbserr_out        => open,
       gt1_rxprbssel_in         => "000",
       gt1_txprbssel_in         => "000",
       gt1_txprbsforceerr_in    => '0',

       gt1_rxcdrhold_in         => '0',

       gt1_dmonitorout_out      => open,

   ------------------------------------------------- Status
       gt1_rxdisperr_out        => gt1_rxdisperr_out_ila,
       gt1_rxnotintable_out     => gt1_rxnotintable_out_ila,
       gt1_rxcommadet_out       => gt_commadetect_ila(1),
   -- DRP
       gt2_drpaddr              => (others => '0'),
       gt2_drpen                => '0',
       gt2_drpdi                => (others => '0'),
       gt2_drpdo                => open,
       gt2_drprdy               => open,
       gt2_drpwe                => '0',
       gt2_drp_busy             => open,
   -- TX Reset and Initialisation
       gt2_txpmareset_in        => reset,-----------'0',--------------reset
       gt2_txpcsreset_in        => reset,----------------'0',
       gt2_txresetdone_out      => gt2_txresetdone_out,
   -- RX Reset and Initialisation
       gt2_rxpmareset_in        => '0',
       gt2_rxpcsreset_in        => '0',
       gt2_rxpmaresetdone_out   => open,
       gt2_rxresetdone_out      => open,
   -- Clocking
       gt2_rxbufstatus_out      => open,
       gt2_txphaligndone_out    => open,
       gt2_txphinitdone_out     => open,
       gt2_txdlysresetdone_out  => open,
   -- Signal Integrity adn Functionality
   -- Eye Scan
       gt2_eyescantrigger_in    => '0',
       gt2_eyescanreset_in      => '0',
       gt2_eyescandataerror_out => open,
       gt2_rxrate_in            => "000",
   -- Loopback
       gt2_loopback_in          => "000",
   -- Polarity-------------------------------------------Polarity
       gt2_rxpolarity_in        => rx_polarities_vio(2),
       gt2_txpolarity_in        => '0',
   -- RX Decision Feedback Equalizer(DFE)
       gt2_rxlpmreset_in        => '0',
       gt2_rxlpmhfhold_in       => '0',
       gt2_rxlpmhfovrden_in     => '0',
       gt2_rxlpmlfhold_in       => '0',
       gt2_rxlpmlfovrden_in     => '0',
   -- TX Driver
       gt2_txdiffctrl_in        => "1000",
       gt2_txpostcursor_in      => "00000",
       gt2_txprecursor_in       => "00000",
       gt2_txinhibit_in         => '0',
   -- PRBS - GT
       gt2_rxprbscntreset_in    => '0',
       gt2_rxprbserr_out        => open,
       gt2_rxprbssel_in         => "000",
       gt2_txprbssel_in         => "000",
       gt2_txprbsforceerr_in    => '0',

       gt2_rxcdrhold_in         => '0',

       gt2_dmonitorout_out      => open,

   ------------------------------------------------------------------- Status
       gt2_rxdisperr_out        => gt2_rxdisperr_out_ila,
       gt2_rxnotintable_out     => gt2_rxnotintable_out_ila,
       gt2_rxcommadet_out       => gt_commadetect_ila(2),
   -- DRP
       gt3_drpaddr              => (others => '0'),
       gt3_drpen                => '0',
       gt3_drpdi                => (others => '0'),
       gt3_drpdo                => open,
       gt3_drprdy               => open,
       gt3_drpwe                => '0',
       gt3_drp_busy             => open,
   -- TX Reset and Initialisation
       gt3_txpmareset_in        => reset,--'0',--------------reset
       gt3_txpcsreset_in        => reset,---'0',
       gt3_txresetdone_out      => gt3_txresetdone_out,
   -- RX Reset and Initialisation
       gt3_rxpmareset_in        => '0',
       gt3_rxpcsreset_in        => '0',
       gt3_rxpmaresetdone_out   => open,
       gt3_rxresetdone_out      => open,
   -- Clocking
       gt3_rxbufstatus_out      => open,
       gt3_txphaligndone_out    => open,
       gt3_txphinitdone_out     => open,
       gt3_txdlysresetdone_out  => open,
   -- Signal Integrity adn Functionality
   -- Eye Scan
       gt3_eyescantrigger_in    => '0',
       gt3_eyescanreset_in      => '0',
       gt3_eyescandataerror_out => open,
       gt3_rxrate_in            => "000",
   -- Loopback
       gt3_loopback_in          => "000",
   -- Polarity-------------------------------------------------Polarity
       gt3_rxpolarity_in        => rx_polarities_vio(3),
       gt3_txpolarity_in        => '1',
   -- RX Decision Feedback Equalizer(DFE)
       gt3_rxlpmreset_in        => '0',
       gt3_rxlpmhfhold_in       => '0',
       gt3_rxlpmhfovrden_in     => '0',
       gt3_rxlpmlfhold_in       => '0',
       gt3_rxlpmlfovrden_in     => '0',
   -- TX Driver
       gt3_txdiffctrl_in        => "1000",
       gt3_txpostcursor_in      => "00000",
       gt3_txprecursor_in       => "00000",
       gt3_txinhibit_in         => '0',
   -- PRBS - GT
       gt3_rxprbscntreset_in    => '0',
       gt3_rxprbserr_out        => open,
       gt3_rxprbssel_in         => "000",
       gt3_txprbssel_in         => "000",
       gt3_txprbsforceerr_in    => '0',

       gt3_rxcdrhold_in         => '0',

       gt3_dmonitorout_out      => open,

   ----------------------------------------------------- Status
       gt3_rxdisperr_out        => gt3_rxdisperr_out_ila,
       gt3_rxnotintable_out     => gt3_rxnotintable_out_ila,
       gt3_rxcommadet_out       => gt_commadetect_ila(3),
       --
      configuration_vector      => configuration_vector, --toggle!
      status_vector             => status_vector
);

  -- Generate DCLK -------------
  -- This should be a stable clock to the support level. The core should be
  -- held in reset until this clock is available. For the purposes of the
  -- example design it is assumed to be a free running clock
--   dclk_bufg_i : BUFG
--     port map (
--       I => dclk,
--       O => dclk_i);

--  clk156_out_ddr : ODDR
--    port map (
--      Q  => open,-- clk156_out,
--      D1 => '0',
--      D2 => '1',
--      C  => clk156,
--      CE => '1',
--      R  => '0',
--      S  => '0');
wizclock156in50out : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_wiz_50MHz_out =>clk_wiz_50Hz_o  ,
  -- Status and control signals                
   reset =>'0',
   locked => open,
   -- Clock in ports
   clk_in1 => clk156_xaui_out
 );
  mgt_tx_ready <= debug(0);
  sync_status  <= debug(4 downto 1);
  align_status <= debug(5);
---
---- this is a simple xgmii pattern generator which should provide MAC-like Frames for XAUI 
 p_xgmii_tx_stimulus : PROCESS (refclk_out_xaui_o)
  BEGIN
   
          ---after each case it increases by 1
        if rising_edge(refclk_out_xaui_o) then
                IF counter_frame_send = 0 THEN
                  xgmii_txd_simple_gen_o <= X"d5555555555555fb"; -- 7 Byte preamble 
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"01";
                ELSIF counter_frame_send = 1 THEN
                  xgmii_txd_simple_gen_o <=X"0123456789ACDFFF";--- X"12DA649D99B1964A";
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"00";
                ELSIF counter_frame_send = 2 THEN
                  xgmii_txd_simple_gen_o <=X"0123456789ACDFFF";-- X"55AA2E0006050403";
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"00";
                ELSIF counter_frame_send >= 3 and counter_frame_send <= 7 THEN
                  xgmii_txd_simple_gen_o <= X"55AA55AAAA55AA55";
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"00";
                
                ELSIF counter_frame_send = 8 THEN
                  xgmii_txd_simple_gen_o <= X"70CB2707AA55AA55";
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"00";
                ELSIF counter_frame_send = 9 THEN
                  --counter_frame_send <= "0000000"; --reset
                  xgmii_txd_simple_gen_o(63 DOWNTO 0) <= X"07070707070707fd"; ---FRAME END
                  xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"FF";
                ELSE
                ---  send idle...
                      xgmii_txd_simple_gen_o(63 DOWNTO 0) <= X"0707070707070707"; ---FRAME END
                      xgmii_txc_simple_gen_o(7 DOWNTO 0) <= X"FF";
                END IF;
             counter_frame_send <= counter_frame_send + 1; -- 2^ 7 = 128

             else
             -- noting
             end if;
 
  END PROCESS p_xgmii_tx_stimulus;
 ---------------------------------------------------
  -- process: Read status_vector until no faults are
  -- reported then signal the DUT is ready to the rest of the
  -- Design/Testbench.
  -- rising refclk_p
  p_config_status_vector2 : PROCESS (refclk_out_xaui_o)
  BEGIN
    IF rising_edge(refclk_out_xaui_o) THEN---0
    
               -- configuration_vector(0) <= '1';
                  IF  status_vector_design /= "11111100" THEN--0
                           --configuration_vector(0) <= '1'; -- set loopback
                                                            IF toggle = '0' THEN
                                                              configuration_vector(2) <= '1';
                                                              configuration_vector(3) <= '1';
                                                             --  <= X"0707070707070707";
                                                             -- xgmii_txc_simple_gen2 <= X"11";
                                                              toggle <= '1';
                                                            ELSIF toggle = '1' THEN
                                                            configuration_vector <= (others => '0');
                                                               -- configuration_vector(2) <= '0';
                                                              --configuration_vector(3) <= '0';
                                                              toggle <= '0';
                                                            END IF;-- 1
                          ELSE---0
                         --    xgmii_txd_simple_gen2 <= X"3333222211110000";
                       --       xgmii_txc_simple_gen2 <= X"00";
                            dut_ready <= '1';
                    
                    
            
                  END IF;---- 0
   
    END IF;
  END PROCESS p_config_status_vector2;
  ----
  -- reset xaui core and xgmac core
  -- counts up , when reaches 200 then it sets reset to 0.
  -- 200 * 6.4 ns > 1200 ns
  ----
  p_reset : process ( refclk_out_xaui_o, reset)
   begin
--   if ( rising_edge(refclk_out_xaui_o) ) then
--   ---case 1 -- not aligned
--       if ( status_vector_design /= "11111100")  then
--           status_notaligned <= '1';
--           status_aligned <= '0';
--       else 
--          status_aligned <= '1';
--          status_notaligned <= '0';
    
--       end if;
--   ----
--   if ( status_notaligned = '1')then
--     --- if it waited about 2 ms and after this status is not valid ask for reset by a setting a flag
--     -- attention this reset_cnt counts really long and doesnt work in simulatio
--     -- u would wait like 2 hours for >another<  toggle
     
--        if to_integer(reset_cnt) >= 0  and to_integer(reset_cnt) <=700  then
--         reset <= '1' xor  vio_reset(0);
--         reset_cnt2 <= (others => '0'); -- reset reset counter2        

--         else  -- after 700 ns
--          reset <= '0' xor  vio_reset(0);
--            reset_cnt2 <= reset_cnt2 +1;

--         end if;
--   else
   
--   end if;
   
   
   
   --- if it is aligned then just use this configuration:
--   if status_aligned = '1' then
--      reset <= '0' xor  vio_reset(0);

--   else
--   end if;
--        reset_cnt <= reset_cnt +1 ;

   
   
       
     -- after 700 ns reset to 0
     -- or if reset flag = 1 to 1
  
--   end if;

   if ( rising_edge(refclk_out_xaui_o) ) then
   
        reset_cnt <= reset_cnt +1 ;
             if to_integer(reset_cnt) >= 200 then
              reset <= '0' xor vio_reset(0); -- init reset
             else
              end if; 
            
            
             if reset = '1' then
               reset_cnt2 <= (others => '0');
               else
               reset_cnt2 <= reset_cnt2 + 1; 
             end if;
    end if;
  end process;
  
  
  p_mac_reset_logic : process ( refclk_out_xaui_o)
  begin 
    if ( reset = '1')then
      rx_configuration_vector_mac <= X"0605040302da00000023";
      tx_configuration_vector_mac <= X"0605040302da00000023";
      mac_started <= '0';
  else
        rx_configuration_vector_mac <= X"0605040302da00000022";
        tx_configuration_vector_mac <= X"0605040302da00000022";
        
 tx_configuration_vector_mac(0) <=  reset_mac_tx(0);
rx_configuration_vector_mac(0) <=  reset_mac_rx(0);
  end if;
--  ---- if resetted   
--  if ( reset = '1')then
--   rx_configuration_vector_mac <= X"0605040302da00000023";
--      tx_configuration_vector_mac <= X"0605040302da00000023";
--      mac_started <= '0';
--  else

--  end if;
--  --- 
--  -- if reset is realed toggle one bit for some time
--if (reset = '0' ) then   
--    if (mac_started = '0' and  to_integer (reset_cnt2) <= 700  )then
--    rx_configuration_vector_mac <= X"0605040302da00000022";
--    tx_configuration_vector_mac <= X"0605040302da00000022";
--    else
--    --..
--    end if;
     
--     if ( mac_started = '0' and to_integer (reset_cnt2) > 700 and  to_integer (reset_cnt2) <=1000 )then
--            rx_configuration_vector_mac <= X"0605040302da00000023";
--            tx_configuration_vector_mac <= X"0605040302da00000023";
--     else
--     end if;
        
--    if ( mac_started = '0' and ( to_integer (reset_cnt2)  > 1000)) then
--        mac_started <= '1';
--        rx_configuration_vector_mac <= X"0605040302da00000022";
--        tx_configuration_vector_mac <= X"0605040302da00000022";
--     else
--     end if;
    
-- end if;---- reset 0

 
    
  

  end process;
  
  
  
   p_detect_clk156 : process(clk156_xaui_out)
   begin
  if (rising_edge(clk156_xaui_out)) then
  clk156_counter <= clk156_counter +1;
  else
  end if; 
  end process;
  
  
    p_detect_dclk : process(clk_111m111)
   begin
  if (rising_edge(clk_111m111)) then
  dclk_counter <= dclk_counter +1;
  else
  end if; 
  end process;
  
  
  
  
  p_polarity_modifiert : process(clk_111m111)
  begin
  
  --rx_polarities
  
  end process;
  
  
  
  
  
  
  
end wrapper;

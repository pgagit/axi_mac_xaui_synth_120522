################################################################
# Transceiver Placement
################################################################

# Transceiver Placement
# Transceivers should be adjacent to allow timing constraints to be met
# easily. Full details of available transceiver locations can be found
# in the appropriate transceiver User Guide, or use the Transceiver
# Wizard.
# These are sample constraints, please use correct ones for your device
set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt3_xaui_0_gt_wrapper_i/gtpe2_i}]
set_property LOC GTPE2_CHANNEL_X0Y7 [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt2_xaui_0_gt_wrapper_i/gtpe2_i}]
set_property LOC GTPE2_CHANNEL_X0Y6 [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt1_xaui_0_gt_wrapper_i/gtpe2_i}]
set_property PACKAGE_PIN A13 [get_ports xaui_rx_l1_n]
set_property PACKAGE_PIN A9 [get_ports xaui_tx_l1_n]
set_property LOC GTPE2_CHANNEL_X0Y5 [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt0_xaui_0_gt_wrapper_i/gtpe2_i}]

################################################################
# Timing Constraints
################################################################

#create_clock -period 20.00 [get_ports dclk]



################################################## Clocks:
### PROPERTIES
## 10G (mgt216) = 156,25 MHz
# only E13 and F13 are connected @ board
set_property PACKAGE_PIN F13 [get_ports refclk_p]
set_property PACKAGE_PIN E13 [get_ports refclk_n]


## 111.111 MHz SF2 to A7
# for dclk GTP
set_property PACKAGE_PIN M16 [get_ports dclk_sf2]
#set_property PACKAGE_PIN M17 [get_ports sf2_a7_diff0n_io]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dclk_sf2_IBUF]
#set_false_path -to [get_ports dclk_sf2]
## SF2 <=> A7 i/f
set_property IOSTANDARD LVCMOS15 [get_ports dclk_sf2]
#set_property IOSTANDARD LVCMOS15 [get_ports sf2_a7_diff0n_io]
set_property PULLUP true [get_ports dclk_sf2]
#set_property PULLUP true [get_ports sf2_a7_diff0n_io]

### CREATE CLOCK
# Misc.-purpose main clock inputs
## for xaui refclk (156,25 MHz):
create_clock -period 6.400 [get_ports refclk_p]
create_clock -period 6.400 [get_ports refclk_n]

create_clock -period 9.000 [get_ports dclk_sf2]

#set_property	PACKAGE_PIN	A11	[	get_ports	xaui_rx_l0_n]
#set_property	PACKAGE_PIN	B11	[	get_ports	xaui_rx_l0_p]
##
#set_property	PACKAGE_PIN	D12	[	get_ports	xaui_rx_l3_p	]
#set_property	PACKAGE_PIN	C12	[	get_ports	xaui_rx_l3_n	]
##
#set_property	PACKAGE_PIN	D14	[	get_ports	xaui_rx_l1_p	]
#set_property	PACKAGE_PIN	C14	[	get_ports	xaui_rx_l1_n	]
##
#set_property	PACKAGE_PIN	B13	[	get_ports	xaui_rx_l2_p	]
#set_property	PACKAGE_PIN	A13	[	get_ports	xaui_rx_l2_n	]
##	a7(xaui)(tx)	->	phy	(rx)
#set_property	PACKAGE_PIN	C8	[	get_ports	xaui_tx_l1_p ]
#set_property	PACKAGE_PIN	D8	[	get_ports	xaui_tx_l1_n	]
##
#set_property	PACKAGE_PIN	B9	[	get_ports	xaui_tx_l2_p	]
#set_property	PACKAGE_PIN	A9	[	get_ports	xaui_tx_l2_n	]
##
#set_property	PACKAGE_PIN	D10	[	get_ports	xaui_tx_l3_p	]
#set_property	PACKAGE_PIN	C10	[	get_ports	xaui_tx_l3_n	]
##
#set_property	PACKAGE_PIN	B7	[	get_ports	xaui_tx_l0_p]
#set_property	PACKAGE_PIN	A7	[	get_ports	xaui_tx_l0_n	]



#      xaui_tx_l0_p             : out std_logic;
#      xaui_tx_l0_n             : out std_logic;
#      xaui_tx_l1_p             : out std_logic;
#      xaui_tx_l1_n             : out std_logic;
#      xaui_tx_l2_p             : out std_logic;
#      xaui_tx_l2_n             : out std_logic;
#      xaui_tx_l3_p             : out std_logic;
#      xaui_tx_l3_n             : out std_logic;
#      xaui_rx_l0_p             : in  std_logic;
#      xaui_rx_l0_n             : in  std_logic;
#      xaui_rx_l1_p             : in  std_logic;
#      xaui_rx_l1_n             : in  std_logic;
#      xaui_rx_l2_p             : in  std_logic;
#      xaui_rx_l2_n             : in  std_logic;
#      xaui_rx_l3_p             : in  std_logic;
#      xaui_rx_l3_n             : in  std_logic

set_property PACKAGE_PIN C14 [get_ports xaui_rx_l0_n]
set_property PACKAGE_PIN C8 [get_ports xaui_tx_l0_n]

set_property PACKAGE_PIN C12 [get_ports xaui_rx_l2_n]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_111m111]

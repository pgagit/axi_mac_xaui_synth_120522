set_property SRC_FILE_INFO {cfile:/home/alexander.kohn/MYREPO2/axi_mac_xaui_GTP_synth/axi_mac_xaui_GTP_synth.srcs/sources_1/ip/ten_gig_eth_mac_0/synth/ten_gig_eth_mac_0.xdc rfile:../../../../../axi_mac_xaui_GTP_synth/axi_mac_xaui_GTP_synth.srcs/sources_1/ip/ten_gig_eth_mac_0/synth/ten_gig_eth_mac_0.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
current_instance U0
set_property src_info {type:SCOPED_XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 6.4000 -datapath_only -from [get_cells ten_gig_eth_mac_0_core/rx/rx_pause_control/pause_quanta_reg[*]] -to [get_cells ten_gig_eth_mac_0_core/tx/tx_cntl/pause_tx_quanta_reg[*]]

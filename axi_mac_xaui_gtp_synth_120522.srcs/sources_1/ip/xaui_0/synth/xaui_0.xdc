create_clock -period 6.40 [get_pins -of_objects [get_cells * -hierarchical -filter {REF_NAME=~ GTPE2_CHANNEL && NAME =~ *gt0*}] -filter {NAME =~ *TXOUTCLK}]

##################################################################
# Clock domain crossing constraints                              #
##################################################################

## set false path synchronizers
set_false_path -to   [get_cells -hierarchical -filter {NAME =~ *reset_count_done_sync_i/sync1_r_reg[0]}]

set_false_path -to   [get_cells -hierarchical -filter {NAME =~ *plllocked_sync_i/sync1_r_reg[0]}]

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *mgt_rxresetdone_*_sync_i/sync1_r_reg[0]}]

set_false_path -from [get_cells -hierarchical -filter {NAME =~ */gt*_xaui_0_gt_wrapper_i/gtrxrate_seq_i/rxrate_o_reg[*]}] -to [get_pins -hierarchical -filter {NAME =~ */gt*_xaui_0_gt_wrapper_i/gtpe2_i/RXRATE[*]}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~ */gt*_xaui_0_gt_wrapper_i/gtrxrate_seq_i/rxrate_o_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~ */gt*_xaui_0_gt_wrapper_i/cdc_rxrate_out*.sync_RXRATE_OUT/data_sync_reg1}]

set_false_path -to [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt0_xaui_0_gt_wrapper_i/gtrxreset_seq_i/drp_op_done_o_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt1_xaui_0_gt_wrapper_i/gtrxreset_seq_i/drp_op_done_o_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt2_xaui_0_gt_wrapper_i/gtrxreset_seq_i/drp_op_done_o_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */gt_wrapper_i/gt3_xaui_0_gt_wrapper_i/gtrxreset_seq_i/drp_op_done_o_reg}]

set_false_path -from [get_cells -hierarchical -filter {NAME =~ *uclk_mgt_rx_reset_reg}] -to [get_cells -hierarchical -filter {NAME =~ *mgt_rx_reset_pulse_stretcher_i/sync_r_reg[*]}]

set_case_analysis 0 [get_ports configuration_vector]

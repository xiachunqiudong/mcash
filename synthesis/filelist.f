$MCASH_HOME/simulation/src/tb/mcash_tb.sv
$MCASH_HOME/simulation/src/dumper/mcash_dumper.sv

$MCASH_HOME/simulation/src/commons/ram_sp.v
$MCASH_HOME/synthesis/src/commons/round_robin_arbiter.v
$MCASH_HOME/synthesis/src/commons/rob_id_gen.v

$MCASH_HOME/synthesis/src/mcash_top.v

$MCASH_HOME/synthesis/src/bank/bank_top_wrapper.v
$MCASH_HOME/synthesis/src/bank/bank_top.v
# HIT TEST UNIT
$MCASH_HOME/synthesis/src/bank/bank_htu_top.v
$MCASH_HOME/synthesis/src/bank/bank_htu_set_entry.v
$MCASH_HOME/synthesis/src/bank/bank_htu_cacheline.v
$MCASH_HOME/synthesis/src/bank/bank_htu_offset.v
$MCASH_HOME/synthesis/src/bank/bank_htu_plru_tree.v
$MCASH_HOME/synthesis/src/bank/bank_isu_top.v
$MCASH_HOME/synthesis/src/bank/bank_isu_iq.v
$MCASH_HOME/synthesis/src/bank/bank_isu_linefill_buffer.v
$MCASH_HOME/synthesis/src/bank/bank_sram_controller.v
$MCASH_HOME/synthesis/src/bank/bank_wbuffer.v
$MCASH_HOME/synthesis/src/bank/bank_biu_top.v

$MCASH_HOME/synthesis/src/cross_bar/channel_entry_rr.v
$MCASH_HOME/synthesis/src/cross_bar/bank_ch_rr.v
$MCASH_HOME/synthesis/src/cross_bar/cross_bar_core.v
$MCASH_HOME/synthesis/src/cross_bar/cross_bar_core_buffer.v
$MCASH_HOME/synthesis/src/cross_bar/cross_bar_top.v
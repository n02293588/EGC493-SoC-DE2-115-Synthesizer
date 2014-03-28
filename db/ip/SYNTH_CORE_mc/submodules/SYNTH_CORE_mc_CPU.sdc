# Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	SYNTH_CORE_mc_CPU 	SYNTH_CORE_mc_CPU:*
set 	SYNTH_CORE_mc_CPU_oci 	SYNTH_CORE_mc_CPU_nios2_oci:the_SYNTH_CORE_mc_CPU_nios2_oci
set 	SYNTH_CORE_mc_CPU_oci_break 	SYNTH_CORE_mc_CPU_nios2_oci_break:the_SYNTH_CORE_mc_CPU_nios2_oci_break
set 	SYNTH_CORE_mc_CPU_ocimem 	SYNTH_CORE_mc_CPU_nios2_ocimem:the_SYNTH_CORE_mc_CPU_nios2_ocimem
set 	SYNTH_CORE_mc_CPU_oci_debug 	SYNTH_CORE_mc_CPU_nios2_oci_debug:the_SYNTH_CORE_mc_CPU_nios2_oci_debug
set 	SYNTH_CORE_mc_CPU_wrapper 	SYNTH_CORE_mc_CPU_jtag_debug_module_wrapper:the_SYNTH_CORE_mc_CPU_jtag_debug_module_wrapper
set 	SYNTH_CORE_mc_CPU_jtag_tck 	SYNTH_CORE_mc_CPU_jtag_debug_module_tck:the_SYNTH_CORE_mc_CPU_jtag_debug_module_tck
set 	SYNTH_CORE_mc_CPU_jtag_sysclk 	SYNTH_CORE_mc_CPU_jtag_debug_module_sysclk:the_SYNTH_CORE_mc_CPU_jtag_debug_module_sysclk
set 	SYNTH_CORE_mc_CPU_oci_path 	 [format "%s|%s" $SYNTH_CORE_mc_CPU $SYNTH_CORE_mc_CPU_oci]
set 	SYNTH_CORE_mc_CPU_oci_break_path 	 [format "%s|%s" $SYNTH_CORE_mc_CPU_oci_path $SYNTH_CORE_mc_CPU_oci_break]
set 	SYNTH_CORE_mc_CPU_ocimem_path 	 [format "%s|%s" $SYNTH_CORE_mc_CPU_oci_path $SYNTH_CORE_mc_CPU_ocimem]
set 	SYNTH_CORE_mc_CPU_oci_debug_path 	 [format "%s|%s" $SYNTH_CORE_mc_CPU_oci_path $SYNTH_CORE_mc_CPU_oci_debug]
set 	SYNTH_CORE_mc_CPU_jtag_tck_path 	 [format "%s|%s|%s" $SYNTH_CORE_mc_CPU_oci_path $SYNTH_CORE_mc_CPU_wrapper $SYNTH_CORE_mc_CPU_jtag_tck]
set 	SYNTH_CORE_mc_CPU_jtag_sysclk_path 	 [format "%s|%s|%s" $SYNTH_CORE_mc_CPU_oci_path $SYNTH_CORE_mc_CPU_wrapper $SYNTH_CORE_mc_CPU_jtag_sysclk]
set 	SYNTH_CORE_mc_CPU_jtag_sr 	 [format "%s|*sr" $SYNTH_CORE_mc_CPU_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_break_path|break_readreg*] -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr*]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_debug_path|*resetlatch]     -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr[33]]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_debug_path|monitor_ready]  -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr[0]]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_debug_path|monitor_error]  -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr[34]]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_ocimem_path|*MonDReg*] -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr*]
set_false_path -from *$SYNTH_CORE_mc_CPU_jtag_sr*    -to *$SYNTH_CORE_mc_CPU_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$SYNTH_CORE_mc_CPU_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$SYNTH_CORE_mc_CPU_oci_debug_path|monitor_go
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_break_path|dbrk_hit?_latch] -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr*]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_break_path|trigbrktype] -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr*]
set_false_path -from [get_keepers *$SYNTH_CORE_mc_CPU_oci_break_path|trigger_state] -to [get_keepers *$SYNTH_CORE_mc_CPU_jtag_sr*]

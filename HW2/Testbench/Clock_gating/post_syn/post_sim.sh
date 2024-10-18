#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW2/Testbench/Clock_gating/post_syn/testbench2.v \
~/HDL/HW2/GateLevel/Clock_gating/dc_out_file/hw2_clock_gating_syn.v \
/cad/CBDK/ADFP/Executable_Package/Collaterals/IP/stdcell/N16ADFP_StdCell/VERILOG/N16ADFP_StdCell.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+am.fsdb +neg_tchk

#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW3/Testbench/post_syn/tb_thumb.v \
~/HDL/HW3/GateLevel/Area/dc_out_file/thumb.v \
/cad/CBDK/ADFP/Executable_Package/Collaterals/IP/stdcell/N16ADFP_StdCell/VERILOG/N16ADFP_StdCell.v \
+full64 \
+lint=TFIPC-L \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+tb_thumb.fsdb +neg_tchk

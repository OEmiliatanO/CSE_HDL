#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW3/Testbench/pre_syn/tb_thumb.v \
~/HDL/HW3/RTL/thumb.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+tb_thumb.fsdb +v2k

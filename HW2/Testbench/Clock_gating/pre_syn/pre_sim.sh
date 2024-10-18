#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW2/Testbench/Clock_gating/pre_syn/testbench2.v \
~/HDL/HW2/RTL/Clock_gating/clock_gating.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+am.fsdb +v2k

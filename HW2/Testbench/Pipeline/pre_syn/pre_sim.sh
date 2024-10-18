#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW2/Testbench/Pipeline/pre_syn/testbench2.v \
~/HDL/HW2/RTL/Pipeline/pipeline.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+am.fsdb +v2k

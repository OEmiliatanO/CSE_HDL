#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW2/Testbench/Non_pipeline/pre_syn/testbench2.v \
~/HDL/HW2/RTL/Non_pipeline/non_pipeline.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+am.fsdb +v2k

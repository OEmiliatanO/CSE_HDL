#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW1/pre_sim/TB.v \
~/HDL/HW1/RTL/D_FF.v \
~/HDL/HW1/RTL/adder_structure.v \
~/HDL/HW1/RTL/adder_structure_reg.v \
~/HDL/HW1/RTL/adder_dataflow.v \
~/HDL/HW1/RTL/adder_dataflow_reg.v \
~/HDL/HW1/RTL/adder_behavior.v \
~/HDL/HW1/RTL/adder_behavior_reg.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+6adder.fsdb +v2k

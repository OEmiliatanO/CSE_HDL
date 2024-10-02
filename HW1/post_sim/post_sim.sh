#!/bin/tcsh

vcs -R -error=noMPD \
~/HDL/HW1/post_sim/TB.v \
~/HDL/HW1/GateLevel/D_FF/D_FF.v \
~/HDL/HW1/GateLevel/adder_structure/delay/adder_structure.v \
~/HDL/HW1/GateLevel/adder_structure_reg/delay/adder_structure_reg.v \
~/HDL/HW1/GateLevel/adder_dataflow/delay/adder_dataflow.v \
~/HDL/HW1/GateLevel/adder_dataflow_reg/delay/adder_dataflow_reg.v \
~/HDL/HW1/GateLevel/adder_behavior/delay/adder_behavior.v \
~/HDL/HW1/GateLevel/adder_behavior_reg/delay/adder_behavior_reg.v \
/cad/CBDK/ADFP/Executable_Package/Collaterals/IP/stdcell/N16ADFP_StdCell/VERILOG/N16ADFP_StdCell.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+6adder.fsdb +neg_tchk

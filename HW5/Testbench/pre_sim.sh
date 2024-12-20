#!/bin/tcsh

vcs -R -debug_access+all \
~/HDL/HW5/Testbench/tb.v \
~/HDL/HW5/RTL/LineBuffer.v \
~/HDL/HW5/RTL/Conv.v \
~/HDL/HW5/RTL/ReLU.v \
+full64 \
+systemverilogext+.v \
+access+r +v2k

###################################################################

# Created by write_sdc on Mon Sep 30 13:27:39 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
set_max_area 0
set_ideal_network [get_ports clk]
create_clock [get_ports clk]  -period 0.037037  -waveform {0 0.0185185}
set_input_delay -clock clk  0  [get_ports {si[31]}]
set_input_delay -clock clk  0  [get_ports {si[30]}]
set_input_delay -clock clk  0  [get_ports {si[29]}]
set_input_delay -clock clk  0  [get_ports {si[28]}]
set_input_delay -clock clk  0  [get_ports {si[27]}]
set_input_delay -clock clk  0  [get_ports {si[26]}]
set_input_delay -clock clk  0  [get_ports {si[25]}]
set_input_delay -clock clk  0  [get_ports {si[24]}]
set_input_delay -clock clk  0  [get_ports {si[23]}]
set_input_delay -clock clk  0  [get_ports {si[22]}]
set_input_delay -clock clk  0  [get_ports {si[21]}]
set_input_delay -clock clk  0  [get_ports {si[20]}]
set_input_delay -clock clk  0  [get_ports {si[19]}]
set_input_delay -clock clk  0  [get_ports {si[18]}]
set_input_delay -clock clk  0  [get_ports {si[17]}]
set_input_delay -clock clk  0  [get_ports {si[16]}]
set_input_delay -clock clk  0  [get_ports {si[15]}]
set_input_delay -clock clk  0  [get_ports {si[14]}]
set_input_delay -clock clk  0  [get_ports {si[13]}]
set_input_delay -clock clk  0  [get_ports {si[12]}]
set_input_delay -clock clk  0  [get_ports {si[11]}]
set_input_delay -clock clk  0  [get_ports {si[10]}]
set_input_delay -clock clk  0  [get_ports {si[9]}]
set_input_delay -clock clk  0  [get_ports {si[8]}]
set_input_delay -clock clk  0  [get_ports {si[7]}]
set_input_delay -clock clk  0  [get_ports {si[6]}]
set_input_delay -clock clk  0  [get_ports {si[5]}]
set_input_delay -clock clk  0  [get_ports {si[4]}]
set_input_delay -clock clk  0  [get_ports {si[3]}]
set_input_delay -clock clk  0  [get_ports {si[2]}]
set_input_delay -clock clk  0  [get_ports {si[1]}]
set_input_delay -clock clk  0  [get_ports {si[0]}]
set_input_delay -clock clk  0  [get_ports ci]
set_output_delay -clock clk  0  [get_ports {so[31]}]
set_output_delay -clock clk  0  [get_ports {so[30]}]
set_output_delay -clock clk  0  [get_ports {so[29]}]
set_output_delay -clock clk  0  [get_ports {so[28]}]
set_output_delay -clock clk  0  [get_ports {so[27]}]
set_output_delay -clock clk  0  [get_ports {so[26]}]
set_output_delay -clock clk  0  [get_ports {so[25]}]
set_output_delay -clock clk  0  [get_ports {so[24]}]
set_output_delay -clock clk  0  [get_ports {so[23]}]
set_output_delay -clock clk  0  [get_ports {so[22]}]
set_output_delay -clock clk  0  [get_ports {so[21]}]
set_output_delay -clock clk  0  [get_ports {so[20]}]
set_output_delay -clock clk  0  [get_ports {so[19]}]
set_output_delay -clock clk  0  [get_ports {so[18]}]
set_output_delay -clock clk  0  [get_ports {so[17]}]
set_output_delay -clock clk  0  [get_ports {so[16]}]
set_output_delay -clock clk  0  [get_ports {so[15]}]
set_output_delay -clock clk  0  [get_ports {so[14]}]
set_output_delay -clock clk  0  [get_ports {so[13]}]
set_output_delay -clock clk  0  [get_ports {so[12]}]
set_output_delay -clock clk  0  [get_ports {so[11]}]
set_output_delay -clock clk  0  [get_ports {so[10]}]
set_output_delay -clock clk  0  [get_ports {so[9]}]
set_output_delay -clock clk  0  [get_ports {so[8]}]
set_output_delay -clock clk  0  [get_ports {so[7]}]
set_output_delay -clock clk  0  [get_ports {so[6]}]
set_output_delay -clock clk  0  [get_ports {so[5]}]
set_output_delay -clock clk  0  [get_ports {so[4]}]
set_output_delay -clock clk  0  [get_ports {so[3]}]
set_output_delay -clock clk  0  [get_ports {so[2]}]
set_output_delay -clock clk  0  [get_ports {so[1]}]
set_output_delay -clock clk  0  [get_ports {so[0]}]
set_output_delay -clock clk  0  [get_ports co]

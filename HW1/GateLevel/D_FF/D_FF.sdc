###################################################################

# Created by write_sdc on Tue Oct  1 21:08:06 2024

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
set_input_delay -clock clk  0  [get_ports d]
set_output_delay -clock clk  0  [get_ports q]

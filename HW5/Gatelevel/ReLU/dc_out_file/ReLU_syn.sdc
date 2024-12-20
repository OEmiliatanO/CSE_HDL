###################################################################

# Created by write_sdc on Thu Dec 19 01:26:00 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
create_clock -name clk  -period 0.3  -waveform {0 0.15}
set_max_delay 0.3  -from [list [get_ports {x[35]}] [get_ports {x[34]}] [get_ports {x[33]}]       \
[get_ports {x[32]}] [get_ports {x[31]}] [get_ports {x[30]}] [get_ports         \
{x[29]}] [get_ports {x[28]}] [get_ports {x[27]}] [get_ports {x[26]}]           \
[get_ports {x[25]}] [get_ports {x[24]}] [get_ports {x[23]}] [get_ports         \
{x[22]}] [get_ports {x[21]}] [get_ports {x[20]}] [get_ports {x[19]}]           \
[get_ports {x[18]}] [get_ports {x[17]}] [get_ports {x[16]}] [get_ports         \
{x[15]}] [get_ports {x[14]}] [get_ports {x[13]}] [get_ports {x[12]}]           \
[get_ports {x[11]}] [get_ports {x[10]}] [get_ports {x[9]}] [get_ports {x[8]}]  \
[get_ports {x[7]}] [get_ports {x[6]}] [get_ports {x[5]}] [get_ports {x[4]}]    \
[get_ports {x[3]}] [get_ports {x[2]}] [get_ports {x[1]}] [get_ports {x[0]}]]  -to [list [get_ports {y[35]}] [get_ports {y[34]}] [get_ports {y[33]}]         \
[get_ports {y[32]}] [get_ports {y[31]}] [get_ports {y[30]}] [get_ports         \
{y[29]}] [get_ports {y[28]}] [get_ports {y[27]}] [get_ports {y[26]}]           \
[get_ports {y[25]}] [get_ports {y[24]}] [get_ports {y[23]}] [get_ports         \
{y[22]}] [get_ports {y[21]}] [get_ports {y[20]}] [get_ports {y[19]}]           \
[get_ports {y[18]}] [get_ports {y[17]}] [get_ports {y[16]}] [get_ports         \
{y[15]}] [get_ports {y[14]}] [get_ports {y[13]}] [get_ports {y[12]}]           \
[get_ports {y[11]}] [get_ports {y[10]}] [get_ports {y[9]}] [get_ports {y[8]}]  \
[get_ports {y[7]}] [get_ports {y[6]}] [get_ports {y[5]}] [get_ports {y[4]}]    \
[get_ports {y[3]}] [get_ports {y[2]}] [get_ports {y[1]}] [get_ports {y[0]}]]
set_input_delay -clock clk  0  [get_ports {x[35]}]
set_input_delay -clock clk  0  [get_ports {x[34]}]
set_input_delay -clock clk  0  [get_ports {x[33]}]
set_input_delay -clock clk  0  [get_ports {x[32]}]
set_input_delay -clock clk  0  [get_ports {x[31]}]
set_input_delay -clock clk  0  [get_ports {x[30]}]
set_input_delay -clock clk  0  [get_ports {x[29]}]
set_input_delay -clock clk  0  [get_ports {x[28]}]
set_input_delay -clock clk  0  [get_ports {x[27]}]
set_input_delay -clock clk  0  [get_ports {x[26]}]
set_input_delay -clock clk  0  [get_ports {x[25]}]
set_input_delay -clock clk  0  [get_ports {x[24]}]
set_input_delay -clock clk  0  [get_ports {x[23]}]
set_input_delay -clock clk  0  [get_ports {x[22]}]
set_input_delay -clock clk  0  [get_ports {x[21]}]
set_input_delay -clock clk  0  [get_ports {x[20]}]
set_input_delay -clock clk  0  [get_ports {x[19]}]
set_input_delay -clock clk  0  [get_ports {x[18]}]
set_input_delay -clock clk  0  [get_ports {x[17]}]
set_input_delay -clock clk  0  [get_ports {x[16]}]
set_input_delay -clock clk  0  [get_ports {x[15]}]
set_input_delay -clock clk  0  [get_ports {x[14]}]
set_input_delay -clock clk  0  [get_ports {x[13]}]
set_input_delay -clock clk  0  [get_ports {x[12]}]
set_input_delay -clock clk  0  [get_ports {x[11]}]
set_input_delay -clock clk  0  [get_ports {x[10]}]
set_input_delay -clock clk  0  [get_ports {x[9]}]
set_input_delay -clock clk  0  [get_ports {x[8]}]
set_input_delay -clock clk  0  [get_ports {x[7]}]
set_input_delay -clock clk  0  [get_ports {x[6]}]
set_input_delay -clock clk  0  [get_ports {x[5]}]
set_input_delay -clock clk  0  [get_ports {x[4]}]
set_input_delay -clock clk  0  [get_ports {x[3]}]
set_input_delay -clock clk  0  [get_ports {x[2]}]
set_input_delay -clock clk  0  [get_ports {x[1]}]
set_input_delay -clock clk  0  [get_ports {x[0]}]
set_output_delay -clock clk  0  [get_ports {y[35]}]
set_output_delay -clock clk  0  [get_ports {y[34]}]
set_output_delay -clock clk  0  [get_ports {y[33]}]
set_output_delay -clock clk  0  [get_ports {y[32]}]
set_output_delay -clock clk  0  [get_ports {y[31]}]
set_output_delay -clock clk  0  [get_ports {y[30]}]
set_output_delay -clock clk  0  [get_ports {y[29]}]
set_output_delay -clock clk  0  [get_ports {y[28]}]
set_output_delay -clock clk  0  [get_ports {y[27]}]
set_output_delay -clock clk  0  [get_ports {y[26]}]
set_output_delay -clock clk  0  [get_ports {y[25]}]
set_output_delay -clock clk  0  [get_ports {y[24]}]
set_output_delay -clock clk  0  [get_ports {y[23]}]
set_output_delay -clock clk  0  [get_ports {y[22]}]
set_output_delay -clock clk  0  [get_ports {y[21]}]
set_output_delay -clock clk  0  [get_ports {y[20]}]
set_output_delay -clock clk  0  [get_ports {y[19]}]
set_output_delay -clock clk  0  [get_ports {y[18]}]
set_output_delay -clock clk  0  [get_ports {y[17]}]
set_output_delay -clock clk  0  [get_ports {y[16]}]
set_output_delay -clock clk  0  [get_ports {y[15]}]
set_output_delay -clock clk  0  [get_ports {y[14]}]
set_output_delay -clock clk  0  [get_ports {y[13]}]
set_output_delay -clock clk  0  [get_ports {y[12]}]
set_output_delay -clock clk  0  [get_ports {y[11]}]
set_output_delay -clock clk  0  [get_ports {y[10]}]
set_output_delay -clock clk  0  [get_ports {y[9]}]
set_output_delay -clock clk  0  [get_ports {y[8]}]
set_output_delay -clock clk  0  [get_ports {y[7]}]
set_output_delay -clock clk  0  [get_ports {y[6]}]
set_output_delay -clock clk  0  [get_ports {y[5]}]
set_output_delay -clock clk  0  [get_ports {y[4]}]
set_output_delay -clock clk  0  [get_ports {y[3]}]
set_output_delay -clock clk  0  [get_ports {y[2]}]
set_output_delay -clock clk  0  [get_ports {y[1]}]
set_output_delay -clock clk  0  [get_ports {y[0]}]

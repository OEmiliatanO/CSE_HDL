###################################################################

# Created by write_sdc on Tue Nov 19 00:28:19 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
create_clock -name clk  -period 0.31  -waveform {0 0.155}
set_max_delay 0.31  -from [list [get_ports {R[7]}] [get_ports {R[6]}] [get_ports {R[5]}]          \
[get_ports {R[4]}] [get_ports {R[3]}] [get_ports {R[2]}] [get_ports {R[1]}]    \
[get_ports {R[0]}] [get_ports {G[7]}] [get_ports {G[6]}] [get_ports {G[5]}]    \
[get_ports {G[4]}] [get_ports {G[3]}] [get_ports {G[2]}] [get_ports {G[1]}]    \
[get_ports {G[0]}] [get_ports {B[7]}] [get_ports {B[6]}] [get_ports {B[5]}]    \
[get_ports {B[4]}] [get_ports {B[3]}] [get_ports {B[2]}] [get_ports {B[1]}]    \
[get_ports {B[0]}]]  -to [list [get_ports {Y[19]}] [get_ports {Y[18]}] [get_ports {Y[17]}]         \
[get_ports {Y[16]}] [get_ports {Y[15]}] [get_ports {Y[14]}] [get_ports         \
{Y[13]}] [get_ports {Y[12]}] [get_ports {Y[11]}] [get_ports {Y[10]}]           \
[get_ports {Y[9]}] [get_ports {Y[8]}] [get_ports {Y[7]}] [get_ports {Y[6]}]    \
[get_ports {Y[5]}] [get_ports {Y[4]}] [get_ports {Y[3]}] [get_ports {Y[2]}]    \
[get_ports {Y[1]}] [get_ports {Y[0]}]]
set_input_delay -clock clk  0  [get_ports {R[7]}]
set_input_delay -clock clk  0  [get_ports {R[6]}]
set_input_delay -clock clk  0  [get_ports {R[5]}]
set_input_delay -clock clk  0  [get_ports {R[4]}]
set_input_delay -clock clk  0  [get_ports {R[3]}]
set_input_delay -clock clk  0  [get_ports {R[2]}]
set_input_delay -clock clk  0  [get_ports {R[1]}]
set_input_delay -clock clk  0  [get_ports {R[0]}]
set_input_delay -clock clk  0  [get_ports {G[7]}]
set_input_delay -clock clk  0  [get_ports {G[6]}]
set_input_delay -clock clk  0  [get_ports {G[5]}]
set_input_delay -clock clk  0  [get_ports {G[4]}]
set_input_delay -clock clk  0  [get_ports {G[3]}]
set_input_delay -clock clk  0  [get_ports {G[2]}]
set_input_delay -clock clk  0  [get_ports {G[1]}]
set_input_delay -clock clk  0  [get_ports {G[0]}]
set_input_delay -clock clk  0  [get_ports {B[7]}]
set_input_delay -clock clk  0  [get_ports {B[6]}]
set_input_delay -clock clk  0  [get_ports {B[5]}]
set_input_delay -clock clk  0  [get_ports {B[4]}]
set_input_delay -clock clk  0  [get_ports {B[3]}]
set_input_delay -clock clk  0  [get_ports {B[2]}]
set_input_delay -clock clk  0  [get_ports {B[1]}]
set_input_delay -clock clk  0  [get_ports {B[0]}]
set_output_delay -clock clk  0  [get_ports {Y[19]}]
set_output_delay -clock clk  0  [get_ports {Y[18]}]
set_output_delay -clock clk  0  [get_ports {Y[17]}]
set_output_delay -clock clk  0  [get_ports {Y[16]}]
set_output_delay -clock clk  0  [get_ports {Y[15]}]
set_output_delay -clock clk  0  [get_ports {Y[14]}]
set_output_delay -clock clk  0  [get_ports {Y[13]}]
set_output_delay -clock clk  0  [get_ports {Y[12]}]
set_output_delay -clock clk  0  [get_ports {Y[11]}]
set_output_delay -clock clk  0  [get_ports {Y[10]}]
set_output_delay -clock clk  0  [get_ports {Y[9]}]
set_output_delay -clock clk  0  [get_ports {Y[8]}]
set_output_delay -clock clk  0  [get_ports {Y[7]}]
set_output_delay -clock clk  0  [get_ports {Y[6]}]
set_output_delay -clock clk  0  [get_ports {Y[5]}]
set_output_delay -clock clk  0  [get_ports {Y[4]}]
set_output_delay -clock clk  0  [get_ports {Y[3]}]
set_output_delay -clock clk  0  [get_ports {Y[2]}]
set_output_delay -clock clk  0  [get_ports {Y[1]}]
set_output_delay -clock clk  0  [get_ports {Y[0]}]

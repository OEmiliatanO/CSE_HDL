###################################################################

# Created by write_sdc on Wed Nov 20 01:41:40 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
set_ideal_network [get_ports clk]
create_clock [get_ports clk]  -period 0.73  -waveform {0 0.365}
set_input_delay -clock clk  0  [get_ports rst]
set_input_delay -clock clk  0  [get_ports {threshold[19]}]
set_input_delay -clock clk  0  [get_ports {threshold[18]}]
set_input_delay -clock clk  0  [get_ports {threshold[17]}]
set_input_delay -clock clk  0  [get_ports {threshold[16]}]
set_input_delay -clock clk  0  [get_ports {threshold[15]}]
set_input_delay -clock clk  0  [get_ports {threshold[14]}]
set_input_delay -clock clk  0  [get_ports {threshold[13]}]
set_input_delay -clock clk  0  [get_ports {threshold[12]}]
set_input_delay -clock clk  0  [get_ports {threshold[11]}]
set_input_delay -clock clk  0  [get_ports {threshold[10]}]
set_input_delay -clock clk  0  [get_ports {threshold[9]}]
set_input_delay -clock clk  0  [get_ports {threshold[8]}]
set_input_delay -clock clk  0  [get_ports {threshold[7]}]
set_input_delay -clock clk  0  [get_ports {threshold[6]}]
set_input_delay -clock clk  0  [get_ports {threshold[5]}]
set_input_delay -clock clk  0  [get_ports {threshold[4]}]
set_input_delay -clock clk  0  [get_ports {threshold[3]}]
set_input_delay -clock clk  0  [get_ports {threshold[2]}]
set_input_delay -clock clk  0  [get_ports {threshold[1]}]
set_input_delay -clock clk  0  [get_ports {threshold[0]}]
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
set_output_delay -clock clk  0  [get_ports {out_x[7]}]
set_output_delay -clock clk  0  [get_ports {out_x[6]}]
set_output_delay -clock clk  0  [get_ports {out_x[5]}]
set_output_delay -clock clk  0  [get_ports {out_x[4]}]
set_output_delay -clock clk  0  [get_ports {out_x[3]}]
set_output_delay -clock clk  0  [get_ports {out_x[2]}]
set_output_delay -clock clk  0  [get_ports {out_x[1]}]
set_output_delay -clock clk  0  [get_ports {out_x[0]}]
set_output_delay -clock clk  0  [get_ports {out_y[7]}]
set_output_delay -clock clk  0  [get_ports {out_y[6]}]
set_output_delay -clock clk  0  [get_ports {out_y[5]}]
set_output_delay -clock clk  0  [get_ports {out_y[4]}]
set_output_delay -clock clk  0  [get_ports {out_y[3]}]
set_output_delay -clock clk  0  [get_ports {out_y[2]}]
set_output_delay -clock clk  0  [get_ports {out_y[1]}]
set_output_delay -clock clk  0  [get_ports {out_y[0]}]
set_output_delay -clock clk  0  [get_ports en]

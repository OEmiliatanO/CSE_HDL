###################################################################

# Created by write_sdc on Tue Nov 19 00:10:52 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
create_clock -name clk  -period 0.69  -waveform {0 0.345}
set_max_delay 0.69  -from [list [get_ports {threshold[19]}] [get_ports {threshold[18]}]           \
[get_ports {threshold[17]}] [get_ports {threshold[16]}] [get_ports             \
{threshold[15]}] [get_ports {threshold[14]}] [get_ports {threshold[13]}]       \
[get_ports {threshold[12]}] [get_ports {threshold[11]}] [get_ports             \
{threshold[10]}] [get_ports {threshold[9]}] [get_ports {threshold[8]}]         \
[get_ports {threshold[7]}] [get_ports {threshold[6]}] [get_ports               \
{threshold[5]}] [get_ports {threshold[4]}] [get_ports {threshold[3]}]          \
[get_ports {threshold[2]}] [get_ports {threshold[1]}] [get_ports               \
{threshold[0]}] [get_ports {R0[19]}] [get_ports {R0[18]}] [get_ports {R0[17]}] \
[get_ports {R0[16]}] [get_ports {R0[15]}] [get_ports {R0[14]}] [get_ports      \
{R0[13]}] [get_ports {R0[12]}] [get_ports {R0[11]}] [get_ports {R0[10]}]       \
[get_ports {R0[9]}] [get_ports {R0[8]}] [get_ports {R0[7]}] [get_ports         \
{R0[6]}] [get_ports {R0[5]}] [get_ports {R0[4]}] [get_ports {R0[3]}]           \
[get_ports {R0[2]}] [get_ports {R0[1]}] [get_ports {R0[0]}] [get_ports         \
{R1[19]}] [get_ports {R1[18]}] [get_ports {R1[17]}] [get_ports {R1[16]}]       \
[get_ports {R1[15]}] [get_ports {R1[14]}] [get_ports {R1[13]}] [get_ports      \
{R1[12]}] [get_ports {R1[11]}] [get_ports {R1[10]}] [get_ports {R1[9]}]        \
[get_ports {R1[8]}] [get_ports {R1[7]}] [get_ports {R1[6]}] [get_ports         \
{R1[5]}] [get_ports {R1[4]}] [get_ports {R1[3]}] [get_ports {R1[2]}]           \
[get_ports {R1[1]}] [get_ports {R1[0]}] [get_ports {R2[19]}] [get_ports        \
{R2[18]}] [get_ports {R2[17]}] [get_ports {R2[16]}] [get_ports {R2[15]}]       \
[get_ports {R2[14]}] [get_ports {R2[13]}] [get_ports {R2[12]}] [get_ports      \
{R2[11]}] [get_ports {R2[10]}] [get_ports {R2[9]}] [get_ports {R2[8]}]         \
[get_ports {R2[7]}] [get_ports {R2[6]}] [get_ports {R2[5]}] [get_ports         \
{R2[4]}] [get_ports {R2[3]}] [get_ports {R2[2]}] [get_ports {R2[1]}]           \
[get_ports {R2[0]}] [get_ports {R3[19]}] [get_ports {R3[18]}] [get_ports       \
{R3[17]}] [get_ports {R3[16]}] [get_ports {R3[15]}] [get_ports {R3[14]}]       \
[get_ports {R3[13]}] [get_ports {R3[12]}] [get_ports {R3[11]}] [get_ports      \
{R3[10]}] [get_ports {R3[9]}] [get_ports {R3[8]}] [get_ports {R3[7]}]          \
[get_ports {R3[6]}] [get_ports {R3[5]}] [get_ports {R3[4]}] [get_ports         \
{R3[3]}] [get_ports {R3[2]}] [get_ports {R3[1]}] [get_ports {R3[0]}]           \
[get_ports {R4[19]}] [get_ports {R4[18]}] [get_ports {R4[17]}] [get_ports      \
{R4[16]}] [get_ports {R4[15]}] [get_ports {R4[14]}] [get_ports {R4[13]}]       \
[get_ports {R4[12]}] [get_ports {R4[11]}] [get_ports {R4[10]}] [get_ports      \
{R4[9]}] [get_ports {R4[8]}] [get_ports {R4[7]}] [get_ports {R4[6]}]           \
[get_ports {R4[5]}] [get_ports {R4[4]}] [get_ports {R4[3]}] [get_ports         \
{R4[2]}] [get_ports {R4[1]}] [get_ports {R4[0]}] [get_ports {R5[19]}]          \
[get_ports {R5[18]}] [get_ports {R5[17]}] [get_ports {R5[16]}] [get_ports      \
{R5[15]}] [get_ports {R5[14]}] [get_ports {R5[13]}] [get_ports {R5[12]}]       \
[get_ports {R5[11]}] [get_ports {R5[10]}] [get_ports {R5[9]}] [get_ports       \
{R5[8]}] [get_ports {R5[7]}] [get_ports {R5[6]}] [get_ports {R5[5]}]           \
[get_ports {R5[4]}] [get_ports {R5[3]}] [get_ports {R5[2]}] [get_ports         \
{R5[1]}] [get_ports {R5[0]}] [get_ports {R6[19]}] [get_ports {R6[18]}]         \
[get_ports {R6[17]}] [get_ports {R6[16]}] [get_ports {R6[15]}] [get_ports      \
{R6[14]}] [get_ports {R6[13]}] [get_ports {R6[12]}] [get_ports {R6[11]}]       \
[get_ports {R6[10]}] [get_ports {R6[9]}] [get_ports {R6[8]}] [get_ports        \
{R6[7]}] [get_ports {R6[6]}] [get_ports {R6[5]}] [get_ports {R6[4]}]           \
[get_ports {R6[3]}] [get_ports {R6[2]}] [get_ports {R6[1]}] [get_ports         \
{R6[0]}] [get_ports {R7[19]}] [get_ports {R7[18]}] [get_ports {R7[17]}]        \
[get_ports {R7[16]}] [get_ports {R7[15]}] [get_ports {R7[14]}] [get_ports      \
{R7[13]}] [get_ports {R7[12]}] [get_ports {R7[11]}] [get_ports {R7[10]}]       \
[get_ports {R7[9]}] [get_ports {R7[8]}] [get_ports {R7[7]}] [get_ports         \
{R7[6]}] [get_ports {R7[5]}] [get_ports {R7[4]}] [get_ports {R7[3]}]           \
[get_ports {R7[2]}] [get_ports {R7[1]}] [get_ports {R7[0]}] [get_ports         \
{R8[19]}] [get_ports {R8[18]}] [get_ports {R8[17]}] [get_ports {R8[16]}]       \
[get_ports {R8[15]}] [get_ports {R8[14]}] [get_ports {R8[13]}] [get_ports      \
{R8[12]}] [get_ports {R8[11]}] [get_ports {R8[10]}] [get_ports {R8[9]}]        \
[get_ports {R8[8]}] [get_ports {R8[7]}] [get_ports {R8[6]}] [get_ports         \
{R8[5]}] [get_ports {R8[4]}] [get_ports {R8[3]}] [get_ports {R8[2]}]           \
[get_ports {R8[1]}] [get_ports {R8[0]}]]  -to [list [get_ports {x[7]}] [get_ports {x[6]}] [get_ports {x[5]}] [get_ports \
{x[4]}] [get_ports {x[3]}] [get_ports {x[2]}] [get_ports {x[1]}] [get_ports    \
{x[0]}] [get_ports {y[7]}] [get_ports {y[6]}] [get_ports {y[5]}] [get_ports    \
{y[4]}] [get_ports {y[3]}] [get_ports {y[2]}] [get_ports {y[1]}] [get_ports    \
{y[0]}]]
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
set_input_delay -clock clk  0  [get_ports {R0[19]}]
set_input_delay -clock clk  0  [get_ports {R0[18]}]
set_input_delay -clock clk  0  [get_ports {R0[17]}]
set_input_delay -clock clk  0  [get_ports {R0[16]}]
set_input_delay -clock clk  0  [get_ports {R0[15]}]
set_input_delay -clock clk  0  [get_ports {R0[14]}]
set_input_delay -clock clk  0  [get_ports {R0[13]}]
set_input_delay -clock clk  0  [get_ports {R0[12]}]
set_input_delay -clock clk  0  [get_ports {R0[11]}]
set_input_delay -clock clk  0  [get_ports {R0[10]}]
set_input_delay -clock clk  0  [get_ports {R0[9]}]
set_input_delay -clock clk  0  [get_ports {R0[8]}]
set_input_delay -clock clk  0  [get_ports {R0[7]}]
set_input_delay -clock clk  0  [get_ports {R0[6]}]
set_input_delay -clock clk  0  [get_ports {R0[5]}]
set_input_delay -clock clk  0  [get_ports {R0[4]}]
set_input_delay -clock clk  0  [get_ports {R0[3]}]
set_input_delay -clock clk  0  [get_ports {R0[2]}]
set_input_delay -clock clk  0  [get_ports {R0[1]}]
set_input_delay -clock clk  0  [get_ports {R0[0]}]
set_input_delay -clock clk  0  [get_ports {R1[19]}]
set_input_delay -clock clk  0  [get_ports {R1[18]}]
set_input_delay -clock clk  0  [get_ports {R1[17]}]
set_input_delay -clock clk  0  [get_ports {R1[16]}]
set_input_delay -clock clk  0  [get_ports {R1[15]}]
set_input_delay -clock clk  0  [get_ports {R1[14]}]
set_input_delay -clock clk  0  [get_ports {R1[13]}]
set_input_delay -clock clk  0  [get_ports {R1[12]}]
set_input_delay -clock clk  0  [get_ports {R1[11]}]
set_input_delay -clock clk  0  [get_ports {R1[10]}]
set_input_delay -clock clk  0  [get_ports {R1[9]}]
set_input_delay -clock clk  0  [get_ports {R1[8]}]
set_input_delay -clock clk  0  [get_ports {R1[7]}]
set_input_delay -clock clk  0  [get_ports {R1[6]}]
set_input_delay -clock clk  0  [get_ports {R1[5]}]
set_input_delay -clock clk  0  [get_ports {R1[4]}]
set_input_delay -clock clk  0  [get_ports {R1[3]}]
set_input_delay -clock clk  0  [get_ports {R1[2]}]
set_input_delay -clock clk  0  [get_ports {R1[1]}]
set_input_delay -clock clk  0  [get_ports {R1[0]}]
set_input_delay -clock clk  0  [get_ports {R2[19]}]
set_input_delay -clock clk  0  [get_ports {R2[18]}]
set_input_delay -clock clk  0  [get_ports {R2[17]}]
set_input_delay -clock clk  0  [get_ports {R2[16]}]
set_input_delay -clock clk  0  [get_ports {R2[15]}]
set_input_delay -clock clk  0  [get_ports {R2[14]}]
set_input_delay -clock clk  0  [get_ports {R2[13]}]
set_input_delay -clock clk  0  [get_ports {R2[12]}]
set_input_delay -clock clk  0  [get_ports {R2[11]}]
set_input_delay -clock clk  0  [get_ports {R2[10]}]
set_input_delay -clock clk  0  [get_ports {R2[9]}]
set_input_delay -clock clk  0  [get_ports {R2[8]}]
set_input_delay -clock clk  0  [get_ports {R2[7]}]
set_input_delay -clock clk  0  [get_ports {R2[6]}]
set_input_delay -clock clk  0  [get_ports {R2[5]}]
set_input_delay -clock clk  0  [get_ports {R2[4]}]
set_input_delay -clock clk  0  [get_ports {R2[3]}]
set_input_delay -clock clk  0  [get_ports {R2[2]}]
set_input_delay -clock clk  0  [get_ports {R2[1]}]
set_input_delay -clock clk  0  [get_ports {R2[0]}]
set_input_delay -clock clk  0  [get_ports {R3[19]}]
set_input_delay -clock clk  0  [get_ports {R3[18]}]
set_input_delay -clock clk  0  [get_ports {R3[17]}]
set_input_delay -clock clk  0  [get_ports {R3[16]}]
set_input_delay -clock clk  0  [get_ports {R3[15]}]
set_input_delay -clock clk  0  [get_ports {R3[14]}]
set_input_delay -clock clk  0  [get_ports {R3[13]}]
set_input_delay -clock clk  0  [get_ports {R3[12]}]
set_input_delay -clock clk  0  [get_ports {R3[11]}]
set_input_delay -clock clk  0  [get_ports {R3[10]}]
set_input_delay -clock clk  0  [get_ports {R3[9]}]
set_input_delay -clock clk  0  [get_ports {R3[8]}]
set_input_delay -clock clk  0  [get_ports {R3[7]}]
set_input_delay -clock clk  0  [get_ports {R3[6]}]
set_input_delay -clock clk  0  [get_ports {R3[5]}]
set_input_delay -clock clk  0  [get_ports {R3[4]}]
set_input_delay -clock clk  0  [get_ports {R3[3]}]
set_input_delay -clock clk  0  [get_ports {R3[2]}]
set_input_delay -clock clk  0  [get_ports {R3[1]}]
set_input_delay -clock clk  0  [get_ports {R3[0]}]
set_input_delay -clock clk  0  [get_ports {R4[19]}]
set_input_delay -clock clk  0  [get_ports {R4[18]}]
set_input_delay -clock clk  0  [get_ports {R4[17]}]
set_input_delay -clock clk  0  [get_ports {R4[16]}]
set_input_delay -clock clk  0  [get_ports {R4[15]}]
set_input_delay -clock clk  0  [get_ports {R4[14]}]
set_input_delay -clock clk  0  [get_ports {R4[13]}]
set_input_delay -clock clk  0  [get_ports {R4[12]}]
set_input_delay -clock clk  0  [get_ports {R4[11]}]
set_input_delay -clock clk  0  [get_ports {R4[10]}]
set_input_delay -clock clk  0  [get_ports {R4[9]}]
set_input_delay -clock clk  0  [get_ports {R4[8]}]
set_input_delay -clock clk  0  [get_ports {R4[7]}]
set_input_delay -clock clk  0  [get_ports {R4[6]}]
set_input_delay -clock clk  0  [get_ports {R4[5]}]
set_input_delay -clock clk  0  [get_ports {R4[4]}]
set_input_delay -clock clk  0  [get_ports {R4[3]}]
set_input_delay -clock clk  0  [get_ports {R4[2]}]
set_input_delay -clock clk  0  [get_ports {R4[1]}]
set_input_delay -clock clk  0  [get_ports {R4[0]}]
set_input_delay -clock clk  0  [get_ports {R5[19]}]
set_input_delay -clock clk  0  [get_ports {R5[18]}]
set_input_delay -clock clk  0  [get_ports {R5[17]}]
set_input_delay -clock clk  0  [get_ports {R5[16]}]
set_input_delay -clock clk  0  [get_ports {R5[15]}]
set_input_delay -clock clk  0  [get_ports {R5[14]}]
set_input_delay -clock clk  0  [get_ports {R5[13]}]
set_input_delay -clock clk  0  [get_ports {R5[12]}]
set_input_delay -clock clk  0  [get_ports {R5[11]}]
set_input_delay -clock clk  0  [get_ports {R5[10]}]
set_input_delay -clock clk  0  [get_ports {R5[9]}]
set_input_delay -clock clk  0  [get_ports {R5[8]}]
set_input_delay -clock clk  0  [get_ports {R5[7]}]
set_input_delay -clock clk  0  [get_ports {R5[6]}]
set_input_delay -clock clk  0  [get_ports {R5[5]}]
set_input_delay -clock clk  0  [get_ports {R5[4]}]
set_input_delay -clock clk  0  [get_ports {R5[3]}]
set_input_delay -clock clk  0  [get_ports {R5[2]}]
set_input_delay -clock clk  0  [get_ports {R5[1]}]
set_input_delay -clock clk  0  [get_ports {R5[0]}]
set_input_delay -clock clk  0  [get_ports {R6[19]}]
set_input_delay -clock clk  0  [get_ports {R6[18]}]
set_input_delay -clock clk  0  [get_ports {R6[17]}]
set_input_delay -clock clk  0  [get_ports {R6[16]}]
set_input_delay -clock clk  0  [get_ports {R6[15]}]
set_input_delay -clock clk  0  [get_ports {R6[14]}]
set_input_delay -clock clk  0  [get_ports {R6[13]}]
set_input_delay -clock clk  0  [get_ports {R6[12]}]
set_input_delay -clock clk  0  [get_ports {R6[11]}]
set_input_delay -clock clk  0  [get_ports {R6[10]}]
set_input_delay -clock clk  0  [get_ports {R6[9]}]
set_input_delay -clock clk  0  [get_ports {R6[8]}]
set_input_delay -clock clk  0  [get_ports {R6[7]}]
set_input_delay -clock clk  0  [get_ports {R6[6]}]
set_input_delay -clock clk  0  [get_ports {R6[5]}]
set_input_delay -clock clk  0  [get_ports {R6[4]}]
set_input_delay -clock clk  0  [get_ports {R6[3]}]
set_input_delay -clock clk  0  [get_ports {R6[2]}]
set_input_delay -clock clk  0  [get_ports {R6[1]}]
set_input_delay -clock clk  0  [get_ports {R6[0]}]
set_input_delay -clock clk  0  [get_ports {R7[19]}]
set_input_delay -clock clk  0  [get_ports {R7[18]}]
set_input_delay -clock clk  0  [get_ports {R7[17]}]
set_input_delay -clock clk  0  [get_ports {R7[16]}]
set_input_delay -clock clk  0  [get_ports {R7[15]}]
set_input_delay -clock clk  0  [get_ports {R7[14]}]
set_input_delay -clock clk  0  [get_ports {R7[13]}]
set_input_delay -clock clk  0  [get_ports {R7[12]}]
set_input_delay -clock clk  0  [get_ports {R7[11]}]
set_input_delay -clock clk  0  [get_ports {R7[10]}]
set_input_delay -clock clk  0  [get_ports {R7[9]}]
set_input_delay -clock clk  0  [get_ports {R7[8]}]
set_input_delay -clock clk  0  [get_ports {R7[7]}]
set_input_delay -clock clk  0  [get_ports {R7[6]}]
set_input_delay -clock clk  0  [get_ports {R7[5]}]
set_input_delay -clock clk  0  [get_ports {R7[4]}]
set_input_delay -clock clk  0  [get_ports {R7[3]}]
set_input_delay -clock clk  0  [get_ports {R7[2]}]
set_input_delay -clock clk  0  [get_ports {R7[1]}]
set_input_delay -clock clk  0  [get_ports {R7[0]}]
set_input_delay -clock clk  0  [get_ports {R8[19]}]
set_input_delay -clock clk  0  [get_ports {R8[18]}]
set_input_delay -clock clk  0  [get_ports {R8[17]}]
set_input_delay -clock clk  0  [get_ports {R8[16]}]
set_input_delay -clock clk  0  [get_ports {R8[15]}]
set_input_delay -clock clk  0  [get_ports {R8[14]}]
set_input_delay -clock clk  0  [get_ports {R8[13]}]
set_input_delay -clock clk  0  [get_ports {R8[12]}]
set_input_delay -clock clk  0  [get_ports {R8[11]}]
set_input_delay -clock clk  0  [get_ports {R8[10]}]
set_input_delay -clock clk  0  [get_ports {R8[9]}]
set_input_delay -clock clk  0  [get_ports {R8[8]}]
set_input_delay -clock clk  0  [get_ports {R8[7]}]
set_input_delay -clock clk  0  [get_ports {R8[6]}]
set_input_delay -clock clk  0  [get_ports {R8[5]}]
set_input_delay -clock clk  0  [get_ports {R8[4]}]
set_input_delay -clock clk  0  [get_ports {R8[3]}]
set_input_delay -clock clk  0  [get_ports {R8[2]}]
set_input_delay -clock clk  0  [get_ports {R8[1]}]
set_input_delay -clock clk  0  [get_ports {R8[0]}]
set_output_delay -clock clk  0  [get_ports {x[7]}]
set_output_delay -clock clk  0  [get_ports {x[6]}]
set_output_delay -clock clk  0  [get_ports {x[5]}]
set_output_delay -clock clk  0  [get_ports {x[4]}]
set_output_delay -clock clk  0  [get_ports {x[3]}]
set_output_delay -clock clk  0  [get_ports {x[2]}]
set_output_delay -clock clk  0  [get_ports {x[1]}]
set_output_delay -clock clk  0  [get_ports {x[0]}]
set_output_delay -clock clk  0  [get_ports {y[7]}]
set_output_delay -clock clk  0  [get_ports {y[6]}]
set_output_delay -clock clk  0  [get_ports {y[5]}]
set_output_delay -clock clk  0  [get_ports {y[4]}]
set_output_delay -clock clk  0  [get_ports {y[3]}]
set_output_delay -clock clk  0  [get_ports {y[2]}]
set_output_delay -clock clk  0  [get_ports {y[1]}]
set_output_delay -clock clk  0  [get_ports {y[0]}]

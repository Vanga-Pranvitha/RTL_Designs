###############################################################################
# Created by write_sdc
# Sat Oct 24 04:21:12 2026
###############################################################################
current_design pill_reminder
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 20.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ack_btn}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {interval_sel[0]}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {interval_sel[1]}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tick_1min}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {buzzer}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {missed_dose_flag}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0177 [get_ports {buzzer}]
set_load -pin_load 0.0177 [get_ports {led}]
set_load -pin_load 0.0177 [get_ports {missed_dose_flag}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {ack_btn}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {tick_1min}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {interval_sel[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {interval_sel[0]}]
###############################################################################
# Design Rules
###############################################################################

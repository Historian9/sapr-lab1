# Lab 1, variant 3: timing constraints (TimeQuest)
# The clock C comes from push-button KEY[3]. The real frequency is very low,
# but the 50 MHz constraint (20 ns) is used to evaluate the design speed.
create_clock -name C -period 20.000 [get_ports {C}]
derive_clock_uncertainty

# Outputs go to LEDs (asynchronous to the outside world)
set_false_path -from [get_clocks {C}] -to [get_ports {Y[*]}]

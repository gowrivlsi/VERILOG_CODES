.main clear
vlog ramp_tb.v +acc
vsim ramp_tb
add wave *
run -all

.main clear
vlog rcs_tb.v +acc
vsim rcs_tb
#add wave *
vsim -debugDB rcs_tb
run -all

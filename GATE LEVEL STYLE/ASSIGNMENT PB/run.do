vlog design28.v +acc
vsim design28_tb
add wave *
#add wave -r *
vsim -debugDB design28_tb
run -all

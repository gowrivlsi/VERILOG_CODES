.main clear
vlog fifo_tb.v +acc
vsim fifo_tb
add wave fifo_tb/FIFO/*
run -all

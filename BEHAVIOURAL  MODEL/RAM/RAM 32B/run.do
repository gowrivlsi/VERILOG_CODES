.main clear
vlog ram32_tb.v +acc
vsim ram32_tb
add wave *
run -all

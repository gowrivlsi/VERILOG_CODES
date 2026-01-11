.main clear
vlog rcsgb_tb.v 
vsim rcsgb_tb
run -all
vsim -debugDB rcsgb_tb #to zoom the schematic ctrl+i(zoom in) & ctrl+o(zoom out)

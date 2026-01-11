.main clear
vlog rcas_tb.v
vsim rcas_tb
vsim -debugDB rcas_tb
run -all

.main clear
vlog rcagb_tb.v 
vsim rcagb_tb
run -all
vsim -debugDB rcagb_tb

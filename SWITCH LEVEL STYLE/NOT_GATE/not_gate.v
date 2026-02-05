module not_gate(inout a,output y);
        supply1 VDD;
        supply0 GND;

            pmos p1(y,VDD,a);
            
            nmos n1(y,GND,a);
endmodule

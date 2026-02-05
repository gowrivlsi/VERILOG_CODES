module nor_gate(input a,b,output y);
        wire w;
        supply1 VDD;
        supply0 GND;

            pmos p1 (w,VDD,a);
            pmos p2(y,w,b);

            nmos n1(y,GND,a);
            nmos n2(y,GND,b);
endmodule

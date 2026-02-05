module or_gate(input a,b, output y);
        wire w1,w2;
        supply1 VDD;
        supply0 GND;
        
            pmos p1(w1,VDD,a);
            pmos p2(w2,w1,b);
            pmos p3(y,VDD,w2);

            nmos n1(w2,GND,a);
            nmos n2(w2,GND,b);
            nmos n3(y,GND,w2);
endmodule

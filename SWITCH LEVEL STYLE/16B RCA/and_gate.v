module and_gate(a,b,y);
    //Directions
    input a,b;
    output y;
    
    //Internal Signals
    wire w1;
    wire w2;
    supply1 VDD;
    supply0 GND;

    //Instansiation
        pmos p1(w1,VDD,a);
        pmos p2(w1,VDD,b);
        pmos p3(y,VDD,w1);

        nmos n1(w1,w2,b);
        nmos n2(w2,GND,a);
        nmos n3(y,GND,w1);
endmodule

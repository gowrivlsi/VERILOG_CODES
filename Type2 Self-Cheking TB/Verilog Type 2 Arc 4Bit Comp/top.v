//=====================================TOP DESIGN CODE=====================
`include "comp4b.v"

module top();
//internal signals
    wire [3:0]w_a,w_b;
    wire w_g,w_e,w_l;

    //instantiation

    //dut
        comp4b C1(.a(w_a),
                  .b(w_b),
                  .G(w_g),
                  .E(w_e),
                  .L(w_l)
                  );
   //tb
    comp4b_tb C2(.A(w_a),
                 .B(w_b),
                 .G1(w_g),
                 .E1(w_e),
                 .L1(w_l)
                 );
endmodule

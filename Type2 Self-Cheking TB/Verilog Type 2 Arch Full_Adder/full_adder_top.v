//==================================TOP DESIGN CODE=========================
`include "full_adder.v"
`include "full_adder_tb.v"
module top();
   wire w_a,w_b,w_cin,w_sum,w_carry;

   //instantiation of dut

   full_adder FA1(.a(w_a),
                 .b(w_b),
                 .cin(w_cin),
                 .sum(w_sum),
                 .carry(w_carry)
                 );

   //instantiation of TB
    full_adder_tb FA2(.A(w_a),
                      .B(w_b),
                      .Cin(w_cin),
                      .SUM(w_sum),
                      .CARRY(w_carry)
                     );
endmodule

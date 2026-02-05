`include "half_adder.v"
`include "half_adder_tb.v"


module top;


   wire x,y,z,q;

  //connection between top and design
   half_adder dut(.a(x),
                  .b(y),
                  .sum(z),
                  .carry(q)
                  );
//connection between tb and top
   half_adder_tb  tb(.A(x),
                     .B(y),
                     .SUM(z),
                     .CARRY(q)
                     );
endmodule

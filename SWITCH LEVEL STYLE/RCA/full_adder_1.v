`nclude "half_adder.v"
`include "or_gate.v"
module full_adder_1(input a,b,c, output sum,carry); //DIRECTIONS

    //INTERNAL CONECTIONS
    
            wire w1, w2, w3;

            //instansiation
            half_adder HA1(
                           .a(a),
                           .b(b),
                           .sum(w1),
                           .carry(w2)
            );

            half_adder HA2(
                           .a(w1),
                           .b(c),
                           .sum(sum),
                           .carry(w3)
            );
                    
                    or_gate OR1(
                                .a(w2),
                                .b(w3),
                                .y(carry)
                    );

endmodule

//TESTBENCH CODE
        module full_adder_1_tb();
            wire tb_sum,tb_carry;
            reg tb_a,tb_b,tb_c;

            //INSTANSIATION
            full_adder_1 FA(
                            .a(tb_a),
                            .b(tb_b),
                            .c(tb_c),
                            .sum(tb_sum),
                            .carry(tb_carry)
            );

            //PROCEDUREAL BLOCK

            initial begin
            tb_a=0; tb_b=0; tb_c=0; #10;
            tb_a=0; tb_b=0; tb_c=1; #10;
            tb_a=0; tb_b=1; tb_c=0; #10;
            tb_a=0; tb_b=1; tb_c=1; #10;
            tb_a=1; tb_b=0; tb_c=0; #10;
            tb_a=1; tb_b=0; tb_c=1; #10;
            tb_a=1; tb_b=1; tb_c=0; #10;
            tb_a=1; tb_b=1; tb_c=1; #10;
            end
            initial
      $monitor("tb_a=%b tb_b=%b tb_c=%b tb_sum2=%b tb_carry=%b Time=%t", tb_a,tb_b,tb_c,tb_sum,tb_carry,$time);

        endmodule

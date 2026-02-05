module half_adder_1(input a,b, output sum1,carry1); //Directions
            
                //INTANSIATION
            xor_gate XOR(
                        .a(a),
                        .b(b),
                        .y(sum1)
                        );
            and_gate AND(
                            .a(a),
                            .b(b),
                            .y(carry1)
            );

endmodule

module half_adder(input a,b,output sum,carry);

       xor X1(sum,a,b);
       and A2(carry,a,b);
endmodule



//TESTBENCH CODE
        module half_adder_tb();
        reg tb_a,tb_b;
        wire tb_sum,tb_carry;

        half_adder HA1(
                   .a(tb_a),
                   .b(tb_b),
                   .sum(tb_sum),
                   .carry(tb_carry)
        );

                initial  
                repeat(4)
                begin
                tb_a=$random; tb_b=$random; #5;
                end
                 initial 
                    $monitor("tb_a=%b tb_b=%b tb_sum=%b tb_carry=%b time=%0t",tb_a,tb_b,tb_sum,tb_carry,$time);
        endmodule

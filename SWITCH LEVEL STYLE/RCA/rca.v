`include "full_adder_1.v"
module rca(
        input[3:0]a,b,
        input cin,
        output[3:0]s,
        output cout
        ); //DIRECTIONS
        wire w1,w2,w3;

        //INSATNSIATION

        full_adder_1 FULL1(
                            .a(a[0]),
                            .b(b[0]),
                            .c(cin),
                            .sum(s[0]),
                            .carry(w1)
        );

 full_adder_1 FULL2(
                            .a(a[1]),
                            .b(b[1]),
                            .c(w1),
                            .sum(s[1]),
                            .carry(w2)
        );
 full_adder_1 FULL3(
                            .a(a[2]),
                            .b(b[2]),
                            .c(w2),
                            .sum(s[2]),
                            .carry(w3)
        );

 full_adder_1 FULL4(
                            .a(a[3]),
                            .b(b[3]),
                            .c(w3),
                            .sum(s[3]),
                            .carry(cout)
        );

 endmodule




 //TESTBENCH CODE
    module rca_tb();
    reg [3:0]tb_a,tb_b;
    reg tb_cin;
    wire[3:0]tb_s;
    wire tb_cout;

    //INSTANSIATION
     rca RA(
            .a(tb_a),
            .b(tb_b),
            .cin(tb_cin),
            .s(tb_s),
            .cout(tb_cout)
     );
        //PROCERUAL BLOCK
        initial begin
            tb_a=4'b1001; tb_b=4'b1100; tb_cin=0; #10;
            tb_a=4'b1010; tb_b=4'b0101; tb_cin=1; #10;
            tb_a=4'b1001; tb_b=4'b1100; tb_cin=0; #10;
        end

        initial 
            $monitor("tb_a=%d tb_b=%d tb_cin=%b tb_s=%b tb_cout=%b Time=%0t", tb_a,tb_b,tb_cin,tb_s,tb_cout,$time);
     endmodule



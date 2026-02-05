`include "rca.v"
module rca_16B (
                input [0:15]a,b,
                input cin,
                output [0:15]s,
                output cout
     );
        wire [2:0]w;

        //INSTANTIATION OF 2 RCA
        rca RCA1(
                        .a(a[0:3]),
                        .b(b[0:3]),
                        .cin(cin),
                        .s(s[0:3]),
                        .cout(w[0])
        );
        
          rca RCA2(
                        .a(a[4:7]),
                        .b(b[4:7]),
                        .cin(w[0]),
                        .s(s[4:7]),
                        .cout(w[1])
        );

          rca RCA3(
                        .a(a[8:11]),
                        .b(b[8:11]),
                        .cin(w[1]),
                        .s(s[8:11]),
                        .cout(w[2])
        );
        
         rca RCA4(
                        .a(a[12:15]),
                        .b(b[12:15]),
                        .cin(w[2]),
                        .s(s[12:15]),
                        .cout(cout)
        );
       endmodule

        //TESTBENCH CODE

        module rca_16B_tb();
        reg[0:15]tb_a,tb_b;
        reg tb_cin;
        wire [0:15]tb_s;
        wire tb_cout;

        //INSTATIATION

                 rca_16B RCA16(
                                    .a(tb_a),
                                    .b(tb_b),
                                    .cin(tb_cin),
                                    .s(tb_s),
                                    .cout(tb_cout)
                );

                        
                        initial begin
                               tb_a=123;tb_b=42;tb_cin=0; #10;
                               tb_a=212;tb_b=555;tb_cin=1; #10;
                               end
                         initial      
                        $monitor("tb_a=%b tb_b=%b tb_cin=%b tb_s=%b tb_cout=%b Time=%t",tb_a,tb_b,tb_cin,tb_s,tb_cout,$time);
         endmodule

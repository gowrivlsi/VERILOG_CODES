module btog1(
            input[3:0]b,
            output[3:0]g
            );
    buf b1(g[3],b[3]);
    xor x2(g[2],b[3],b[2]);
    xor x3(g[1],b[2],b[1]);
    xor x4(g[0],b[1],b[0]);
endmodule

        //testbench code

        module btog1_tb();
            reg[3:0]b;
            wire[3:0]g;

            btog1 BG1(b,g);

            initial 
            repeat(8)
                begin
                    b=$urandom_range(0,15);#10;
                end
                initial
                $monitor("b=%b g=%b Time=%0t",b,g,$time);
        endmodule

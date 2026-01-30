module gtob2(
            input[3:0]g,
            output[3:0]b
            );

        buf b1(b[3],g[3]);
        xor x2(b[2],b[3],g[2]);
        xor x3(b[1],b[2],g[1]);
        xor x4(b[0],b[1],g[0]);
endmodule

        //testbench code
            module gtob2_tb();
                reg[3:0]g;
                wire[3:0]b;

                gtob2 GB1(g,b);

                initial
                    repeat(8)
                        begin
                            g=$random %16; #10;
                        end
                        initial
                        $monitor("g=%b b=%b Time=%0t",g,b,$time);
              endmodule

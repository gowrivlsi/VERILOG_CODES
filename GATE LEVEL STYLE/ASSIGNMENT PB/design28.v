`include"mux4to1.v"
`include"dmux1to4.v"
module design28(input[3:0]i,input[1:0]s,output[3:0]g);

        mux4to1 M1(.i(i),
                   .s(s),
                   .y(y)
                      );
        dmux1to4 D1(
                    .y(y),
                    .s(s),
                    .i(g)
        );
endmodule


//TESTBENCH CODE
    module design28_tb();
        reg[3:0]i;
        reg[1:0]s;
        wire[3:0]g;
        integer x;

        design28 D1(i,s,g
        );

        initial
        repeat(7)
            begin
                i=$random;
                for(x=0;x<=3;x=x+1)
                    begin
                        s=x; #5;
                    end
            end
            initial
                $monitor("i[0]=%b   i[1]=%b i[2]=%b i[3]=%b s=%b g[0]=%b    g[1]=%b  g[2]=%b  g[3]=%b Time=%t",i[0],i[1],i[2],i[3],s,g[0],g[1],g[2],g[3],$time);
                endmodule

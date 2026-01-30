`include"mux4to1.v"
module mux4to1_m(
                   input[3:0]i0,i1,i2,i3,
                   input[1:0]s,
                   output[3:0]y
            );


        mux4to1 m1(
                        .i({i3[0],i2[0],i1[0],i0[0]}),
                        .s(s),
                        .y(y[0])
                    );
mux4to1 m2(
           .i({i3[1],i2[1],i1[1],i0[1]}),
           .s(s),
           .y(y[1])
            );
mux4to1 m3(
            .i({i3[2],i2[2],i1[2],i0[2]}),
            .s(s),
            .y(y[2])

);
mux4to1 m4(
            .i({i3[3],i2[3],i1[3],i0[3]}),
            .s(s),
            .y(y[3])
);
endmodule



//TESTBENCH CODE
    module mux4to1_m_tb();
        reg[3:0]tb_i0,tb_i1,tb_i2,tb_i3;
        reg[1:0]tb_sel;
        wire[3:0]tb_y;

        mux4to1_m M1(   .i0(tb_i0),
                        .i1(tb_i1),
                        .i2(tb_i2),
                        .i3(tb_i3),
                     .s(tb_sel),
                     .y(tb_y));

        initial
        repeat(10)
                 begin 
                 tb_i0=$random %16; tb_i1=$random %16; tb_i2=$random %16; tb_i3=$random %16;
                 tb_sel=$random %16; #5;
                end
               initial
               $monitor("tb_i0=%b tb_i1=%b tb_i2=%b tb_i3=%b  tb_sel=%b  tb_y=%b Time=%t",tb_i0,tb_i1,tb_i2,tb_i3,tb_sel,tb_y,$time);
        endmodule

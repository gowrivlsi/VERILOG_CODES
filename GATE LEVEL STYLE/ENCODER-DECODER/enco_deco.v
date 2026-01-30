`include"enco4to2.v"
`include"deco2to4.v"
module enco_deco(
                input i0,i1,i2,i3,
                output g0,g1,g2,g3
                );
        enco4to2 E1(i0,i1,i2,i3,y0,y1);
        deco2to4 D1(y0,y1,g0,g1,g2,g3);
endmodule

//testbenchcode
        module enco_deco_tb();
            reg i0,i1,i2,i3;
            wire g0,g1,g2,g3;

            enco_deco ED1(i0,i1,i2,i3,g0,g1,g2,g3);
            initial 
            repeat(6)
                begin
                i0=1;i1=0;i2=0;i3=0;#10;
                i1=1;i0=0;i2=0;i3=0;#10;
                i2=1;i0=0;i1=0;i3=0;#10;
                i3=1;i0=0;i1=0;i2=0;#10; 
                end
             initial
              $monitor("i0=%d i1=%d i2=%d i3=%d g0=%d g1=%d  g2=%d g3=%d Time=%0t",i0,i1,i2,i3,g0,g1,g2,g3,$time);
              endmodule

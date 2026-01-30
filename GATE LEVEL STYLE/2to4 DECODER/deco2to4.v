module deco2to4(
                input y0,y1,
                output i0,i1,i2,i3
                );
          and A1(i0,~y0,~y1);
          and A2(i1,~y0,y1);
          and A3(i2,y0,~y1);
          and A4(i3,y0,y1);
endmodule


//testbench
        module deco2to4_tb();
            reg y0,y1;
            wire i0,i1,i2,i3;

            deco2to4 D1(y0,y1,i0,i1,i2,i3);

            initial 
            repeat(7)
                begin
                    y0=0;y1=0;#10;
                    y0=0;y1=1;#10;
                    y0=1;y1=0;#10;
                    y0=1;y1=1;#10;
                end
                initial
                $monitor("y0=%d y1=%d i0=%d i1=%d i2=%d i3=%d Time=%t",y0,y1,i0,i1,i2,i3,$time);
         endmodule 

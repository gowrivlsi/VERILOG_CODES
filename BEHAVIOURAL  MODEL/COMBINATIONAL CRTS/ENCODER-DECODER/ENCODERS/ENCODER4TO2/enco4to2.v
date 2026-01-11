module enco4to2(
                input i0,i1,i2,i3,
                output reg y0,y1
                );

    always@(*)
        begin
             if(i0 && ~i1 && ~i2 && ~i3)
                begin
                    y0=0;y1=0;
                end
             else if(~i0 && i1 && ~i2 && ~i3)
                begin
                    y0=0;y1=1;
                end
             else if(~i0 && ~i1 && i2 && ~i3)
                begin
                    y0=1;y1=0;
                end
             else
                 begin
                    y0=1; y1=1;
                 end
        end
endmodule

//Test bench code
     module enco4to2_tb();
        reg i0,i1,i2,i3;
        wire y0,y1;

        enco4to2 E1(i0,i1,i2,i3,y0,y1);

        initial 
        repeat(5)
            begin
                i0=1;i1=0;i2=0;i3=0;#10;
                i1=1;i0=0;i2=0;i3=0;#10;
                i2=1;i0=0;i1=0;i3=0;#10;
                i3=1;i0=0;i1=0;i2=0;#10;
            end
            initial 
            $monitor("i0=%d i1=%d i2=%d i3=%d y0=%d y1=%d Time=%0t",i0,i1,i2,i3,y0,y1,$time);
 endmodule

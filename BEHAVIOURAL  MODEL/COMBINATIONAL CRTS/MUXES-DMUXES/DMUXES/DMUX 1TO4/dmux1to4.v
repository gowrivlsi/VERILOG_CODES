module dmux1to4(
                input y,
                input s0,s1,
                output reg i0,i1,i2,i3
                );
    always@(*)
        begin
            i0=0;i1=0;i2=0;i3=0;//default
             if(~s0 && ~s1)
                i0=y;
             else if(~s0 && s1)
                i1=y;
             else if(s0 && ~s1)
                i2=y;
             else
                 i3=y;
        end
endmodule

//Test bench code
    module dmux1to4_tb();
        reg y,s0,s1;
        wire i0,i1,i2,i3;

            dmux1to4 D1(y,s0,s1,i0,i1,i2,i3);

            initial
            repeat(10)
                begin
                    s0=$random;s1=$random;y=$random;#5;
                end

                initial
                $monitor("y=%b s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b Time=%0t",y,s0,s1,i0,i1,i2,i3,$time);
    endmodule

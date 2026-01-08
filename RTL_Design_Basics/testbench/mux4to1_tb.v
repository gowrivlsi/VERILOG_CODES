//Test bench code
    module mux4to1_tb();
        reg i0,i1,i2,i3,s0,s1;
        wire y;

            mux4to1 M1(i0,i1,i2,i3,s0,s1,y);

            initial
            repeat(10)
                begin
                   {i0,i1,i2,i3}=$random;s0=$random; s1=$random; #5;
                end
                    initial
                    $monitor("i0=%b i1=%b i2=%b i3=%b s0=%b s1=%b y=%b Time=%0t",i0,i1,i2,i3,s0,s1,y,$time);

                    initial
                    #100 $stop;
    endmodule

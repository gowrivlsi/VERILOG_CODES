module mux2to1(
                input i0,i1,s,
                output y
                );
        assign y=(s)?i1:i0;
endmodule

    //testbench code

    module mux2to1_tb();
        reg i0,i1,s;
        wire y;

        mux2to1 M1(i0,i1,s,y);

        initial 
            begin
               i0=0;i1=0;s=0;#5;
               i0=0;i1=1;s=1;#5;
            end
                initial
                $monitor("i0=%b i1=%b s=%b y=%b Time=%0t",i0,i1,s,y,$time);
     endmodule

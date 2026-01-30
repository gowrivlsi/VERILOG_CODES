module mux2to1(
               input i0,i1,
               input s,
               output y
    );
    wire w1,w2;
        and A1(w1,~s,i0);
        and A2(w2,s,i1);
        or R1(y,w1,w2);
endmodule



//TESTBENCH
    module mux2to1_tb();
        reg i0,i1;
        reg s;
        wire y;
        integer x;

        mux2to1 M1(i0,i1,s,y);

        initial 
            repeat(4)
        begin
         i0=$random %16; i1=$random %16;
         for(x=0;x<=1;x=x+1)
         begin    
             s=x; #5;
         end
        end
        initial 
            $monitor("i0=%b  i1=%b  s=%b  y=%b  Time=%t",i0,i1,s,y,$time);
      endmodule

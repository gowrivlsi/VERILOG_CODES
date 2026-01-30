`include"mux2to1.v"
module mux2to1_m(
                input[3:0]i0,i1,
                input s,
                output[3:0]y
);

    mux2to1 M1(i0[0],i1[0],s,y[0]);
    mux2to1 M2(i0[1],i1[1],s,y[1]);
    mux2to1 M3(i0[2],i1[2],s,y[2]);
    mux2to1 M4(i0[3],i1[3],s,y[3]);
 endmodule



//testbench code
        module mux2to1_m_tb();
        reg[3:0]i0,i1;
        reg s;
        wire[3:0]y;
        integer x;

        mux2to1_m M1(i0,i1,s,y);

        initial
        repeat(7)
            begin
                i0=$random %16; 
                i1=$random %16;
                for(x=0;x<=1;x=x+1)
                    begin
                        s=x; #5;
                    end
            end
            initial 
                $monitor("i0=%b  i1=%b  s=%b  y=%b Time=%t",i0,i1,s,y,$time);
         endmodule

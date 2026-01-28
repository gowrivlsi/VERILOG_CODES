module dmux1to2(
                input y,s,
                output i0,i1
                );
    assign i0=~s&y;
    assign i1=s&y;
endmodule


 //testbench code
    module dmux1to2_tb();
        reg y,s;
        wire i0,i1;

            dmux1to2 D1(y,s,i0,i1);

            initial
            repeat(4)
                begin
                    y=$random; s=$random;#5;
                end
                    initial
                    $monitor("y=%b s=%b i0=%b i1=%b Time=%0t",y,s,i0,i1,$time);
    endmodule

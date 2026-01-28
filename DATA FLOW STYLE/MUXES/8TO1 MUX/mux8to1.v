module mux8to1(
                input[7:0]i,
                input[2:0]s,
                output y
                );
        assign y=i[s];
endmodule


//testbench code
     module mux8to1_tb();
        reg[7:0]i;
        reg[2:0]s;
        wire y;

            mux8to1 M1(i,s,y);

                initial
                repeat(5)
                    begin
                        i=$random; s=$random; #5;
                    end
                        initial
                        $monitor("i=%b s=%b y=%b Time=%0t",i,s,y,$time);
    endmodule

module dmux1to4(
                input y,
                input[1:0]s,
                output[3:0]i
                );
    assign i[0]=~s[1]&~s[0]&y;
    assign i[1]=~s[1]&s[0]&y;
    assign i[2]=s[1]&~s[0]&y;
    assign i[3]=s[1]&s[0]&y;
endmodule

//TestBench Code
 module dmux1to4_tb();
            reg y;
            reg[1:0]s;
            wire[3:0]i;
            integer x;

            dmux1to4 D1(y,s,i);

               initial 
                    repeat(7)
                        begin
                           y=$random;
                           for(x=0;x<=3;x=x+1)
                                begin
                                    s=x; #5;
                                end
                        end
                   initial
                    $monitor("y=%b  s=%b  i=%b  Time=%t",y,s,i,$time);
          endmodule

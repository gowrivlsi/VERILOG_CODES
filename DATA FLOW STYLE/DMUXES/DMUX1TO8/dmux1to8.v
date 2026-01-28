module dmux1to8(
                input y,
                input [2:0]s,
                output [7:0]i
                );
        assign i[0]=~s[2]&~s[1]&~s[0]&y;
        assign i[1]=~s[2]&~s[1]&s[0]&y;
        assign i[2]=~s[2]&s[1]&~s[0]&y;
        assign i[3]=~s[2]&s[1]&s[0]&y;
        assign i[4]=s[2]&~s[1]&~s[0]&y;
        assign i[5]=s[2]&~s[1]&s[0]&y;
        assign i[6]=s[2]&s[1]&~s[0]&y;
        assign i[7]=s[2]&s[1]&s[0]&y;
endmodule


//TestBench Code
      module dmux1to8_tb();
            reg y;
            reg[2:0]s;
            wire[7:0]i;
            integer x;

            dmux1to8 D1(y,s,i);

               initial 
                    repeat(7)
                        begin
                           y=$random;
                           for(x=0;x<=7;x=x+1)
                                begin
                                    s=x; #5;
                                end
                        end
                   initial
                    $monitor("y=%b  s=%b  i=%b  Time=%t",y,s,i,$time);
          endmodule

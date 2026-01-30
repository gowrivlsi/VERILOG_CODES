module dmux1to4(
                input y,input[1:0]s,output[3:0]i
);
        and A1(i[0],~s[1],~s[0],y);
        and A2(i[1],~s[1],s[0],y);
        and A3(i[2],s[1],~s[0],y);
        and A4(i[3],s[1],s[0],y);
endmodule


//TESTBENCH CODE

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

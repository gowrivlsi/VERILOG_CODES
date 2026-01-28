module mux4to1(
                input[3:0]i,
                input[1:0]s,
                output y
               );
        //assign y=s[1]?(s[1]?i[3]:i[2]):(s[1]?i[1]:i[0]);only when s are consider as saperate
       //assign y=(s==3)?i[3]:(s==2)?i[2]:(s==1)?i[1]:i[0];
        //assign y=i[s];
        //assign y=(s[1]==0 && s[0]==0) ? i[0]:(s[1]==0 && s[0]==1) ? i[1]:(s[1]==1 && s[0]==0) ? i[2]:i[3];
        //assign y=(~s[1]&~s[0]&i[0])|(~s[1]&s[0]&i[1])|(s[1]&~s[0]&i[2])|(s[1]&s[0]&i[3]);
        assign y=(!s[0] && !s[1]) ? i[0]:(!s[0] && s[1]) ? i[1]:(s[0] && !s[1]) ? i[2]:i[3];
endmodule

//Testbench code

    module mux4to1_tb();
        reg[3:0]i;
        reg[1:0]s;
        wire y;

            mux4to1 M1(i,s,y);

                initial
                repeat(5)
                    begin
                        i=$random; s=$random; #5;
                    end
                        initial
                        $monitor("i=%b s=%b y=%b Time=%0t",i,s,y,$time);
    endmodule

module srff1(
            input clk,rst,s,r,
            output reg q,
            output qn
             );
    assign qn=~q;
    always@(posedge clk)
        begin
            if(!rst)
                q<=0;
            else 
                begin
                    if(~s && ~r)
                        q<=q;
                    else if(~s && r)
                        q<=0;
                    else if(s && ~r)
                        q<=1;
                    else
                        q<=1'bx;
                end
        end
endmodule

//test bench
    module srff1_tb();
        reg clk,rst,s,r;
        wire q,qn;

        srff1 G1(clk,rst,s,r,q,qn);

       initial clk=0;
        always #5 clk=~clk;
        
        initial 
            begin
                rst=0;#10;
                rst=1;
            repeat(10)
            begin
            s=$random;r=$random; #10;
            
               /* s=0;r=0;#5;//@(posedge clk);
                s=0;r=1;#5;//@(posedge clk);

                s=1;r=0;#5;//@(posedge clk);

                s=1;r=1;#5;//@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b s=%b r=%b q=%b qn=%b Time=%0t",rst,clk,s,r,q,qn,$time);
    endmodule

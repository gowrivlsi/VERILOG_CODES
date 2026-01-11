module jkff1(
            input clk,rst,j,k,
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
                    if(~j && ~k)
                        q<=q;
                    else if(~j && k)
                        q<=0;
                    else if(j && ~k)
                        q<=1;
                    else
                        q<=~q;
                end
        end
endmodule

//test bench
    module jkff1_tb();
        reg clk,rst,j,k;
        wire q,qn;

        jkff1 G1(clk,rst,j,k,q,qn);

       initial clk=0;
        always #5 clk=~clk;
        
        initial 
            begin
                rst=0;#10;
                rst=1;
            repeat(20)
            begin
            j=$random;k=$random; #10;
            
               /* s=0;r=0;#5;//@(posedge clk);
                s=0;r=1;#5;//@(posedge clk);

                s=1;r=0;#5;//@(posedge clk);

                s=1;r=1;#5;//@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b j=%b k=%b q=%b qn=%b Time=%0t",rst,clk,j,k,q,qn,$time);
    endmodule

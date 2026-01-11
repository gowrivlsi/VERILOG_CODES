module srff(
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
                     case({s,r})
                        2'b00:q<=q;
                        2'b01:q<=0;
                        2'b10:q<=1;
                        2'b11:q<=1'bx;
                     endcase
                end
        end
endmodule


//Test Bench Code
      module srff_tb();
        reg clk,rst,s,r;
        wire q,qn;

        srff G1(clk,rst,s,r,q,qn);

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

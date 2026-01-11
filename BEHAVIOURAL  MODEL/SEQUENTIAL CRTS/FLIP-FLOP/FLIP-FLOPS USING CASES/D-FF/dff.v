module dff(
            input clk,rst,din,
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
                    case (din)
                        1'b0:q<=din;
                        1'b1:q<=din;
                    endcase
                end
        end
endmodule

//Test Bench Code

     module dff_tb();
        reg clk,rst,din;
        wire q,qn;

        dff G1(clk,rst,din,q,qn);

       initial clk=0;
        always #5 clk=~clk;
        
        initial 
            begin
                rst=0;#10;
                rst=1;
            repeat(20)
            begin
            din=$random;#10;
            
               /* s=0;r=0;#5;//@(posedge clk);
                s=0;r=1;#5;//@(posedge clk);

                s=1;r=0;#5;//@(posedge clk);

                s=1;r=1;#5;//@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b din=%b q=%b qn=%b Time=%0t",rst,clk,din,q,qn,$time);
    endmodule

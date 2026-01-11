module tff(
            input clk,rst,tin,
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
                        case(tin)
                            1'b0:q<=q;
                            1'b1:q<=~q;
                        endcase
                    end
            end
endmodule

////test bench
    module tff_tb();
        reg clk,rst,tin;
        wire q,qn;

        tff G1(clk,rst,tin,q,qn);

       initial clk=0;
        always #5 clk=~clk;
        
        initial 
            begin
                rst=0;#10;
                rst=1;
            repeat(20)
            begin
            tin=$random;#10;
            
               /* s=0;r=0;#5;//@(posedge clk);
                s=0;r=1;#5;//@(posedge clk);

                s=1;r=0;#5;//@(posedge clk);

                s=1;r=1;#5;//@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b tin=%b q=%b qn=%b Time=%0t",rst,clk,tin,q,qn,$time);
    endmodule

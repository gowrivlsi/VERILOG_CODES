`include"dl.v"
module dff(
            input clk,rst,Din,
            output Q,Qbar
            );
   wire q;
   
    dl D1(clk,rst,Din,q,qbar);
    dl D2(~clk,rst,q,Q,Qbar);
endmodule

//Test bench Code
    module dff_tb();
        reg clk,rst,Din;
        wire Q,Qbar;

        dff D3(clk,rst,Din,Q,Qbar);

        always begin 
            clk=0; #5;
            clk=1; #5;
            end
            
        initial 
            begin
                rst=0;#10;
                rst=1;
            repeat(10)
            begin
            #7; Din=$random;
            
               /* J=0;K=0;@(posedge clk);
                J=0;K=1;@(posedge clk);
                J=1;K=0;@(posedge clk);
                J=1;K=1;@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b Din=%b Q=%b Qbar=%b Time=%0t",rst,clk,Din,Q,Qbar,$time);
    endmodule

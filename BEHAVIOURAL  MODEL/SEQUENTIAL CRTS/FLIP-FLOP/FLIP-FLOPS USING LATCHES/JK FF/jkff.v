`include"jkl.v"
module jkff(
            input clk,rst,J,K,
            output Q,Qbar
            );
    wire q,qbar;

    jkl J1(clk,rst,J,K,q,qbar);
    jkl J2(~clk,rst,q,qbar,Q,Qbar);
endmodule

//Test Bench Code
 module jkff_tb();
        reg clk,rst,J,K;
        wire Q,Qbar;

        jkff J3(clk,rst,J,K,Q,Qbar);

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
            #7; J=$random;K=$random;
            
               /* J=0;K=0;@(posedge clk);
                J=0;K=1;@(posedge clk);
                J=1;K=0;@(posedge clk);
                J=1;K=1;@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b J=%b K=%b Q=%b Qbar=%b Time=%0t",rst,clk,J,K,Q,Qbar,$time);
    endmodule

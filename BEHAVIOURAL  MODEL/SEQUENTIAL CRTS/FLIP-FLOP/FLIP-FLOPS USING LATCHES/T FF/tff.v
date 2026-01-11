`include"tl.v"
module tff(
            input clk,rst,Tin,
            output Q,Qbar
            );
    wire q;

    tl T1(clk,rst,Tin,q,qbar);
    tl T2(~clk,rst,q,Q,Qbar);
endmodule

//Test Bench code
module tff_tb();
        reg clk,rst,Tin;
        wire Q,Qbar;

        tff GB(clk,rst,Tin,Q,Qbar);

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
            #7; Tin=$random;
            
                //Tin=0;Tin=1;@(posedge clk);
            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b Tin=%b Q=%b Qbar=%b Time=%0t",rst,clk,Tin,Q,Qbar,$time);
    endmodule

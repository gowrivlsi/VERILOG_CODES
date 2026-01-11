`include"srl.v"
module srff(
            input clk,rst,S,R,
            output Q,Qbar
            );
    wire q,qbar;
    srl S1(clk,rst,S,R,q,qbar);
    srl G2(~clk,rst,q,qbar,Q,Qbar);
    //srln S2(~clk,rst,q,qbar,Q,Qbar);
endmodule


//test bench
    module srff_tb();
        reg clk,rst,S,R;
        wire Q,Qbar;

        srff GB(clk,rst,S,R,Q,Qbar);

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
            #7; S=$random;R=$random;
            /*
                S=0;R=0;//@(posedge clk);
                S=0;R=1;//@(posedge clk);

                S=1;R=0;//@(posedge clk);

                S=1;R=1;//@(posedge clk);*/

            end
            end
            initial 
            #100 $stop();
                initial
                    $monitor("rst=%b clk=%b S=%b R=%b Q=%b Qbar=%b Time=%0t",rst,clk,S,R,Q,Qbar,$time);
    endmodule

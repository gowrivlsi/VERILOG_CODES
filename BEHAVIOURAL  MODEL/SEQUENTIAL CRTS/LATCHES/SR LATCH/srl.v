module srl(
            input clk,rst,s,r,
            output reg q,output qbar
            );
        assign qbar=~q;

        always @(clk,s,r) // OR @(clk or rst)
            begin
                if(!rst)//OR (rst!=0)
                    q<=0;
                else  //rst=1 
                    begin
                    if(clk==1)
                        begin
                            if(s==0 && r==0)
                                q<=q;
                            else if(s==0 && r==1)
                                q<=0;
                            else if(s==1 && r==0)
                                q<=1;
                            else
                                q<=1'bx;
                    end
                        end
            end
endmodule

//test bench
    module srl_tb();
        reg clk,rst,s,r;
        wire q,qbar;

        srl S1(clk,rst,s,r,q,qbar);

        always begin 
            clk=0; #5;
            clk=1; #5;
            end
            initial 
                begin
                    rst=0;
                    rst=1;
                end
        initial 
           repeat(5)
            begin
                //s=$random;r=$random; #5;
                s=0;r=0;#3;
                s=0;r=1;#3;
                s=1;r=0;#3;
                s=1;r=1;#3;

            end
            initial 
            #100 $stop();
                initial
                    $monitor("clk=%b rst=%b s=%b r=%b q=%b qbar=%b Time=%0t",clk,rst,s,r,q,qbar,$time);
    endmodule

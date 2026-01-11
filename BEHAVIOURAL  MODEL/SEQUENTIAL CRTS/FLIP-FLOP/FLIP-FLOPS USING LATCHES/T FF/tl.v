module tl(
        input clk,rst,tin,
        output reg q,output qbar
        );
    assign qbar=~q;

        always@(clk,tin)
            begin
                if(!rst)
                    q<=0;
                else
                    begin
                        if(clk==1)
                            begin
                                if(tin==0)
                                   q<=q;
                                else 
                                    q<=~q;
                            end
                    end
            end
endmodule


//Test Bench
     module tl_tb();
        reg clk,rst,tin;
        wire q,qbar;

        tl T1(clk,rst,tin,q,qbar);

        
          always
                begin
                    clk=0; #5;
                    clk=1; #5;
                end
        /*initial
            begin
                rst=0;#10;
                rst=1;
            end*/
            initial
                begin
                rst=0;#10;
                rst=1;
            repeat(7)
                begin
                tin=$random; #5;
                end
                end
            initial
                $monitor("clk=%b rst=%b tin=%b q=%b qbar=%b Time=%0t",clk,rst,tin,q,qbar,$time);

               initial
               #100 $stop();
    endmodule

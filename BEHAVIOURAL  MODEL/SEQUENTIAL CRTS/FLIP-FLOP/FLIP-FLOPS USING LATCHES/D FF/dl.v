module dl(
           input clk,rst,din,
           output reg q,output qbar
          );
    assign qbar=~q;

         always@(*)
                begin
                    if(!rst)
                        q<=q;
                    else 
                        begin
                        if(clk==1)
                            begin
                                if(din==0)
                                    q<=din;
                                else if(din==1)
                                    q<=din;
                            end
                        end

                end
endmodule

//Test bench
    module dl_tb();
        reg clk,rst,din;
        wire q,qbar;

        dl D1(clk,rst,din,q,qbar);

        
          always
                begin
                    clk=0; #5;
                    clk=1; #5;
                end
        initial
            begin
                rst=0;#5;
                rst=1;
            end
            initial
            repeat(7)
                begin
                din=$random; #5;
                end
            initial
                $monitor("clk=%b rst=%b din=%b q=%b qbar=%b Time=%0t",clk,rst,din,q,qbar,$time);

               initial
               #100 $stop();
    endmodule

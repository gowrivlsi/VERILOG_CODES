module dl(
           input clk,rst,din,
           output reg q,output qbar
          );
    assign qbar=~q;

         always@(clk,rst)
                begin
                    if(!rst)
                        q<=q;
                    else 
                        begin
                        if(clk==0)
                            begin
                                if(din==0)
                                    q<=din;
                                else if(din==1)
                                    q<=din;
                            end
                        end

                end
endmodule

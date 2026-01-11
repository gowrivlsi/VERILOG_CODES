module srl(
            input clk,rst,s,r,
            output reg q,output qbar
            );
        assign qbar=~q;

        always @(clk,rst) // OR @(clk or rst)
            begin
                if(!rst)//OR (rst!=0)
                    q<=0;
                else  //rst=1 
                    begin
                    if(clk==0)
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


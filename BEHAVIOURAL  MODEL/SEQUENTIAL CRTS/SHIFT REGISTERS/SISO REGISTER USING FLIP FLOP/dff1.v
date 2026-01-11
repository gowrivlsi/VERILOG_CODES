module dff1(
            input clk,rst,din,
            output reg q
             );
   // assign qn=~q;
    always@(posedge clk)
        begin
            if(!rst)
                q<=0;
            else 
                begin
                   if(din==1)
                       q<=din;
                   else
                       q<=din;
                end
        end
endmodule

module u1827c(
                input clk,rst,
                output reg[4:0] count
              );

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                count<=18;
            else
                count<=count+1;
            if(count==27)
               count<=18;
                    
                
        end
endmodule


//TEST BENCH CODE
    module u1827c_tb();
        reg clk,rst;
        wire [4:0]count;

            u1827c UP(clk,rst,count);
                
                //clock generation
                initial
                begin
                    clk=1;
                    forever #5 clk=~clk;
                end

                //rst generation
                initial
                begin
                    rst=0;
                    #20 rst=1;
                end

                initial
                #250 $stop;

                initial
                $monitor("count=%0d Time=%0t",count,$time);
    endmodule

module upcounter(
                input clk,rst,
                output integer count
                );

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                count<=0;
            else
                
                    count<=count+1;
                
        end
endmodule


//TEST BENCH CODE
    module upcounter_tb();
        reg clk,rst;
        wire integer count;

            upcounter UP(clk,rst,count);
                
                //clk generation
                initial 
                    begin
                    clk=0;
                    forever #5 clk=~clk;
                    end

                //rst generation
                initial
                    begin
                        rst=0;
                        #20 rst=1;
                    end
                    initial
                    #200 $stop;

                    initial
                    $monitor(" count=%0d Time=%0t",count,$time);
    endmodule

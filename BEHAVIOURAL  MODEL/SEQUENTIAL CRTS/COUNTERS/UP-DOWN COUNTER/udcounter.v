module udcounter(
                input clk,rst,
                input mode,
                output integer count
                );

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                count<=0;
            else
                begin
                    if(mode)
                        count<=count+1;
                    else if(!mode)
                        count<=count-1;
                end
        end
        
endmodule

//TEST BENCH CODE
    module udcounter_tb();
        reg clk,rst;
        reg mode;
        wire integer count;

            udcounter UDC(clk,rst,mode,count);
                
                //clok generation
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
                begin
                mode=1;
               #200 mode=0;
                end
                initial
                #500 $stop;

                initial
                $monitor("count=%0d Time=0t",count,$time);
    endmodule

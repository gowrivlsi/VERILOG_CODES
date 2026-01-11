module dcounter(
                input clk,rst,
                output reg[3:0]count
                );
    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                count<=0;
            else
                count<=count-1;
        end
endmodule


//TEST BENCH CODE
    module dcounter_tb();
        reg clk,rst;
        wire [3:0]count;

            dcounter DC(clk,rst,count);

                //clok generation
                initial
                begin
                    clk=1;
                    /*while(1)
                        begin
                            clk=1;
                            #5 clk=~clk;
                        end */
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
                $monitor("count=%0d Time=%0t",count,$time);
    endmodule

module siso (
                                input clk,rst,
                                input  s_in,
                                output reg s_out
                                );
    reg[3:0]temp;

        always @(posedge clk,negedge rst)
            begin
                if(!rst)
                    begin
                    s_out<=0;
                    temp<=0;
                    end
                else
                    begin
                       /* s_out<=temp[0];
                        temp[0]<=temp[1];
                        temp[1]<=temp[2];
                        temp[2]<=temp[3];
                        
                        temp[3]<=s_in;
                        temp[2]<=temp[3];
                        temp[1]<=temp[2];
                        temp[0]<=temp[1];
                        */
                        temp<={s_in,temp[3:1]};
                        s_out<=temp[0];
                    end
            end
endmodule


//TEST BENCH CODE
    module siso_tb ();
        reg clk,rst,s_in;
        wire  s_out;

            siso SISO(clk,rst,s_in,s_out);

            //Clock generation
                initial
                begin
                    clk=0;
                    forever #10 clk=~clk;
                end

                //reset generation
                initial
                begin
                    rst=0;
                    #20 rst=1;
                end

                initial
                begin
                wait(rst==1);
                    s_in=1;#15;
                    s_in=1;#20;
                    s_in=0;#20;
                    s_in=1;#20;
                end

                initial
                #200 $stop;

                initial
                $monitor("clk=%b rst=%b s_in=%b s_out=%b Time=%0t",clk,rst,s_in,s_out,$time);
    endmodule

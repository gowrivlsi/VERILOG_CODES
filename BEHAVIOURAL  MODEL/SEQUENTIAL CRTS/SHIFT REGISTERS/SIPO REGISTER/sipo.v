module sipo #(parameter width=4)(
                                    input clk,rst,s_in,mode,
                                    output reg [width-1:0]p_out
                                );      
    reg[width-1:0]temp;

        always @(posedge clk,negedge rst)
            begin
                if(!rst)
                    begin
                    p_out<=0;
                    temp<=0;
                    end
                else
                    begin
                        if(!mode)
                            begin
                                //temp<={s_in,temp[3:1]}; 
                                temp[3]<=s_in;
                                temp[2]<=temp[3];
                                temp[1]<=temp[2];
                                temp[0]<=temp[1];
                            end
                        else
                            p_out<=temp;
                       /* p_out<=temp[width-1:0];

                        temp[3]<=s_in;
                        temp[2]<=temp[3];
                        temp[1]<=temp[2];
                        temp[0]<=temp[1];
                        */
                       // temp<={s_in,temp[3:1]};
                        //p_out<=temp;
                    end
            end
endmodule

//TEST BENCH CODE
    module sipo_tb #(parameter width=4)();
        reg clk,rst,s_in,mode;
        wire [width-1:0]p_out;

            sipo SP(clk,rst,s_in,mode,p_out);

                //Clock generation
                initial
                begin
                    clk=0;
                    forever #10 clk=~clk;
                end

                //rst generation
                initial
                begin
                    rst=0;
                    #10 rst=1;
                end
                
                    initial
                    begin
                        mode=0;
                        #80 mode=1;
                    end
                initial
                begin
                    s_in=1;#15;
                    s_in=0;#20;
                    s_in=0;#20;
                    s_in=1;#20;
                end

                initial
                #180 $stop;

                initial
                $monitor("clk=%b rst=%b s_in=%b mode=%b p_out=%b Time=%0t",clk,rst,s_in,mode,p_out,$time);
    endmodule

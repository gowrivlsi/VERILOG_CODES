module piso #(parameter width=4)(
                                    input clk,rst,mode,
                                    input [width-1:0]p_in,
                                    output reg s_out
                                 );
    reg[width-1:0]temp;

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                begin
                    temp<=0;
                    s_out<=0;
                end
            else 
                begin
                    if(mode)
                        begin
                            temp<=p_in;
                        end
                    else 
                        begin
                        //FOR RIGHT SHIFT
                        //s_out<=temp[0];
                         //temp<=temp>>1;
                        
                        //FOR LEFT SHIFT
                        s_out<=temp[width-1];
                        temp<=temp<<1;
                        end
                end
        end
endmodule

//TEST BENCH CODE
    module piso_tb #(parameter width=4)();
        reg clk,rst,mode;
        reg [width-1:0]p_in;
        wire s_out;

            piso PS(clk,rst,mode,p_in,s_out);

            //clock generation
            initial
            begin
            clk=1;
            forever #10 clk=~clk;
            end

            initial
            begin
            rst=0;
            #10 rst=1;
            end

            initial
            #180 $stop;
                
                initial
                begin
                    mode=1;
                    #25 mode=0;
                end
            initial
            begin
              p_in=4'b1011;#20;            
            end

            initial
            $monitor("clk=%b rst=%b mode=%b p_in=%b s_out=%b Time=%0t",clk,rst,mode,p_in,s_out,$time);
    endmodule

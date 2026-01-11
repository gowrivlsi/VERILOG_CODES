module pipo #(parameter width=4)(
                                input clk,rst,
                                input [width-1:0]p_in,
                                output reg[width-1:0]p_out
                                );

    reg [width-1:0]temp;

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                begin
                temp<=0;
                p_out<=0;
                end
            else
                begin
                    p_out<=temp;
                    temp<=p_in;
                end
        end
endmodule

//  TEST BENCH CODE
    module pipo_tb #(parameter width=4)();
        reg clk,rst;
        reg [width-1:0]p_in;
        wire[width-1:0]p_out;

            pipo PO(clk,rst,p_in,p_out);

            //clock generation
            initial
            begin
                clk=1;
                forever #10 clk=~clk;
            end

            //reset generation
            initial
            begin
            rst=0;
            #10 rst=1; 
            end

            initial
            begin
            p_in=4'b1011;
            end

            initial
            $monitor("clk=%b rst=%b p_in=%b p_out=%b Time=%0t",clk,rst,p_in,p_out,$time);
            
            initial
            begin
            #120 $stop;
            end
    endmodule

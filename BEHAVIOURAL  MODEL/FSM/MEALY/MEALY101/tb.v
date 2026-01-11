//Test Bench Code
`include "mealy1.v"
module tb();
    reg clk_i,rst_i;
    reg x_i;
    wire y_o;

    //Instattiation
        mealy1 M1(clk_i,rst_i,x_i,y_o);

    //clk generation
        initial begin clk_i=0;
            forever #5 clk_i=~clk_i;
        end

    //rst generation
        initial begin
            rst_i=0;
        #20 rst_i=1;
        end

    //Stimulus generation
        initial
            begin
                x_i=0;
                #30 repeat(20)
                    begin
                        #10 x_i=$random;
                    end
            end

             initial
                 $monitor("clk_i=%0b rst_i=%0b x_i=%0b y_o=%0b Time=%0t",clk_i,rst_i,x_i,y_o,$time);
endmodule

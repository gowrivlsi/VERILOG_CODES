`include "mealy.v"
module tb();
    reg clk_i,rst_i;
    reg x_i;
    wire y_o;

    mealy_101 RTL(
                    .clk(clk_i),
                    .rst(rst_i),
                    .x(x_i),
                    .y(y_o)
                );


    initial begin
        clk_i=1;
        forever #5 clk_i=~clk_i;
    end

    initial begin
        rst_i=0;
        #20
        rst_i=1;
    end

    initial begin
        x_i=0; #30;
        repeat(20)
            #10 x_i=$random;
    end
        initial
        $monitor("clk_i=%0b rst_i=%0b x_i=%0b y_o=%0b Time=%0t",clk_i,rst_i,x_i,y_o,$time);

endmodule

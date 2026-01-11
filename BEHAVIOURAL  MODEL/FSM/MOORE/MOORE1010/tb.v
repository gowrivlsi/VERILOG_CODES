`include "moore1.v"

module tb();
    reg clk,rst,x;
    wire y;

    //instantion
    moore1 M1(clk,rst,x,y);

    //clk generation
    initial begin clk=0;
    forever #5 clk=~clk;
    end

    //rst generation
    initial begin
        rst=0;
    #20 rst=1;
    end

    //stimulus generation
    initial begin
        x=0;
#30 repeat(20)
        begin
            #10 x=$random;
        end
    end

    initial
      $monitor("clk_i=%0b rst_i=%0b x_i=%0b y_o=%0b Time=%0t",clk,rst,x,y,$time);
endmodule

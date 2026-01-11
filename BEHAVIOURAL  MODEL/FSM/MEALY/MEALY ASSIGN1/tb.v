`include "assign1.v"
module tb();
        reg clk,rst,pready,transfer;
        wire pselx,penable;

  //instantition
    assign1 A1(clk,rst,pready,transfer,pselx,penable);

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
        pready=0;
        transfer=0;
        #30 repeat(20)
        begin
            #10 pready=$random; transfer=$random;
        end
    end

    initial
      $monitor("clk_i=%0b rst_i=%0b pready_i=%0b transfer_i=%0d pselx_o=%0b penable_o=%0d Time=%0t",clk,rst,pready,transfer,pselx,penable,$time);
endmodule

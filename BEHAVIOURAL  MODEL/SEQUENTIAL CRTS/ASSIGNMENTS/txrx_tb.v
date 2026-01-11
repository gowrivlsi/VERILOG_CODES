`include "assign1.v"
//---------------------------------------------------TEST BENCH CODE----------------------
`timescale 1ns/1ps

module txrx_tb;
    reg clk, rst, wr1, rd1, wr2, rd2, mode;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate your design
    txrx1 DUT (
        .clk(clk),
        .rst(rst),
        .wr1(wr1),
        .rd1(rd1),
        .wr2(wr2),
        .rd2(rd2),
        .mode(mode),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("txrx_tb.vcd");
        $dumpvars(0, txrx_tb);

        // Initialize
        clk = 0; rst = 0;
        wr1 = 0; rd1 = 0; wr2 = 0; rd2 = 0;
        mode = 1; data_in = 0;

        // Reset system
        #10 rst = 1;

        // Continuous transmission loop
        forever begin
            // --- Send 18 ---
            #5 data_in = 8'd18; wr1 = 1; #10 wr1 = 0;
            rd1 = 1; #10 rd1 = 0;
            mode = 0; repeat(8) #10; mode = 1;
            wr2 = 1; #10 wr2 = 0;
            rd2 = 1; #10 rd2 = 0;
            $display("Output = %d", data_out);

            // --- Send 43 ---
            #25 data_in = 8'd43; wr1 = 1; #10 wr1 = 0;
            rd1 = 1; #10 rd1 = 0;
            mode = 0; repeat(8) #10; mode = 1;
            wr2 = 1; #10 wr2 = 0;
            rd2 = 1; #10 rd2 = 0;
            $display("Output = %d", data_out);

            // --- Send 64 ---
            #10 data_in = 8'd64; wr1 = 1; #10 wr1 = 0;
            rd1 = 1; #10 rd1 = 0;
            mode = 0; repeat(8) #10; mode = 1;
            wr2 = 1; #10 wr2 = 0;
            rd2 = 1; #10 rd2 = 0;
            $display("Output = %d", data_out);
        end
        
    end
    initial
#1000 $stop;
endmodule

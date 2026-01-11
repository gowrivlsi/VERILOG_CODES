module ramp #(parameter R=7,W=4) (
                                   input clk,rst,
                                   input wr_rd,
                                   input [2**W-1:0]d_in,
                                   input [R-1:0]addr,
                                   output reg [2**W-1:0] d_out
                                  );

   //MEMORY ALLOCATION
    reg[2**W-1:0] mem[2**R-1:0];
    integer i;

  always @(posedge clk or negedge rst)
    begin
        if(!rst) 
            begin
                d_out<=0;
                for(i=0;i<2**R;i=i+1)
                    mem[i]<=0;
            end
        else
            begin
                if(wr_rd)
                    mem[addr]<=d_in;
                else
                    d_out<=mem[addr];
            end

    end
endmodule

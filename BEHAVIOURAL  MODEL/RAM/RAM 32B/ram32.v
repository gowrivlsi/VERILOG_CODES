module ram32(
                input clk,rst,
                input wr_rd,
                input [7:0]d_in,
                input [4:0]addr,
                output reg [7:0]d_out
             );
    //MEMORY ALLOCAION
    reg [7:0] mem [31:0];       //(Data_width) mem name(depth(2**addr))
    integer i;
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                d_out<=0;
                for(i=0;i<32;i=i+1)
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

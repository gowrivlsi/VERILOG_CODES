module ramp #(parameter R=7,W=4) (
                                   input clk,rst,
                                   input wr_rd,
                                   input [2**W-1:0]d_in,
                                   input [R-1:0]addr,
                                   output  empty,full,
                                   output reg [2**W-1:0] d_out
                                  );

    //for count
        reg [R:0]count;

   //MEMORY ALLOCATION
    reg[2**W-1:0] mem[2**R-1:0];
    integer i;


             assign   empty=(count==0);
             assign   full=(count==2**R);

  always @(posedge clk or negedge rst)
    begin
        if(!rst) 
            begin
                d_out<=0;
          //      empty<=1;
            //    full<=0;
                count<=0;
                for(i=0;i<2**R;i=i+1)
                    mem[i]<=0;
            end
        else
            begin
                if(wr_rd)
                    begin
                    mem[addr]<=d_in;
                    if(count<2**R)
                        count=count+1;
                    end
                else begin
                    d_out<=mem[addr];
                    if(count>0)
                        count=count-1;
                    end
            end

    end
endmodule

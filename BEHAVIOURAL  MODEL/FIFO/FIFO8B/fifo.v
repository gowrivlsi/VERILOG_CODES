module fifo(
            input clk,rst,
            input [7:0] d_in,
            input wr,rd,
            output empty,full,
            output reg [7:0] d_out
            );
    //MEMORY ALLOCATION 
        reg [7:0] mem [7:0];

    //wrire and read declaration
        reg [3:0] wr_ptr;
        reg [3:0] rd_ptr;
    //ASSIGNING FULL AND EMPTY 

        //assign empty=((wr_ptr-1'b1)==rd_ptr);
      //assign full=((wr_ptr+1'b1)==rd_ptr);
      assign empty=(wr_ptr==rd_ptr);
        assign full=({!wr_ptr[3],wr_ptr[2:0]}==rd_ptr);
        
        integer i;
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    d_out<=0;
                    wr_ptr<=0;
                    rd_ptr<=0;
                    for(i=0;i<8;i=i+1)
                        mem[i]<=0;
                end
            else
                begin
                    if(wr && !rd && !full)
                        begin
                            mem[wr_ptr]<=d_in;
                            wr_ptr<=wr_ptr+1;
                        end
                    else 
                        if(!wr && rd && !empty)
                            begin
                               d_out<=mem[rd_ptr];
                               rd_ptr<=rd_ptr+1;
                            end
                    else
                        if((wr  && !full) && (rd && !empty))
                            begin
                                //wr_ptr<=wr_ptr+1;
                                mem[wr_ptr]<=d_in;
                                wr_ptr<=wr_ptr+1;
                                 //rd_ptr<=rd_ptr+1;
                                d_out<=mem[rd_ptr];
                                rd_ptr<=rd_ptr+1;
                            end
                end
        end
endmodule

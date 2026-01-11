`include "ram32.v"

//TEST BENCH CODE
module ram32_tb();
    reg clk,rst;
    reg wr_rd;
    reg [7:0]d_in;
    reg [4:0]addr;
    wire [7:0] d_out;
    //declarinf finish as reg
        reg finish;

        integer i;
    //instatiation
        ram32 RAM(clk,rst,wr_rd,d_in,addr,d_out); //OR ram32 ram(.*)

        //clok generatiomn

        initial begin
        clk=0;
            forever #5 clk=~clk;
        end

        //rst generation
        initial
        begin
        rst=0;
        #20 rst=1;
        end

        //wr_rd using task function
        //for write task
        task write();
            begin
                wr_rd=1;
                for(i=0;i<32;i=i+1)
                    begin
                        addr=i;
                        d_in=$random;
                        #10;
                    end
            end
        endtask
        
       //for read task

        task read();
            begin
                wr_rd=0;
                for(i=0;i<32;i=i+1)
                        begin
                            addr=i;
                            #10;
                        end
                        finish=1;
            end
        endtask

        //caling task
            initial
            begin
                wait(rst==1);
                write();
                read();
            end

        //finishing 
            initial
            begin
                wait(finish==1);
                $stop;
            end
endmodule


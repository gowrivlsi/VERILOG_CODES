`include "ramp.v"

//TEST BENCH CODE
module ramp_tb #(parameter R=7,W=4) ();
    reg clk,rst;
    reg wr_rd;
    reg [2**W-1:0]d_in;
    reg [R-1:0]addr;
    wire [2**W-1:0]d_out;

    reg finish;
    integer i,file1;

    //INSTANTIATION
        ramp RAM(.*);

    //clk generation
        initial
        begin
            clk=0;
            forever #5 clk=~clk;
        end

    //rst generation
        initial begin
            rst=0;
            #20 rst=1;
        end

    //task generation for write and read
        //for  WRITE
            task write();
            begin
                wr_rd=1;
                for(i=0;i<2**R;i=i+1)
                    begin
                        addr=i;
                        d_in=$random;
                        #10;
                        $fdisplay(file1,"write=%0d addr=%0d d_in=%0d",wr_rd,addr,d_in);#2;
                    end
            end

            endtask

        //for READ
            task read();
                begin
                    wr_rd=0;
                    for(i=0;i<2**R;i=i+1)
                        begin
                            addr=i;
                            #10;
                            $fdisplay(file1,"Read=%0d addr=%0d d_out=%0d",wr_rd,addr,d_out);#2;
                        end
                     finish=1;
                end
            endtask

        //calling task
            initial
            begin
            wait (rst==1);
            file1=$fopen("RAMP.txt");
            #5;
            write();
            read();

            #30;
            $fclose(file1);
            end

        //finishing
            initial begin
            wait (finish==1);
            $stop;
            end

            defparam RAM.R=R;
            defparam RAM.W=W;

endmodule

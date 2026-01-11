//compliler directives
`include "fifo.v"

//TEST BENCH CODE
module fifo_tb();
    reg clk,rst;
    reg [7:0] d_in;
    reg wr,rd;
    wire empty,full;
    wire [7:0] d_out;

    integer file1,file2,file3;
    reg finish;
    
       
    //INSTANTIATION
        fifo FIFO(.*);

    //CLOCK GENERATION
        initial begin
            clk=0;
            forever #5 clk=~clk;
        end
    //RST GENERATION
        initial begin
            rst=0;
            #20 rst=1;
        end
    //TASK FOR WRITE AND READ 
        //for write wr=1 rd=0
        task write();
        integer i;
            begin
               wr=1;  rd=0;
                // repeat(8)
                for(i=0;i<8;i=i+1)
                    begin
                    d_in=$random;//#8;
                    @(negedge clk);
                     $fdisplay(file1,"write=%0d d_in=%0d full=%0d empty=%0d",wr,d_in,full,empty);//#12;
                    end
                  //wr=0;      
              //finish=1;
            end
        endtask

        //for read wr==0 rd==1
            task read();
                begin
                    wr=0; rd=1;
                    repeat(8)begin
                     @(negedge clk);
                     $fdisplay(file2,"read=%0d d_out=%0d",rd,d_out);//#10;
                     end
                    // rd=0;
                   // finish=1;
                end
            endtask
        //for both wr==1 rd==1
            task write_read();
            integer i;
                begin
                    wr=1;
                    rd=1;//#10;
                    //repeat(8) begin
                    for(i=0;i<8;i=i+1) begin
                       d_in=$random;
                     @(negedge clk);
                     d_in=$random;
                    $fdisplay(file3,"write=%0d d_in=%0d full=%0d read=%0d d_out=%0d empty=%0d",wr,d_in,full,rd,d_out,empty);//#100;
                    end
                   // wr=0;rd=0;
                  finish=1;
                end
            endtask
    //CALLING TASK
           initial 
           begin
            wait (rst==1);
            file1=$fopen("FIFO Write.txt");
            #5;
            file2=$fopen("FIFO Read.txt");
            #5;
            file3=$fopen("FIFO wr_rd.txt");
            #5;

           // @(negedge clk);
          // write();
            //@(negedge clk);
            //read();
            write_read();
         $fclose(file1);
         $fclose(file2);
         $fclose(file3);
           end
    //FINISHING
        initial begin
           // wait (finish==1);
            #110 $stop;
        end
    //FOR DISPLAYONG 
        initial
        $monitor("clk=%0d rst=%0d wr=%0d d_in=%0d rd=%0d d_out=%0d empty=%0d full=%0d Time=%0t",clk,rst,wr,d_in,rd,d_out,empty,full,$time);

      /*
      initial begin
            wait (rst==1);
            write();
        end
        */
    
endmodule

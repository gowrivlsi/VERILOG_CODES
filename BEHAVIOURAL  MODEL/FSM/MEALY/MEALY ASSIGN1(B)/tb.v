//.....................................................TEST BENCH CODE.........................................................

`include "assign1b.v"

module tb();
   reg clk,rst,transfer,pready,pwrite;
   wire pselx,penable;

   //instantation
        assign1b A1(.*);

   initial begin
   clk=0;
   forever #5 clk=~clk;
    end
    
   initial begin
        rst=0;
    #20 rst=1;
   end

   initial begin
        transfer=0; #20;
        transfer=1; #20;
        transfer=1; #20;
        if(A1.cs==A1.access)
            begin
                pwrite=1;
                pready=0;
            end
            /*
                pwrite=0;
                tranfer=1;#25;
                pready=0; transfer=0; #10;
            */
   end

   always @(A1.cs)
   begin
      case(A1.cs)
        0   :   $display("IDEAL");
        1   :   $display("SETUP");
        2   :   $display("ACCESS");
      endcase
   end
    
    always @(posedge clk)
        begin
            if(A1.cs==A1.access && penable==1 && pwrite==1)
                $display("HI");
            else
                if(A1.cs==A1.access && penable==1 && pwrite==0)
                    $display("BYE");
        end

        initial
            $monitor("clk_i=%0d rst_i=%0d transfer_i=%0d pready_i=%0d pselx_o=%0d penable_o=%0d pwrite_i=%0d Time=%0t",clk,rst,transfer,pready,pselx,penable,pwrite,$time);
   endmodule

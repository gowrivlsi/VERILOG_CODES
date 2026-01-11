`include "rcs.v"

//TEST BENCH CODE
    module rcs_tb #(parameter G=32)();
        reg [G-1:0]a,b;
        reg        bin;
        wire [G-1:0]diff;
        wire        bout;

        //INTANTIATION
            rcs RCS(a,b,bin,diff,bout);
            integer file1,file2;

            //stimulus generation and file handling
            initial
            
                begin
                    file1=$fopen("input.txt");
                    file2=$fopen("output.txt");
                    repeat(10)
                    begin
                        a=$urandom_range(10,15);b=$urandom_range(5,9);bin=1;
                        $fdisplay(file1,"a=[%0d] b=[%0d] bin=[%0d]",a,b,bin);#1;
                        $fdisplay(file2,"diff=[%0d] bout=[%0d]",diff,bout);
                        #20;
                    end
                    
                    $fclose(file1);
                    $fclose(file2);
                end

           
    endmodule

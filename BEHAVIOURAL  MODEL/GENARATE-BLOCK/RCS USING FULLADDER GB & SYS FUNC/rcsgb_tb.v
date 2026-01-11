`include"rcsgb.v"

//TESTBENCH CODE
    module rcsgb_tb #(parameter G=32)();
        reg [G-1:0]a,b;
        reg bin;
        wire [G-1:0]diff;
        wire bout;

        //instatiation
            rcsgb RCA(a,b,bin,diff,bout);

        integer file1,file2;
        //stimulus generation WITH FILE HANDALING
            initial begin
                file1=$fopen("Input.txt");
                file2=$fopen("Output.txt");
            
            repeat(10)
            begin
               a=$urandom_range(20,30);b=$urandom_range(0,10);bin=$random;
               $fdisplay(file1,"a=[%0d] b=[%0d] bin=[%0d]",a,b,bin);#1;
               $fdisplay(file2,"diff=[%0d] bout=[%0d]",diff,bout);
                #20;
            end
                
                $fclose(file1);
                $fclose(file2);

            end
            //OVERRIGING PARAMETER
            defparam RCA.G=G;
            
            //initial
            //$monitor("a=[%0d] b=[%0d] cin=[%0d] sum=[%0d] carry=[%0d] Time=%0t",a,b,cin,sum,carry,$time);
    endmodule

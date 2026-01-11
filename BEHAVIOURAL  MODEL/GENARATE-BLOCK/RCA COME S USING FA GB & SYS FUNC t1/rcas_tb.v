`include "rcas.v"

//TEST BENCH CODE

module rcas_tb #(parameter G=32)();
    reg [G-1:0] a,b;
    reg         cin;
    reg         mode;
    wire [G-1:0] sum;
    wire         carry;

    //INTANSTIATION
        rcas RCAS(a,b,cin,mode,sum,carry);

        //STIMULUS GENERATION WITH FILE HANDLING
        
            integer file1,file2,file3,file4;
        initial
        begin
            file1=$fopen("Inputs for mode1.txt");
            file2=$fopen("Outputs for mode1.txt");
            file3=$fopen("Inputs for mode0.txt");
            file4=$fopen("Outputs for mode0.txt");

            repeat(10)
            begin
                mode=0;
                a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;
                $fdisplay(file3,"a=[%0d] b=[%0d] cin=[%0d]",a,b,cin);#1;
                $fdisplay(file4,"sum=[%0d] carry=[%0d]",sum,carry);
                #20;

            #100;mode=1;
                a=$urandom_range(20,30);b=$urandom_range(0,10);cin=1;
                $fdisplay(file1,"a=[%0d] b=[%0d] bin=[%0d]",a,b,cin);#1;
                $fdisplay(file2,"diff=[%0d] borr=[%0d]",sum,carry);
                #20;
            end
            $fclose(file1);
            $fclose(file2);
            $fclose(file3);
            $fclose(file4);
        end


endmodule

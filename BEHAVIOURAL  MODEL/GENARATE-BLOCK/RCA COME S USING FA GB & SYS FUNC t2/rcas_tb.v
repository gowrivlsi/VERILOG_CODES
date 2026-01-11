`include "rcas.v"

//TEST BENCH CODE

module rcas_tb #(parameter G=32,mode=0)();
    reg [G-1:0] a,b;
    reg         cin;
    wire [G-1:0] sum;
    wire         carry;

    //INTANSTIATION
        rcas RCAS(a,b,cin,sum,carry);

        //STIMULUS GENERATION WITH FILE HANDLING
        
            integer file1,file2;
        initial
        begin
            file1=$fopen("Adder.txt");
            file2=$fopen("Subtractor.txt");
            
            repeat(10)
            begin
                if(mode)
                    begin
                        a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;#1;
                        $fdisplay(file1,"a=[%0d] b=[%0d] cin=[%0d] sum=[%0d] carry=[%0d]",a,b,cin,sum,carry);
                    end
                else
                    begin
                        a=$urandom_range(40,100);b=$urandom_range(0,30);cin=1;#1;
                        $fdisplay(file2,"a=[%0d] b=[%0d] bin=[%0d] diff=[%0d] borr=[%0d]",a,b,cin,sum,carry);
                    end
                    #10;
            end
            $fclose(file1);
            $fclose(file2);
        end

        //PARAMETER OVERRIDING
        defparam RCAS.mode=mode;
endmodule

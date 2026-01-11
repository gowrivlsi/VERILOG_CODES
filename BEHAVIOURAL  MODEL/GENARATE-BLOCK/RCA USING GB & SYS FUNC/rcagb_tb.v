`include"rcagb.v"

//TESTBENCH CODE
    module rcagb_tb #(parameter G=128)();
        reg [G-1:0]a,b;
        reg cin;
        wire [G-1:0]sum;
        wire carry;

        //instatiation
            rcagb RCA(a,b,cin,sum,carry);

        integer file1,file2;
        //stimulus generation WITH FILE HANDALING
            initial begin
                file1=$fopen("Input.txt");
                file2=$fopen("Output.txt");
            
            repeat(10)
            begin
               a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;
               $fdisplay(file1,"a=[%0d] b=[%0d] cin=[%0d]",a,b,cin);#1;
               $fdisplay(file2,"sum=[%0d] carry=[%0d]",sum,carry);
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

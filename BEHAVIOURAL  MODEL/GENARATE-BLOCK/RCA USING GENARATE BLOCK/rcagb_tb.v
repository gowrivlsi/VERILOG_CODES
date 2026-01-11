`include"rcagb.v"

//TESTBENCH CODE
    module rcagb_tb #(parameter G=128)();
        reg [G-1:0]a,b;
        reg cin;
        wire [G-1:0]sum;
        wire carry;

        //instatiation
            rcagb RCA(a,b,cin,sum,carry);


        //stimulus generation
            initial
            repeat(10)
            begin
               a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;
                #20;
            end

            //OVERRIGING PARAMETER
            defparam RCA.G=G;
            
            initial
            $monitor("a=[%0d] b=[%0d] cin=[%0d] sum=[%0d] carry=[%0d] Time=%0t",a,b,cin,sum,carry,$time);
    endmodule

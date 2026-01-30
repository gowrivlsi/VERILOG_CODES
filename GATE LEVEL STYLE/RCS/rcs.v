`include"full_adder.v"
module rcs(
            input[3:0]a,b,
            input bin,
            output[3:0]diff,
            output bout
           );
    wire w0,w1,w2;
        full_adder FA1(a[0],~b[0],bin,diff[0],w0);
        full_adder FA2(a[1],~b[1],w0,diff[1],w1);
        full_adder FA3(a[2],~b[2],w1,diff[2],w2);
        full_adder FA4(a[3],~b[3],w2,diff[3],bout);
endmodule

      //Testbench Code

        module rcs_tb();
            reg[3:0]a,b;
            reg bin;
            wire[3:0]diff;
            wire bout;

            rcs R1(a,b,bin,diff,bout);

                initial 
                repeat(7)
                    begin
                        a=$random %16; b=$random %16; bin=1;#10;
                    end
                        initial
                        $monitor("a=%b  b=%b   bin=%b  diff=%b  bout=%b  Time=%0t",a,b,bin,diff,bout,$time);
           endmodule       

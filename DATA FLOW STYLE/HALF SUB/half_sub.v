module half_sub(
                input a,b,
                output diff,bout
                );
    assign diff=a^b;
    assign bout=~a&b;
endmodule

//testbench

        module half_sub_tb();
            reg a,b;
            wire diff,bout;

            half_sub HS(a,b,diff,bout);

            initial
                begin
                    a=0;b=0;#5;
                    a=0;b=1;#5;
                    a=1;b=0;#5;
                    a=1;b=1;#5;
                end
                    initial
                    $monitor("a=%b b=%b diff=%b bout=%b Time=%0t",a,b,diff,bout,$time);
         endmodule

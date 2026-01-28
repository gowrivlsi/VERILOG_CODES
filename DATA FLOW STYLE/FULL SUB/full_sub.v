module full_sub(
                input a,b,bin,
                output diff,bout
                );
    assign diff=a^b^bin;
    assign bout=(~a&b)|(bin&(a~^b));
endmodule

//Testbench code
    module full_sub_tb();
        reg a,b,bin;
        wire diff,bout;

        full_sub FS(a,b,bin,diff,bout);

        initial
        repeat(9)
            begin
                //a=0; b=0; bin=0;#5;
                a=$random;b=$random; bin=$random;#5;
            end
                initial
                $monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%0t",a,b,bin,diff,bout,$time);
    endmodule

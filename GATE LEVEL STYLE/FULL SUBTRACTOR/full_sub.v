module full_sub(input a,b,bin,output diff,bout);
        wire w1,w2,w3;
        xor X1(w1,a,b);
        and A1(w2,~a,b);
        xor X2(diff,w1,bin);
        and A2(w3,~w1,bin);
        or R1(bout,w2,w3);
endmodule


//testbench code
    module full_sub_tb();
        reg a,b,bin;
        wire diff,bout;

        full_sub F1(a,b,bin,diff,bout);

        initial 
        repeat(7)
            begin 
                a=$random;
                b=$random;
                bin=$random; #5;
            end
            initial
                $monitor("a=%b  b=%b  bin=%b  diff=%b  bout=%b  Time=%t",a,b,bin,diff,bout,$time);
     endmodule

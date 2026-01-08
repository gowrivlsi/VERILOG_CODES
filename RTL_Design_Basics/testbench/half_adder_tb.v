//Test bench
    module halfadder_tb();
        reg a,b;
        wire s,c;

            halfadder H1(a,b,s,c);

            initial
            repeat(5)
            begin
                a=$random; b=$random; #5;
            end

            initial
            $monitor("a=%b b=%b s=%b c=%b Time=%0t",a,b,s,c,$time);
            //$info("a=%b b=%b s=%b c=%b Time=%0t",a,b,s,c,$time);
            //$display("a=%b b=%b s=%b c=%b Time=%0t",a,b,s,c,$time);

            
    endmodule

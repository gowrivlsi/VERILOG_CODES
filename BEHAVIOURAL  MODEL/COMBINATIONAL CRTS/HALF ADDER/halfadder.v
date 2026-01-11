module halfadder(
                input a,b,
                output reg s,c
                );

    always@(a,b)
        begin
            if(~a && ~b)
                begin
                    s=0; c=0;
                end
            else if(~a && b)
                begin
                    s=1; c=0;
                end
            else if(a && ~b)
                begin
                    s=1; c=0;
                end
            else
                begin
                s=0; c=1;
                end
        end
endmodule

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

module fullsub(
                input a,b,bin,
                output reg diff,bout
                );
    always@(*)
        begin
            if(~a && ~b && ~bin)
                begin
                    diff=0;bout=0;
                end
            else if(~a && ~b && bin)
                begin
                    diff=1;bout=1;
                end
            else if(~a && b && ~bin)
                begin
                    diff=1;bout=1;
                end
            else if(~a && b && bin)
                begin
                    diff=0;bout=1;
                end
            else if(a && ~b && ~bin)
                begin
                    diff=1;bout=0;
                end
            else if(a && ~b && bin)
                begin
                    diff=0;bout=0;
                end
            else if(a && b && ~bin)
                begin
                    diff=0;bout=0;
                end
            else
                begin
                    diff=1;bout=1;
                end

        end
endmodule

//Test Bench Code
    module fullsub_tb();
        reg a,b,bin;
        wire diff,bout;

            fullsub F1(a,b,bin,diff,bout);

                initial
                repeat(17)
                    begin
                        a=$random;b=$random; bin=1; #5;
                    end

                    initial 
                    $monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%0t",a,b,bin,diff,bout,$time);
    endmodule

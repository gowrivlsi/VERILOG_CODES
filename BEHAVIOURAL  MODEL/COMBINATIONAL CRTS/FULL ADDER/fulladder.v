module fulladder(
                input a,b,cin,
                output reg s,c
                );
    always@(*)
        begin
            if(~a && ~b && ~cin)
                begin
                    s=0;c=0;
                end
            else if(~a && ~b && cin)
                begin
                    s=1; c=0;
                end
            else if(~a && b && ~cin)
                begin
                    s=1; c=0;
                end
            else if(~a && b && cin)
                begin
                    s=0; c=1;
                end
            else if(a && ~b && ~cin)
                begin
                    s=0; c=0;
                end
            else if(a && ~b && cin)
                begin
                    s=0; c=1;
                end
            else if(a && b && ~cin)
                begin
                    s=0; c=1;
                end
            else
                begin
                    s=1;c=1;
                end
        end
endmodule


//Test bench
    module fulladder_tb();
        reg a,b,cin;
        wire s,c;

            fulladder F1(a,b,cin,s,c);

                initial
                repeat(8)
                    begin
                        a=$random;b=$random; cin=1; #5;
                    end

                    initial 
                    $monitor("a=%b b=%b cin=%b s=%b c=%b Time=%0t",a,b,cin,s,c,$time);
    endmodule

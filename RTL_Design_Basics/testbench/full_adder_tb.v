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

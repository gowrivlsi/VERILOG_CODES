module comp2bit(
                input [1:0]a,b,
                output G,E,L
                );
    assign G=(a[1]&~b[1])|((a[1]~^b[1])&(a[0]&~b[0]));
    assign L=(~a[1]&b[1])|((a[1]~^b[1])&(~a[0]&b[0]));
    assign E=(a[1]~^b[1])&(a[0]~^b[0]);
endmodule

    //Testbench Code
           module comp2bit_tb();
                reg[1:0]a,b;
                wire G,E,L;

                    comp2bit B2(a,b,G,E,L);

                    initial
                    repeat(9)
                        begin
                            a=$random;b=$random;#5;
                        end
                            initial
                            $monitor("a=%b b=%b G=%b E=%b L=%b Time=%0t",a,b,G,E,L,$time);
           endmodule

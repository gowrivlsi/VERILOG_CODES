module comp4bit(
                input[3:0]a,b,
                output G,E,L
                );
    assign G=(a[3]&~b[3])|((a[3]~^b[3])&(a[2]&~b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]&~b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]&~b[0]));
    assign L=(~a[3]&b[3])|((a[3]~^b[3])&(~a[2]&b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(~a[1]&b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(~a[0]&b[0]));
    assign E=(a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]~^b[0]);
endmodule

//Testbench code
    module comp4bit_tb();
                reg[3:0]a,b;
                wire G,E,L;

                    comp4bit B4(a,b,G,E,L);

                    initial
                    repeat(17)
                        begin
                            a=$random;b=$random;#5;
                        end
                            initial
                            $monitor("a=%b b=%b G=%b E=%b L=%b Time=%0t",a,b,G,E,L,$time);
           endmodule

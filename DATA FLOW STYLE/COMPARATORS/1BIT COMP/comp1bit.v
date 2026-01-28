module comp1bit(
                input a,b,
                output G,E,L
                );
        assign G=a&~b;
        assign E=a~^b;
        assign L=~a&b;
endmodule


    //Testbenchcode
            module comp1bit_tb();
                reg a,b;
                wire G,E,L;

                    comp1bit B1(a,b,G,E,L);

                    initial
                    repeat(5)
                        begin
                            a=$random;b=$random;#5;
                        end
                            initial
                            $monitor("a=%b b=%b G=%b E=%b L=%b Time=%0t",a,b,G,E,L,$time);
            endmodule

module comp1b(
              input a,b,
              output reg G,E,L
              );
        always@(*)
            begin
                G=0;E=0;L=0; //default
                if(a && ~b)
                    G=1;
                else if(a && b)
                    E=1;
                else if(~a && ~b)
                    E=1;
                else
                    L=1;

            end
endmodule


//Test bench code
    module comp1b_tb();
                reg a,b;
                wire G,E,L;

                    comp1b B1(a,b,G,E,L);

                    initial
                    repeat(5)
                        begin
                            a=$random;b=$random;#5;
                        end
                            initial
                            $monitor("a=%b b=%b G=%b E=%b L=%b Time=%0t",a,b,G,E,L,$time);
            endmodule

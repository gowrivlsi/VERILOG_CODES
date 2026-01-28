module full_adder(
                    input a,b,cin,
                    output s,cout
                   );
        assign s=a^b^cin;
        assign cout=(a&b)|(cin&(a^b));
endmodule


//testbench code

        module full_adder_tb();
        reg a,b,cin;
        wire s,cout;

            full_adder FA(a,b,cin,s,cout);

            initial
                begin
                    a=0;b=0;cin=0;#5;
                    a=0;b=1;cin=1;#5;
                    a=0;b=1;cin=0;#5;
                    a=0;b=1;cin=1;#5;
                    a=1;b=0;cin=0;#5;
                    a=1;b=0;cin=1;#5;
                    a=1;b=1;cin=0;#5;
                    a=1;b=1;cin=1;#5;
                    
                end
                initial
                $monitor("a=%b b=%b cin=%b s=%b cout=%b Time=%0t",a,b,cin,s,cout,$time);
        endmodule

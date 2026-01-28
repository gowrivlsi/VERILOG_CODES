module half_adder(input a,b,output s,cout);
    
    assign s=a^b;
    assign cout=a&b;
endmodule

    //testbench code
    module half_adder_tb();
        reg a,b;
        wire s,cout;

        half_adder HA(a,b,s,cout);

        initial
        repeat(5)
            begin
                a=0;b=0;#10; 
                a=0;b=1;#10;
                a=1;b=0;#10;
                a=1;b=1;#10;
            end
            initial
            $monitor("a=%b b=%b s=%b cout=%b Time=%0t",a,b,s,cout,$time);
   endmodule

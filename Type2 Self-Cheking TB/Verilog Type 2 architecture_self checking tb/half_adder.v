//Design for half_adder


module  half_adder(input  a,b,
                   output sum,carry);
     
     //logic implementation
        assign sum=a^b;
        assign carry=a&b;
endmodule

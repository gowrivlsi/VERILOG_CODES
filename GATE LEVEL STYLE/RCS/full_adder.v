module full_adder(input a,b,cin,output sum,carry);
            wire w1,w2,w3;
            xor X1(w1,a,b);
            xor X2(sum,w1,cin);
            and A1(w2,a,b);
            and A2(w3,w1,cin);
            or OR1(carry,w2,w3);
endmodule


//TESTBENCH CODE
module full_adder_tb();
  reg a,b,cin;
  wire sum,carry;
   full_adder F1(a,b,cin,sum,carry);

   initial 
   repeat(5)
    begin
        a=$random;b=$random;cin=1; #10;
     end
        initial
        $monitor("a=%b b=%b cin=%b sum=%b carry=%b time=%0t",a,b,cin,sum,carry,$time);
   endmodule

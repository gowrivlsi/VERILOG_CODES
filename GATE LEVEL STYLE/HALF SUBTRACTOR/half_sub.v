module half_sub(input a,b,output Diff,B);
xor X1(Diff,a,b);
and A1(B,~a,b);
endmodule


//testbench code
module half_sub_tb();
reg [2:0]a,b;
wire Diff,B;

half_sub HS1(a,b,Diff,B);
 initial 
 repeat(5)
 begin
    a=15;b=12;#10;
 end
 initial
 $monitor("a=%d b=%d Diff=%d B=%d time=%0t",a,b,Diff,B,$time);
 endmodule

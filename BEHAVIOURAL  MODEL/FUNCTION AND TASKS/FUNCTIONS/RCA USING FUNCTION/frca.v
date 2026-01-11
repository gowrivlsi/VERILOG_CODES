//FUNCTION USING RCA (FRCA)
module frca(a,b,cin,sum,cout);
   input  [3:0]a,b;
   input  cin;
   output reg [3:0]sum;
   output reg cout;
    
    reg[1:0]result;//FRCA SUM
    reg G;// FRCA COUT

        //FUNCTION USING FULL ADDER
        function reg[1:0] fulladder(input a,b,cin);
        reg sum,carry;
        begin
            sum=a^b^cin;
            carry=(a&b)|(cin&(a^b));
            fulladder={carry,sum};
            $display("a=%b b=%b cin=%b fulladder=%b",a,b,cin,fulladder); 
        end
        endfunction

        always@(*)
        begin
           /* a=4'b1001;
            b=4'b1101;
            cin=1'b1;*/

            result=fulladder(a[0],b[0],cin);
            sum[0]=result[0];
            G=result[1];

            result=fulladder(a[1],b[1],G);
            sum[1]=result[0];
            G=result[1];

            result=fulladder(a[2],b[2],G);
            sum[2]=result[0];
            G=result[1];

            result=fulladder(a[3],b[3],G);
            sum[3]=result[0];
            cout=result[1];

            //$display("a=%b b=%b cin=%b -> sum=%b cout=%b",a,b,cin,sum,cout);


             end
endmodule

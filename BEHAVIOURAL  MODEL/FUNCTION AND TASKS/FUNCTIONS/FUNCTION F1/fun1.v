module fun1();
    reg[63:0]add,sub,mul,div;
        function reg[63:0] addition(input[15:0]a,b);
            begin
                addition=a+b;
                $display("a=%0d b=%0d addition=%0d",a,b,addition);
            end
         endfunction
        function reg[63:0] subtraction(input[15:0]c,d);
            begin
               subtraction=c-d;
               $display("c=%0d d=%0d subtraction=%0d",c,d,subtraction);
            end
         endfunction
        function reg[63:0] multiplication(input[15:0]e,f);
            begin
                multiplication=e*f;
               $display("e=%0d f=%0d multiplication=%0d",e,f,multiplication);
            end
          endfunction
        function reg[63:0] division(input[15:0]g,h);
            begin
                division=g/h;
               $display("g=%0d h=%0d division=%0d",g,h,division);
            end
         endfunction
        /* initial
            $monitor("a=%0d b=%0d c=%0d d=%0d e=%0d f=%0d g=%0d h=%0d add=%0d sub=%0d mul=%0d div=%0d",a,b,c,d,e,f,g,h,add,sub,mul,div);*/
         initial
            begin
                add=addition(80,10);
                sub=subtraction(50,30);
                mul=multiplication(50,50);
                div=division(50,25);
            end
endmodule


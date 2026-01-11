module fact();
    integer G;
    integer value;

        function integer fac (input integer num);
        integer i;
            begin
                fac=1;
                    for(i=1;i<=num;i=i+1)
                            begin
                                fac=fac*i;
                            end
            end
        endfunction

        initial
            begin
                value=5;
                G=fac(value);
                $display("FACTORIAL OF=[%0D] IS=[%0d]",value,G);
                
                value=6;
                G=fac(value);
                $display("FACTORIAL OF=[%0D] IS=[%0d]",value,G);
            end
endmodule

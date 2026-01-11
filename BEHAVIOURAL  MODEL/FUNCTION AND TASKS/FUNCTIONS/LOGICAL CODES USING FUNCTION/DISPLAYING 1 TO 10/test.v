module test();
    integer i;

    function integer num (input integer a);

        num=a;
    endfunction

        initial 
        begin
            for(i=0;i<11;i=i+1)
                $display("a=%0d",num(i));
        end
endmodule

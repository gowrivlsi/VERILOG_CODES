module test();

    integer i=0;

    function integer count (input a);
        begin
            i=i+1;
            count=i;

        end
    endfunction

    initial
        begin
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
            $display("count=%0d",count(i));
        end
endmodule

module even();

    integer i;
    initial
        begin
            for(i=0;i<=20;i=i+1)
                begin
                    if((i%2)==0)
                        $display("EVEN_NUMBER=%0D",i);
                end
        end
endmodule

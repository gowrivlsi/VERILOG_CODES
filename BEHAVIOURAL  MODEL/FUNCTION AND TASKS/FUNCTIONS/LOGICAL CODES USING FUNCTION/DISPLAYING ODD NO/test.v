module test();
    integer i;
    
    initial
        for(i=1;i<=20;i=i+1)
            if(i%2!=0)
                $display("ODD_NUMBERS=%0D",i);
endmodule

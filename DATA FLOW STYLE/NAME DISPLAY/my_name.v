module my_name #(parameter width=15)(
                input[width*8-1:0]m,
                output[width*8-1:0]y
               );
    assign y=m;
endmodule


//Testbench code
    module my_name_tb();
        parameter width=14;
        reg[width*8-1:0]m;
        wire[width*8-1:0]y;
            
            my_name M1(m,y);
                initial
                    begin
                        m="BASAVARAJA P M"; #5;//m="GOWRISH BALEGAR"; #5;
                    end
                        initial 
                        $display("m=%s y=%s Time=%0t",m,y,$time);
                        defparam M1.width=width;
    endmodule

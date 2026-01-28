module mux_tb #(parameter width=4)/*#(parameter width=2)(input tb_y,
                                  output reg[width-1:0]tb_s,
                                  output reg[2**width-1:0]tb_i
                                  );*/
                               (
                                input tb_y,
                                output reg[$clog2(width)-1:0]tb_s,[width-1:0]tb_i
                               );
    integer x;
        initial
             begin
                tb_i=$random;
                    for(x=0;x<width;x=x+1)
                        begin
                            tb_s=x;
                                #5;
                        end
             end
                initial
                $monitor("i=%b s=%b y=%b Time=%0t",tb_i,tb_s,tb_y,$time);

endmodule

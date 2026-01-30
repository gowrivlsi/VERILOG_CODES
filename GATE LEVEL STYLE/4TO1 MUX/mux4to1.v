module mux4to1(
            input[3:0]i,
            input[1:0]s,
            output y
           );
     wire[3:0]w;
    
        and A1(w[0],~s[1],~s[0],i[0]);
        and A2(w[1],~s[1],s[0],i[1]);
        and A3(w[2],s[1],~s[0],i[2]);
        and A4(w[3],s[1],s[0],i[3]);
        or R1(y,w[0],w[1],w[2],w[3]);

 endmodule



 //testbench

    module mux4to1_tb();
        reg[3:0]tb_i;
        reg[1:0]tb_s;
        wire tb_y;

        mux4to1 MUX1(
                    .i(tb_i),
                    .s(tb_s),
                    .y(tb_y)
                );
        initial 
            repeat(10)
                begin
               tb_i=$random;
               tb_s=0;#5;
               tb_s=1;#5;
               tb_s=2;#5;
               tb_s=3;#5;
                end
             initial 
             $monitor("tb_i=[%b] tb_s=[%b]  tb_y=%b Time=%t",tb_i,tb_s,tb_y,$time);
          endmodule

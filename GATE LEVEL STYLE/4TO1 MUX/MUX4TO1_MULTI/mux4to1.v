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

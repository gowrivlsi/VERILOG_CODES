//FULL SUBTRACTOR
module fullsub(
                input a,b,bin,
                output diff,bout
                );
    assign diff=a^b^bin;
    assign bout=~a&b | bin&(~(a^b));

endmodule

//RCS USING GENERATE BLOCK
    module rcs #(parameter G=32)(
                                    input [G-1:0]a,b,
                                    input        bin,
                                    output [G-1:0]diff,
                                    output        bout
                                );
        
        wire [G:0]c;
        assign c[0]=bin;
        assign bout=c[G];

        genvar m;
        
        generate
                for(m=0;m<G;m=m+1)
                    fullsub FS(a[m],b[m],c[m],diff[m],c[m+1]);
        endgenerate
    endmodule

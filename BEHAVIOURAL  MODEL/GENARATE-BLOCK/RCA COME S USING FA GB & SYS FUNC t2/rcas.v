//FULL ADDER
module fulladder(
                  input a,b,cin,
                  output sum,carry
                );

    assign sum=a^b^cin;
    assign carry=a&b | (cin&(a^b));
endmodule

//RC A COME S 
    module rcas #(parameter G=32,mode=1)(
                                    input [G-1:0] a,b,
                                    input         cin,
                                    output [G-1:0] sum,
                                    output         carry
                                    );
    //INTERNAL SIGNALS

    wire [G:0] c;
    assign c[0]=cin;
    assign carry=c[G];

            //GENERATE BLOCK 
                  genvar m;

                  generate
                         
                          begin
                                for(m=0;m<G;m=m+1)
                                     if(mode)
                                        fulladder FA(a[m],b[m],c[m],sum[m],c[m+1]);
                                      else
                                        fulladder FS(a[m],~b[m],c[m],sum[m],c[m+1]);        
                            end   
                    endgenerate
    endmodule

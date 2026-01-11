//FULL ADDER
module fulladder(
                  input a,b,cin,
                  output sum,carry
                );

    assign sum=a^b^cin;
    assign carry=a&b | (cin&(a^b));
endmodule

//RC A COME S 
    module rcas #(parameter G=32)(
                                    input [G-1:0] a,b,
                                    input         cin,
                                    input         mode,
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
                         /*
                        if(!mode)
                            begin
                                for(m=0;m<G;m=m+1)
                                    fulladder FA(a[m],b[m],c[m],sum[m],c[m+1]);
                            end
                        else
                            begin
                                if(mode)
                                    begin
                                        for(m=0;m<G;m=m+1)
                                            fulladder FS(a[m],~b[m],c[m],sum[m],c[m+1]);
                                    end
                            end
                            */

                            for(m=0;m<G;m=m+1)
                                begin
                                    fulladder FA(
                                                    .a(a[m]),
                                                    .b(mode ? ~b[m]:b[m]),
                                                    .cin(c[m]),
                                                    .sum(sum[m]),
                                                    .carry(c[m+1])
                                                    );
                                end
                  endgenerate
    endmodule

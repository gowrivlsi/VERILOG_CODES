//FULL ADDER 
module fulladder(input a,b,cin,
                 output sum,carry
                 );
    assign sum=a^b^cin;
    assign carry=a&b |(cin&(a^b));
endmodule

//RCA USING GENERATOR BLOCK
    module rcagb #(parameter G=32)(
                                    input [G-1:0]a,b,
                                    input cin,
                                    output [G-1:0]sum,
                                    output carry
       
                                    );
    //DIRECTIONS
       //INTERNAL SIGNALS
        wire [G:0]c;

        assign c[0]=cin;
        assign carry=c[G];

        genvar m;

        //GENERAT BLOCK
        generate 
                
                for(m=0;m<G;m=m+1)
                    fulladder FA(a[m],b[m],c[m],sum[m],c[m+1]);
        endgenerate
        
    endmodule

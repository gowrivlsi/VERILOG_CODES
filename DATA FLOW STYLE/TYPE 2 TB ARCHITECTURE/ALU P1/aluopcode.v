module aluopcode #(parameter IN=8)(
                                    input[IN/2-1:0]a,b,
                                    input[IN-1:0]op,
                                    output[IN-1:0]y
                                    );

        assign y=(op==7)?{a,b}:(op==6)?&a:(op==5)?a&b:(op==4)?a&&b:(op==3)?a/b:(op==2)?a*b:(op==1)?a-b:a+b;
endmodule


//Testbench code
    module aluopcode_tb #(parameter IN=8)(
                                           input[IN-1:0]y,
                                           output reg[IN/2-1:0]a,b,
                                           output reg[IN-1:0]op
                                        );
                    integer x,G;
        initial
        $value$plusargs("G=%d",G);
        initial
           repeat(G)
                begin
                    a=$random;b=$random;
                    for(x=0;x<8;x=x+1)
                        begin
                            op=x; #5;
                        end
                end
                    initial
                    $monitor("a=%b b=%b op=%b y=%b Time=%0t",a,b,op,y,$time);
    endmodule

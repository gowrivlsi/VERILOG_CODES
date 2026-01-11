`include"nrca.v"
`include"frca.v"

module tb();

   //INPUTS OF FUNCTION USING RCA (FRCA)
   reg [3:0]fa,fb;
    reg fcin;
    wire [3:0]fsum;
    wire fcout;

    //INPUTS OF NORMAL RCA (NRCA)
    reg[3:0]na,nb;
    reg ncin;
    wire [3:0]nsum;
    wire ncout;

    //INSTANTIATION OF NRCA
        nrca N1(na,nb,ncin,nsum,ncout);

    //INSTANTIATION OF FRCA
        frca F1(fa,fb,fcin,fsum,fcout);

        initial
        begin
            
            //GENERATING INPUTS(STIMULUS) FOR FRCA
                fa=4'b1011;
                fb=4'b1010;
                fcin=1'b1;

            //GENARATING INPUTS FOR NRCA
                na=4'b1011;
                nb=4'b1010;
                ncin=1'b1;

        end
        //DISPLAY OF FRCA
            initial
            $monitor("a=%b b=%b cin=%b sum=%b cout=%b",fa,fb,fcin,fsum,fcout);

        //DISPLAY OF NRCA
            initial
            begin
            #10;
            $monitor("a=%b b=%b cin=%b sum=%b cout=%b",na,nb,ncin,nsum,ncout);
            end

            initial
            begin
            #50;
                if(fsum==nsum && fcout==ncout)
                    $display("-----------------------RCA IS VALID-----------------------------------");
                else
                    $display("-----------------------RCA IS INVALID---------------------------------");
            end

endmodule

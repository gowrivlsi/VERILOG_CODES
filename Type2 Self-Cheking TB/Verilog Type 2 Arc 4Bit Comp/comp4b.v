//=======================================4 BIT COMPARATOR==============================
module comp4b(
                input [3:0]a,b,
                output reg G,E,L
             );
    always @(*)
    begin
        G=0;E=0;L=0;//default
            if(a > b)
                G=1;
            else if(a == b)
                E=1;
            else 
                L=1;
    end
endmodule

//==================================Test Bench=========================
module comp4b_tb(
                input G1,E1,L1,
                output reg [3:0]A,B
                );
reg g,e,l;
//Geneating Stimulus
    task gen();
        begin
            {A,B}=$random;
        end
    endtask
//BFM
    task bfm();
        begin
            {g,e,l}={A>B,A==B,A<B};
        end
    endtask

//SCORE BOARD COMPARING
    task sc();
        begin
            if(g==G1 && e==E1 && l==L1)
                begin
                    $info("=============================TEST PASED==============================");
                    $display("A in = %0d B in = %0d GRATER = %0d|g=%0d EQUAL = %0D|e=%0d LESSTHAN = %0D|l=%0d",A,B,G1,g,E1,e,L1,l);
                end
            else
                begin
                    $info("=============================TEST FALIED==============================");
                    $display("A in = %0d B in = %0d GRATER = %0d EQUAL = %0D LESSTHAN = %0D",A,B,G1,E1,L1);
                end

        end
    endtask

    //calling task
        initial begin
            repeat(10) begin
            gen();
            #10 bfm();
            sc();
            end
        end
endmodule

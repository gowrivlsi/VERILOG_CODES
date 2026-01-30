`include"btog1.v"
`include"gtob2.v"
module bgtogb2(
                input[3:0]b,
                output[3:0]y
                );
    wire[3:0]w;
        btog1 BG2(b,w);
        gtob2 GB3(w,y);
endmodule

    //testbench code
        module bgtogb2_tb();
            reg[3:0]b;
            wire[3:0]y;

            bgtogb2 MG(b,y);

            initial 
              repeat(8)
                    begin
                    b=$random %16; #10;
                    end

                    initial
                    $monitor("b=%b  y=%b Time=%0t",b,y,$time);
          endmodule

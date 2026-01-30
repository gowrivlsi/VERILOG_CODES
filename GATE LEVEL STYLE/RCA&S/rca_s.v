`include"full_adder.v"
module rca_s(
            input[3:0]A,B,
            input G,cin,
            output[3:0]s,
            output cout
            //output[3:0]b
            );
       // wire w0,w1,w2;
        wire [3:0]b;
        xor x1(b[0],G,B[0]);
        xor x2(b[1],G,B[1]);
        xor x3(b[2],G,B[2]);
        xor x4(b[3],G,B[3]);

        full_adder FA1(A[0],b[0],cin,s[0],w0);
        full_adder FA2(A[1],b[1],w0,s[1],w1);
        full_adder FA3(A[2],b[2],w1,s[2],w3);
        full_adder FA4(A[3],b[3],w3,s[3],cout);
endmodule


        //Testbench code

            module rca_s_tb();
                reg[3:0]A,B;
                reg G,cin;
                wire[3:0]s;
                wire cout;
                //wire[3:0]b;

                rca_s AS1(A,B,G,cin,s,cout);

                initial
                repeat(7)
                    begin
                        A=$random %16; B=$random +16; cin=1; G=0;#10;
                        A=$random %16; B=$random +16; cin=1; G=1;#10;
                    end
                    initial 
                    $monitor("A=%d  B=%d  cin=%d  G=%d  s=%d  cout=%d Time=%0t",A,B,cin,G,s,cout,$time);
                    endmodule

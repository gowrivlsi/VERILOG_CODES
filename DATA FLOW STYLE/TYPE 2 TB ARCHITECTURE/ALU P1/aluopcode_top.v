`include"aluopcode.v"
module aluopcode_top #(parameter IN=8)();
    wire[IN/2-1:0]w_a,w_b;
    wire [IN-1:0]w_p;
    wire[IN-1:0]w_y;

    aluopcode A1(w_a,w_b,w_p,w_y);
    aluopcode_tb A2(w_y,w_a,w_b,w_p);
endmodule

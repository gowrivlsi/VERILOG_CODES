`include"mux.v"
`include"mux_tb.v"
module mux_top #(parameter width=8)();/*#(parameter width=2)();
    wire w_y;
    wire[2**width-1:0]w_i;
    wire[width-1:0]w_s;*/

        wire w_y;
        wire[$clog2(width)-1:0]w_s;
        wire[width-1:0]w_i;
    //inatantiation
    mux M1(
            .i(w_i),
            .s(w_s),
            .y(w_y)
            );
    mux_tb #(.width(width)) M2(
                .tb_i(w_i),
                .tb_s(w_s),
                .tb_y(w_y)
                );
    defparam M1.in=width;
endmodule

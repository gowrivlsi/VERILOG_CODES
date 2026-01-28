module mux #(parameter in=4)/*#(parameter sel=2)(
                                input[2**sel-1:0]i,
                                input[sel-1:0]s,
                                output y
                                );*/
                (
                input[$clog2(in)-1:0]s,
                input[in-1:0]i,
                output y
                );
                assign y=i[s];
endmodule

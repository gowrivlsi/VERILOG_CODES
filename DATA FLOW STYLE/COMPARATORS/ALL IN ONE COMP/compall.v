module compall #(parameter width=16)(
                                        input[width-1:0]a,b,
                                        output G,E,L
        
                                       );
        //assign G=a>b; assign E=a==b; assign L=a<b;
        assign{G,E,L}={a>b,a==b,a<b};
endmodule


//TB code
    module compall_tb #(parameter width=16)(
                                            input G,E,L,
                                            output reg[width-1:0]a,b
                                            );
        initial
        repeat(16)
            begin
                a=$random;b=$random;#5;
            end
            initial
            $monitor("a=%b b=%b G=%B E=%b L=%b Time=%0t",a,b,G,E,L,$time);
   endmodule

//Top Code

    module compall_top #(parameter width=4)();
            wire[width-1:0]w_a,w_b;
            wire w_G,w_E,w_L;
        compall #(.width(width)) C1(w_a,w_b,w_G,w_E,w_L);
        compall_tb #(.width(width)) C2(w_G,w_E,w_L,w_a,w_b);

        //defparam C1.width=width;
        //defparam C2.width=width;
    endmodule

module fun1();
    reg [31:0]A,M,E,C;

        function reg[4:0] adder(input[3:0]a,b,input cin);
        begin
        adder=a+b+cin;
        $display("a=%0d b=%0d cin=%b adder=%0b",a,b,cin,adder);
        end
        endfunction

        function reg[16:0] mux(input i0,i1,i2,i3,input [1:0]s);
        begin
        mux=(s==0)?i0:(s==1)?i1:(s==2)?i2:i3;
        $display("i0=%0b i1=%0b i2=%0b i3=%0b s=%b mux=%0b",i0,i1,i2,i3,s,mux);
        end
        endfunction

        function reg[16:0] enco(input i0,i1,i2,i3);
        begin
        case({i0,i1,i2,i3})
        4'b0001:enco=2'b00;
        4'b0010:enco=2'b01;
        4'b0100:enco=2'b10;
        4'b1000:enco=2'b11;
        endcase
        $display("i0=%0b i1=%0b i2=%b i3=%0b enco=%0b",i0,i1,i2,i3,enco);
        end
        endfunction

        function reg[16:0] comp(input[16:0]a,b);
        reg g,e,l;
        begin
        assign {g,e,l}={a>b,a==b,a<b};
        comp={g,e,l};
        $display("a=%0d b=%0d comp=%0b",a,b,comp);
        end
        endfunction

        initial
        begin
        A=adder(7,2,1);
        M=mux(1,1,0,1,3);
        E=enco(0,0,1,0);
        C=comp(55,48);
        end
endmodule

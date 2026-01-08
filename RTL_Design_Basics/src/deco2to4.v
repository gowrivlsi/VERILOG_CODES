module deco2to4(
                input y0,y1,
                output reg i0,i1,i2,i3
                );
    always@(*)
        begin
            i0=0;i1=0;i2=0;i3=0; //Default
            if(~y0 && ~y1)
                i0=1;
            else if(~y0 && y1)
                i1=1;
            else if(y0 && ~y1)
                i2=1;
            else
                i3=1;
        end
endmodule



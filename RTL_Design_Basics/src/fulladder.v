module fulladder(
                input a,b,cin,
                output reg s,c
                );
    always@(*)
        begin
            if(~a && ~b && ~cin)
                begin
                    s=0;c=0;
                end
            else if(~a && ~b && cin)
                begin
                    s=1; c=0;
                end
            else if(~a && b && ~cin)
                begin
                    s=1; c=0;
                end
            else if(~a && b && cin)
                begin
                    s=0; c=1;
                end
            else if(a && ~b && ~cin)
                begin
                    s=0; c=0;
                end
            else if(a && ~b && cin)
                begin
                    s=0; c=1;
                end
            else if(a && b && ~cin)
                begin
                    s=0; c=1;
                end
            else
                begin
                    s=1;c=1;
                end
        end
endmodule




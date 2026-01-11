//moore overlapping 1010
module moore1(
                input clk,rst,x,
                output y
             );
    parameter s0=0,
              s1=1,
              s2=2,
              s3=3,
              s4=4;
    reg[2:0]cs,ns;
    assign y=(cs==s4)?1:0;
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            cs<=0;
        else
            cs<=ns;
    end

   always @(*)
   begin
        case(cs)
            s0 : ns=(x)?s1:s0;
            s1 : ns=(x)?s1:s2;
            s2 : ns=(x)?s3:s0;
            s3 : ns=(x)?s1:s4;
            s4 : ns=(x)?s3:s0;//overlapping
            //s4 : ns=(x)?s1:s0;//Non overlapping
        default: ns = s0;
        endcase
   end
endmodule

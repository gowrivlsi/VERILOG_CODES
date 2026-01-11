//Mealy 1010 overlapping/non overlapping
module mealy1(
                input clk,rst,x,
                output reg y
             );

    parameter s0=0,
              s1=1,
              s2=2,
              s3=3;
   reg[1:0]cs,ns;

   always @(posedge clk or negedge rst)
   begin
        if(!rst)
            {y,cs}<=2'b00;
        else
            cs<=ns;
   end

   always @(*)
    begin
        case(cs)
            s0 : begin
                 ns<=(x)?s1:s0;
                 y<=0;
                 end
            s1 : begin
                 ns<=(x)?s1:s2;
                 y<=0;
                 end
            s2 : begin
                 ns<=(x)?s3:s0;
                 y<=0;
                 end
            s3 : begin
                 ns<=(!x)?s2:s1;//overlapping
                 //ns<=(x)?s1:s0;//Non overlapping
                 y<=1;
                 end
          // default : ns<=s0;
        endcase
    end
endmodule

//.................................BUS BOOKING FSM...........................................................
module bus1(
              input clk,rst,x,
              output reg y
           );
    parameter ideal =   0,
              open  =   1,
          location  =   2,
          filters   =   3,
          selbus    =   4,
          selseat   =   5,
          selsd     =   6,
          coupen    =   7,
          payment   =   8,
          done      =   9;

    reg[3:0]cs,ns;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            {y,cs}<=2'b00;
        else
            cs<=ns;
    end

    always @(*)
    begin
        y<=0;
        case(cs)
            ideal   :   ns<=(x)?open        :   ideal;
            open    :   ns<=(x)?location    :   ideal;
        location    :   ns<=(x)?filters     :   ideal;
        filters     :   ns<=(x)?selbus      :   filters;
        selbus      :   ns<=(x)?selseat     :   selbus;
        selseat     :   ns<=(x)?selsd       :   selbus;
        selsd       :   ns<=(x)?coupen      :   selsd;
        coupen      :   ns<=(x)?payment     :   coupen;
        payment     :   ns<=(x)?done        :   payment;
        done        :  begin
                        ns<=(x)?done        :   payment;
                        y<=1;
                       end  
        default     :  begin
                        ns<=ideal;
                        y<=0;
                       end
        endcase
    end
endmodule

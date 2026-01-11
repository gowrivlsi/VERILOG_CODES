//......................................APB PROTOCOL FSM DESIGN CODE............................................................

module assign1b(
                 input clk,rst,transfer,pready,pwrite,
                 output reg pselx,penable
                );
    parameter ideal =   0,
              setup =   1,
             access =   2;

    reg[1:0]cs,ns;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            {pselx,penable,cs}<=3'b000;
        else
            cs<=ns;
    end

    always @(*)
    begin
        case(cs)
            ideal   :   if(transfer)
                            begin
                                ns<=setup;
                                {pselx,penable}<=2'b10;
                            end
                        else
                            begin
                                ns<=ideal;
                                {pselx,penable}<=2'b00;
                            end
            setup   :   if(transfer)
                            begin
                                ns<=access;
                                {pselx,penable}<=2'b11;
                            end
                        else
                            begin
                                ns<=ideal;
                                {pselx,penable}<=2'b00;
                            end
           access   :   if(!pready)
                            begin
                                ns<=access;
                                {pselx,penable}<=2'b11;
                            end
                        else
                            begin
                                if(transfer)
                                    begin
                                        ns<=setup;
                                        {pselx,penable}<=2'b10;
                                    end
                                else
                                    begin
                                        ns<=ideal;
                                        {pselx,penable}<=2'b00;
                                    end
                            end
        endcase
    end
endmodule

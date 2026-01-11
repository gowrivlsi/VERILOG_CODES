module assign1(
                input clk,rst,pready,transfer,
                output reg pselx,penable
              );
    parameter IDEL=0,
              SETUP=1,
              ACCESS=2;
    reg[1:0]cs,ns;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                cs<=0; //{cs,pselx,penable}<=3'b000;
                pselx<=0;
                penable<=0;
            end
        else
            cs<=ns;
    end

    always @(*)
        begin
            case(cs)
                    IDEL : begin
                            ns<=SETUP;
                            {pselx,penable}<=2'b00;
                           end
                    SETUP : begin
                            ns<=ACCESS;
                            {pselx,penable}<=2'b10;
                            end
                    ACCESS : begin
                                    if(!transfer)
                                        begin
                                          ns<=IDEL;
                                          {pselx,penable}<=2'b11;
                                        end
                                    else
                                        begin
                                           if(pready)begin
                                              ns<=SETUP;
                                              {pselx,penable}<=2'b11;
                                              end
                                        end
                                /*
                                if(pready)
                                    begin
                                        ns<=IDEL;
                                        {pselx,penable}<=2'b11;
                                    end
                                else
                                    ns<=ACCESS; */
                             end
                default : ns<=IDEL;
            endcase
        end
endmodule


/*
if(!transer)
    ns=IDEL;
else
    begin
        if(pready)
            ns<=SETUP
    end
    */

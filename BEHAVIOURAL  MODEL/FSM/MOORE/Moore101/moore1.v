//Moore overlapping And nonoverlapping 
//101
module moore1(
              input clk,rst,x,
              output y
             );
    parameter s0=0,
              s1=1,
              s2=2,
              s3=3;
reg[1:0]cs,ns;
assign y=(cs==s3)?1:0;
    
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                cs<=0;
            else
                cs<=ns;
        end

    always @(*) begin
            case(cs)
                s0 : begin
                        if(x)
                            begin
                                ns=s1;
                            end
                        else begin
                                ns=s0;
                                
                            end
                     end
                s1 : begin
                        if(!x)
                            begin
                                ns=s2;
                                
                            end
                        else begin
                                ns=s1;
                                
                            end
                     end
                s2 : begin
                        if(x)
                            begin
                                ns=s3;
                                
                            end
                        else begin
                                ns=s0;
                                
                            end
                     end
                s3 : begin
                    if(x)
                        begin
                            ns=s1;
                           
                        end
                    else begin
                            //ns=s2;//overlapping
                            ns=s0;//non overlapping
                            
                        end
                     end
            endcase
        end

   /*
   always @(*)
        begin
            case(cs)
                s0 : y=0;
                s1 : y=0;
                s2 : y=0;
                s3 : y=1;
            endcase
        end
    */
endmodule

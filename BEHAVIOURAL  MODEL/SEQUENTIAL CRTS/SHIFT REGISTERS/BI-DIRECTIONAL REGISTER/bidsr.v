module bidsr(
            input clk,rst,s_in,mode,
            output reg s_out
            );
    reg[3:0]temp;
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                s_out<=0;
                temp<=0;
                end
            else
                begin
                    if(!mode)
                        begin
                            //RIGHT SHIFT
                             /*
                            temp[0]<=temp[1];
                            temp[1]<=temp[2];
                            temp[2]<=temp[3];
                            temp[3]<=s_in;
                            */

                            temp<={s_in,temp[3:1]};
                            s_out<=temp[0];

                        end
                     else
                         begin
                         //LEFT SHIFT
                            s_out<=temp[3];
                            
                            temp[3]<=temp[2];
                            temp[2]<=temp[1];
                            temp[1]<=temp[0];
                            temp[0]<=s_in;
                            //temp<={temp[2:0],s_in}
                         end
                end
        end

endmodule



//TEST BENCH CODE
    module bidsr_tb();
        reg clk,rst,s_in,mode;
        wire s_out;

            bidsr BIS(clk,rst,s_in,mode,s_out);

            //clock generation
            initial
            begin
                 clk=0;
                forever #10 clk=~clk;
            end

            //rst generation
            initial
            begin
                rst=0;
                #5 rst=1;
                //wait(rst==1);
            end
         
            //stimulus generation
            
            initial
            begin
           
           
           mode=0;#3;

            s_in=1;#15;
            s_in=0;#20;
            s_in=0;#20;
            s_in=1;#100;

            mode=1;#5;
            
            s_in=1;#15;
            s_in=0;#20;
            s_in=0;#20;
            s_in=1;
          
            end
            
           
/*           
initial begin
  mode = 0;
  s_in = 1; @(posedge clk);
  s_in = 0; @(posedge clk);
  s_in = 0; @(posedge clk);
  s_in = 1; @(posedge clk);

  mode = 1;
  s_in = 1; @(posedge clk);
  s_in = 0; @(posedge clk);
  s_in = 0; @(posedge clk);
  s_in = 1; @(posedge clk);
end
*/
            
            initial
            #350 $stop;

            initial
            $monitor("clk=%b rst=%b mode=%b s_in=%b s_out=%b Time=%0t",clk,rst,mode,s_in,s_out,$time);
    endmodule

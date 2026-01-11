module usr(
            input clk,rst,[3:0]in,[1:0]opcode,
            output reg [3:0]out
            ); //DIRECTIONS

    reg [3:0]temp;

    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                begin
                    out<=0;
                    temp<=0;
                end
            else
                begin
                    case(opcode)
                        //NO CHANGE
                        0:out<=out;
                        1:begin
                            //RIGHT SHIFT
                                temp<={in[0],temp[3:1]}; //temp<=temp>>1
                                out<=temp[0];
                          end
                        
                        2:begin
                            //LEFT SHIFT
                                out<=temp[3];
                                temp<={temp[2:0],in[0]}//temp<=temp<<1;
                          end

                        3:begin
                            //PIPO
                            out<=temp;
                            temp<=in;
                          end
                    endcase
                end
        end
endmodule


//TEST BENCH CODE
    module usr_tb();
        reg clk,rst;
        reg[3:0]in;
        reg[1:0]opcode;
        wire [3:0]out;

        //INSTATIATION
            usr USR(clk,rst,in,opcode,out);
            
        //Clock Generation
            initial
            begin
                clk=0;
                forever #10 clk=~clk;
            end

        //RESET Generation
            initial
                begin
                    rst=0;
                    #20 rst=1;
                end

        //Stimulus Generation
            initial
            begin
                wait(rst==1);

                in=0;
                in[0]=1;
                opcode=1;#20;
                in[0]=1;#20;
                in[0]=0;#20;
                in[0]=1;
                
            end

            initial
            #250 $stop;

            initial
            $monitor("clk=%b rst=%b in=%b opcode=%b out=%b Time=%0t",clk,rst,in,opcode,out,$time);
    endmodule



`include"dff1.v"
module siso(
            input clk,rst,I,
            output y0,y1,y2,y3
            );

    dff1 D1(clk,rst,I,y0);
    dff1 D2(clk,rst,y0,y1);
    dff1 D3(clk,rst,y1,y2);
    dff1 D4(clk,rst,y2,y3);
endmodule



//Test Bench Code
    module siso_tb();
        reg clk,rst,I;
        wire y0,y1,y2,y3;

            siso S1(clk,rst,I,y0,y1,y2,y3);

                initial clk=1; 
                        
                 always #10 clk=~clk; 
                
                    initial
                        begin
                            rst=0;#5;
                            rst=1;
                        begin
                            I=0;
                            #5;
                            I=0;#15;
                            I=1;#20;
                            I=1;#20;
                            I=0;
                        end
                        end

                        initial
                        $monitor("rst=%b clk=%b I=%b y0=%b y1=%b y2=%b y3=%b Time=%0t",rst,clk,I,y0,y1,y2,y3,$time);

                        initial
                        #150 $stop;

    endmodule

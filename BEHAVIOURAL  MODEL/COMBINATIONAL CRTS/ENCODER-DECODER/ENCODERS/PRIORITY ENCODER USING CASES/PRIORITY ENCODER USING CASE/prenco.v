module prenco(
               input i0,i1,i2,i3,
               output reg y0,y1
              );

    always @(*)
        begin
            case(1'b1)//priority check
                i3:begin y0=1'b1;y1=1'b1;end
                i2:begin y0=1'b1;y1=1'b0;end
                i1:begin y0=1'b0;y1=1'b1;end
                i0:begin y0=1'b0;y1=1'b0;end
                default :begin y0=0;y1=0;end
            endcase
        end
endmodule


//Test bench code
     module prenco_tb();
        reg i0,i1,i2,i3;
        wire y0,y1;

        prenco E1(i0,i1,i2,i3,y0,y1);
        
        integer file1;
        initial
        begin
           file1=$fopen("PRIORITY ENCO.txt");
        
        repeat(5)
            begin
                i0=1;i1=0;i2=0;i3=0;#10;
                i1=1;i0=0;i2=0;i3=0;#10;
                i2=1;i0=0;i1=0;i3=0;#10;
                i3=1;i0=1;i1=1;i2=1;#10;
              $fmonitor(file1,"i0=%b i1=%b i2=%b i3=%b y0=%b y1=%b Time=%0t",i0,i1,i2,i3,y0,y1,$time);#10;
            end
            $fclose(file1);
            end
            
            initial 
            $monitor("i0=%d i1=%d i2=%d i3=%d y0=%d y1=%d Time=%0t",i0,i1,i2,i3,y0,y1,$time);
 endmodule

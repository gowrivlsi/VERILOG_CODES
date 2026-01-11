module urat(
            input start,
            input [7:0]data,
            input parity,
            input [1:0] stop,
            output reg[11:0]frame
            );
     //METHOD 01
    //assign frame={start,data,parity,stop};

    //METHOD 02

        always @(*)
            begin
                frame[11]<=start;
                frame[10:3]<=data;
                frame[2]<=parity;
                frame[1:0]<=stop;
            end
endmodule

//TEST BENCH CODE
    module urat_tb();
        reg start;
        reg [7:0]data;
        reg parity;
        reg [1:0] stop;
        wire [11:0]frame;

        //INSTANTIATION 
            urat UR(start,data,parity,stop,frame);

        //STIMULUS GENERATION
            initial
                repeat(10)
            begin
                start=1;data=$random;parity=^data;stop=0;#10;
                data=$random;parity=^data;#10;
            end

            initial
            #90 $stop;

            initial
            $monitor("start=%b data=%b parity=%b stop=%b frame=%b Time=%0t",start,data,parity,stop,frame,$time);
    endmodule

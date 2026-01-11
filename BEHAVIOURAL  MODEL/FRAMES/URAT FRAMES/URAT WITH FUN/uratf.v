module uratf(
               input start,
               input [7:0]data,
               input parity,
               input stop,
               output reg [11:0]Frame
            );
    
    //FUNCTION BLOCK
    function reg[11:0] frame(input start,[7:0]data,input parity,stop);
        frame={start,data,parity,stop};
    endfunction

    //CALLING FUNCTION
        always @(*)
        Frame=frame(start,data,parity,stop);
endmodule


//TEST BENCH CODE
    module uratf_tb();
        reg start;
        reg [7:0]data;
        reg parity;
        reg stop;
        wire [11:0]Frame;

        //instantiation
            uratf URF(start,data,parity,stop,Frame);

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
            $monitor("start=%b data=%b parity=%b stop=%b Frame=%b Time=%0t",start,data,parity,stop,Frame,$time);
    endmodule

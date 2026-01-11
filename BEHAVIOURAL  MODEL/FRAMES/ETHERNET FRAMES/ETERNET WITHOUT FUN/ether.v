module ether(
               input[55:0]pre,
               input[7:0]sfd,
               input[47:0]da,sa,
               input[15:0]len,
               input[367:0]data,
               input[31:0]crc,
               output reg [575:0]frame
            );

    always @(*)
        begin
            frame<={pre,sfd,da,sa,len,data,crc};
        end
endmodule

//TEST BENCH CODE
    module ether_tb();
        reg[55:0]pre;
        reg[7:0]sfd;
        reg[47:0]da,sa;
        reg[15:0]len;
        reg[367:0]data;
        reg[31:0]crc;
        wire [575:0]frame;

        //INSTANTIATION
            ether ETH(pre,sfd,da,sa,len,data,crc,frame);

        //STIMULUS GENERATION
            initial
            repeat(2)
            begin
                pre={14{4'b1010}};sfd={8'hAB};da=$random;sa=$urandom;data=$random;len=$random;crc=$random;
                #10;
                $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
            end
            
            initial
            $monitor("Preamble=%b SFD=%b DA=%b SA=%b DATA=%b LEN=%b CRC=%b Time=%0t",pre,sfd,da,sa,data,len,crc,$time);
    endmodule

//-------------------------------------------Tx Rx DESIGN CODE-------------------------------------------------

//FIFO 8 BIT
module fifo1 (
                input clk,rst,wr,rd,
                input [7:0]d_in,
                output reg[7:0]d_out
               );
    reg [7:0]mem [7:0]; //8 bit fifo memory
    reg[2:0]w_ptr,r_ptr; //3 bit write and read pointers

    always @(posedge clk or negedge rst)
    begin
        if(!rst) begin
            d_out<=0;
            {w_ptr,r_ptr}<=2'b00;
            end
        else begin 
            if(wr && !rd) begin
                mem[w_ptr]<=d_in;
                w_ptr<=w_ptr+1;
                end

            else
                if(!wr && rd) begin
                d_out<=mem[r_ptr];
                r_ptr<=r_ptr+1;
                end
            end
    end
endmodule

//PISO 8 BIT
module piso1(
                input clk,rst,mode,
                input [7:0]p_in,
                output reg s_out
             );
    reg[7:0]temp;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                temp<=0;
                s_out<=0;
            end
        else
            begin
                if(mode)
                    temp<=p_in;
                else
                    begin
                        s_out<=temp[0];
                        temp<=temp>>1;
                    end
            end
    end
endmodule

//SIPO 8 BIT
    module sipo1(
                    input clk,rst,s_in,mode,
                    output reg[7:0]p_out
                );
    reg [7:0]temp;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                temp<=0;
                p_out<=0;
            end
        else 
            begin
                if(!mode)
                    begin
                        temp<={s_in,temp[7:1]};
                    end
                else
                    p_out<=temp;
            end
    end
    endmodule
 //------------------------------------------------------------Tx-Rx ALL INSTANTIATION Design Code---------------------------------------------------------
 module txrx1(
                input clk,rst,wr1,rd1,wr2,rd2,mode,
                input[7:0]data_in,
                output [7:0]data_out
             );
    wire[7:0]w1;
    wire w2;
    wire [7:0]w3;

    //instantiation
        fifo1 F1(.clk(clk),
                 .rst(rst),
                 .wr(wr1),
                 .rd(rd1),
                 .d_in(data_in),
                 .d_out(w1)
                );
        piso1 P1(
                .clk(clk),
                .rst(rst),
                .mode(mode),
                .p_in(w1),
                .s_out(w2)
                );
        sipo1 S1(
                  .clk(clk),
                  .rst(rst),
                  .mode(mode),
                  .s_in(w2),
                  .p_out(w3)
                );
        fifo1 F2(
                    .clk(clk),
                    .rst(rst),
                    .wr(wr2),
                    .rd(rd2),
                    .d_in(w3),
                    .d_out(data_out)
                );
 endmodule

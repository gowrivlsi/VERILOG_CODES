module add_deco(
        input[31:0]add,
        output[4:1]slave
        );

       and A1(slave[1],~add[18],~add[17],add[16]);
       and A2(slave[2],~add[18],add[17],~add[16]);
       and A3(slave[3],~add[18],add[17],add[16]);
       and A4(slave[4],add[18],~add[17],~add[16]);
endmodule

//Testbench Code
    module add_deco_tb();
        reg[31:0]add;
        wire[4:1]slave;

        //instantion

            add_deco A1(add,slave);

            initial begin
                        add[31:0]=0;add[16]=1;#10;
                        add[31:0]=0;add[17]=1;#10;
                        add[31:0]=0;add[17:16]=3;#10;
                        add[31:0]=0;add[18]=1;#10;
                    end
           initial
            $monitor("add=%b  slave=%b Time=%0t",add,slave,$time);
            endmodule

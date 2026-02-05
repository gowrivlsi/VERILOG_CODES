//===================================TB FOR DESIGN==================================
module full_adder_tb(
                       input SUM,CARRY,
                       output reg A,B,Cin
                    );
reg C1,S1;
//Generating stimulus
    task gen();
        begin
            {A,B,Cin}=$random;
        end
    endtask

 //BFM
    task bfm();
        begin
            {C1,S1} = A + B +Cin;
        end
    endtask
    
 //COMPARING THR RESPONSE [Score Board]
    task sb();
        begin
            if(SUM == S1 && CARRY == C1)
                begin
                    $info("===================TEST PASSED================");
                    $display("A=%b B=%b Cin=%b SUM=%b CARRY=%b S1=%b C1=%b",A,B,Cin,SUM,CARRY,S1,C1);
                end
            else
                begin
                    $info("===================TEST FAILED================");
                    $display("A=%b B=%b Cin=%b SUM=%b CARRY=%b S1=%b C1=%b",A,B,Cin,SUM,CARRY,S1,C1);

                end
        end
    endtask

  initial begin
    repeat(10) begin
        gen();
        bfm();
        #10;
        sb();
    end
  end
endmodule

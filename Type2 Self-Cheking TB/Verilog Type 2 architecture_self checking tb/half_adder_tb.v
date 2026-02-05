//Test bench to verify rtl

module half_adder_tb(input SUM,CARRY,
                     output reg A,B);

  reg S1,C1;
  
  //generating the stimulus
     task gen();
       begin
        {A,B}=$random;
        end
     endtask


  //BFM logic
    task bfm();
      begin
      {C1,S1}=A+B;
      end
     endtask


  //Comparing the response
    task sb();
      begin
        if(SUM==S1 && CARRY==C1)
           begin
           $info("==========TEST PASSED===========");
           $display("A=%B,B=%B,SUM=%B,CARRY=%B,S1=%B,C1=%B",A,B,SUM,CARRY,S1,C1);
           end
        else
           begin
           $info("==========TEST FAILED===========");
           $display("A=%B,B=%B,SUM=%B,CARRY=%B,S1=%B,C1=%B",A,B,SUM,CARRY,S1,C1);
           end
        end
     endtask

     initial begin
       repeat(5)
        begin
        gen();
        bfm();
        #10;
        sb();
       end
     end



endmodule

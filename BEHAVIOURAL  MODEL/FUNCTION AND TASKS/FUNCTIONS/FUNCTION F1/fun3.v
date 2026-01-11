module fun3();
    reg [9:0]G;
    //reg tout,y;
   //FUNCTION IMPLIMENTATION
   function reg([9:0]) circuit(input [7:0]take_in,input [3:0]locate,input cntrl,a,b);//CIRCUIT(FORMAL ARGUMENTS1)
        begin
          G=circuit(5,4,8);//CIRCUITS(ACTUAL ARGUMENTS)  
        end
    endfunction

    //FUNCTION CALL
        initial 
        begin
            
        end
endmodule

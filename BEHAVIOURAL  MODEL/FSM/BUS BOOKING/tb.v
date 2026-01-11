//...................................................TEST BENCH CODE................................................................

`include "bus1.v"
module tb();
    reg clk,rst,x;
    wire y;

    //instantiation
    bus1 B1(.*);

    //clk Generation
    initial begin
    clk=0;
    forever #5 clk=~clk;
    end

    //rst Generation
    initial begin
        rst=0;
        #20 rst=1;
    end

    //Stimulus Generation
    initial begin
    x=0; #30;
    repeat(10)
        begin
            x=1;#10;
        end
    end
    
    /*
    always @(y)
        if(y)
            $display("Ticket Booked Successfully");
    */

    always @(B1.cs)
    begin
        case(B1.cs)
            0   :   $display("Open App");
            1   :   $display("Bus Portal Opened");
            2   :   $display("Choose Location");
            3   :   begin
                    $display("Location Selected");
                    $display("Applying Filters.......");
                    end
            4   :   begin
                    $display("Filters Applied");
                    $display("Select Bus...........");
                    end
            5   :   $display("Select Seats");
            6   :   $display("Select Source & Destination");
            7   :   $display("Applying Coupen");
            8   :   begin
                    $display("Coupen Applied");
                    $display("Making Payment..........");
                    end
            9   :   begin
                    $display("Payment Done");
                    $display("Booking Completed.........");
                    $display("Tickets Are Sent To Your Registered Email.........");
                    end
      default   :   $display("Open App");
        endcase
    end
    
    initial
        $monitor("clk_i=%0d rst_i=%0d x_i=%0d y_o=%0d Time=%0t",clk,rst,x,y,$time);
endmodule

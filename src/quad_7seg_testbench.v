module quad_7seg_testbench;
    reg clock;
    reg [15:0] numberInput;
    wire [10:0] driverOutput;
    reg displayClock;
    always #20 clock = ~clock; //approx 27MHz clock

    quad_7seg #(.HEX_MODE(1)) displayOut (
                                          .number(numberInput),
                                          .colonEnable(1'b0),
                                          .clk(clock),
                                          .segDrivers(driverOutput)
                                          );
    initial begin
        $monitor("Time = %0t | Number = %4h |                  ABCDEFG \n Active anodes = %4b | 7-Segment Driver Out = %7b\n\n", $time, numberInput, driverOutput[10:7], driverOutput[6:0]);
        #0 numberInput = 16'h0;
        #100 clock = 0;
        #200 numberInput = 16'hA7B0;
        #300 numberInput = 16'h37CB;
        #400 $finish;
    end
endmodule
module counter_timer_TOP(input clk,
                         output [10:0] se7enDriver);
    reg [24:0] clockCounter;
    reg [13:0] counter;
    reg displayClk;
    initial begin
        displayClk = 0;
        clockCounter = 0;
        counter = 0;
    end
    always@(posedge clk) begin
        clockCounter = clockCounter + 1'b1;
        //onboard 27MHz oscillator
        if (clockCounter == 27000000) begin
            clockCounter = 0;
            counter = counter + 1'b1;
        end
        if (clockCounter[13:0] == 10000) begin // (10000 * 1/(27e6))^-1 = 2700Hz display clock
            displayClk = ~displayClk;
        end
    end
    quad_7seg #(.HEX_MODE(1)) displayOut (
                                          .number({2'b0, counter}),
                                          .colonEnable(1'b0),
                                          .clk(displayClk),
                                          .segDrivers({se7enDriver})
                                          );
endmodule
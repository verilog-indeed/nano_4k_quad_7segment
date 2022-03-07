module single_7seg_test (input clk,
                         output reg [7:0] se7enDriver);
    reg [24:0] clockCounter;
    reg [3:0] numberCounter;
    wire [3:0] numberVal;
    single_7seg mySegger (.numDigit(numberVal),
                          .digitEnable(1));
    assign numberVal = numberCounter;
    always @(posedge clk) begin
        if (clockCounter == 27000000) begin
            numberCounter = numberCounter + 1;
            clockCounter = 0;
        end
        clockCounter = clockCounter + 1;
        se7enDriver = {1'b1, mySegger.digitDrive};
    end
endmodule
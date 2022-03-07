//digitDrive: MSB -> LSB
//              {S,ABCDEFG}
//Where S is digit supply enable
module single_7seg(input wire [3:0] numDigit,
                   input digitEnable,
                   output reg [6:0] digitDrive);
    always @ (digitEnable or numDigit) begin
        if (digitEnable) begin
            case (numDigit)
                4'h0: digitDrive[6:0] <= 7'h01;
                4'h1: digitDrive[6:0] <= 7'h4F;
                4'h2: digitDrive[6:0] <= 7'h12;
                4'h3: digitDrive[6:0] <= 7'h06;
                4'h4: digitDrive[6:0] <= 7'h4C;
                4'h5: digitDrive[6:0] <= 7'h24;
                4'h6: digitDrive[6:0] <= 7'h20;
                4'h7: digitDrive[6:0] <= 7'h0F;
                4'h8: digitDrive[6:0] <= 7'h00;
                4'h9: digitDrive[6:0] <= 7'h04;
                4'hA: digitDrive[6:0] <= 7'h08;
                4'hB: digitDrive[6:0] <= 7'h60;
                4'hC: digitDrive[6:0] <= 7'h31;
                4'hD: digitDrive[6:0] <= 7'h42;
                4'hE: digitDrive[6:0] <= 7'h30;
                4'hF: digitDrive[6:0] <= 7'h38;
                default: digitDrive[6:0] <=  7'bZZZZZZZ;
            endcase
        end else begin
            digitDrive = 7'bZZZZZZZ;
        end
    end
endmodule
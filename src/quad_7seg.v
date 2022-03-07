//segDrivers: MSB -> LSB
//            {DP,S3-S2-S1-S0,~ABCDEFG}
//DP is colon anode, active high. shares cathode with segment C
//Sx is digit x enable, active high

//1 for displaying hex digits 0000-FFFF, 0 for only displaying decimal 0000-9999 

module quad_7seg    #(parameter HEX_MODE = 1)
                    
                    (input [15:0] number,
                     input clk,
                     input colonEnable,
                     output [10:0] segDrivers);
    reg [3:0] digitEn;
    
    genvar i;
    generate
            if (HEX_MODE == 1) begin
            for (i = 0; i < 4; i = i + 1) 
            
            begin: hex_mode_digit_gen
                single_7seg dig_inst (
                    .numDigit(number[4*i +:4]),
                    .digitEnable(digitEn[i]),
                    .digitDrive(segDrivers[6:0])
                );
            end
        end else begin
            bin2bcd bcdEncoder (.binary(number[13:0]));
            for (i = 0; i < 4; i = i + 1) 
            begin: bcd_mode_digit_gen
                single_7seg dig_inst (
                    .numDigit(bcdEncoder.bcd[4*i +:4]),
                    .digitEnable(digitEn[i]),
                    .digitDrive(segDrivers[6:0])
                );
            end
        end
    endgenerate
    always@(posedge clk) begin
        //time-division multiplexing 
        //change active digit on each clock cycle
        digitEn = digitEn << 1;
        if (digitEn == 4'b0000) begin
            //rotatry shift to maintain a rolling 1 through the enables
            digitEn = 4'b0001;
        end
        //If I hardwire the enable to a specific digit, it lights up correctly
        //The selected digit also synthesizes correctly, the remaining 3 get swept in optimizing
        //RTL still hangs
        //digitEn = 4'b0001;
    end
    assign segDrivers[10:7] = {digitEn};
endmodule





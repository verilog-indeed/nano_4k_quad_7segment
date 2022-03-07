//converts 14-bit binary number to 4 digit (16-bit) binary coded decimal
//implements double dabble algorithm
//supports 0000-9999
module bin2bcd(input wire [13:0] binary,
               output wire [15:0] bcd);
    integer i;
    integer decPos;
    reg [15:0] result;

    always@(binary) begin
        result = 0;
        for (i = 13; i >= 0; i = i - 1) begin
            for (decPos = 0; decPos <= 3; decPos = decPos + 1) begin
                if (result[decPos*4 +: 4] >= 5) begin
                    result[decPos*4 +: 4] = result[decPos*4 +: 4] + 4'd3;
                end 
            end
            result = result << 1;
            result[0] = binary[i];
        end
    end
    assign bcd = result;
endmodule
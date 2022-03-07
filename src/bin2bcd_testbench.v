module bin2bcd_testbench;
    reg [13:0] in;
    wire [15:0] out;
    integer i;
    bin2bcd myConverter (
                         .binary(in),
                         .bcd(out)
                         );
    initial begin
        in <= 0;
        $monitor("in=0x%0h out=%0b", in, out);
        
        for (i = 0; i < 32; i = i + 1) begin
          in = i;
          #10;
        end
        
        #10;
        in = 8'b11110011;
        #10;
        in = 9999;
    end
endmodule

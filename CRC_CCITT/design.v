module CRC_CCITT (
    input wire [7:0] data_in,
    output wire [15:0] crc_out
);

reg [15:0] crc;

// CRC-CCITT polynomial: x^16 + x^12 + x^5 + 1
reg [15:0] polynomial = 16'h1021;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        crc <= 16'h0000; // Initialize CRC to zero on reset
    end else begin
        // Shift in each bit of the data
        crc[7:0] <= data_in[7:0] ^ crc[15] ^ crc[13] ^ crc[12] ^ crc[10] ^ crc[9] ^ crc[5] ^ crc[0];
        crc[15:8] <= crc[7:0];
    end
end

assign crc_out = crc;

endmodule

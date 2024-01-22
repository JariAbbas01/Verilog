module ROM #(parameter data_width=8, parameter memory_depth=16, parameter address_width=$clog2(memory_depth))(address, read_enable, chip_enable, data_out);

// i want memory addressibility = 16

input read_enable, chip_enable;
input [address_width-1:0] address;
output reg [data_width-1:0] data_out;

// Initializing my ROM

reg [data_width-1:0] ROM [0:memory_depth-1]; // JARI

always @ (read_enable or chip_enable or address)
begin
 case(address)
    0 : data_out = 8'b01001010; // ASCII value for 'J'
    1 : data_out = 8'b01000001; // ASCII value for 'A'
    2 : data_out = 8'b01010010; // ASCII value for 'R'
    3 : data_out = 8'b01001001; // ASCII value for 'I'
    default : data_out = 8'b00000000; // Default value
 endcase
end
endmodule;


/*

Design a 4x8 single-port RAM module in Verilog. The RAM should have the following characteristics:

• 4 memory locations.
• Each memory location should store an 8-bit data.
• Implement read and write operations.
• Use a clock signal for synchronization.
• Include a reset signal to initialize the memory.
• Include an address input for specifying the memory location.
• Include a data input for write operations and a data output for read operations.

*/

module RAM #(parameter Data_width = 8, parameter memory_addressibility = 4, parameter address_Width = $clog2(memory_addressibility)) (clk, reset, address, we, data_in, data_out);

input clk, reset, we;
input [address_Width-1 : 0] address;
input [Data_width-1 : 0] data_in;
output reg [Data_width-1 : 0] data_out;


// Memory Creation

reg [Data_width-1 : 0] memory [0:memory_addressibility-1];

// Write Logic

always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(we) begin
    memory[address] <= data_in;
  end
end

// Read Logic 

always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(!we) begin
    data_out <= memory[address];
  end
end

endmodule
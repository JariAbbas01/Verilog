module Dual_Port_RAM #(parameter Data_width=8, parameter memory_addressibility = 4, parameter address_width = $clog2(memory_addressibility)) (clk_A, clk_B, we_A, we_B, reset, address_A, address_B, data_in_A, data_in_B, data_out_A, data_out_B);

input clk_A, clk_B, we_A, we_B, reset;

input [address_width-1:0] address_A, address_B;
input [Data_width-1:0] data_in_A, data_in_B;
output reg [Data_width-1:0] data_out_A, data_out_B;

// creating Memory

reg [Data_width-1:0] memory [0:memory_addressibility-1];

// Write Logic for Port A;

always @ (posedge clk_A or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(we_A) begin
    memory[address_A] <= data_in_A;
  end
end


// Write Logic for Port B;

always @ (posedge clk_B or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(we_B) begin
    memory[address_B] <= data_in_B;
  end
end

// Read Logic for port A

always @ (posedge clk_A or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(!we_A) begin
    data_out_A <= memory[address_A];
  end
end

// Read Logic for port B

always @ (posedge clk_B or posedge reset)
begin
  if(reset) begin
    for(integer i=0; i<memory_addressibility; i=i+1) begin
      memory[i] <= 0;
    end
  end
  else if(!we_B) begin
    data_out_B <= memory[address_B];
  end
end

endmodule;


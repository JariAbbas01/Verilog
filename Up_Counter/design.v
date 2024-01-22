module Up_Counter(clk, reset, data_out);

input clk, reset;
output reg [3:0] data_out;

always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    data_out <= 4'b000;
  end
  else begin
    data_out <= data_out + 1'b1;
  end
end

endmodule
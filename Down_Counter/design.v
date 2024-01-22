module DownCounter(reset, clk, out);
input reset, clk;
output  reg [3:0] out;

always @ (posedge clk)
begin
  if(reset) begin
    out <= 4'b1111;
  end
  else begin
    out <= out - 1'b1;
  end
end

endmodule;
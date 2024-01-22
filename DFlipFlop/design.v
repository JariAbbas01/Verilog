
module FlipFlop(reset,clk,D,Q);

input reset,clk,D;
output reg Q;

always @ (posedge clk or posedge reset) begin
  if(reset) begin
    Q <= 0;
  end
  else begin
    Q <= D;
  end
end


endmodule
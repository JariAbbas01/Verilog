module Async_FlipFlop(Enable, clk, reset, Data_in, Q, Q_Bar);

input Enable, clk, reset, Data_in;
output reg Q_Bar, Q;

always @ (posedge clk or posedge Enable or posedge reset)
begin
  if(reset) begin
    Q <= 1'b0;
    Q_Bar <= ~Q;
  end
  else if(Enable) begin
    Q <= Data_in;
    Q_Bar <= ~Data_in;
  end
  else begin
    Q <= 1'b0;
    Q_Bar <= ~Q;
  end
end

endmodule
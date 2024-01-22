
module Mux(a,b,s,out);

input a,b,s;
output reg out;

always @ (a or b or s)
begin
  if(s == 1'b1) begin
    out = a;
  end
  else begin
    out = b;
  end
end

endmodule
module Mux(a,b,Sel,out);

input a,b,Sel;
output reg out;



always @ (Sel or a or b)
begin
  case (Sel)
  1'b0: begin
    out <= a;
  end
  1'b1: begin
    out <=b;
  end
  default: begin
    out <= a;
  end
  endcase
end

endmodule
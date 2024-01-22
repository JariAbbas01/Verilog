module mux_Case(a,b,c,d,s,o);
input [1:0] a,b,c,d,s;
output reg [1:0] o;

always @ (a or b or c or d or s)
begin
  case(s)
  2'b00 : begin
    o <= a; 
  end
  2'b01 : begin
    o <= b;
  end
  2'b10 : begin
    o <= c;
  end
  2'b11 : begin
    o <= d;
  end
  default : begin
    o <= 2'b00;
  end
  endcase
end

endmodule
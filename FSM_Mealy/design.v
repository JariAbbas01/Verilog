
module FSM(clk,reset,in, out);

input clk,reset, in;
output reg out;

// States;

reg state, next_state;
parameter s0=0, s1=1;

always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    state <= 0;
  end
  else begin
    state <= next_state;
  end
end

always @ (state or in)
begin
  case(state)
  s0: begin
    out <= 0;
    next_state <= s1;
  end
  s1: begin
    out <=1;
    next_state <= s0;
  end
  default: begin
    out <=0;
    next_state <= s1;
  end
  endcase
end

endmodule;
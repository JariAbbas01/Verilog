module FSM(clk, reset, req_0, req_1, req_2, req_3, gen_0, gen_1, gen_2, gen_3);

input clk, reset, req_0, req_1, req_2, req_3;
output reg gen_0, gen_1, gen_2, gen_3;

parameter IDLE = 3'b000, GEN0 = 3'b001, GEN1 = 3'b010, GEN2 = 3'b011, GEN3 = 3'b100;
reg [2:0] state, next_state;

// State Logic
always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end
// Next State and Output
always @ (state or req_0 or req_1 or req_2 or req_3)
begin
  case (state)
  IDLE : if(req_0) begin
    gen_0 = 1;
    next_state = GEN0;
  end else if(req_1) begin
    gen_1 = 1;
    next_state = GEN1;
  end else if(req_2) begin
    gen_2 = 1;
    next_state = GEN2;
  end else if(req_3) begin
    gen_3 = 1;
    next_state = GEN3;
  end else begin
    gen_0 = 0;
    gen_1 = 0;
    gen_2 = 0;
    gen_3 = 0;
    next_state = IDLE;
  end
  GEN0 : if(req_0) begin
    gen_0 = 1;
  end else begin
    next_state = IDLE;
  end
  GEN1 : if(req_1) begin
    gen_1 = 1;
  end else begin
    next_state = IDLE;
  end
  GEN2 : if(req_2) begin
    gen_2 = 1;
  end else begin
    next_state = IDLE;
  end
  GEN3 : if(req_3) begin
    gen_3 = 1;
  end else begin
    next_state = IDLE;
  end
  endcase
end


endmodule
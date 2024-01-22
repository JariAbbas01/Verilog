
module FSM(clk, reset, req_0, req_1, gen_0, gen_1);

input clk, reset, req_0, req_1;
output reg gen_0, gen_1;


parameter IDLE = 3'b001, GEN0 = 3'b010, GEN1 = 3'b100;
reg [2:0] state, next_state;

always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end

always @ (state or req_0 or req_1)
begin
    next_state = IDLE;
    gen_0 = 0;
    gen_1 = 0;
  case (state)
    IDLE : if(req_0) begin
        gen_0 = 1;
        next_state = GEN0;
        end
        else if(req_1) begin
        gen_1 = 1;
        next_state = GEN1;
        end
        else begin
        next_state = IDLE;
        end
    GEN0 : if(req_0) begin
        gen_0 = 1;
        end
        else begin
        next_state = IDLE;
        end 
    GEN1 : if(req_1) begin
        gen_1 = 1;
        end
        else begin
        next_state = IDLE;
        end
    endcase
end
endmodule
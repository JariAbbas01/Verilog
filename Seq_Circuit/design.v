
module Sequential_Circuit(a,b,c,clk,reset,z);

input a,b,c,clk,reset;
output z;

// Nets
wire reg_1_Input;
wire reg_2_Input;
reg reg_1;
reg reg_2;

assign reg_1_Input = (a|b)&c;
assign reg_2_Input = ~(reg_1);
always @ (posedge clk)
begin
  if(reset) begin
    reg_1 <= 1'b0;
    reg_2 <= 1'b0;
  end
  else begin
    reg_1 <= reg_1_Input;
    reg_2 <= reg_2_Input;
  end
end

assign z = ~(reg_2);



endmodule
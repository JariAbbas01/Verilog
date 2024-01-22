`include "Module_1.v"
`include "Module_2.v"

module Top_Level_Module(A,B,C,D,clk,reset,Z);

// declairing Inputs
input A,B,C,D,clk,reset;
// declairing Output
output Z;

// interim signals

reg [1:0] reg_output;
wire output_1_module_1, output_2_module_1;

// Module 1 Instantiation

Module_1 Module_1(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .output_1_module_1(output_1_module_1), 
    .output_2_module_1(output_2_module_1)
);


always @ (posedge clk)
begin
  if(reset) begin
    reg_output <= 2'b00;
  end
  else begin
    reg_output[0] <= output_1_module_1;
    reg_output[1] <= output_2_module_1;
  end
end

Module_2 Module_2(
    .input_1_module_2(reg_output[0]), 
    .input_2_module_2(reg_output[1]), 
    .Z(Z)
);



endmodule
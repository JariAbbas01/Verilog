
module Parameterized_Adder #(parameter Data_Width = 32) (A,B,C);

input [Data_Width-1:0] A, B;
output [Data_Width-1:0] C;


assign C = A+B;

endmodule
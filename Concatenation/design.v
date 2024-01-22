module Concatenation(A,B,C,D);

input [1:0] A;
input [3:0] B;

output [7:0] C;
output [15:0] D;

// design Logic

assign C = {B, 4'b0101};
assign D = {8{A}};

endmodule
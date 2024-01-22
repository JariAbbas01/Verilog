
module Decoder(A,E,Y0,Y1,Y2,Y3);

input [1:0] A;
input E;
output Y0,Y1,Y2,Y3;

assign Y0 = (~A[0]) & (~A[1]) & E;
assign Y1 = (A[0]) & (~A[1]) & E;
assign Y2 = (~A[0]) & (A[1]) & E;
assign Y3 = (A[0]) & (A[1]) & E;


endmodule
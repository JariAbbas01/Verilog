module combinationalLogic(A,B,C,Q);

input A,B,C;
output Q;
wire E,F;

assign E = ~(A&B);
assign F = ~(A|B);
assign Q = E&F&C;

endmodule;
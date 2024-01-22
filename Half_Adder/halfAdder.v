module halfAdder(A,B,S,C);

input A,B;
output S,C;

//Data flow Modeling

assign C = A&B;
assign S =A^B;

endmodule;
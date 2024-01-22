module Module_1(A,B,C,D,output_1_module_1, output_2_module_1);

input A,B,C,D;
output output_1_module_1, output_2_module_1;

// interim signals

assign output_1_module_1 = ((A|B)&(C)) | (~(A&B));
assign output_2_module_1 = D;

endmodule
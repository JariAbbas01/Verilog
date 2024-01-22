module Module_2(input_1_module_2, input_2_module_2, Z);

input input_1_module_2, input_2_module_2;
output Z;

assign Z = ~((input_1_module_2 | input_2_module_2) & (input_1_module_2 & input_2_module_2));


endmodule
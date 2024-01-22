module TB();
reg [7:0] data_in;
wire parity;

Parity dut(
    .data_in(data_in),
    .parity(parity)
);

initial begin
//   Even Parity
data_in = 8'b00000000;
#50;
data_in = 8'b10000000;
#50;
data_in = 8'b10100000;
#50;

end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
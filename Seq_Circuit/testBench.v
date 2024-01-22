
module TB();

reg a, b, c, reset, clk=0;
wire z;

Sequential_Circuit dut(
    .a(a),
    .b(b),
    .c(c),
    .clk(clk),
    .reset(reset),
    .z(z)
);

// create a clock

always begin
  clk = ~clk;
  #50;
end

initial begin
  reset = 1'b1;
  #100;
  reset = 1'b0;
  a = 1'b0;
  b = 1'b0;
  c = 1'b0;
  #100;
  reset = 1'b0;
  a = 1'b0;
  b = 1'b0;
  c = 1'b1;
  #100;
  reset = 1'b0;
  a = 1'b0;
  b = 1'b1;
  c = 1'b0;
  #100;
  reset = 1'b0;
  a = 1'b0;
  b = 1'b1;
  c = 1'b1;
  #100;
  reset = 1'b0;
  a = 1'b1;
  b = 1'b0;
  c = 1'b0;
  #100;
  reset = 1'b0;
  a = 1'b1;
  b = 1'b0;
  c = 1'b1;
  #100;
  reset = 1'b0;
  a = 1'b1;
  b = 1'b1;
  c = 1'b0;
  #100;
  reset = 1'b0;
  a = 1'b1;
  b = 1'b1;
  c = 1'b1;
  #100;
  $finish;
end

initial begin
  $dumpfile("seq.vcd");
  $dumpvars(0);
end


endmodule;
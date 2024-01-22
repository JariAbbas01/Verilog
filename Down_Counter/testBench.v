module TB();

reg reset, clk=0;
wire [3:0] out;

DownCounter dut(
    .reset(reset),
    .clk(clk),
    .out(out)
);

initial begin
  $dumpfile("counterDown.vcd");
  $dumpvars(0);
end

always begin
  clk = ~clk;
  #50;
end

initial begin
  reset = 1'b1;
  #100;
  reset = 1'b0;
  #400 $finish;
end


endmodule;
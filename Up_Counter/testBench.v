module TB();

reg clk=0, reset;
wire [3:0] data_out;

Up_Counter dut(
  .clk(clk),
  .reset(reset),
  .data_out(data_out)
);

// Creating Clock

always begin
  clk <= ~clk;
  #50;
end

initial begin
  reset <=1;
  #100;
  reset <=0;
  #600; // You Can set according to you
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
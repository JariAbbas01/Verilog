module TB();

reg Enable, clk=0, reset, Data_in;
wire Q_Bar, Q;

Async_FlipFlop dut(
    .Enable(Enable),
    .clk(clk),
    .reset(reset),
    .Data_in(Data_in),
    .Q_Bar(Q_Bar),
    .Q(Q)
    );

always begin
  clk <= ~clk;
  #50;
end

initial begin
  reset <=1'b1;
  Enable <= 1'b0;
  Data_in <= 1'b0;
  #100;
  reset <= 1'b0;
  Enable <= 1'b1;
  Data_in <= 1'b1;
  #100;
  Data_in <= 1'b0;
  #100;
  Data_in <= 1'b1;
  #100;
  Data_in <= 1'b0;
  #100;
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end


endmodule
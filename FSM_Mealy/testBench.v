module TestBench_FSM();

reg in,clk=0,reset;
wire out;

FSM dut(
    .clk(clk), 
    .reset(reset), 
    .in(in), 
    .out(out)
    );

// Creating Clock

always begin
  clk <= ~clk;
  #50;
end

initial begin
  reset <= 1;
  in <= 1;
  #100;
  reset <= 0;
  in <=0;
  #100;
  in <=1;
  #100;
  in <=0;
  #100;
  $finish;
end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
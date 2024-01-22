module tb();

reg clk=0, reset, req_0, req_1;
wire gen_0, gen_1;

FSM dut(
    .clk(clk), 
    .reset(reset), 
    .req_0(req_0), 
    .req_1(req_1), 
    .gen_0(gen_0), 
    .gen_1(gen_1)
    );

// Creating Clock

always begin
  clk <= ~clk;
  #50;
end

initial begin
  reset <= 1;
  req_0 <=0;
  req_1 <=0;
  #100;
  reset<=0;
  req_0<=0;
  req_1<=1;
  #100;
  req_0<=1;
  req_1<=0;
  #100;
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end


endmodule
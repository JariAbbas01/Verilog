module FSM_TestBench();


reg clk=0, reset, req_0, req_1, req_2, req_3;
wire gen_0, gen_1, gen_2, gen_3;

FSM dut(
    .clk(clk), 
    .reset(reset), 
    .req_0(req_0), 
    .req_1(req_1), 
    .req_2(req_2), 
    .req_3(req_3), 
    .gen_0(gen_0), 
    .gen_1(gen_1), 
    .gen_2(gen_2), 
    .gen_3(gen_3)
    );

// Creating Clock

always begin
  clk <= ~clk;
  #50;
end

initial begin
  reset <= 1;
  #100;
  reset <= 0;
  #100;
  req_0 <= 1;
  #100;
  req_0 <= 0;
  #100;
  req_1 <= 1;
  #100;
  req_1 <= 0;
  #100;
  req_2 <= 1;
  #100;
  req_2 <= 0;
  #100;
  req_3 <= 1;
  #100;
  req_3 <= 0;
  #300;
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
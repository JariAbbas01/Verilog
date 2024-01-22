
module TB();
reg [15:0] Encoder_In;
wire [3:0] Binary_Out;

Encoder dut(
  .Encoder_In(Encoder_In), 
  .Binary_Out(Binary_Out)
  );

initial begin
  Encoder_In <= 16'h0;
  #100;
  Encoder_In <= 16'h1;
  #100;
  Encoder_In <= 16'h2;
  #100;
  Encoder_In <= 16'h3;
  #100;
  Encoder_In <= 16'h4;
  #100;
  Encoder_In <= 16'h5;
  #100;
  Encoder_In <= 16'h6;
  #100;
  Encoder_In <= 16'h7;
  #100;
  Encoder_In <= 16'h8;
  #100;
  Encoder_In <= 16'h9;
  #100;
  Encoder_In <= 16'hA;
  #100;
  
end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
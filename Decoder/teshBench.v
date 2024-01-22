module TB();

reg [1:0] A;
reg E;
wire Y0, Y1, Y2, Y3;


Decoder dut(
.A(A),
.E(E),
.Y0(Y0),
.Y1(Y1),
.Y2(Y2),
.Y3(Y3)
);



initial begin
  A = 2'b00;
  E = 1'b1;
  #100;
  A = 2'b01;
  E = 1'b1;
  #100;
  A = 2'b10;
  E = 1'b1;
  #100;
  A = 2'b11;
  E = 1'b1;
  #100;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
end


endmodule

module TB();

// Declaring Input and Output

reg [31:0] A,B;

wire [31:0] C;


Parameterized_Adder #(.Data_Width(32)) dut(
    .A(A),
    .B(B),
    .C(C)
    );

Parameterized_Adder #(.Data_Width(16)) dut1(
    .A(A),
    .B(B),
    .C(C)
    );



// Stimulus

initial begin
  A <= 32'h00000001;
  B <= 32'h00000002;
  #100;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
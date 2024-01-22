
module TB();

reg a,b,s;
wire out;

Mux dut(
    .a(a),
    .b(b),
    .s(s),
    .out(out)

);

initial begin
  a=1'b0; b=1'b0; s=1'b0;
  #100;
  a=1'b0; b=1'b0; s=1'b1;
  #100;
  a=1'b0; b=1'b1; s=1'b0;
  #100;
  a=1'b0; b=1'b1; s=1'b1;
  #100;
  a=1'b1; b=1'b0; s=1'b0;
  #100;
  a=1'b1; b=1'b0; s=1'b1;
  #100;
  a=1'b1; b=1'b1; s=1'b0;
  #100;
  a=1'b1; b=1'b1; s=1'b1;
  #100;
  
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule;
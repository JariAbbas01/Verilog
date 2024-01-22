module TB();

reg Sel;
reg a,b;
wire out;

Mux dut(
    .a(a),
    .b(b),
    .Sel(Sel),
    .out(out)
);

initial begin
  a <= 1'b0;
  b <= 1'b1;
  #100;
  Sel <= 1'b0;
  #100;
  Sel <= 1'b1;
  #100;
end


initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    
end
endmodule;
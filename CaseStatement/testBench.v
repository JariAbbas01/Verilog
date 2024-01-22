
module TB();

reg [1:0] a,b,c,d,s;
wire [1:0] o;

mux_Case dut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s(s),
    .o(o)
);

initial begin
    a <= 2'b00;
    b <= 2'b01;
    c <= 2'b11;
    d <= 2'b00;
    #100;
    s <= 2'b00;
    #100;
    s <= 2'b01;
    #100;
    s <= 2'b10;
    #100;
    s <= 2'b11;
    #100;
  end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule
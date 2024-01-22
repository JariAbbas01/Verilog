

module TB();

reg clk=0, rst, wr_en, rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full, empty;


// intantiate

FIFO_Memory dut(
    .clk(clk), 
    .rst(rst), 
    .wr_en(wr_en), 
    .rd_en(rd_en), 
    .data_in(data_in), 
    .data_out(data_out), 
    .full(full), 
    .empty(empty)
    );



// creating the clock

always begin
  clk <= ~clk;
  #50;
end

initial begin
  rst <= 1'b1;
  wr_en <=1'b0;
  rd_en <=1'b0;
  data_in <= 8'b0;
  #100;
  rst <= 1'b0;
  wr_en <=1'b1;
  data_in <= 8'b10101010;
  #100;
  wr_en <=1'b0;
  #100;
  rd_en <=1'b1;
  #100;
  rd_en <=1'b0;
  #100;
  wr_en <=1'b1;
  data_in <= 8'b10111111;
  #100;
  wr_en <=1'b0;
  #100;
  rd_en <=1'b1;
  #100;
  rd_en <=1'b0;
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule


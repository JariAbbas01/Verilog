module testBench();
reg read_enable, chip_enable;
reg [3:0] address;
wire [7:0] data_out;

ROM dut(
    .address(address), 
    .read_enable(read_enable), 
    .chip_enable(chip_enable), 
    .data_out(data_out)
    );

initial begin
  read_enable <=1;
  chip_enable <=1;
  address <= 0;
  #100;
  address <= 1;
  #100;
  address <= 2;
  #100;
  address <= 3;
  #100;
  
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end


endmodule
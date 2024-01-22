module TB();

reg clk=0, reset, we;
reg [1 : 0] address;
reg [7 : 0] data_in;
wire [7 : 0] data_out;

RAM dut(
    .clk(clk), 
    .reset(reset), 
    .we(we),  
    .address(address), 
    .data_in(data_in), 
    .data_out(data_out)
);

always begin
  clk <= ~clk;
  #2;
end

initial begin
    #10 reset = 1;
    #10 reset = 0;

    // Write sequence
    address = 0;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hAA;     // Data to write
    #20;                 // Wait for a few clock cycles

    address = 1;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hBB;     // Data to write
    #20;                 // Wait for a few clock cycles

    address = 2;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hCC;     // Data to write
    #20;                 // Wait for a few clock cycles

    address = 3;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hAA;     // Data to write
    #20;                 // Wait for a few clock cycles

    address = 4;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hBB;     // Data to write
    #20;                 // Wait for a few clock cycles

    address = 5;            // Address to write data
    we = 1;    // Enable write
    
    data_in = 8'hCC;     // Data to write
    #20;                 // Wait for a few clock cycles



    // Read sequence
    address = 0;            // Address to read data
    we = 0;    // Disable write (read operation)
    
    #20;
    $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end


endmodule
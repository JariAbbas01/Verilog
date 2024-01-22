module TB_Dual_Port_RAM();

  reg clk_A=0, clk_B=0, reset, we_A, we_B;
  reg [1 : 0] address_A, address_B;
  reg [7 : 0] data_in_A, data_in_B;
  wire [7 : 0] data_out_A, data_out_B;

  Dual_Port_RAM dut(
      .clk_A(clk_A), 
      .clk_B(clk_B), 
      .we_A(we_A), 
      .we_B(we_B), 
      .reset(reset), 
      .address_A(address_A), 
      .address_B(address_B), 
      .data_in_A(data_in_A), 
      .data_in_B(data_in_B), 
      .data_out_A(data_out_A), 
      .data_out_B(data_out_B)
  );

  always begin
    clk_A <= ~clk_A;
    #5;
  end

  always begin
    clk_B <= ~clk_B;
    #10;
  end

  initial begin
    reset = 1;
    we_A = 0;
    we_B = 0;
    address_A = 2'b00;
    address_B = 2'b01;
    data_in_A = 8'hAA;
    data_in_B = 8'hBB;

    // Apply reset and initial values
    #20 reset = 0;

    // Write and Read operations
    #10 we_A = 1; data_in_A = 8'h55; // Write data 0x55 to address 0
    #10 we_B = 1; data_in_B = 8'h66; // Write data 0x66 to address 1
    #20 we_A = 0; we_B = 0; // Disable writes

    // Read from addresses
    #10 address_A = 2'b00; // Read from address 0
    #10 address_B = 2'b01; // Read from address 1

    #50 $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule

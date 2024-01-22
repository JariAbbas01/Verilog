module TB();

reg A,B,C,D,clk=0,reset;
wire Z;

Top_Level_Module dut(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .clk(clk),
    .reset(reset),
    .Z(Z)
);

// creating clock

always begin
  clk = ~clk;
  #50;
end

 initial begin
    // Combination 0
    reset = 1'b1;
    D = 1'b0; C = 1'b0; B = 1'b0; A = 1'b0;
    
    #100;

    // Combination 1
    reset = 1'b0;
    D = 1'b0; C = 1'b0; B = 1'b0; A = 1'b1;
    #100;

    // Combination 2
    D = 1'b0; C = 1'b0; B = 1'b1; A = 1'b0;
    #100;

    // Combination 3
    D = 1'b0; C = 1'b0; B = 1'b1; A = 1'b1;
    #100;

    // Combination 4
    D = 1'b0; C = 1'b1; B = 1'b0; A = 1'b0;
    #100;

    // Combination 5
    D = 1'b0; C = 1'b1; B = 1'b0; A = 1'b1;
    #100;

    // Combination 6
    D = 1'b0; C = 1'b1; B = 1'b1; A = 1'b0;
    #100;

    // Combination 7
    D = 1'b0; C = 1'b1; B = 1'b1; A = 1'b1;
    #100;

    // Combination 8
    D = 1'b1; C = 1'b0; B = 1'b0; A = 1'b0;
    #100;

    // Combination 9
    D = 1'b1; C = 1'b0; B = 1'b0; A = 1'b1;
    #100;

    // Combination 10
    D = 1'b1; C = 1'b0; B = 1'b1; A = 1'b0;
    #100;

    // Combination 11
    D = 1'b1; C = 1'b0; B = 1'b1; A = 1'b1;
    #100;

    // Combination 12
    D = 1'b1; C = 1'b1; B = 1'b0; A = 1'b0;
    #100;

    // Combination 13
    D = 1'b1; C = 1'b1; B = 1'b0; A = 1'b1;
    #100;

    // Combination 14
    D = 1'b1; C = 1'b1; B = 1'b1; A = 1'b0;
    #100;

    // Combination 15
    D = 1'b1; C = 1'b1; B = 1'b1; A = 1'b1;
    #100;

    $finish; // End simulation
  end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end



endmodule
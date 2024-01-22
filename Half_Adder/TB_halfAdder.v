module TB();

reg A,B;

wire S,C;

halfAdder dut(
    .A(A),
    .B(B),
    .S(S),
    .C(C)
);

// stimulus

initial begin
    A<=1'b0;
    B<=1'b0;
    #100;

    A<=1'b0;
    B<=1'b1;
    #100;
    
    A<=1'b1;
    B<=1'b0;
    #100;
    
    A<=1'b1;
    B<=1'b1;
    #100;
    
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
end


endmodule;
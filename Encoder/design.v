
// Encoder 16x4

module Encoder(Encoder_In, Binary_Out);

input [15:0] Encoder_In;
output reg [3:0] Binary_Out;

always @ (Encoder_In)
begin
  case (Encoder_In)
  16'h0: begin
    Binary_Out <= 4'b0000;
  end
  16'h1: begin
    Binary_Out <= 4'b0001;
  end
  16'h2: begin
    Binary_Out <= 4'b0010;
  end
  16'h3: begin
    Binary_Out <= 4'b0011;
  end
  16'h4: begin
    Binary_Out <= 4'b0100;
  end
  16'h5: begin
    Binary_Out <= 4'b0101;
  end
  16'h6: begin
    Binary_Out <= 4'b0110;
  end
  16'h7: begin
    Binary_Out <= 4'b0111;
  end
  16'h8: begin
    Binary_Out <= 4'b1000;
  end
  16'h9: begin
    Binary_Out <= 4'b1001;
  end
  16'hA: begin
    Binary_Out <= 4'b1010;
  end
  16'hB: begin
    Binary_Out <= 4'b1011;
  end
  16'hC: begin
    Binary_Out <= 4'b1100;
  end
  16'hD: begin
    Binary_Out <= 4'b1101;
  end
  16'hE: begin
    Binary_Out <= 4'b1110;
  end
  16'hF: begin
    Binary_Out <= 4'b1111;
  end
  default: begin
    Binary_Out <= 4'b0000;
  end
  endcase
end

endmodule
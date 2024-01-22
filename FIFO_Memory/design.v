module FIFO_Memory(clk, rst, wr_en, rd_en, data_in, data_out, full, empty);

input clk, rst, wr_en, rd_en;
input [7:0] data_in;
output reg [7:0] data_out;
output reg full, empty;


reg [7:0] memory [0:3];
reg [2:0] wr_ptr, rd_ptr;

// Write Logic :)

always @ (posedge clk or posedge rst)
begin
  if(rst) begin
    wr_ptr <= 3'b000;
  end
  else if(wr_en && !full) begin
    memory[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr;
  end
end

// Read Logic :)

always @ (posedge clk or posedge rst)
begin
  if(rst) begin
    rd_ptr <= 3'b000;
  end
  else if(rd_en && !empty) begin
    data_out <= memory[rd_ptr];
    rd_ptr <= rd_ptr +1;
  end
end

// Status Logic

always @ (posedge clk or posedge rst)
begin
  if(rst) begin
    full <= 1'b0;
    empty <= 1'b0;
  end
  else begin
    full <= (wr_ptr == rd_ptr) && wr_en;
    empty <= (wr_ptr == rd_ptr) && rd_en;
  end
end

endmodule;
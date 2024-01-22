
module Fifo_Module #(parameter Data_Width = 16, parameter Depth = 8) (clk, rst, wr_en, rd_en, data_in, data_out, full, empty);

input clk, rst, wr_en, rd_en;
input [Data_Width-1:0] data_in;
output reg [Data_Width-1:0] data_out;
output reg full, empty;

localparam LOG2_DEPTH = $clog2(Depth);

reg [Data_Width-1:0] memory [0:Depth-1];
reg [LOG2_DEPTH-1:0] wr_ptr, rd_ptr;

// Write Logic

always @ (posedge clk or posedge rst)
begin
  if(rst) begin
    wr_ptr <= 0;
  end
  else if(wr_en && !full) begin
    memory[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr + 1;
  end
end

// Read Logic

always @ (posedge clk or posedge rst)
begin
  if(rst) begin
    rd_ptr <= 0;
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
    full <= 0;
    empty <= 1;
  end
  else begin
    full = (wr_ptr == rd_ptr) && wr_en;
    empty = (wr_ptr == rd_ptr) && rd_en;
  end
end


endmodule;
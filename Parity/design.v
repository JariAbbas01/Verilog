module Parity #(parameter data_width=8) (data_in, parity);

input [data_width-1:0] data_in;
output reg parity;

always @ (data_in)
begin
parity = data_in[0];
  for(integer i=0; i<data_width ;i++) begin
    parity = parity ^ data_in[i];
  end
end

endmodule;
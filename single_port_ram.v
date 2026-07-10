module single_port_ram #(parameter N=32,parameter D=8,parameter A=4) 
(input clk,we,cs,oe, input [A-1:0]addr, input [N-1:0]d_in, output [N-1:0]d_out);
reg [N-1:0] mem [0:D-1];
reg [N-1:0]data;
always @(posedge clk) begin
    if(we&&cs)
    mem[addr]<=d_in;
end
always @(posedge clk) begin
    if(!we&&cs)
    data<=mem[addr];
end
assign d_out=(~we&&cs&&oe)?data:1'bz;
endmodule

module single_port_ram_tb;
parameter N=32;
parameter D=8;
parameter A=4;
reg clk,we,cs,oe;
reg [A-1:0]addr;
reg [N-1:0]d_in;
wire [N-1:0]d_out;
single_port_ram #(N,D,A) dut (.clk(clk),.we(we),.oe(oe),.cs(cs),.addr(addr),.d_in(d_in),.d_out(d_out));
always #5 clk=~clk;
initial begin
    cs<=1;d_in<=32'hfea9;we<=1;addr<=4'h6;clk=0;oe<=0;
    #15 we<=0;
    #10 oe<=1;
    #100 $finish;
end
endmodule

module tb;
reg clk,rst,wr,sel;
reg [15:0]wdata;
wire [15:0]rdata;
single_port_ram dut (.clk(clk),.rst(rst),.wr(wr),.sel(sel),.wdata(wdata),.rdata(rdata));
always #5 clk=~clk;
initial begin
    $monitor($time, "wr =%b rst=%b sel=%b wdata=%b rdata=%b",wr,rst,sel,wdata,rdata);
    rst=1;clk=1;wdata=16'h12ab;
    wr=0;sel=0;
    #10 rst=0;
    #2 wr=1;sel=1;
    #10 wr=1;sel=0;
    #10 wr=0;sel=1;
    #10 $finish;
end
endmodule

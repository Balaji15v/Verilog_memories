module single_port_ram(input rst,clk,wr,sel,input [15:0]wdata, output [15:0]rdata);
reg [15:0] register;
always @(posedge clk) begin
    if(rst)
    register<=0;
    else begin 
        if(sel && wr)
         register<=wdata;
        else
        register<=register;
    end
end
assign rdata=(sel & ~wr)?register:0;
endmodule

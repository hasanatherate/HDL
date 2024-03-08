// VERILOG MODULE
module BCD(count,rst,clk);
input wire rst, clk;
output reg [3:0] count;
//*USE the following block of code only during synthesis*
reg[20:0]clk_signal;
reg clk_1;
initial
clk_signal=21'd0;
always@(posedge clk)
begin
clk_signal=clk_signal+1;
clk_1=clk_signal[16];
end
always @(posedge clk) //*for synthesis use clk_1 instead of clk*
begin
if ((rst==1)|(count==4'b1001))
count =4'b0000;
else
count = count + 4'b0001;
end
endmodule
// Test bench module
module BCD_t ;
wire [3:0] count;
reg rst,clk;
BCD m1 (count,rst,clk);
initial
clk = 1'b0;
always
#5 clk = ~clk;
initial
begin
#10; rst= 1'b1 ;
#10; rst= 1'b0 ;
#10; rst= 1'b1 ;
#10; rst= 1'b0 ;
#200 $finish;
end
initial
$monitor ($time, "Output count = %d ",count );
endmodule

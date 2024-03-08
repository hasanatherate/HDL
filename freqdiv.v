//VERILOG MODULE
module freq_div(clk_2,clk_4,clk_8,clk_16,rst,clk);
input wire rst, clk;
output reg clk_2,clk_4,clk_8,clk_16;
reg [3:0]count;
initial
count[3:0]=4'b0000;
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
if (rst==1)
begin count =4'b0000; end
else
begin count = count + 4'b0001;end
clk_2=count[0];
clk_4=count[1];
clk_8=count[2];
clk_16=count[3];
end
endmodule
// Test bench module
module freq_div_test ;
wire clk_2,clk_4,clk_8,clk_16;
reg rst,clk;
freq_div m1 ( clk_2,clk_4,clk_8,clk_16,rst,clk);
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
$monitor ($time,"Output clk_2=%d " ,clk_2, "Output clk_4=%d " ,clk_4, "Output clk_8=%d"
,clk_8, "Output clk_16=%d" ,clk_16);
endmodule

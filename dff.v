// Main module
module dff( d, clk,rst, q, q_bar);
input d, clk, rst;
output reg q, q_bar;
//*USE the following block of code only during synthesis*
reg[20:0]clk_signal;
reg clk_1;
initial
clk_signal=21'd0;
always@(posedge clk)
begin
clk_signal=clk_signal+1;
clk_1=clk_signal[16];
end*/
always @ (posedge clk or negedge rst) //*for synthesis use clk_1 instead of clk*
begin
if(!rst)
begin
q <= 1'b0;
q_bar<=1'b1;
end
else
begin
q <= d;
q_bar<= !d;
end
end
endmodule
//Test bench module
module dff_test;
regd,rst,clk;
wire q,qbar;
// Instantiate the D-flipflop
dff d1 (.d(d),.clk(clk),.rst(rst), .q(q), .q_bar(q_bar));
task display;
begin
$display("time=%0d",$time,"ns"," n_rst=",rst," din=",d," q=",q," q_bar=",q_bar);
end
endtask
initial
begin
d = 0;
clk = 0;
end
// Generating clock signal
always
#5 clk = ~clk;
// Add stimulus here
initial
begin
rst=1'b0;d=1'b1;#10;display;
rst=1'b1;d=1'b1;#10;display;
d=1'b0;#10;display;
d=1'b1;#10;display;
rst=1'b0;d=1'b1;#10; display;
rst=1'b1;d=1'b1;#10;display;
end
endmodule

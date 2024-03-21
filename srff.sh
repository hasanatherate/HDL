//Main module
module srff(q,qbar,s,r,clk,rst);
output q,qbar;
input clk,rst,s,r;
reg q;
//*USE the following block of code only during synthesis*
/*reg[20:0]clk_signal;
reg clk_1;
initial
clk_signal=21'd0;
always@(posedgeclk)
begin
clk_signal=clk_signal+1;
clk_1=clk_signal[16];
end*/
always @(posedge clk or negedge rst) //*for synthesis use clk_1 instead of clk*
begin
if (!rst)
q <= 1'b0;
else if (s == 1'b0 && r == 1'b0)
q <= q;
else if (s == 1'b0 && r == 1'b1)
q <= 1'b0;
else if (s == 1'b1 && r == 1'b0)
q <= 1'b1;
else if (s == 1'b1 && r == 1'b1)
q <= 1'bx;
end
assign qbar = ~q;
endmodule
// Testbenchmodule
module sr_ff_test;
reg clk,rst,s,r;
wire q,qbar;
srff sr1(q,qbar,s,r,clk,rst);
task display;
begin
$display("time=%0d",$time,"ns"," rst=",rst," s=",s," r=",r," q=",q," qbar=",qbar);
end
endtask
initial
clk = 1'b0;
always
#5 clk = ~clk;
initial
begin
rst=0; s=1;r=0; #10;display;
rst=1; s=1;r=0; #10;display;
s=0;r=0; #10;display;
s=0;r=1; #10;display;
s=1;r=1; #10;display;
end
initial
#70 $finish;
endmodule

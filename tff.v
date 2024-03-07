//Define our own T-Flip Flop Module
module t_ff(q,qbar,clk,tin,rst);
output q,qbar;
input clk,tin,rst;
reg tq;
always @(posedge clk or negedge rst)
begin
if(!rst)
tq <= 1'b0;
else
begin
if (tin)
tq <= ~tq;
end
end
assign q = tq;
assign qbar = ~q;
endmodule
// Testbench for T-Flip Flop Module
module tff_test;
reg clk,tin,rst;
wire q,qbar;
t_ff t1(q,qbar,clk,tin,rst);
task display;
begin
$display("time=%0d",$time,"ns",
" rst=",rst," tin=",tin," q=",q," qbar=",qbar);
end
endtask
initial
clk = 1'b0;
always
#5 clk = ~clk;
initial
begin
rst = 1'b0;tin=1'b0;#10;display;
rst = 1'b1;tin=1'b1;#10;display;
tin = 1'b1;#10;display;
tin = 1'b1;#10;display;
tin = 1'b0;#10;display;
rst=1'b0;tin=1'b1;#10;display;
rst=1'b1;tin=1'b1;#10;display;
#10 ;
end
initial
#100 $finish;
endmodule

// VERILOGMODULE
module fulladd(sum,cout,yxor,yxnor,yand,yor,a,b,c);
output sum,cout,yxor,yxnor,yand,yor;
input a,b,c;
assign sum = a^b^c;
assign cout = (a&b)|(b&c)|(c&a);
assign yxor = a^b^c;
assign yxnor = ~(a^b^c);
assign yand = a&b&c;
assign yor = a|b|c;
endmodule
// Test bench module
module stimulus();
wire sum,cout,yxor,yxnor,yand,yor;
reg a,b,c;
fulladd g(sum,cout,yxor,yxnor,yand,yor,a,b,c);
task display;
begin
$display (" a= ",a," b= ",b, "c=",c,"sum = " ,sum, "cout =", cout,
" yxor= ",yxor," yxnor= ",yxnor, "yand = ",yand, " yor = ",yor);
end
endtask
initial
begin
a=1'b0;b=1'b0;c=1'b0;#5;display;
a=1'b0;b=1'b0;c=1'b1;#5;display;
a=1'b1;b=1'b1;c=1'b0;#5;display;
a=1'b1;b=1'b1;c=1'b1;#5;display;
a=1'b1;b=1'b0;c=1'b0;#5;display;
a=1'b1;b=1'b0;c=1'b1;#5;display;
a=1'b1;b=1'b1;c=1'b0;#5;display;
a=1'b1;b=1'b1;c=1'b1;#5;display;
end
endmodule

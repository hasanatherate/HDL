//VERILOG MODULE
module lookheadadder(sum,c_4,a,b,c_0);
input [7:0]a,b;
input c_0;
output [7:0]sum;
output c_4;
wire p0,p1,p2,p3,p4,p5,p6,p7,g0,g1,g2,g3,g4,g5,g6,g7;
wire c1,c2,c3,c4,c5,c6,c7,c8;
assign p0=a[0]^b[0],p1=a[1]^b[1],p2=a[2]^b[2],p3=a[3]^b[3],
p4=a[4]^b[4],p5=a[5]^b[5],p6=a[6]^b[6],p7=a[7]^b[7],
g0=a[0]&b[0],g1=a[1]&b[1],g2=a[2]&b[2],g3=a[3]&b[3],g4=a[4]&b[4],
g5=a[5]&b[5],g6=a[6]&b[6],g6=a[6]&b[6],g7=a[7]&b[7];
assign c1=g0|(p0&c_0),
c2=g1|(p1&g0)|(p1&p0&c_0),
c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&c_0),
c4=g3|(p3&g2)|(p3&p2&p1&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&c_0),
c5=g4|(p4&g3)|(p4&p3&p2&p1&g2)|(p4&p3&p2&p1&g1)|(p4&p3&p2&p1&g0)|(p4&p3&p2&p1
&p0&c_0),
c6=g5|(p5&g4)|(p5&p4&p3&p2&p1&g3)|(p5&p4&p3&p2&p1&g2)|(p5&p4&p3&p2&p1&g1)|(p5
&p4&p3&p2&p1&g0)|(p5&p4&p3&p2&p1&p0&c_0),
c7=g6|(p6&g5)|(p6&p5&p4&p3&p2&p1&g4)|(p6&p5&p4&p3&p2&p1&g3)|(p6&p5&p4&p3&p2&
p1&g2)|(p6&p5&p4&p3&p2&p1&g1)|(p6&p5&p4&p3&p2&p1&g0)|(p6&p5&p4&p3&p2&p1&p0
&c_0),
c8=g7|(p7&g6)|(p7&p6&p5&p4&p3&p2&p1&g5)|(p7&p6&p5&p4&p3&p2&p1&g4)|(p7&p6&p5&
p4&p3&p2&p1&g3)|(p7&p6&p5&p4&p3&p2&p1&g2)|(p7&p6&p5&p4&p3&p2&p1&g1)|(p7&p6
&p5&p4&p3&p2&p1&g0)|(p7&p6&p5&p4&p3&p2&p1&p0&c_0);
assign sum[0]=p0^c_0,
sum[1]=p1^c1,
sum[2]=p2^c2,
sum[3]=p3^c3,
sum[4]=p4^c4,
sum[5]=p5^c5,
sum[6]=p6^c6,
sum[7]=p7^c7,
c_4=c8;
endmodule
module test_lookahead_adder_8bit;
// Inputs
reg [7:0] A;
reg [7:0] B;
reg Cin;
// Outputs
wire [7:0] Sum;
wire Cout;
// Instantiate the Unit Under Test (UUT)
lookheadadder uut (Sum,Cout,A,B,Cin);
initial begin
// Initialize Inputs
A = 0;
B = 0;
Cin = 0;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
#10 A=8'b00000001;B=8'b00000001;Cin=1'b0;
#10 A=8'b00000001;B=8'b00000001;Cin=1'b1;
#10 A=8'b00000010;B=8'b00000011;Cin=1'b0;
#10 A=8'b10000001;B=8'b10000001;Cin=1'b0;
#10 A=8'b00011001;B=8'b00110001;Cin=1'b0;
end
initial begin
$monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b",A,B,Cin,Sum,Cout);
end
endmodule

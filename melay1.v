//Verilog Code
i. without overlap
module moore_overlap(
input x,
output reg y,
input clk,
input rst );
reg[2:0] current_state,next_state;
parameter A=3'b000;
parameter B=3'b001;
parameter C=3'b010;
parameter D=3'b011;
parameter E=3'b100;
parameter F=3'b101;
always@(posedge clk)begin
if(rst)begin
current_state=A;
end
else begin
current_state=next_state;
end
end
always@(current_state or x or rst)
begin
case(current_state)
A: begin//----------------------A
if(rst==0&x==1)begin
y=0;
next_state=B;
end
else if(x==0)begin
y=0;
next_state=A;
end
end
B:begin//------------------------B
if(x==1)begin
y=0;
next_state=C;
end
else if(x==0)begin
y=0;
next_state=A;
end
end
C:begin//-------------------------C
if(x==1)begin
y=0;
next_state=D;
end
else if (x==0) begin
y=0;
next_state=A;
end
end
D:begin//------------------------D
if(x==0)begin
y=0;
next_state=E;
end
else if(x==1) begin
y=0;
next_state=A;
end
end
E:begin//-------------------------E
if(x==1)begin
y=0;
next_state=F;
end
else if(x==0) begin
y=0;
next_state=A;
end
end
F:begin//---------------------------F
if(x==1)begin
y=1;
next_state=C;
end
else if(x==0)begin
y=0;
next_state=A;
end
end
endcase
end
endmodule
//Testbench:
module tbmooreoverlap;
// Inputs
reg x; reg clk; reg rst; /
/ Outputs
wire y;
// Instantiate the Unit Under Test (UUT)
moore_overlap uut ( .x(x), .y(y), .clk(clk), .rst(rst) );
initial begin
// Initialize Inputs
x = 0; clk = 0; rst = 0; #100; // Wait 100 ns for global reset to finish
// Add stimulus here
end
always begin
clk=1; #10; clk=0; #10;
end
initial begin
rst=1; #20; rst=0;
x=1;#20; x=1;#20; x=1;#20;
x=0;#20; x=1;#20; x=0;#20;
x=1;#20; x=1;#20; x=0;#20;
x=1;#20; x=1;#20; x=1;#20;
x=0;#20; x=1;#20; x=1;#20;
x=1;#20; x=0;#20; x=1;#100;
end
endmodule

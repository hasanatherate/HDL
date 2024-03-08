// VERILOG MODULE
module enco_p_8_3(A, valid, y);
input [7:0] A;
output valid;
output [2:0]y;
reg valid;
reg [2:0]y;
always @(A)
begin
valid = 1;
if (A[7] ==1)y = 3'd7;
else if (A[6] ==1)y = 3'd6;
else if (A[5] ==1)y = 3'd5;
else if (A[4] ==1)y = 3'd4;
else if (A[3] ==1)y = 3'd3;
else if (A[2] ==1)y = 3'd2;
else if (A[1] ==1)y = 3'd1;
else if (A[0] ==1)y = 3'd0;
else
begin
valid = 0;
y = 3'bXXX;
end
end
endmodule
// Test bench module
module stimulus();
reg [7:0]A;
wire valid;
wire [2:0]Y;
enco_p_8_3 e1(A,valid,Y);
initial
begin
A=8'b00000000;
#10 A=8'b00000001;
#10 A=8'b0000001X;
#10 A=8'b000001XX;
#10 A=8'b00001XXX;
#10 A=8'b0001XXXX;
#10 A=8'b001XXXXX;
#10 A=8'b01XXXXXX;
#10 A=8'b1XXXXXXX;
#10 A=8'b011XXXXX;
#10 $finish;
end
endmodule
// Main module
module encoder8_3(A, Y);
input [7:0] A;
output [2:0] Y;
reg [2:0] Y;
always @(A)
begin
case (A)
8'b10000000:Y=3'd7;
8'b01000000:Y=3'd6;
8'b00100000:Y=3'd5;
8'b00010000:Y=3'd4;
8'b00001000:Y=3'd3;
8'b00000100:Y=3'd2;
8'b00000010:Y=3'd1;
8'b00000001:Y=3'd0;
default:Y=3'bXXX;
endcase
end
endmodule
// Test bench module
module stimulus();
reg [7:0]A;
wire [2:0]Y;
encoder8_3 e1(A,Y);
initial
begin
A=8'b00000000;
#10 A=8'b00000001;
#10 A=8'b00000010;
#10 A=8'b00000100;
#10 A=8'b00001000;
#10 A=8'b00010000;
#10 A=8'b00100000;
#10 A=8'b01000000;
#10 A=8'b10000000;
#10 $finish;
end
endmodule

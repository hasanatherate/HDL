//VERILOG MODULDE
module alu(Result, A, B, opcode, Enable);
output [63:0] Result; //*for synthesis [7:0]*
input signed[31:0] A, B; //*for synthesis [3:0]*
input [2:0] opcode;
input Enable;
reg [63:0] Result; //*for synthesis [7:0]*
always@(opcode,A,B,Enable)
begin
if(Enable==0)
begin
Result=64'bx;
end
else
begin
case(opcode)
3'b000: begin Result=A+B; end
3'b001: begin Result=A-B; end
3'b010: begin Result=A+1; end
3'b011: begin Result=A-1; end
3'b100: begin
if(A)
Result =1'b1;
else
Result =1'b0;
end
3'b101: begin Result=~A; end
3'b110: begin Result=A|B; end
3'b111: begin Result=A&B; end
endcase
end
end
endmodule
// Test bench module
module stimulus();
reg [2:0]opcode;
reg [31:0] a,b;
reg Enable;
wire [63:0]Result;
alu m1 (Result, a, b, opcode, Enable);
initial
begin
a=16'h0000; b=16'h0000; Enable =1'b0;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b000;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b001;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b010;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b011;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b100;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b101;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b110;
#10 Enable=1'b1; a=32'hABCD1212; b=32'h71611111; opcode=3'b111;
#10 $finish;
end
endmodule

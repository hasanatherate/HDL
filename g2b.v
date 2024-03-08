//VERILOG MODULE
module BG(B,G);
output [3:0]G;
input [3:0]B;
assign G[3]=B[3];
Gray_bin_1 x1(G[2],G[3],B[2]);
Fulladder_1 x2(G[1], ,1'b0,B[2],B[1]);
Subtractor_1 x3(G[0], ,1'b0,B[1], B[0]);
endmodule
//Module for 1 bit G 2 B
module Gray_bin_1(b0,g1,g0);
output b0;
input g0,g1;
assign b0= g0 ^ g1;
endmodule
//Module for 1 bit Adder
module Fulladder_1 (sum,cout, a, b, c);
output sum, cout;
input a, b,c;
assign sum= a ^ b ^ c;
assign cout= (a & b) | (b & c) | (c & a);
endmodule
//Module for 1 bit Subtractor
module Subtractor_1 (diff,bout, a, b, c);
output diff, bout;
input a, b,c;
assign diff= a ^ b ^ c;
assign bout= ((~a) & b) | ((((~a) | b)) & c);
endmodule
//Test Bench module
module stimulus();
reg[3:0]B;
wire[3:0]G;
BG bg(B,G);
initial
begin
B=4'h0;
#10 B=4'h1; #10B=4'h3;
#10 B=4'h7; #10B=4'h9;
#10 B=4'hf; #10B=4'ha;
#10 $finish;
end
endmodule

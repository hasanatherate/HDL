// VERILOG MODULE
module mux8_1(sel,a,muxout);
input [2:0] sel;
input [7:0] a;
output muxout;
reg muxout;
always @(sel,a)
begin
case(sel)
3'd0: muxout = a[0];
3'd1: muxout = a[1];
3'd2: muxout = a[2];
3'd3: muxout = a[3];
3'd4: muxout = a[4];
3'd5: muxout = a[5];
3'd6: muxout = a[6];
3'd7: muxout = a[7];
default:;
endcase
end
endmodule
// Test bench module
module stimulus();
reg [2:0]sel;
reg [7:0]a;
wire muxout;
mux8_1 m1 (sel,a,muxout);
initial
begin
a=8'b00000000;
#10 a=8'b00000001;sel=3'b000;
#10 a=8'b00000010;sel=3'b001;
#10 a=8'b00000100;sel=3'b010;
#10 a=8'b00001000;sel=3'b011;
#10 a=8'b00010000;sel=3'b100;
#10 a=8'b00100000;sel=3'b101;
#10 a=8'b01000000;sel=3'b110;
#10 a=8'b10000000;sel=3'b111;
#10 $finish;
end
endmodule

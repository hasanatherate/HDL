// VERILOG MODULE
module mux(a,s1,s2,s3,y);
input [7:0] a;
input s1,s2,s3;
output y;
reg y;
always @(a,s1,s2,s3)
begin
if ((s1 ==0)&&(s2==0)&&(s3==0))y = a[0];
else if ((s1 ==1)&&(s2==0)&&(s3==0))y = a[1];
else if ((s1 ==0)&&(s2==1)&&(s3==0))y = a[2];
else if ((s1 ==1)&&(s2==1)&&(s3==0))y = a[3];
else if ((s1 ==0)&&(s2==0)&&(s3==1))y = a[4];
else if ((s1 ==1)&&(s2==0)&&(s3==1))y = a[5];
else if ((s1 ==0)&&(s2==1)&&(s3==1))y = a[6];
else if ((s1 ==1)&&(s2==1)&&(s3==1))y = a[7];
else
begin
y = 1’bz;
end
end
endmodule
// Test bench module
module stimulus();
reg s1,s2,s3;
reg [7:0]a;
wire y;
mux m1 ( a,s1,s2,s3,y);
initial
begin
a=8'b00000000;
#10 a=8'b00000001; {s3,s2,s1}=3'b000;
//#10 a=8’b00000000; {s3,s2,s1}=3’b000;
#10 a=8'b00000010; {s3,s2,s1}= 3'b001;
//#10 a=8’b00000000; {s3,s2,s1}=3’b001;
#10 a=8'b00000100; {s3,s2,s1}=3'b010;
#10 a=8'b00001000; {s3,s2,s1}= 3'b011;
#10 a=8'b00010000; {s3,s2,s1}= 3'b100;
#10 a=8'b00100000; {s3,s2,s1}= 3'b101;
#10 a=8'b01000000; {s3,s2,s1}= 3'b110;
#10 a=8'b10000000; {s3,s2,s1}= 3'b111;
#10 $finish;
end
endmodule

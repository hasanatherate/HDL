module multiplier4x4;
  output [7:0] product;
  input [3:0] inp1;
  input [3:0] inp2;

  wire [7:0] product;
  wire [1:0] x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17;

  ha ha1(product[1], x1, (inp1[1] & inp2[0]), (inp1[0] & inp2[1]));
  fa fa1(x2, x3, inp1[1] & inp2[1], (inp1[0] & inp2[2]), x1);
  fa fa2(x4, x5, (inp1[1] & inp2[2]), (inp1[0] & inp2[3]), x3);
  ha ha2(x6, x7, (inp1[1] & inp2[3]), x5);
  ha ha3(product[2], x15, x2, (inp1[2] & inp2[0]));
  fa fa5(x14, x16, x4, (inp1[2] & inp2[1]), x15);
  fa fa4(x13, x17, x6, (inp1[2] & inp2[2]), x16);
  fa fa3(x9, x8, x7, (inp1[2] & inp2[3]), x17);
  ha ha4(product[3], x12, x14, (inp1[3] & inp2[0]));
  fa fa8(product[4], x11, x13, (inp1[3] & inp2[1]), x12);
  fa fa7(product[5], x10, x9, (inp1[3] & inp2[2]), x11);
  fa fa6(product[6], product[7], x8, (inp1[3] & inp2[3]), x10);

endmodule

// HALF ADDER
module ha(sout, cout, a, b);
  output sout, cout;
  input a, b;
  assign sout = a ^ b;
  assign cout = a & b;
endmodule

// FULL ADDER
module fa(sout, cout, a, b, cin);
  output sout, cout;
  input a, b, cin;
  assign sout = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module tb_multiplier4x4;
  reg [3:0] inp1;
  reg [3:0] inp2;
  wire [7:0] product;

  multiplier4x4 uut (
    .inp1(inp1),
    .inp2(inp2),
    .product(product)
  );

  initial begin
    inp1 = 10; inp2 = 12; #30;
    inp1 = 13; inp2 = 12; #30;
    inp1 = 10; inp2 = 22; #30;
    inp1 = 11; inp2 = 22; #30;
    inp1 = 12; inp2 = 15; #30;
    $finish;
  end
endmodule

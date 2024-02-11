// Parameter declaration outside of any module or initial block
parameter WIDTH = 8;

module division #(parameter WIDTH = 4)(
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  output [WIDTH-1:0] Res
);

  reg [WIDTH-1:0] a1, b1;
  reg [WIDTH:0] p1;
  integer i;

  always @ (A or B) begin
    // initialize the variables.
    // ... (rest of the code)
    Res = a1;
  end
endmodule

module tb_division;
  // Outputs
  wire [WIDTH-1:0] Res;

  // Instantiate the division module (UUT)
  division #(WIDTH) uut (
    .A(A),
    .B(B),
    .Res(Res)
  );

  // Rest of the testbench code
  // ...
endmodule

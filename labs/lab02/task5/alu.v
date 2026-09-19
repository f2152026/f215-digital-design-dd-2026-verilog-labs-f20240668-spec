// alu.v
// Fixed 1-bit-opcode ALU

module alu (
  input      [3:0] a,
  input      [3:0] b,
  input            op,      // 0 = add, 1 = sub
  output reg [3:0] result
);

  reg [3:0] b_inv;
  reg [3:0] b_twos;

  // FIX 1: Use @(*) so the block triggers when ANY input (including 'op') changes
  always @(*) begin
    case (op)
      1'b0: begin
        result = a + b;                 // add
      end
      1'b1: begin
        // FIX 2: Use blocking assignments (=) for combinational logic
        b_inv  = ~b;                    // sub, via two's complement
        b_twos = b_inv + 1;
        result = a + b_twos;
      end
    endcase
  end

endmodule


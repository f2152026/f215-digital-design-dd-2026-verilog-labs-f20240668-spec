// tb.v
// Self-checking testbench for comp2

module tb;
  reg  [1:0] A, B;
  wire GT, LT, EQ;
  integer i, j;

  // Instantiate the comparator
  comp2 DUT (
    .A  (A),
    .B  (B),
    .GT (GT),
    .LT (LT),
    .EQ (EQ)
  );

  initial begin
    $display("Starting self-checking test...");
    
    // Loop through all 16 combinations of A and B
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i; 
        B = j;
        #5;
        
        // SELF-CHECK: The sum of the outputs should always be exactly 1.
        // If it isn't, print an error message showing the exact inputs.
        if ((GT + LT + EQ) != 1) begin
          $display("BUG FOUND: A=%d, B=%d -> GT=%b, LT=%b, EQ=%b", A, B, GT, LT, EQ);
        end
      end
    end
    
    $display("Testbench complete.");
    $finish;
  end

endmodule

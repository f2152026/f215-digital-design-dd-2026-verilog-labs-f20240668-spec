// tb.v
module tb;
  reg  [3:0] a;
  reg  [3:0] b;
  reg        op;
  wire [3:0] result;

  alu DUT (
    .a      (a),
    .b      (b),
    .op     (op),
    .result (result)
  );

  initial begin
    $monitor($time, " op=%b a=%d b=%d | result=%d", op, a, b, result);

    // Test 1: Subtraction to expose the blocking/non-blocking bug
    a = 4'd7; b = 4'd3; op = 1'b1; 
    #10; 
    
    // Test 2: Toggle ONLY 'op' to expose the sensitivity list bug
    op = 1'b0; 
    #10; 

    $finish;
  end
endmodule

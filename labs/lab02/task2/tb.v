// tb.v
// Completed testbench

module tb;

  // Declare inputs as reg and outputs as wire
  // $clog2(4) = 2 bits (1:0) for sel
  // WIDTH = 8 bits (7:0) for dout
  reg  [1:0] t_sel;
  wire [7:0] t_dout;

  // Instantiate DUT
  lut DUT (
    .sel  (t_sel),
    .dout (t_dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // Apply all 4 possible selection values, 5 time units apart
    t_sel = 2'd0; #5;
    t_sel = 2'd1; #5;
    t_sel = 2'd2; #5;
    t_sel = 2'd3; #5;
    
    $finish;
  end

  initial
    $monitor($time, " sel=%d | dout=%d", t_sel, t_dout);

endmodule

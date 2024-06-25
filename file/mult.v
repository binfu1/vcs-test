module mult (
  input  signed [31:0]	dina,
  input  signed [31:0]	dinb,
  output signed [31:0]	dout
);
 
  assign dout = dina * dinb;
 
endmodule

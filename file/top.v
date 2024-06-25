module top (
  input                clk,
  input                rstn,
  input  signed [31:0] dina,
  input  signed [31:0] dinb,
  output signed [31:0] dout
);
 
  wire signed [31:0] add_dout;
  wire signed [31:0] mult_dout;

  add add_i(
    .dina(dina),
    .dinb(dinb),
    .dout(add_dout)
  );
 
  mult mult_i(
    .dina(dina),
    .dinb(dinb),
    .dout(mult_dout)
  );

  reg signed [31:0] add_inv;
  reg signed [31:0] mult_inv;
  always @(posedge clk) begin
    if (!rstn) begin
      add_inv <= 0;
      mult_inv <= 0;
    end
    else begin
      add_inv <= -add_dout;
      mult_inv <= -mult_dout;
    end
  end

  assign dout = add_inv + mult_inv;
 
endmodule

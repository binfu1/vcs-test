`timescale 1ns/1ns
 
module tb;
reg                clk;
reg                rstn;
reg  signed [31:0] dina;
reg  signed [31:0] dinb;
wire signed [31:0] dout;

initial begin
  #0 begin clk = 1; rstn = 0; end
  #4 begin rstn = 1; end
end
always #2 clk = !clk;
 
initial begin
  #0 begin dina <= 3; dinb <= 4; end
  #4 begin dina <= -5; dinb <= 16; end
  #8;
  $finish;
end

top top_i(
  .clk (clk),
  .rstn(rstn),
  .dina(dina),
  .dinb(dinb),
  .dout(dout)
);

initial begin
  // 指定文件名称和限制文件大小(单位MB)
  $fsdbDumpfile("./rtl.fsdb", 32);
  // 导出的信号
  // $fsdbDumpvars; //所有信号
  $fsdbDumpvars(0, top_i); //top_i下的所有信号，包括子模块的信号
  // $fsdbDumpvars(1, top_i); //top_i下的所有信号，不包括子模块的信号
  // $fsdbDumpvars(2, top_i); //top_i和下一层子模块add_i和mult_i下的所有信号
end

endmodule

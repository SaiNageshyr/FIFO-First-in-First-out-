`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2023 12:45:28 PM
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_tb();

	reg wr_en, rd_en, clk, rst;
	reg [7:0] data_in;
	wire empt, full;
	wire [7:0] data_out;
	fifo tb( wr_en, rd_en, clk, rst, data_in, empt, full, data_out);
	
	initial 
	begin
		//clk = 1'b0;

		rst = 1'b1;
		wr_en = 1'b0;
		rd_en = 1'b0;
		data_in = 8'd0;
		#10 rst = 1'b0;
		wr_en=1'b1;
		#10 data_in = 4;
		#14 data_in = 5;
		#14 data_in = 6;
		#14 wr_en=1'b0;
		#15 rd_en=1'b1;
		#20 rd_en=1'b0;
		#15 rd_en=1'b1;
		#20 rd_en=1'b0;
		#50 $finish;
	end
	initial
	  begin
	     clk    = 1'b0;
	  end
	always #5 clk    = ~ clk;
	
endmodule

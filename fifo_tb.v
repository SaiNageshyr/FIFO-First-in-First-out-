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


module fifo_2clks_tb();

	reg wr_en, rd_en, clk1,clk2, rst;
	reg [7:0] data_in;
	wire empt, full;
	wire [7:0] data_out;
	fifo_2clks tb( wr_en, rd_en, clk1, clk2, rst, data_in, empt, full, data_out);
	
	initial 
	begin
		//clk = 1'b0;

		rst = 1'b1;
		wr_en = 1'b0;
		rd_en = 1'b0;
		data_in = 8'd0;
		#10 rst = 1'b0;
		wr_en=1'b1;
		data_in = 4;
		#14 data_in = 5;
		#14 data_in = 6;
		#14 wr_en=1'b0;
		#15 rd_en=1'b1;
		#20 rd_en=1'b0;
		#50 $finish;
	end
	initial
	  begin
	     clk1    = 1'b0;
	     clk2    = 1'b0;
	  end
	always begin 
	#1.665 clk1    = ~ clk1;
	#5     clk2    = ~ clk2;
	end
endmodule

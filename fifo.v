`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2023 10:54:38 AM
// Design Name: 
// Module Name: fifo
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


module fifo( 
	input wr_en, rd_en, clk, rst,
	input [7:0] data_in,
	output reg empt, full,
	output reg [7:0] data_out

    );
	//parameter FIFO_DEPTH = 8'd7, COUNTER_SIZE = 3'd3;
	
	reg [6:0]wr_ptr, rd_ptr;
	reg [6:0] count;
	reg [7:0] mem [7:0];
	
	always @(posedge rst)
        begin
            empt <= 1'b0;
            full <= 1'b0;
        end
	always @(posedge clk)
	begin
		empt <= (count== 0)?1'b1:1'b0;
		full <= (count== 7'b1000000)?1'b1:1'b0;
	end
	
	always @(posedge clk, posedge rst)
	begin
		if(rst)
			count<=0;
		else
		begin
			case ({wr_en, rd_en})
				2'b00 : count <= count;
				2'b01 : count <= (!empt) ? count - 1 : count;
				2'b10 : count <= (!full) ? count + 1 : count;
				2'b11 : count <= count;
				default : count <= count;
			endcase
		end
		end
	always @ ( posedge clk, posedge rst)
	begin
		if(rst)
			data_out <= 0;
		else
		begin
			if( rd_en && !empt)
				data_out <= mem[rd_ptr];
			else
				data_out <= data_out;
		end
	end
	
	always @ ( posedge clk)
	begin
		if( wr_en && !full)
			mem[wr_ptr] <= data_in;
		else
			mem[wr_ptr] <= mem[wr_ptr] ;
	end
	
	always @ ( posedge clk, posedge rst)
	begin
		if(rst)begin
			wr_ptr <= 0;
			rd_ptr <= 0;
		end
		else
		begin
			if ( !full && wr_en)
				wr_ptr <= wr_ptr + 1;
			else
				wr_ptr <= wr_ptr;
			if (!empt && rd_en)
				rd_ptr <= rd_ptr + 1;
			else 
				rd_ptr <= rd_ptr;
		end
		end
endmodule

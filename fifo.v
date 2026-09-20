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


module fifo_2clks( 
	input wr_en, rd_en, clk1,clk2, rst,
	input [7:0] data_in,
	output reg empt, full,
	output reg [7:0] data_out

    );
	parameter FIFO_DEPTH = 8'd8, COUNTER_SIZE = 3'd3;
	
	reg [COUNTER_SIZE - 1:0]wr_ptr, rd_ptr;
	wire [COUNTER_SIZE - 1:0] count;
	reg [7:0] mem [FIFO_DEPTH - 1:0];
	integer i,j;
	initial begin 
	   for (i=0; i<FIFO_DEPTH ;i=i+1) begin 
	       for (j=0; j<FIFO_DEPTH ;j=j+1)
	           mem[i][j]<=1'b0;
	   end
	end
	
    assign count = (wr_ptr - rd_ptr) % FIFO_DEPTH;
    
	always @(posedge clk1, posedge rst)
	begin
	if (rst)
	   full<=0;
    else
		full <= (count== FIFO_DEPTH - 1)?1'b1:1'b0;
	end
	
	always @(posedge clk2, posedge rst)
        begin
        if (rst)
            empt<=0;
        else
            empt <= (count== 0)?1'b1:1'b0;
        end

	always @ ( posedge clk2, posedge rst)
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
	
	always @ ( posedge clk1)
	begin
		if( wr_en && !full)
			mem[wr_ptr] <= data_in;
		else
			mem[wr_ptr] <= mem[wr_ptr] ;
	end
	
	
	always @ ( posedge clk1, posedge rst)
            begin
                if(rst)begin
                    wr_ptr <= 0;
                end
                else
                begin
                    if ( !full && wr_en)
                        wr_ptr <= wr_ptr + 1;
                    else
                        wr_ptr <= wr_ptr;
                end
                end
    always @ ( posedge clk2, posedge rst)
            begin
                if(rst)begin
                    rd_ptr <= 0;
                end
                else
                begin
                    if (!empt && rd_en)
                        rd_ptr <= rd_ptr + 1;
                    else 
                        rd_ptr <= rd_ptr;
                end
                end
endmodule

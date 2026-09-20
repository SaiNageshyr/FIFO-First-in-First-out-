`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 08:39:18 AM
// Design Name: 
// Module Name: problem_1
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


module problem_1(
    input [7:0]A,B,
    input clk1,clk2,rst,
    output [15:0]out
    );
    wire [15:0]sum;
    wire cout;
    wire wr_en=1,rd_en=1;
    wire empty,full;
    wire [7:0]dataout;
    pipe_cla_8 m1 (.clk(clk1),.rst(rst),.a(A),.b(B),.cin(0),.sum(sum),.cout(cout));
    
    fifo_2clks m2(.wr_en(wr_en),.rd_en(rd_en),.clk1(clk1),.clk2(clk2),.rst(rst),.data_in(sum),.empt(empty),.full(full),.data_out(dataout));
    
    pipe_squarer m3(.clk(clk2),.rst(rst),.num(dataout),.sq(out));
endmodule

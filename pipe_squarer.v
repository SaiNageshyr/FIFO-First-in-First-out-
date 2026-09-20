`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 12:04:35 PM
// Design Name: 
// Module Name: pipe_squarer
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


module pipe_squarer(
    input clk,
    input rst,
    input [7:0]num,
    output reg [16:0]sq
    );
    
    reg [7:0]num_q;
    wire [15:0]sq_q;
   
    squarer m1(num_q,sq_q);
    
    always @(posedge clk, posedge rst) begin 
    if(rst) begin 
        num_q<=0;
        sq<=0;
    end
    else begin 
        num_q <= num;
        sq <= sq_q;
    end
    end
endmodule

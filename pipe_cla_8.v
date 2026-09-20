`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 01:02:40 PM
// Design Name: 
// Module Name: pipe_cla_8
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


module pipe_cla_8(
    input clk,
    input rst,
    input [7:0]a,
    input [7:0]b,
    input cin,
    output reg [7:0]sum,
    output reg cout
    );
    reg [7:0]aq,bq;
    reg cinq;
    wire [7:0]sumq;
    wire coutq;
    
    cla_8 m1(.a(aq),.b(bq),.cin(cinq),.sum(sumq),.cout(coutq));
    
    always @(posedge clk , posedge rst) begin 
    if(rst) begin 
        aq<=0;
        bq<=0;
        cinq<=0;
        sum<=0;
        cout<=0;
    end
    else begin 
        aq <=a;
        bq <=b;
        cinq <=cin;
        sum <= sumq;
        cout <= coutq;
    end
    end
endmodule

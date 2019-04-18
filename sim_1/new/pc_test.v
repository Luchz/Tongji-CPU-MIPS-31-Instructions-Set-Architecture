`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/08 19:26:11
// Design Name: 
// Module Name: pc_test
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


module pc_test();
    reg clk, rst;
    reg [31:0] data;
    wire [31:0] data_out;
    always #10 clk = ~clk;
    initial begin   clk = 0; rst = 1; #30 rst = 0; end
    initial data = 32'hxxxxxxxxx;
    pcreg pc(clk, rst, 1'b1, data, data_out);
endmodule

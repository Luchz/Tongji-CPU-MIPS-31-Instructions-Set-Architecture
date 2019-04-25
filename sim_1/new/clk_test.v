`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 12:42:50
// Design Name: 
// Module Name: clk_test
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


module clk_test();
    reg clk, rst;
    wire [31:0] r;
    clk_edge clk_inst(clk, rst, r);
    initial clk = 0;
    initial begin
        rst = 1;
        #10 rst = 0;
        end
    always #20 clk = ~clk;
endmodule

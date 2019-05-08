`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 20:16:14
// Design Name: 
// Module Name: timing_tb
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


module timing_tb();
    reg  clk,reset;
    //wire [31:0] pc, d1, d2, w1, w2, a1, a2, r1, r2;
    wire [31:0] inst, pc;
    //wire [30:0] op;
    //wire c,w;
    //reg flag;
    sccomp_dataflow uut(clk, reset, inst, pc);
    //initial flag = 1'b0;
    //integer file_output;
    //integer counter = 0;
    initial begin
        clk = 0;
        reset = 1;
        #9 reset = 0;
    end
    
   always begin
        #11 clk = ~clk;
   end
endmodule


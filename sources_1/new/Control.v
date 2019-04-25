`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/06 21:05:23
// Design Name: 
// Module Name: Control
// Project Name: 
// Taregt Devices: 
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


module Control(
    input [30:0] op,
    input zero,
    input clk,
    output PC_CLK,
    output IM_R,
    output RF_W,
    output RF_CLK,
    output DM_CS,
    output DM_W,
    output DM_R,
    output [8:0] m,
    output [3:0] ALUC
    );
    
    assign m[0] = ~(op[28] | op[29]);
    assign m[1] = ~(op[26] | op[27] | op[28] | op[29] | op[30]) | (op[26] & ~zero) | (op[27] & zero);
    assign m[2] = ~(op[28] | op[29] | op[30]);
    assign m[3] = ~(op[13] | op[14] | op[15] | op[28] | op[29] | op[30]);
    assign m[4] = op[16] | op[17] | op[18] | op[19] | op[20] | op[21] | op[22] | op[23] | op[24] | op[25];
    assign m[5] = ~(op[24] | op[25] | op[26] | op[27] | op[28] | op[29] | op[30]);
    assign m[6] = op[16] | op[17] | op[21] | op[24] | op[25] | op[26] | op[27];
    assign m[7] = ~op[29];//~(op[25] | op[26] | op[27] | op[28] | op[29] | op[30]);
    assign m[8] = op[16] | op[17] | op[18] | op[19] | op[20] | op[21] | op[22] | op[23] | op[24];
    assign ALUC[0] = op[2] | op[3] | op[5] | op[7] | op[8] | op[9] | op[11] | op[13] | op[14] | op[19] | op[21] | op[26] | op[27];
    assign ALUC[1] = op[1] | op[3] | op[6] | op[7] | op[8] | op[11] | op[12] | op[13] | op[16] | op[20] | op[22] | op[21];
    assign ALUC[2] = op[4] | op[5] | op[6] | op[7] | op[8] | op[9] | op[10] | op[13] | op[14] | op[15] | op[18] | op[19] | op[20];
    assign ALUC[3] = op[8] | op[9] | op[10] | op[11] | op[12] | op[13] | op[14] | op[15] | op[21] | op[22] | op[23];
    assign DM_CS = (op[24] | op[25]) & clk;
    assign DM_W = op[25];
    assign DM_R = op[24];
    assign RF_CLK = ~clk;
    assign RF_W = ~(op[25] | op[26] | op[27] | op[28] | op[30]);
    assign PC_CLK = ~clk;
    assign IM_R = 1'b1;
endmodule

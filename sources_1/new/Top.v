`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 20:52:44
// Design Name: 
// Module Name: Top
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


module sccomp_dataflow(
    input clk_in,
    input reset,
    output [31:0] inst,
    output [31:0] pc,
    output [31:0] d1,
    output [31:0] d2,
    output [31:0] a1,
    output [31:0] a2,
    output [31:0] w1,
    output [30:0] op
    );
    wire [31:0] alu;
    //wire [30:0] op;
    cpu sccpu(clk_in, reset, alu, pc, op, inst, d1, d2, a1, a2, w1);
endmodule

module cpu(
    input clk,
    input rst,
    output [31:0] alu_output,
    output [31:0] pc_out,
    output [30:0] op,
    output [31:0] imem_out,
    output [31:0] d1,
    output [31:0] d2,
    output [31:0] a1,
    output [31:0] a2,
    output [31:0] w1
    );
    wire RF_CLK,RF_W;
    wire [31:0] addr, pc_in, cataddr, m3_out, m2_out, npc_out, branch, ext18_out, dout;
    wire [31:0] rdata1, rdata2, wdata, data, a, b, m6_out, m7_out, ext16_out, ext5_out;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [3:0] aluc;
    wire [4:0] waddr, im_addr, sele_addr, rs, rt, rd, shamt;
    wire [8:0] m;
    assign a1 = waddr;
    assign a2 = rt;
    assign d1 = rdata1;
    assign d2 = rdata2;
    assign w1 = wdata;
    RegFiles cpu_ref(RF_CLK, ~rst, RF_W, rs, rt, waddr, wdata, rdata1, rdata2);
    iram inst_mem(im_r, pc_out, rs, rt, rd, shamt, imm16, imm26, imem_out);
    alu ALU(a, b, aluc, alu_output, zero, carry, negative, overflow);
    dram dmem(DM_CS, DM_R, DM_W, alu_output, rdata2, dout);
    pc_reg PC(pc_clk,~rst,~rst,pc_in,pc_out);
    Adder add(ext18_out, npc_out, branch, );
    Adder NPC(pc_out, 32'h00000004, npc_out, );
    Catenate Addrcat(pc_out[31:28],{imm26, 2'b00},cataddr);
    Ext18 Addrext({imm16, 2'b00}, m[6], ext18_out);
    Ext16 Immext(imm16, m[6], ext16_out);
    Ext5 Shamtext(shamt, m[6], ext5_out);
    selector2 PcSelect(cataddr, m3_out, m[0], 1'b1, pc_in);
    selector2 M3_select(rdata1, m2_out, m[2], 1'b1, m3_out);
    selector2 M2_select(branch, npc_out, m[1], 1'b1, m2_out);
    selector2 ALU_A(ext5_out, rdata1, m[3], 1'b1, a);
    selector2 ALU_B(rdata2, ext16_out, m[4], 1'b1, b);
    selector2_5b RF_rd(rd, rt, m[8], 1'b1, im_addr);
    selector2 RF_wd(npc_out, m6_out, m[7], 1'b1, wdata);
    selector2 M6_select(dout, alu_output, m[5], 1'b1, m6_out);
    selector2_5b RF_addr(5'd31, im_addr, m[7], 1'b1, sele_addr);
    selector2_5b zero_addr(5'b00000, sele_addr, RF_W, 1'b1, waddr);
    Control ConUnit(op, zero, clk, pc_clk, im_r, RF_W, RF_CLK, DM_CS, DM_W, DM_R, m, aluc);
    mem_decoder imemdecoder(imem_out, 1'b1,op);
endmodule

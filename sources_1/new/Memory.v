`timescale 1ns / 1ps
/*结构级描述实现的寄存器堆，按约束要求，需改由行为级描述实现，已废弃
module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire [31:0] data_o31,data_o30,data_o29,data_o28,data_o27,data_o26,data_o25,data_o24,data_o23,
    data_o22,data_o21,data_o20,data_o19,data_o18,data_o17,data_o16,data_o15,data_o14,data_o13,data_o12,
    data_o11,data_o10,data_o9,data_o8,data_o7,data_o6,data_o5,data_o4,data_o3,data_o2,data_o1,data_o0;
    pcreg reg0(.clk(clk),.rst(rst),.ena(ena0),.data_in(wdata),.data_out(data_o0));
    pcreg reg1(.clk(clk),.rst(rst),.ena(ena1),.data_in(wdata),.data_out(data_o1));
    pcreg reg2(.clk(clk),.rst(rst),.ena(ena2),.data_in(wdata),.data_out(data_o2));
    pcreg reg3(.clk(clk),.rst(rst),.ena(ena3),.data_in(wdata),.data_out(data_o3));
    pcreg reg4(.clk(clk),.rst(rst),.ena(ena4),.data_in(wdata),.data_out(data_o4));
    pcreg reg5(.clk(clk),.rst(rst),.ena(ena5),.data_in(wdata),.data_out(data_o5));
    pcreg reg6(.clk(clk),.rst(rst),.ena(ena6),.data_in(wdata),.data_out(data_o6));
    pcreg reg7(.clk(clk),.rst(rst),.ena(ena7),.data_in(wdata),.data_out(data_o7));
    pcreg reg8(.clk(clk),.rst(rst),.ena(ena8),.data_in(wdata),.data_out(data_o8));
    pcreg reg9(.clk(clk),.rst(rst),.ena(ena9),.data_in(wdata),.data_out(data_o9));
    pcreg reg10(.clk(clk),.rst(rst),.ena(ena10),.data_in(wdata),.data_out(data_o10));
    pcreg reg11(.clk(clk),.rst(rst),.ena(ena11),.data_in(wdata),.data_out(data_o11));
    pcreg reg12(.clk(clk),.rst(rst),.ena(ena12),.data_in(wdata),.data_out(data_o12));
    pcreg reg13(.clk(clk),.rst(rst),.ena(ena13),.data_in(wdata),.data_out(data_o13));
    pcreg reg14(.clk(clk),.rst(rst),.ena(ena14),.data_in(wdata),.data_out(data_o14));
    pcreg reg15(.clk(clk),.rst(rst),.ena(ena15),.data_in(wdata),.data_out(data_o15));
    pcreg reg16(.clk(clk),.rst(rst),.ena(ena16),.data_in(wdata),.data_out(data_o16));
    pcreg reg17(.clk(clk),.rst(rst),.ena(ena17),.data_in(wdata),.data_out(data_o17));
    pcreg reg18(.clk(clk),.rst(rst),.ena(ena18),.data_in(wdata),.data_out(data_o18));
    pcreg reg19(.clk(clk),.rst(rst),.ena(ena19),.data_in(wdata),.data_out(data_o19));
    pcreg reg20(.clk(clk),.rst(rst),.ena(ena20),.data_in(wdata),.data_out(data_o20));
    pcreg reg21(.clk(clk),.rst(rst),.ena(ena21),.data_in(wdata),.data_out(data_o21));
    pcreg reg22(.clk(clk),.rst(rst),.ena(ena22),.data_in(wdata),.data_out(data_o22));
    pcreg reg23(.clk(clk),.rst(rst),.ena(ena23),.data_in(wdata),.data_out(data_o23));
    pcreg reg24(.clk(clk),.rst(rst),.ena(ena24),.data_in(wdata),.data_out(data_o24));
    pcreg reg25(.clk(clk),.rst(rst),.ena(ena25),.data_in(wdata),.data_out(data_o25));
    pcreg reg26(.clk(clk),.rst(rst),.ena(ena26),.data_in(wdata),.data_out(data_o26));
    pcreg reg27(.clk(clk),.rst(rst),.ena(ena27),.data_in(wdata),.data_out(data_o27));
    pcreg reg28(.clk(clk),.rst(rst),.ena(ena28),.data_in(wdata),.data_out(data_o28));
    pcreg reg29(.clk(clk),.rst(rst),.ena(ena29),.data_in(wdata),.data_out(data_o29));
    pcreg reg30(.clk(clk),.rst(rst),.ena(ena30),.data_in(wdata),.data_out(data_o30));
    pcreg reg31(.clk(clk),.rst(rst),.ena(ena31),.data_in(wdata),.data_out(data_o31));
    selector32 sel1(.iC0(data_o0),.iC1(data_o1),.iC2(data_o2),.iC3(data_o3),.iC4(data_o4),
    .iC5(data_o5),.iC6(data_o6),.iC7(data_o7),.iC8(data_o8),.iC9(data_o9),.iC10(data_o10),
    .iC11(data_o11),.iC12(data_o12),.iC13(data_o13),.iC14(data_o14),.iC15(data_o15),
    .iC16(data_o16),.iC17(data_o17),.iC18(data_o18),.iC19(data_o19),.iC20(data_o20),
    .iC21(data_o21),.iC22(data_o22),.iC23(data_o23),.iC24(data_o24),.iC25(data_o25),
    .iC26(data_o26),.iC27(data_o27),.iC28(data_o28),.iC29(data_o29),.iC30(data_o30),
    .iC31(data_o31),.addr(raddr1[4:0]),.oZ(rdata1),.ena(1));//输出永远有效
    selector32 sel2(.iC0(data_o0),.iC1(data_o1),.iC2(data_o2),.iC3(data_o3),.iC4(data_o4),
    .iC5(data_o5),.iC6(data_o6),.iC7(data_o7),.iC8(data_o8),.iC9(data_o9),.iC10(data_o10),
    .iC11(data_o11),.iC12(data_o12),.iC13(data_o13),.iC14(data_o14),.iC15(data_o15),
    .iC16(data_o16),.iC17(data_o17),.iC18(data_o18),.iC19(data_o19),.iC20(data_o20),
    .iC21(data_o21),.iC22(data_o22),.iC23(data_o23),.iC24(data_o24),.iC25(data_o25),
    .iC26(data_o26),.iC27(data_o27),.iC28(data_o28),.iC29(data_o29),.iC30(data_o30),
    .iC31(data_o31),.addr(raddr2[4:0]),.oZ(rdata2),.ena(1));//输出永远有效
    decoder32 decoder1(.iData(waddr),.iEna(we),.oData({ena31,ena30,ena29,ena28,ena27,
    ena26,ena25,ena24,ena23,ena22,ena21,ena20,ena19,ena18,ena17,ena16,ena15,ena14,ena13,
    ena12,ena11,ena10,ena9,ena8,ena7,ena6,ena5,ena4,ena3,ena2,ena1,ena0}));
endmodule*/

module RegFiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
);
    reg [31:0] array_reg [31:0];
    reg tmp_reg_a, tmp_reg_b;
    always @ (posedge clk or posedge rst)
        if(rst == 1'b0)begin
            if(we)
                array_reg[waddr] = waddr == 5'b0 ? 32'b0 : wdata;
            end
        else begin
            array_reg[0] = 32'b0;
            array_reg[1] = 32'b0;
            array_reg[2] = 32'b0;
            array_reg[3] = 32'b0;
            array_reg[4] = 32'b0;
            array_reg[5] = 32'b0;
            array_reg[6] = 32'b0;
            array_reg[7] = 32'b0;
            array_reg[8] = 32'b0;
            array_reg[9] = 32'b0;
            array_reg[10] = 32'b0;
            array_reg[11] = 32'b0;
            array_reg[12] = 32'b0;
            array_reg[13] = 32'b0;
            array_reg[14] = 32'b0;
            array_reg[15] = 32'b0;
            array_reg[16] = 32'b0;
            array_reg[17] = 32'b0;
            array_reg[18] = 32'b0;
            array_reg[19] = 32'b0;
            array_reg[20] = 32'b0;
            array_reg[21] = 32'b0;
            array_reg[22] = 32'b0;
            array_reg[23] = 32'b0;
            array_reg[24] = 32'b0;
            array_reg[25] = 32'b0;
            array_reg[26] = 32'b0;
            array_reg[27] = 32'b0;
            array_reg[28] = 32'b0;
            array_reg[29] = 32'b0;
            array_reg[30] = 32'b0;
            array_reg[31] = 32'b0;
            end
    assign rdata1 = array_reg[raddr1];
    assign rdata2 = array_reg[raddr2];
endmodule

module D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1
    );
    always @ (posedge CLK)
        if(RST_n == 1'b0)
            Q1 <= 0;
        else
            Q1 <= D;
endmodule

module nD_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1
    );
    always @ (posedge CLK)
        if(RST_n == 1'b0)
            Q1 <= 1;
        else
            Q1 <= D;
endmodule

module pcreg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output [31:0] data_out
    );
    wire [31:0] data;
    wire CLK;
    assign CLK = clk & (rst | ena);
    D_FF D1(.CLK(CLK),.D(data_in[0]),.RST_n(~rst),.Q1(data[0]));
    D_FF D2(.CLK(CLK),.D(data_in[1]),.RST_n(~rst),.Q1(data[1]));    
    D_FF D3(.CLK(CLK),.D(data_in[2]),.RST_n(~rst),.Q1(data[2]));
    D_FF D4(.CLK(CLK),.D(data_in[3]),.RST_n(~rst),.Q1(data[3]));
    D_FF D5(.CLK(CLK),.D(data_in[4]),.RST_n(~rst),.Q1(data[4]));
    D_FF D6(.CLK(CLK),.D(data_in[5]),.RST_n(~rst),.Q1(data[5]));
    D_FF D7(.CLK(CLK),.D(data_in[6]),.RST_n(~rst),.Q1(data[6]));
    D_FF D8(.CLK(CLK),.D(data_in[7]),.RST_n(~rst),.Q1(data[7]));
    D_FF D9(.CLK(CLK),.D(data_in[8]),.RST_n(~rst),.Q1(data[8]));
    D_FF D10(.CLK(CLK),.D(data_in[9]),.RST_n(~rst),.Q1(data[9]));
    D_FF D11(.CLK(CLK),.D(data_in[10]),.RST_n(~rst),.Q1(data[10]));
    D_FF D12(.CLK(CLK),.D(data_in[11]),.RST_n(~rst),.Q1(data[11]));
    D_FF D13(.CLK(CLK),.D(data_in[12]),.RST_n(~rst),.Q1(data[12]));
    D_FF D14(.CLK(CLK),.D(data_in[13]),.RST_n(~rst),.Q1(data[13]));
    D_FF D15(.CLK(CLK),.D(data_in[14]),.RST_n(~rst),.Q1(data[14]));
    D_FF D16(.CLK(CLK),.D(data_in[15]),.RST_n(~rst),.Q1(data[15]));
    D_FF D17(.CLK(CLK),.D(data_in[16]),.RST_n(~rst),.Q1(data[16]));
    D_FF D18(.CLK(CLK),.D(data_in[17]),.RST_n(~rst),.Q1(data[17]));
    D_FF D19(.CLK(CLK),.D(data_in[18]),.RST_n(~rst),.Q1(data[18]));
    D_FF D20(.CLK(CLK),.D(data_in[19]),.RST_n(~rst),.Q1(data[19]));
    D_FF D21(.CLK(CLK),.D(data_in[20]),.RST_n(~rst),.Q1(data[20]));
    D_FF D22(.CLK(CLK),.D(data_in[21]),.RST_n(~rst),.Q1(data[21]));
    nD_FF D23(.CLK(CLK),.D(data_in[22]),.RST_n(~rst),.Q1(data[22]));
    D_FF D24(.CLK(CLK),.D(data_in[23]),.RST_n(~rst),.Q1(data[23]));
    D_FF D25(.CLK(CLK),.D(data_in[24]),.RST_n(~rst),.Q1(data[24]));
    D_FF D26(.CLK(CLK),.D(data_in[25]),.RST_n(~rst),.Q1(data[25]));
    D_FF D27(.CLK(CLK),.D(data_in[26]),.RST_n(~rst),.Q1(data[26]));
    D_FF D28(.CLK(CLK),.D(data_in[27]),.RST_n(~rst),.Q1(data[27]));
    D_FF D29(.CLK(CLK),.D(data_in[28]),.RST_n(~rst),.Q1(data[28]));
    D_FF D30(.CLK(CLK),.D(data_in[29]),.RST_n(~rst),.Q1(data[29]));
    D_FF D31(.CLK(CLK),.D(data_in[30]),.RST_n(~rst),.Q1(data[30]));
    D_FF D32(.CLK(CLK),.D(data_in[31]),.RST_n(~rst),.Q1(data[31]));
    assign data_out[31:0] = data[31:0];
endmodule

module pc_reg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output [31:0] data_out
);
    reg [31:0] in_reg;
    always @ (posedge clk)
        if(rst == 1'b1)
            in_reg <= 32'h00400000;
        else if(ena)
            in_reg <= data_in;
    assign data_out = in_reg;
endmodule

module dram(
	input clk,
    input ena,//与原ram有所不同，ena信号只控制读使能
    input wena,
    input [31:0] addr,
    input [31:0] data_in,
    output [31:0] data_out
);
    reg [31:0] data_inside [0:2047];
    reg [31:0] data_output;
    always @ (posedge clk)
    begin
        if(wena == 1)
            data_inside[addr[31:2] - 32'h4004000] <= data_in;
    end
    always @ (ena or addr)
    begin
        if(ena == 1)
            data_output = data_inside[addr[31:2] - 32'h4004000][31:0];
        else
            data_output = 32'bz;
    end
    assign data_out = data_output;
endmodule

module iram(
	input im_r,
	input [31:0] addr,
	output [4:0] rs,//特指25-21
	output [4:0] rt,//特指20-16
	output [4:0] rd,//特指15-11
	output [4:0] shamt,
	output [15:0] imm16,
	output [25:0] imm26,
	output [31:0] imem_out
    );
    //reg [31:0] data [0:2047];
    //initial $readmemh("e:/Mars/test.txt",data);
    wire [31:0] data_output;
    imem data({addr[31:2] - 30'h00100000}[10:0], data_output);
    assign imem_out = data_output;
    assign rd = data_output[15:11];
    assign rt = data_output[20:16];
    assign rs = data_output[25:21];
    assign imm16 = data_output[15:0];
    assign imm26 = data_output[25:0];
    assign shamt = data_output[10:6];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/06 18:19:35
// Design Name: 
// Module Name: Plexers
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

module selector32(
    input [31:0] iC0,iC1,iC2,iC3,iC4,iC5,iC6,iC7,
    input [31:0] iC8,iC9,iC10,iC11,iC12,iC13,iC14,iC15,
    input [31:0] iC16,iC17,iC18,iC19,iC20,iC21,iC22,iC23,
    input [31:0] iC24,iC25,iC26,iC27,iC28,iC29,iC30,iC31,
    input [4:0] addr,
    input ena,
    output  [31:0] oZ
    );
    reg [31:0] data;
    always @ (*)
        begin
        if(ena == 1)
            case(addr)
            5'b0:begin
            data=iC0;end
            5'b1:begin
            data=iC1;end
            5'b10:begin
            data=iC2;end
            5'b11:begin
            data=iC3;end
            5'b100:begin
            data=iC4;end
            5'b101:begin
            data=iC5;end
            5'b110:begin
            data=iC6;end
            5'b111:begin
            data=iC7;end
            5'b1000:begin
            data=iC8;end
            5'b1001:begin
            data=iC9;end
            5'b1010:begin
            data=iC10;end
            5'b1011:begin
            data=iC11;end
            5'b1100:begin
            data=iC12;end
            5'b1101:begin
            data=iC13;end
            5'b1110:begin
            data=iC14;end
            5'b1111:begin
            data=iC15;end
            5'b10000:begin
            data=iC16;end
            5'b10001:begin
            data=iC17;end
            5'b10010:begin
            data=iC18;end
            5'b10011:begin
            data=iC19;end
            5'b10100:begin
            data=iC20;end
            5'b10101:begin
            data=iC21;end
            5'b10110:begin
            data=iC22;end
            5'b10111:begin
            data=iC23;end
            5'b11000:begin
            data=iC24;end
            5'b11001:begin
            data=iC25;end
            5'b11010:begin
            data=iC26;end
            5'b11011:begin
            data=iC27;end
            5'b11100:begin
            data=iC28;end
            5'b11101:begin
            data=iC29;end
            5'b11110:begin
            data=iC30;end
            5'b11111:begin
            data=iC31;end
            endcase
         else
            data = 32'bz;
         end
    assign oZ = data;
endmodule

module selector4(
    input [31:0] iC0,iC1,iC2,iC3,
    input [1:0] addr,
    input ena,//高电平有效
    output [31:0] oZ
    );
    reg [31:0] data;
    always @ (*)
        begin
            if(ena == 0)
                data = 32'b0;
            else
                case(addr)
                    2'b00:data = iC0;
                    2'b01:data = iC1;
                    2'b10:data = iC2;
                    2'b11:data = iC3;
                    default:;
                endcase
        end
    assign oZ = data;
endmodule

module selector2(
    input [31:0] iC0,iC1,
    input addr,
    input ena,
    output [31:0] oZ
    );
    reg [31:0] data;
    always @ (*)
        begin
            if(1'b0 == ena)
                data = 32'b0;
            else begin
                if(addr == 1'b0)
                    data = iC0;
                else data = iC1;
            end
        end
    assign oZ = data;
endmodule

module selector2_5b(
    input [4:0] iC0,iC1,
    input addr,
    input ena,
    output [4:0] oZ
    );
    reg [31:0] data;
    always @ (*)
        begin
            if(ena == 1'b0)
                data = 32'b0;
            else begin
                if(addr == 1'b0)
                    data = iC0;
                else data = iC1;
            end
        end
    assign oZ = data;
endmodule


module decoder32(
    input [4:0] iData,
    input iEna,
    output [31:0] oData
    );
    reg [31:0] data_out;
    always @ (iEna or iData)
        begin
        if(iEna == 1)
            begin
                data_out = 32'b1<<iData[4:0];
            end
        else
            data_out = 32'b0;
        end
    assign oData = data_out;
endmodule

module mem_decoder(
    input [31:0] imem,
    input iEna,
    output [30:0] op
    );
    wire rop, iop, jop, reg_ari, reg_shift;
    assign rop = (imem[31:26] == 6'b0) & iEna;
    assign iop = (imem[31] == 1'b0 && imem[29] == 1'b1) & iEna;
    assign jop = imem[31:29] == 3'b000 & iEna;
    assign reg_ari = imem[5:3] == 3'b100 & rop;
    assign reg_shift = imem[5:3] == 3'b000 & rop ;
    assign op[0] = imem[2:0] == 3'b001 & reg_ari;
    assign op[1] = imem[2:0] == 3'b000 & reg_ari;
    assign op[2] = imem[2:0] == 3'b011 & reg_ari;
    assign op[3] = imem[2:0] == 3'b010 & reg_ari;
    assign op[4] = imem[2:0] == 3'b100 & reg_ari;
    assign op[5] = imem[2:0] == 3'b101 & reg_ari;
    assign op[6] = imem[2:0] == 3'b110 & reg_ari;
    assign op[7] = imem[2:0] == 3'b111 & reg_ari;
    assign op[8] = imem[2:0] == 3'b100 & reg_shift;
    assign op[9] = imem[2:0] == 3'b110 & reg_shift;
    assign op[10] = imem[2:0] == 3'b111 & reg_shift;
    assign op[13] = imem[2:0] == 3'b000 & reg_shift;
    assign op[14] = imem[2:0] == 3'b010 & reg_shift;
    assign op[15] = imem[2:0] == 3'b011 & reg_shift;
    assign op[11] = imem[5:0] == 6'b101010 & rop;
    assign op[12] = imem[5:0] == 6'b101011 & rop;
    assign op[30] = imem[5:0] == 6'b001000 & rop;
    assign op[16] = imem[28:26] == 3'b000 & iop;
    assign op[17] = imem[28:26] == 3'b001 & iop;
    assign op[18] = imem[28:26] == 3'b100 & iop;
    assign op[19] = imem[28:26] == 3'b101 & iop;
    assign op[20] = imem[28:26] == 3'b110 & iop;
    assign op[21] = imem[28:26] == 3'b010 & iop;
    assign op[22] = imem[28:26] == 3'b011 & iop;
    assign op[23] = imem[28:26] == 3'b111 & iop;
    assign op[24] = imem[31:26] == 6'b100011 & iEna;
    assign op[25] = imem[31:26] == 6'b101011 & iEna;
    assign op[26] = imem[28:26] == 3'b100 & jop;
    assign op[27] = imem[28:26] == 3'b101 & jop;
    assign op[28] = imem[28:26] == 3'b010 & jop;
    assign op[29] = imem[28:26] == 3'b011 & jop;
endmodule
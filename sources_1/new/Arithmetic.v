`timescale 1ns / 1ps

module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output [31:0] r,
    output zero,
    output carry,
    output negative,
    output overflow
    );
    reg signed [32:0] sa, sb;
    reg [32:0] ua, ub, re;
    reg nega = 0, over = 0, carr = 0, zer = 0;
    always @ (*)
        begin
            sa = {a[31],a[31:0]};
            sb = {b[31],b[31:0]};
            ua = {1'b0, a[31:0]};
            ub = {1'b0, b[31:0]};
            zer = 0;
            carr = 0;
            nega = 0;
            over = 0;
            case(aluc)
                4'b0000:begin
                    re = ua[32:0] + ub[32:0];
                    carr = re[32];
                        end
                4'b0010:begin
                    re = sa + sb;
                    over = (!(sa[31] ^ sb[31])) & (re[31] ^ sa[31]) & (re[31] ^ sb[31]);
                        end
                4'b0001:begin
                    re = ua - ub;
                    if(ua<ub)
                        carr = 1;
                        end
                4'b0011:begin
                    re = sa - sb;
                    over = sa[32] ^ re[32];
                        end
                4'b0100:begin
                    re = ua & ub;
                        end
                4'b0101:begin
                    re = ua | ub;
                    end
                4'b0110:begin
                    re = ua ^ ub;
                    end
                4'b0111:begin
                    re = ~(ua | ub);
                    end
                4'b1000:begin
                    re = {ub[16:0],16'b0};
                    end
                4'b1011:begin
                    re = (sa < sb) ? 1 : 0;
                    if(re)
                        re[31] = 1;
                    if(sa == sb)
                        zer = 1;
                    end
                4'b1010:begin
                    re[0] = (ua < ub) ? 1:0;
                    carr = (ua < ub) ? 1:0;
                    if(ua == ub)
                        zer = 1;
                    end
                4'b1100:begin
                    re = sb>>>(sa-1);
                    carr = re[0];
                    re = sb>>>sa;
                    end
                4'b1111:begin
                    re = ub<<ua;
                    carr = re[32];
                    end
                4'b1101:begin
                    re = ub>>(ua-1);
                    carr = re[0];
                    re = ub>>ua;
                    end
                default:;
            endcase
            nega = re[31] | nega;
            if(aluc == 4'b1011 || aluc == 4'b1010)
                re = re & 33'h000000001;
            if(re[31:0] == 0 && aluc != 4'b1011 && aluc != 4'b1010)
                zer = 1;
       end
    assign zero = zer;
    assign negative = nega;
    assign carry = carr;
    assign overflow = over;
    assign r = re[31:0];
endmodule

module FA(
    input iA,
    input iB,
    input iC,
    output oS,
    output oC
    );
    
    xor xor_1(xor1_o,iA,iB);
    xor xor_2(oS,xor1_o,iC);
    and and_1(and1_o,iA,iB);
    and and_2(and2_o,iC, xor1_o);
    or(oC, and1_o, and2_o);
endmodule

module Adder(
    input [31:0] iData_a,
    input [31:0] iData_b,
    output [31:0] oData,
    output oData_C
    );
    FA FA_0(.iA(iData_a[0]),.iB(iData_b[0]),.iC(0),.oS(oData[0]),.oC(oC1));
    FA FA_1(.iA(iData_a[1]),.iB(iData_b[1]),.iC(oC1),.oS(oData[1]),.oC(oC2));
    FA FA_2(.iA(iData_a[2]),.iB(iData_b[2]),.iC(oC2),.oS(oData[2]),.oC(oC3));
    FA FA_3(.iA(iData_a[3]),.iB(iData_b[3]),.iC(oC3),.oS(oData[3]),.oC(oC4));
    FA FA_4(.iA(iData_a[4]),.iB(iData_b[4]),.iC(oC4),.oS(oData[4]),.oC(oC5));
    FA FA_5(.iA(iData_a[5]),.iB(iData_b[5]),.iC(oC5),.oS(oData[5]),.oC(oC6));
    FA FA_6(.iA(iData_a[6]),.iB(iData_b[6]),.iC(oC6),.oS(oData[6]),.oC(oC7));
    FA FA_7(.iA(iData_a[7]),.iB(iData_b[7]),.iC(oC7),.oS(oData[7]),.oC(oC8));
    FA FA_8(.iA(iData_a[8]),.iB(iData_b[8]),.iC(oC8),.oS(oData[8]),.oC(oC9));
    FA FA_9(.iA(iData_a[9]),.iB(iData_b[9]),.iC(oC9),.oS(oData[9]),.oC(oC10));
    FA FA_10(.iA(iData_a[10]),.iB(iData_b[10]),.iC(oC10),.oS(oData[10]),.oC(oC11));
    FA FA_11(.iA(iData_a[11]),.iB(iData_b[11]),.iC(oC11),.oS(oData[11]),.oC(oC12));
    FA FA_12(.iA(iData_a[12]),.iB(iData_b[12]),.iC(oC12),.oS(oData[12]),.oC(oC13));
    FA FA_13(.iA(iData_a[13]),.iB(iData_b[13]),.iC(oC13),.oS(oData[13]),.oC(oC14));
    FA FA_14(.iA(iData_a[14]),.iB(iData_b[14]),.iC(oC14),.oS(oData[14]),.oC(oC15));
    FA FA_15(.iA(iData_a[15]),.iB(iData_b[15]),.iC(oC15),.oS(oData[15]),.oC(oC16));
    FA FA_16(.iA(iData_a[16]),.iB(iData_b[16]),.iC(oC16),.oS(oData[16]),.oC(oC17));
    FA FA_17(.iA(iData_a[17]),.iB(iData_b[17]),.iC(oC17),.oS(oData[17]),.oC(oC18));
    FA FA_18(.iA(iData_a[18]),.iB(iData_b[18]),.iC(oC18),.oS(oData[18]),.oC(oC19));
    FA FA_19(.iA(iData_a[19]),.iB(iData_b[19]),.iC(oC19),.oS(oData[19]),.oC(oC20));
    FA FA_20(.iA(iData_a[20]),.iB(iData_b[20]),.iC(oC20),.oS(oData[20]),.oC(oC21));
    FA FA_21(.iA(iData_a[21]),.iB(iData_b[21]),.iC(oC21),.oS(oData[21]),.oC(oC22));
    FA FA_22(.iA(iData_a[22]),.iB(iData_b[22]),.iC(oC22),.oS(oData[22]),.oC(oC23));
    FA FA_23(.iA(iData_a[23]),.iB(iData_b[23]),.iC(oC23),.oS(oData[23]),.oC(oC24));
    FA FA_24(.iA(iData_a[24]),.iB(iData_b[24]),.iC(oC24),.oS(oData[24]),.oC(oC25));
    FA FA_25(.iA(iData_a[25]),.iB(iData_b[25]),.iC(oC25),.oS(oData[25]),.oC(oC26));
    FA FA_26(.iA(iData_a[26]),.iB(iData_b[26]),.iC(oC26),.oS(oData[26]),.oC(oC27));
    FA FA_27(.iA(iData_a[27]),.iB(iData_b[27]),.iC(oC27),.oS(oData[27]),.oC(oC28));
    FA FA_28(.iA(iData_a[28]),.iB(iData_b[28]),.iC(oC28),.oS(oData[28]),.oC(oC29));
    FA FA_29(.iA(iData_a[29]),.iB(iData_b[29]),.iC(oC29),.oS(oData[29]),.oC(oC30));
    FA FA_30(.iA(iData_a[30]),.iB(iData_b[30]),.iC(oC30),.oS(oData[30]),.oC(oC31));
    FA FA_31(.iA(iData_a[31]),.iB(iData_b[31]),.iC(oC31),.oS(oData[31]),.oC(oData_C));
endmodule

module Ander(
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
);
    and and_0(a[0], b[0], c[0]);
    and and_1(a[1], b[1], c[1]);
    and and_2(a[2], b[2], c[2]);
    and and_3(a[3], b[3], c[3]);
    and and_4(a[4], b[4], c[4]);
    and and_5(a[5], b[5], c[5]);
    and and_6(a[6], b[6], c[6]);
    and and_7(a[7], b[7], c[7]);
    and and_8(a[8], b[8], c[8]);
    and and_9(a[9], b[9], c[9]);
    and and_10(a[10], b[10], c[10]);
    and and_11(a[11], b[11], c[11]);
    and and_12(a[12], b[12], c[12]);
    and and_13(a[13], b[13], c[13]);
    and and_14(a[14], b[14], c[14]);
    and and_15(a[15], b[15], c[15]);
    and and_16(a[16], b[16], c[16]);
    and and_17(a[17], b[17], c[17]);
    and and_18(a[18], b[18], c[18]);
    and and_19(a[19], b[19], c[19]);
    and and_20(a[20], b[20], c[20]);
    and and_21(a[21], b[21], c[21]);
    and and_22(a[22], b[22], c[22]);
    and and_23(a[23], b[23], c[23]);
    and and_24(a[24], b[24], c[24]);
    and and_25(a[25], b[25], c[25]);
    and and_26(a[26], b[26], c[26]);
    and and_27(a[27], b[27], c[27]);
    and and_28(a[28], b[28], c[28]);
    and and_29(a[29], b[29], c[29]);
    and and_30(a[30], b[30], c[30]);
    and and_31(a[31], b[31], c[31]);
endmodule

module Xorer(
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
);
    xor xor_0(a[0], b[0], c[0]);
    xor xor_1(a[1], b[1], c[1]);
    xor xor_2(a[2], b[2], c[2]);
    xor xor_3(a[3], b[3], c[3]);
    xor xor_4(a[4], b[4], c[4]);
    xor xor_5(a[5], b[5], c[5]);
    xor xor_6(a[6], b[6], c[6]);
    xor xor_7(a[7], b[7], c[7]);
    xor xor_8(a[8], b[8], c[8]);
    xor xor_9(a[9], b[9], c[9]);
    xor xor_10(a[10], b[10], c[10]);
    xor xor_11(a[11], b[11], c[11]);
    xor xor_12(a[12], b[12], c[12]);
    xor xor_13(a[13], b[13], c[13]);
    xor xor_14(a[14], b[14], c[14]);
    xor xor_15(a[15], b[15], c[15]);
    xor xor_16(a[16], b[16], c[16]);
    xor xor_17(a[17], b[17], c[17]);
    xor xor_18(a[18], b[18], c[18]);
    xor xor_19(a[19], b[19], c[19]);
    xor xor_20(a[20], b[20], c[20]);
    xor xor_21(a[21], b[21], c[21]);
    xor xor_22(a[22], b[22], c[22]);
    xor xor_23(a[23], b[23], c[23]);
    xor xor_24(a[24], b[24], c[24]);
    xor xor_25(a[25], b[25], c[25]);
    xor xor_26(a[26], b[26], c[26]);
    xor xor_27(a[27], b[27], c[27]);
    xor xor_28(a[28], b[28], c[28]);
    xor xor_29(a[29], b[29], c[29]);
    xor xor_30(a[30], b[30], c[30]);
    xor xor_31(a[31], b[31], c[31]);
endmodule

module Orer(
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
);
    or or_0(a[0], b[0], c[0]);
    or or_1(a[1], b[1], c[1]);
    or or_2(a[2], b[2], c[2]);
    or or_3(a[3], b[3], c[3]);
    or or_4(a[4], b[4], c[4]);
    or or_5(a[5], b[5], c[5]);
    or or_6(a[6], b[6], c[6]);
    or or_7(a[7], b[7], c[7]);
    or or_8(a[8], b[8], c[8]);
    or or_9(a[9], b[9], c[9]);
    or or_10(a[10], b[10], c[10]);
    or or_11(a[11], b[11], c[11]);
    or or_12(a[12], b[12], c[12]);
    or or_13(a[13], b[13], c[13]);
    or or_14(a[14], b[14], c[14]);
    or or_15(a[15], b[15], c[15]);
    or or_16(a[16], b[16], c[16]);
    or or_17(a[17], b[17], c[17]);
    or or_18(a[18], b[18], c[18]);
    or or_19(a[19], b[19], c[19]);
    or or_20(a[20], b[20], c[20]);
    or or_21(a[21], b[21], c[21]);
    or or_22(a[22], b[22], c[22]);
    or or_23(a[23], b[23], c[23]);
    or or_24(a[24], b[24], c[24]);
    or or_25(a[25], b[25], c[25]);
    or or_26(a[26], b[26], c[26]);
    or or_27(a[27], b[27], c[27]);
    or or_28(a[28], b[28], c[28]);
    or or_29(a[29], b[29], c[29]);
    or or_30(a[30], b[30], c[30]);
    or or_31(a[31], b[31], c[31]);
endmodule
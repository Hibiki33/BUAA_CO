`timescale 1ns / 1ps
// Module Name:    IDEX 
// Project Name: 

module IDEX(
    input req,
    input clk,
    input reset, 
    input clear,
    input [31:0] D_PC,
    input [31:0] D_Instruction,
    input [31:0] D_RD1,
    input [31:0] D_RD2,
    input [4:0] D_RegAddr,
    input [31:0] D_imm32,
    output reg[31:0] E_PC,
    output reg[31:0] E_Instruction,
    output reg[31:0] E_RD1,
    output reg[31:0] E_RD2,
    output reg[4:0] E_RegAddr,
    output reg[31:0] E_imm32,
    input D_BD,
    output reg E_BD,
    input [4:0] D_excCode,
    output reg[4:0] E_pre_excCode
    );

    initial begin
        E_PC = 0;
        E_Instruction = 0;
        E_RD1 = 0;
        E_RD2 = 0;
        E_RegAddr = 0;
        E_imm32 = 0;
        E_BD = 0;
        E_pre_excCode = 0;
    end

    always @(posedge clk) begin
        if (reset || clear || req) begin
            E_PC <= clear ? D_PC : (req ? 32'h0000_4180 : 0);
            E_Instruction <= 0;
            E_RD1 <= 0;
            E_RD2 <= 0;
            E_RegAddr <= 0;
            E_imm32 <= 0;
            E_BD <= clear ? D_BD : 0;
            E_pre_excCode <= clear ? D_excCode : 0;
        end
        else begin
            E_PC <= D_PC;
            E_Instruction <= D_Instruction;
            E_RD1 <= D_RD1;
            E_RD2 <= D_RD2;
            E_RegAddr <= D_RegAddr;
            E_imm32 = D_imm32;
            E_BD <= D_BD;
            E_pre_excCode <= D_excCode;
        end
    end

endmodule

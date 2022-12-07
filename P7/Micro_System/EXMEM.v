`timescale 1ns / 1ps 
// Module Name:    EXMEM 
// Project Name: 

module EXMEM(
    input req,
    input [4:0] E_excCode,
    input E_BD,
    input E_excOvDM,
    output reg [4:0] M_pre_excCode,
    output reg M_BD,
    output reg M_excOvDM,

    input clk,
    input reset,
    input [31:0] E_PC,
    input [31:0] E_Instruction,
    input [31:0] E_Result,
    input [31:0] E_WD,
    input [4:0] E_RegAddr,
    input [31:0] E_imm32,
    input [31:0] E_HILOout,
    output reg[31:0] M_PC,
    output reg[31:0] M_Instruction,
    output reg[31:0] M_Result,
    output reg[31:0] M_WD,
    output reg[4:0] M_RegAddr,
    output reg[31:0] M_imm32,
    output reg[31:0] M_HILOout
    );

    initial begin
        M_PC = 0;
        M_Instruction = 0;
        M_Result = 0;
        M_WD = 0;
        M_RegAddr = 0;
        M_imm32 = 0;
        M_HILOout = 0;
        M_pre_excCode = 0;
        M_BD = 0;
        M_excOvDM = 0;
    end

    always @(posedge clk) begin
        if (reset || req) begin
            M_PC <= req ? 32'h0000_4180 : 0;
            M_Instruction <= 0;
            M_Result <= 0;
            M_WD <= 0;
            M_RegAddr <= 0;
            M_imm32 <= 0;
            M_HILOout <= 0;
            M_pre_excCode <= 0;
            M_BD <= 0;
            M_excOvDM <= 0;
        end
        else begin
            M_PC <= E_PC;
            M_Instruction <= E_Instruction;
            M_Result <= E_Result;
            M_WD <= E_WD;
            M_RegAddr <= E_RegAddr;
            M_imm32 <= E_imm32;
            M_HILOout <= E_HILOout;
            M_pre_excCode <= E_excCode;
            M_BD <= E_BD;
            M_excOvDM <= E_excOvDM;
        end
    end

endmodule

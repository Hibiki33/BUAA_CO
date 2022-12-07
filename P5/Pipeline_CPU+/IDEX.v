`timescale 1ns / 1ps
// Module Name:    IDEX 
// Project Name: 

module IDEX(
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
    output reg[31:0] E_imm32
    );

    initial begin
        E_PC = 0;
        E_Instruction = 0;
        E_RD1 = 0;
        E_RD2 = 0;
        E_RegAddr = 0;
        E_imm32 = 0;
    end

    always @(posedge clk) begin
        if (reset || clear) begin
            E_PC <= 0;
            E_Instruction <= 0;
            E_RD1 <= 0;
            E_RD2 <= 0;
            E_RegAddr <= 0;
            E_imm32 <= 0;
        end
        else begin
            E_PC <= D_PC;
            E_Instruction <= D_Instruction;
            E_RD1 <= D_RD1;
            E_RD2 <= D_RD2;
            E_RegAddr <= D_RegAddr;
            E_imm32 = D_imm32;
        end
    end

endmodule

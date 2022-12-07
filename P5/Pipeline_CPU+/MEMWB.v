`timescale 1ns / 1ps
// Module Name:    MEMWB 
// Project Name: 

module MEMWB(
    input clk,
    input reset,
    input [31:0] M_PC,
    input [31:0] M_Instruction,
    input [31:0] M_RD,
    input [31:0] M_Result,
    input [4:0] M_RegAddr,
    input [31:0] M_imm32,
    input [31:0] M_HILOout,
    output reg[31:0] W_PC,
    output reg[31:0] W_Instruction,
    output reg[31:0] W_RD,
    output reg[31:0] W_Result,
    output reg[4:0] W_RegAddr,
    output reg[31:0] W_imm32,
    output reg[31:0] W_HILOout
    );

    initial begin
        W_PC = 0;
        W_Instruction = 0;
        W_RD = 0;
        W_Result = 0;
        W_RegAddr = 0;
        W_imm32 = 0;
        W_HILOout = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            W_PC <= 0;
            W_Instruction <= 0;
            W_RD <= 0;
            W_Result <= 0;
            W_RegAddr <= 0;
            W_imm32 <= 0;
            W_HILOout <= 0;
        end
        else begin
            W_PC <= M_PC;
            W_Instruction <= M_Instruction;
            W_RD <= M_RD;
            W_Result <= M_Result;
            W_RegAddr <= M_RegAddr;
            W_imm32 <= M_imm32;
            W_HILOout <= M_HILOout;
        end
    end

endmodule

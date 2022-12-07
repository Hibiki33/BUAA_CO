`timescale 1ns / 1ps
// Module Name:    IFID 
// Project Name:   Pipeline CPU of MIPS

module IFID(
    input req,
    input clk,
    input reset,
    input stall,
    input [31:0] F_Instruction,
    input [31:0] F_PC,
    output reg[31:0] D_Instruction,
    output reg[31:0] D_PC,
    input F_BD,
    output reg D_BD,
    input [4:0] F_excCode,
    output reg[4:0] D_pre_excCode
    );

    initial begin
        D_Instruction = 0;
        D_PC = 0;
        D_BD = 0;
        D_pre_excCode = 0;
    end

    always @(posedge clk) begin
        if (reset || req) begin
            D_Instruction <= 0;
            D_PC <= req ? 32'h0000_4180 : 0;
            D_BD <= 0;
            D_pre_excCode <= 0;
        end
        else if (!stall) begin
            D_Instruction <= F_Instruction;
            D_PC <= F_PC;
            D_BD <= F_BD;
            D_pre_excCode <= F_excCode;
        end
    end

endmodule

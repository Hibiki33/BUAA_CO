`timescale 1ns / 1ps
// Module Name:    IFID 
// Project Name:   Pipeline CPU of MIPS

module IFID(
    input clk,
    input reset,
    input stall,
    input [31:0] F_Instruction,
    input [31:0] F_PC,
    output reg[31:0] D_Instruction,
    output reg[31:0] D_PC
    );

    initial begin
        D_Instruction = 0;
        D_PC = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            D_Instruction <= 0;
            D_PC <= 0;
        end
        else if (!stall) begin
            D_Instruction <= F_Instruction;
            D_PC <= F_PC;
        end
        else begin
            D_Instruction <= D_Instruction;
            D_PC <= D_PC;
        end
    end

endmodule

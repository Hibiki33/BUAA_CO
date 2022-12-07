`timescale 1ns / 1ps
// Module Name:    E_ALU 
// Project Name: 

`include "macro.v"

module E_ALU(
    input [31:0] A,
    input [31:0] B,
    input [4:0] shamt,
    input [3:0] ALUCtrl,
    output reg[31:0] ALU_Result
    );

    always @(*) begin
        case (ALUCtrl)
            `ALU_ADD    : ALU_Result = A + B;
            `ALU_SUB    : ALU_Result = A - B;
            `ALU_AND    : ALU_Result = A & B;
            `ALU_OR     : ALU_Result = A | B;
            `ALU_XOR    : ALU_Result = A ^ B;
            `ALU_SLT    : ALU_Result = $signed(A) < $signed(B) ? 32'd1 : 32'd0;
            `ALU_SLTU   : ALU_Result = ({1'b0, A} < {1'b0, B}) ? 32'd1 : 32'd0;
            `ALU_SLL    : ALU_Result = B << (A[4:0] + shamt);
            `ALU_SRL    : ALU_Result = B >> (A[4:0] + shamt);
            `ALU_SRA    : ALU_Result = $signed($signed(B) >>> (A[4:0] + shamt));
            `ALU_NOR    : ALU_Result = ~(A | B);
            default     : ALU_Result = 0;
        endcase
    end

endmodule

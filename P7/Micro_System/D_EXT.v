`timescale 1ns / 1ps
// Module Name:    D_EXT 
// Project Name: 

`include "macro.v"

module D_EXT(
    input [15:0] imm16,
    input [1:0] EXTOp,
    output reg[31:0] imm32
    );
	
	always @(*) begin
        case (EXTOp)
            `zero_extend : imm32 = {16'b0, imm16};
            `lui_extend  : imm32 = {imm16, 16'b0};
            `sign_extend : imm32 = {{16{imm16[15]}}, imm16};
            default : imm32 = 0;
        endcase
    end

endmodule

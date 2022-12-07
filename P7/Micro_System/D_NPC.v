`timescale 1ns / 1ps
// Module Name:    D_NPC 
// Project Name: 

`include "macro.v"

module D_NPC(
	input req,
	input eret,
    input [31:0] EPC,

    input [31:0] F_PC,
	input [31:0] D_PC,
    input [25:0] Imm26,
    input [31:0] Ext32,
    input [31:0] RD1,
	input [2:0] nPC_sel,
    input CMP_Result,
    output reg[31:0] next_PC
    );
	
	always @(*) begin
		if (req) next_PC = 32'h0000_4180;
		else if (eret) next_PC = EPC + 4;
		else if (nPC_sel == `nPC_PC4) next_PC = F_PC + 4;
		else if (nPC_sel == `nPC_branch && CMP_Result) next_PC = (Ext32 << 2) + D_PC + 4;
		else if (nPC_sel == `nPC_jump) next_PC = {D_PC[31:28], Imm26, 2'b00};
		else if (nPC_sel == `nPC_jr) next_PC = RD1;
		else next_PC = F_PC + 4;
	end
	
endmodule

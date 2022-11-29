`timescale 1ns / 1ps
// Module Name:    ext 
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module ext(
    input [15:0] Imm16,
    input ExtOp,
    output [31:0] Ext32
    );

	// EXTOp == 0 : Sign_extend
	// EXTOp == 1 : Zero_extend
	assign Ext32 = ExtOp ? {{16{1'b0}}, Imm16} : {{16{Imm16[15]}}, Imm16};

endmodule

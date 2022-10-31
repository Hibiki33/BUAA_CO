`timescale 1ns / 1ps
// Module Name:    mips
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module mips(
    input clk,
    input reset
    );
	
    wire[1:0] RegDst;
    wire ALUSrc;
    wire RegWrite;
    wire MemWrite;
    wire[1:0] MemToReg;
    wire ExtOp;
    //wire Branch;
    //wire Jump;
    //wire Jr;
	 wire[1:0] nPC_sel;
    wire[2:0] ALUCtrl;
    wire[5:0] OPCode;
    wire[5:0] Funct;

    ctrl Controller(
    .OPCode(OPCode),
    .Funct(Funct),
    .RegDst(RegDst),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .ExtOp(ExtOp),
    //.Branch(Branch),
    //.Jump(Jump),
    //.Jr(Jr),
	 .nPC_sel(nPC_sel),
    .ALUCtrl(ALUCtrl)
    );

	datapath DataPath(
	.clk(clk),
	.reset(reset),
    .RegDst(RegDst),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .ExtOp(ExtOp),
    //.Branch(Branch),
    //.Jump(Jump),
    //.Jr(Jr),
	 .nPC_sel(nPC_sel),
    .ALUCtrl(ALUCtrl),
    .OPCode(OPCode),
    .Funct(Funct)
    );

endmodule

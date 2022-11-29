`timescale 1ns / 1ps 
// Module Name:    datapath 
// Project Name:   Sigle_Cycle_CPU of MIPS

module datapath(
	input clk,
	input reset,
    input [1:0] RegDst,
    input ALUSrc,
    input RegWrite,
    input MemWrite,
    input [1:0] MemToReg,
    input ExtOp,
    //input Branch,
    //input Jump,
    //input Jr,
	 input [1:0] nPC_sel,
    input [2:0] ALUCtrl,
    output [5:0] OPCode,
    output [5:0] Funct
    );

	wire[31:0] next_PC, PC, PC_plus_4;
	wire[31:0] Instruction;
	
    wire[31:0] RegRD1, RegRD2, RegWD;
    wire[31:0] MemRD;
    wire[31:0] Ext32;

    wire[31:0] Result;
    wire Zero;

    assign OPCode = Instruction[31:26];
    assign Funct = Instruction[5:0];

///////////////////////////////////////////
// IM
    im IM(
    .PC(PC),
    .Instruction(Instruction)
    );
	
///////////////////////////////////////////
// PC
    pc PC_inst(
    .next_PC(next_PC),
    .clk(clk),
    .reset(reset),
    .PC(PC)
    );

///////////////////////////////////////////
// NPC
    npc NPC(
    .PC(PC),
    .Imm26(Instruction[25:0]),
    .Ext32(Ext32),
    .RD1(RegRD1),
    //.Branch(Branch),
    //.Jump(Jump),
    //.Jr(Jr),
	 .nPC_sel(nPC_sel),
    .Zero(Zero),
    .next_PC(next_PC),
    .PC_plus_4(PC_plus_4)
    );

///////////////////////////////////////////
// GRF
    wire [4:0] RegAddr;

    mux_4_5 MUX_for_A3(
	.inA(Instruction[20:16]),
    .inB(Instruction[15:11]),
	.inC(5'b11111),
	.inD(5'b00000),
    .sel(RegDst),
    .out(RegAddr)
    );

    mux_4_32 MUX_for_RegWD(
    .inA(Result),
    .inB(MemRD),
    .inC(Ext32 << 16),
    .inD(PC_plus_4),
    .sel(MemToReg),
    .out(RegWD)
    );

	grf GRF(
	.PC(PC),
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite),
    .A1(Instruction[25:21]),
    .A2(Instruction[20:16]),
    .A3(RegAddr),
    .WD(RegWD),
    .RD1(RegRD1),
    .RD2(RegRD2)
    );
    
//////////////////////////////////////////
// EXT
    ext EXT(
    .Imm16(Instruction[15:0]),
    .ExtOp(ExtOp),
    .Ext32(Ext32)
    );

//////////////////////////////////////////
// ALU
    wire[31:0] SrcB;

    mux_2_32 MUX_for_SrcB(
	.inA(RegRD2),
    .inB(Ext32),
    .sel(ALUSrc),
    .out(SrcB)
    );

    alu ALU(
    .A(RegRD1),
    .B(SrcB),
    .ALUCtrl(ALUCtrl),
    .Result(Result),
    .Zero(Zero)
    );

//////////////////////////////////////////
// DM
    dm DM(
    .PC(PC),
	.clk(clk),
    .reset(reset),
    .MemWrite(MemWrite),
    .MemAddr(Result),
    .WD(RegRD2),
    .RD(MemRD)
    );

endmodule
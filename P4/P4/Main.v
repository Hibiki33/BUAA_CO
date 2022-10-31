`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:48 09/13/2022 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
    input Clk,
    input Reset
    );
	 
	 wire[31:0] Imm32; 
	 wire[31:0] Instr;
	 wire[31:0] Result;
	 wire[31:0] PC;
	 wire Zero;
	 wire[4:0] WA;
	 wire[31:0] WD;
	 wire[31:0] RD1, RD2;
	 wire[31:0] RD;
	 wire[31:0] B;
	 
	 wire[1:0] RegDst;
	 wire ALUSrc;
	 wire RegWrite;
	 wire MemRead;
	 wire MemWrite;
	 wire[1:0] MemToReg;
	 wire EXTOp;
	 wire Branch1, Branch2, Branch3;
	 wire[2:0] ALUCtrl;	 
	 
	 assign WA = (RegDst == 2'b00) ? Instr[20:16] : 
					 (RegDst == 2'b01) ? Instr[15:11] : 
					 (RegDst == 2'b10) ? 5'b11111 : 5'b00000;
					 
	 assign B = ALUSrc ? Imm32 : RD2;
	 
	 assign RD_or_Ret = MemToReg[1] ? RD : Result;
	 
	 assign jal_or_lui = Branch2 ? (PC + 32'h00000004) : (Imm32 << 16);
	 
	 assign WD = MemToReg[0] ? jal_or_lui : RD_or_Ret;
	 
	 controller ctrl_inst (
		 .Op(Instr[31:26]),
		 .Func(Instr[5:0]),
		 .RegDst(RegDst),
		 .ALUSrc(ALUSrc),
		 .RegWrite(RegWrite),
		 .MemRead(MemRead),
		 .MemWrite(MemWrite),
		 .MemToReg(MemToReg),
		 .ExtOp(EXTOp),
		 .Branch1(Branch1),
		 .Branch2(Branch2),
		 .Branch3(Branch3),
		 .ALUCtrl(ALUCtrl)
	 );
	 
	 alu alu_inst (
		.A(RD1),
		.B(B),
		.ALUCtrl(ALUCtrl),
		.Result(Result),
		.Zero(Zero)
	 );
	 
	 ifu ifu_inst (
		.Clk(Clk),
		.Reset(Reset),
		.Zero(Zero),
		.Branch1(Branch1),
		.Branch2(Branch2),
		.Branch3(Branch3),
		.Imm32(Imm32),
		.ALUResult(Result),
		.PC(PC),
		.Instr(Instr)
	 );
	 
	 grf grf_inst (
		 .Clk(Clk),
		 .Reset(Reset),
		 .RegWrite(RegWrite),
		 .RA1(Instr[25:21]),
		 .RA2(Instr[20:16]),
		 .WA(WA),
		 .WD(WD),
		 .PC(PC),
		 .RD1(RD1),
		 .RD2(RD2)
	 );
	 
	 ext ext_inst (
		 .in(Instr[15:0]),
		 .EXTOp(EXTOp),
		 .out(Imm32) 
	 );
	 
	 dm dm_inst (
		 .Clk(Clk),
		 .Reset(Reset),
		 .MemWrite(MemWrite),
		 .MemRead(MemRead),
		 .MemAddr(Result),
		 .WD(RD2),
		 .RD(RD),
		 .PC(PC)
	 );

endmodule

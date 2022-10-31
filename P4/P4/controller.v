`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:17 09/18/2022 
// Design Name: 
// Module Name:    controller 
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


module controller(
    input [5:0] Op,
	 input [5:0] Func,
    output [1:0] RegDst,
    output ALUSrc,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output [1:0] MemToReg,
    output ExtOp,
    output Branch1,
	 output Branch2,
	 output Branch3,
	 output [2:0] ALUCtrl
    );
	 
	 wire r, lw, sw, lui, ori, beq, jal, addu, subu, jr;
	 
	 assign r 	= (Op == 6'b000000) ? 1'b1 : 1'b0;
	 assign lw 	= (Op == 6'b100011) ? 1'b1 : 1'b0;
	 assign sw 	= (Op == 6'b101011) ? 1'b1 : 1'b0;
	 assign lui = (Op == 6'b001111) ? 1'b1 : 1'b0;
	 assign ori = (Op == 6'b001101) ? 1'b1 : 1'b0;
	 assign beq = (Op == 6'b000100) ? 1'b1 : 1'b0;
	 assign j 	= (Op == 6'b000010) ? 1'b1 : 1'b0;
	 assign jal = (Op == 6'b000011) ? 1'b1 : 1'b0;
	 
	 assign RegDst[1] = jal;
	 assign RegDst[0] = r;
	 assign ALUSrc = lw | sw | ori;
	 assign RegWrite = r | lw | lui | ori | jal;
	 assign MemRead = lw;
	 assign MemWrite = sw;
	 assign MemToReg[1] = lw | jal;
	 assign MemToReg[0] = lui | jal;
	 assign ExtOp = ori;
	 assign Branch1 = beq;
	 assign Branch2 = j | jal;
	 assign Branch3 = jr ? 1'b1 : 1'b0;
	 
	 assign addu = (r && Func == 6'b100010) ? 1'b1 : 1'b0;
	 assign subu = (r && Func == 6'b100011) ? 1'b1 : 1'b0;
	 assign jr = (r & Func == 6'b001000) ? 1'b1 : 1'b0;
	 
	 assign ALUCtrl[2] = lui | jal;
	 assign ALUCtrl[1] = r | lw | sw | lui | beq | jal;
	 assign ALUCtrl[0] = beq | lui | ori | jal | subu;
	
endmodule

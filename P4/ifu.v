`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:45 09/18/2022 
// Design Name: 
// Module Name:    ifu 
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
module ifu(
    input Clk,
    input Reset,
    input Zero,
    input Branch1,
    input Branch2,
    input Branch3,
	 input [31:0] Imm32,
	 input [31:0] ALUResult,
    output [31:0] PC,
    output [31:0] Instr
    ); 
	
	wire[31:0] adder1, adder2, mux1, mux2, mux3, PCj;
	
	assign PCj = {PC[31:28], Instr[25:0], {2{1'b0}}};
	
	assign adder1 = 32'h00000004 + PC;
	assign adder2 = Imm32 << 2 + adder1;
	assign mux1 = (Zero && Branch1) ? adder2 : adder1;
	assign mux2 = Branch2 ? PCj : mux1;
	assign mux3 = Branch3 ? ALUResult : mux2;
	
	pc pc_inst (
		 .Clk(Clk),
		 .Reset(Reset),
		 .next_PC(mux3),
		 .PC(PC)
	 );
	 
	im im_inst (
		.PC(PC),
		.Instruction(Instr)
	);
	
endmodule

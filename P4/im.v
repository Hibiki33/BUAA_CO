`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:37 09/13/2022 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] PC,
    output [31:0] Instruction
    );
	 
	 reg[31:0] im[0:1023];
	 
	 initial begin
		$readmemh("code.txt", im);
	 end

	assign Instruction = im[PC[11:2]];

endmodule

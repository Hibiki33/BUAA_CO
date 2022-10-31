`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:31 09/13/2022 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input Clk,
    input Reset,
    input [31:0] next_PC,
    output reg[31:0] PC
    );
	 
	 initial PC = 32'h00003000;
	 
	 always @(posedge Clk) begin
		if (Reset) begin
			PC <= 32'h00003000;
		end
		else begin
			PC <= next_PC;
		end
	 end

endmodule

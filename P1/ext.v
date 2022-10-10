`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:59 10/05/2022 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [15:0] imm,
    input [1:0] EOp,
    output reg[31:0] ext
    );
	 
	 always @(*) begin
		case (EOp) 
			2'b00 : begin
				ext = {{16{imm[15]}}, imm};
			end
			2'b01 : begin
				ext = {16'h0000, imm};
			end
			2'b10 : begin
				ext = {imm, 16'h0000};
			end
			2'b11 : begin
				ext = {{14{imm[15]}}, imm, 2'b00};
			end
		endcase 
	 end
	
endmodule

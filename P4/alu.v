`timescale 1ns / 1ps
// Module Name:    alu 
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUCtrl,
    output reg[31:0] Result,
    output Zero
    );
	 
	assign Zero = (A == B) ? 1'b1 : 1'b0;
	 
	always @(*) begin
		case (ALUCtrl) 
			3'b000 : begin
				Result = A & B;
			end
			3'b001 : begin
				Result = A | B;
			end
			3'b010 : begin
				Result = A + B;
			end
			3'b011 : begin
				Result = A - B;
			end
			default : begin
				Result = 32'h00000000;
			end
		endcase
	end

endmodule

`timescale 1ns / 1ps 
// Module Name:    F_PC 
// Project Name: 

module F_PC(
    input [31:0] nPC,
    input clk,
    input reset,
	input stall,
	input req,
    output reg[31:0] PC
    );
	 
	initial begin
		PC = 32'h00003000;
	end

	always @(posedge clk) begin
		if(reset) begin
			PC <= 32'h00003000;
		end
		else if (!stall | req) begin
			PC <= nPC;
		end
	end
	
endmodule

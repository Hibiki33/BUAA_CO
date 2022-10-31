`timescale 1ns / 1ps
// Module Name:    pc 
// Project Name:   Sigle_Cycle_CPU of MIPS

module pc(
    input [31:0] next_PC,
    input clk,
    input reset,
    output reg[31:0] PC
    );
	 
	 initial begin
		PC <= 32'h00003000;
	 end

	always @(posedge clk) begin
		if(reset) begin
			PC <= 32'h00003000;
		end
		else begin
			PC <= next_PC;
		end
	end
	
endmodule

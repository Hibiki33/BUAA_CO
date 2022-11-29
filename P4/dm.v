`timescale 1ns / 1ps
// Module Name:    dm 
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module dm(
    input [31:0] PC,
	 input clk,
    input reset,
    input MemWrite,
    input [31:0] MemAddr,
    input [31:0] WD,
    output [31:0] RD
    );
	 
	reg[31:0] RAM[0:3071];
	integer i;
	 
	initial begin
		for (i = 0; i < 3072; i = i + 1) begin
			RAM[i] <= 0;
		end
	end
		
	assign RD = RAM[MemAddr[13:2]];
	
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] <= 0;
			end
		end
		else begin
			if (MemWrite) begin
				RAM[MemAddr[13:2]] <= WD;
				$display("@%h: *%h <= %h", PC, MemAddr, WD);
			end
		end
	end

endmodule

`timescale 1ns / 1ps
// Module Name:    grf 
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module grf(
	 input [31:0] PC,
    input clk,
    input reset,
    input RegWrite,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    output [31:0] RD1,
    output [31:0] RD2
    );
	 
	reg[31:0] register[0:31];
	integer i;
	 
	initial begin
		for (i = 0; i < 32; i = i + 1) begin
			register[i] <= 0;
		end
	end
	
	assign RD1 = register[A1];
	assign RD2 = register[A2];

	always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 32; i = i + 1) begin
				register[i] <= 0;
			end
		end
		else begin
			if (RegWrite && A3 != 0) begin
				register[A3] <= WD;
				$display("@%h: $%d <= %h", PC, A3, WD);
			end
		end
	end

endmodule

`timescale 1ns / 1ps
// Module Name:    dm 
// Project Name:   Pipeline of MIPS

`include "macro.v"

module M_DM(
    input [31:0] PC,
	input clk,
    input reset,
    input WE,
    input [31:0] MemAddr,
    input [31:0] WD,
	input [1:0] width,
	input LoadOp,
    output reg[31:0] RD
    );
	 
	reg[31:0] RAM[0:3071];
	integer i;
	 
	initial begin
		for (i = 0; i < 3072; i = i + 1) begin
			RAM[i] <= 0;
		end
	end
		
	// assign RD = RAM[MemAddr[13:2]];

	always @(*) begin
		case (width)
			`WORD : RD = RAM[MemAddr[13:2]];
			`HALF : begin
				case (MemAddr[1])
					0 : RD[15:0] = RAM[MemAddr[13:2]][15:0];
					1 : RD[15:0] = RAM[MemAddr[13:2]][31:16];
				endcase
				case (LoadOp)
					0 : RD[31:16] = 0; 
					1 :	RD[31:16] = {16{RD[15]}};
				endcase
			end
			`BYTE : begin
				case (MemAddr[1:0])
					2'b00 : RD[7:0] = RAM[MemAddr[13:2]][7:0];
					2'b01 : RD[7:0] = RAM[MemAddr[13:2]][15:8];
					2'b10 : RD[7:0] = RAM[MemAddr[13:2]][23:16];
					2'b11 : RD[7:0] = RAM[MemAddr[13:2]][31:24];
				endcase
				case (LoadOp)
					0 : RD[31:8] = 0;
					1 : RD[31:8] = {24{RD[7]}};
				endcase
			end
		endcase
	end
	
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] = 0;
			end
		end
		else begin
			if (WE) begin
				case (width)
					`WORD : begin
						RAM[MemAddr[13:2]] = WD;
						$display("%d@%h: *%h <= %h", $time, PC, MemAddr, WD);
					end
					`HALF : begin
						case (MemAddr[1])
							0 : RAM[MemAddr[13:2]][15:0] = WD[15:0];
							1 : RAM[MemAddr[13:2]][31:16] = WD[15:0];
						endcase
						$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b0}, RAM[MemAddr[13:2]]);
					end
					`BYTE : begin
						case (MemAddr[1:0])
							2'b00 : RAM[MemAddr[13:2]][7:0] = WD[7:0];
							2'b01 : RAM[MemAddr[13:2]][15:8] = WD[7:0];
							2'b10 : RAM[MemAddr[13:2]][23:16] = WD[7:0];
							2'b11 : RAM[MemAddr[13:2]][31:24] = WD[7:0];
						endcase
						$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b0}, RAM[MemAddr[13:2]]);
					end
				endcase
			end
		end
	end

endmodule

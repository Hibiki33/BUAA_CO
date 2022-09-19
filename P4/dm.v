`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:17 09/14/2022 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input Clk,
    input Reset,
    input MemWrite,
    input MemRead,
    input [31:0] MemAddr,
    input [31:0] WD,
    output [31:0] RD,
    input [31:0] PC
    );
	 
	 reg[31:0] dm[0:1023];
	 integer i;
	 
	 initial begin
		for (i = 0; i <=31; i = i + 1) begin
			dm[i] <= 0;
		end
	end
		
	 assign RD = MemRead ? dm[MemAddr[11:2]] : 0;
	
	always @(posedge Clk) begin
		if (Reset) begin
			for (i = 0; i <=31; i = i + 1) begin
				dm[i] <= 0;
			end
		end
		else begin
			if (MemWrite) begin
				dm[MemAddr[11:2]] <= WD;
				$display("@%h: *%h <= %h", PC, MemAddr, WD);
			end
		end
	end

endmodule

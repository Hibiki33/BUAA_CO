`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:54 09/13/2022 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input Clk,
    input Reset,
    input RegWrite,
    input [4:0] RA1,
    input [4:0] RA2,
    input [4:0] WA,
    input [31:0] WD,
    input [31:0] PC,
    output [31:0] RD1,
    output [31:0] RD2
    );
	 
	 reg[31:0] register[0:31];
	 integer i;
	 
	 initial begin
		for (i = 0; i <= 31; i = i + 1) begin
			register[i] <= 32'h00000000;
		end
	 end
	 
	 always @(posedge Clk) begin
		if (Reset) begin
			for (i = 0; i <= 31; i = i + 1) begin
				register[i] <= 32'h00000000;
			end
		end
		else begin
			if (RegWrite && !WA) begin
				register[WA] <= WD;
				$display("@%h: $%d <= %h", PC, WA,WD);
			end
		end
	 end
	
	assign RD1 = register[RA1];
	assign RD2 = register[RA2];

endmodule

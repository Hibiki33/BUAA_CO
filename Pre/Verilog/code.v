`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:30 08/23/2022 
// Design Name: 
// Module Name:    code 
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
module code (
    input Clk,
    input Reset,
    input Slt,
    input En,
    output reg [63:0] Output0,
    output reg [63:0] Output1
    );
	 
	 reg [1:0] efc_clk;
	 
	 always @(posedge Clk) begin
		if (Reset == 1'b1) begin
			Output0 <= 64'h0000_0000;
			Output1 <= 64'h0000_0000;
			efc_clk <= 2'b00;
		end
		else begin
			if (En == 1'b1) begin
				case (Slt)
					1'b0 : begin
						Output0 <= Output0 + 64'h0000_0001; 
						Output1 <= Output1;
					end
					1'b1 : begin
						efc_clk = efc_clk + 2'b01; //Need blocking in this position!!!
						if (efc_clk == 2'b00) begin
							Output0 <= Output0;
							Output1 <= Output1 + 64'h0000_0001;
						end 
						else begin
							Output0 <= Output0;
							Output1 <= Output1;
						end
					end
				endcase
			end
			else begin
				Output0 <= Output0;
				Output1 <= Output1;
			end
		end
	 end
	 
endmodule



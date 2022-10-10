`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:34 10/05/2022 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output reg[2:0] Output,
    output reg Overflow
    );
	 
	reg[2:0] counter;
				 
	always @(*) begin
		case(counter) 
			3'b000 : Output <= 3'b000;
			3'b001 :	Output <= 3'b001;
			3'b010 : Output <= 3'b011;
			3'b011 :	Output <= 3'b010;
			3'b100 : Output <= 3'b110;
			3'b101 : Output <= 3'b111;
			3'b110 : Output <= 3'b101;
			3'b111 : Output <= 3'b100;
		endcase
	end
	 
	always @(posedge Clk) begin
		if (Reset) begin
			counter <= 3'b000;
			Overflow <= 1'b0;
		end
		else begin
			if (En) begin
				counter <= counter + 1;
				if (!Overflow && counter == 3'b111) begin
					Overflow <= 1'b1;
				end
			end
		end
	end
	
endmodule

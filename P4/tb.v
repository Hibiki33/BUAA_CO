`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:07:38 09/19/2022
// Design Name:   Main
// Module Name:   D:/Computer Organization/BUAA_CO/P4/tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs

	reg clk;
	reg reset;

	Main uut (
		.Clk(clk), 
		.Reset(reset)
	);
	
	initial begin
		clk = 0;
		reset = 1;
		#12 reset = 0;
	end
	
	always #10 clk = ~clk;
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:07:49 08/23/2022
// Design Name:   Adder
// Module Name:   D:/Computer Organization/Verilog/Adder/Adder_tb.v
// Project Name:  Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder_tb;

	// Inputs
	reg [4:0] inA;
	reg [4:0] inB;

	// Outputs
	wire [4:0] ans;

	// Instantiate the Unit Under Test (UUT)
	Adder uut (
		.inA(inA), 
		.inB(inB), 
		.ans(ans)
	);

	initial begin
		// Initialize Inputs
		inA = 0;
		inB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		inA = 1;
		inB = 2;
		#10
		inA = 3;
		inB = 2;
	end
   
endmodule


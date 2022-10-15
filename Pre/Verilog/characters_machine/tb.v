`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:55 08/23/2022
// Design Name:   id_fsm
// Module Name:   D:/Computer Organization/Verilog/characters_machine/tb.v
// Project Name:  characters_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: id_fsm
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
	reg [7:0] char;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	id_fsm uut (
		.char(char), 
		.clk(clk), 
		.out(out)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		char = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		char = "a";
		#10;
		char = "b";
		#10;
		char = "c";
		#10;
		char = "d";
		#10;
		char = "1";
		#10;
		char = "2";
		#10;
		char = "3";
		#10;
		char = "4";
		#10;
		char = "1";
		#10;
		char = "/";
	end
      
endmodule


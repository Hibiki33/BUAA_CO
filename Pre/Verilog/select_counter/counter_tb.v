`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:46 08/23/2022
// Design Name:   code
// Module Name:   D:/Computer Organization/Verilog/select_counter/counter_tb.v
// Project Name:  select_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;
	reg reset;
	reg slt;
	reg en;

	// Outputs
	wire [63:0] output0;
	wire [63:0] output1;

	// Instantiate the Unit Under Test (UUT)
	code uut (
		.clk(clk), 
		.reset(reset), 
		.slt(slt), 
		.en(en), 
		.output0(output0), 
		.output1(output1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		slt = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		reset = 0;
		en = 1;
		slt = 0;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 0;
		#10;
		en = 1;
		slt = 1;
		#10;
		en = 1;
		slt = 0;

	end
	
	always #5 clk = ~clk;
      
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:14 09/19/2022 
// Design Name: 
// Module Name:    Test_tb 
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
module test;

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

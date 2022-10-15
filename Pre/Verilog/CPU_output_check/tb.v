`timescale 1ns / 1ps

module tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] char;
	reg [15:0] freq;
	reg finish;

	// Outputs
	wire [1:0] format_type;
	wire [3:0] error_code;

   always @(posedge clk) begin
      if (!reset && !finish) begin
         $display("%d", format_type);
      end
   end

	// Instantiate the Unit Under Test (UUT)
	cpu_checker uut (
		.clk(clk),
		.reset(reset),
		.char(char),
		.format_type(format_type)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		char = 0;
		freq = 2;
		finish = 0;

		#10 reset = 0;//^ 1 0 2 4 @ 0 0 0 0 3 0 f c : $ 2 < = 8 9 a b c d e f # ^ 6 4
#2 char = "^";
#2 char = "1";
#2 char = "0";
#2 char = "2";
#2 char = "4";
#2 char = "@";
#2 char = "0";
#2 char = "0";
#2 char = "0";
#2 char = "0";
#2 char = "3";
#2 char = "0";
#2 char = "f";
#2 char = "c";
#2 char = ":";
#2 char = " ";
#2 char = " ";
#2 char = " ";
#2 char = " ";
#2 char = "$";
#2 char = "2";
#2 char = " ";
#2 char = " ";
#2 char = " ";
#2 char = "<";
#2 char = "=";
#2 char = " ";
#2 char = " ";
#2 char = " ";
#2 char = " ";
#2 char = "8";
#2 char = "9";
#2 char = "a";
#2 char = "b";
#2 char = "c";
#2 char = "d";
#2 char = "e";
#2 char = "f";
#2 char = "#";
#2 char = "6";
#2 char = "4";
#2 char = "#";
#2 char = "^";

		#20
		finish = 1;
	end

    always #1 clk = ~clk;

endmodule


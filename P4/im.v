`timescale 1ns / 1ps
// Module Name:    im
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module im(
    input [31:0] PC,
    output [31:0] Instruction
    );

    reg[31:0] ROM[3072:7167]; 

    initial begin
        $readmemh("code.txt", ROM);
    end
	 
	assign Instruction = ROM[PC[13:2]];

endmodule

`timescale 1ns / 1ps
// Module Name:    F_IM 
// Project Name: 

module F_IM(
    input [31:0] PC,
    output [31:0] Instruction
    );

    reg[31:0] ROM[3072:7167]; 

    initial begin
        $readmemh("code.txt", ROM);
    end
	 
    assign Instruction = ROM[PC[15:2]];

endmodule

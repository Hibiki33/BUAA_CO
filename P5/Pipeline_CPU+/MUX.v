`timescale 1ns / 1ps
// Module Name:    mux 
// Project Name:   Pipeline_CPU of MIPS

module mux_2_32(
    input [31:0] inA,
    input [31:0] inB,
    input sel,
    output [31:0] out
    );

    assign out = sel ? inB : inA;

endmodule

module mux_4_5(
    input [4:0] inA,
    input [4:0] inB,
    input [4:0] inC,
    input [4:0] inD,
    input [1:0] sel,
    output [4:0] out
    );

    assign out = (sel == 2'b00) ? inA :
				 (sel == 2'b01) ? inB :
				 (sel == 2'b10) ? inC :
				 (sel == 2'b11) ? inD : 0;

endmodule

module mux_4_32(
    input [31:0] inA,
    input [31:0] inB,
    input [31:0] inC,
    input [31:0] inD,
    input [1:0] sel,
    output [31:0] out
    );

    assign out = (sel == 2'b00) ? inA :
				 (sel == 2'b01) ? inB :
				 (sel == 2'b10) ? inC :
				 (sel == 2'b11) ? inD : 0;

endmodule

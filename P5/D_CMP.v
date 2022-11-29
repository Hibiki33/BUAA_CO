`timescale 1ns / 1ps
// Module Name:    D_Compare 
// Project Name:   Pipeline_CPU of MIPS

`include "macro.v"

module D_CMP(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [3:0] BType,
    output reg CMP_Result
    );                    
	
    always @(*) begin
        case (BType)
            `Tbeq : begin
                if (SrcA == SrcB) begin
                    CMP_Result = 1;
                end
                else begin         
                    CMP_Result = 0;
                end
            end
            `Tbne : begin
                if (SrcA != SrcB) begin
                    CMP_Result = 1;
                end
                else begin
                    CMP_Result = 0;
                end 
            end
            default : CMP_Result = 0;
        endcase
    end

endmodule

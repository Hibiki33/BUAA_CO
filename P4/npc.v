`timescale 1ns / 1ps
// Module Name:    alu 
// Project Name: 	 Sigle_Cycle_CPU of MIPS

module npc(
    input [31:0] PC,
    input [25:0] Imm26,
    input [31:0] Ext32,
    input [31:0] RD1,
    //input Branch,
    //input Jump,
    //input Jr,
	 input [1:0] nPC_sel,
    input Zero,
    output reg[31:0] next_PC,
    output [31:0] PC_plus_4
    );

    //reg[3:0] PCSrc;

	assign PC_plus_4 = PC + 4;
	/*
    always @(*) begin
        PCSrc[0] = 1'b1;
        if (Branch && Zero) begin
            PCSrc[1] = 1'b1;
        end
        if (Jump) begin
            PCSrc[2] = 1'b1;
        end
        if (Jr) begin
            PCSrc[3] = 1'b1;
        end
    end
	
    always @(*) begin
        casex (PCSrc)
            4'b0001 : next_PC = PC + 4;							// none
            4'b001x : next_PC = (Ext32 << 2) + PC + 4;		// branch
            4'b01xx : next_PC = {PC[31:28], Imm26, 2'b00};	// j / jal
            4'b1xxx : next_PC = RD1;								// jr
        endcase
    end
	*/
	
	always @(*) begin
		if (nPC_sel == 2'b00) next_PC = PC + 4;
		else if (nPC_sel == 2'b01 && Zero) next_PC = (Ext32 << 2) + PC + 4;
		else if (nPC_sel == 2'b10) next_PC = {PC[31:28], Imm26, 2'b00};
		else if (nPC_sel == 2'b11) next_PC = RD1;
		else next_PC = PC + 4;
	end
	
endmodule


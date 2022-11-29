`timescale 1ns / 1ps
// Module Name:    ctrl 
// Project Name:   Sigle_Cycle_CPU of MIPS

module ctrl(
    input [5:0] OPCode,
    input [5:0] Funct,
    output reg[1:0] RegDst,
    output ALUSrc,
    output RegWrite,
    output MemWrite,
    output reg[1:0] MemToReg,
    output ExtOp,
    //output Branch,
    //output Jump,
    //output Jr,
	output reg[1:0] nPC_sel,
    output reg[2:0] ALUCtrl
    );
    
    wire R, ori, lw, sw, beq, lui, jal;
    wire add, sub, jr;

    assign R   = (OPCode == 6'b000000) ? 1 : 0;
    assign ori = (OPCode == 6'b001101) ? 1 : 0;
    assign lw  = (OPCode == 6'b100011) ? 1 : 0;
    assign sw  = (OPCode == 6'b101011) ? 1 : 0;
    assign beq = (OPCode == 6'b000100) ? 1 : 0;
    assign lui = (OPCode == 6'b001111) ? 1 : 0;
    assign jal = (OPCode == 6'b000011) ? 1 : 0;

    assign add = (R && Funct == 6'b100000) ? 1 : 0;
    assign sub = (R && Funct == 6'b100010) ? 1 : 0;
    assign jr  = (R && Funct == 6'b001000) ? 1 : 0;

    always @(*) begin
        if (add || sub) begin
            RegDst = 2'b01;
        end
        else if (jal) begin
            RegDst = 2'b10;
        end
        else begin
            RegDst = 2'b00;
        end
    end

    assign ALUSrc = (ori || lw || sw) ? 1 : 0;

    assign RegWrite = (add || sub || ori || lw || lui || jal) ? 1 : 0;

    assign MemWrite = sw ? 1 : 0;
    
    always @(*) begin
        if (lw) begin
            MemToReg = 2'b01;
        end
        else if (lui) begin
            MemToReg = 2'b10;
        end
        else if (jal) begin
            MemToReg = 2'b11;
        end
        else begin
            MemToReg = 2'b00;
        end
    end

    assign ExtOp = ori ? 1 : 0;
	 
	 always @(*) begin
		if (beq) begin
			nPC_sel = 2'b01;
		end
		else if (jal) begin
			nPC_sel = 2'b10;
		end
		else if (jr) begin
			nPC_sel = 2'b11;
		end
		else begin
			nPC_sel = 2'b00;
		end
	 end

    always @(*) begin
        if (ori) begin
            ALUCtrl = 3'b001;
        end
        else if (add || lw || sw || jr) begin
            ALUCtrl = 3'b010;
        end
        else if (sub || beq) begin
            ALUCtrl = 3'b011;
        end
        else begin
            ALUCtrl = 3'b111;
        end
    end

endmodule

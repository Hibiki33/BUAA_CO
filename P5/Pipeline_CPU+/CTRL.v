`timescale 1ns / 1ps
// Module Name:    CTRL 
// Project Name: 

`include "macro.v"

module CTRL(
    input [31:0] Instruction,
    // stage_F
    // stage_D
    output reg[2:0] RegDst,
    output [1:0] EXTOp,
    output reg[2:0] nPC_sel,
    output reg[3:0] BType,
    // stage_E
    output ALUSrc,
    output reg[2:0] ALUCtrl,
    output reg[3:0] HILOType,
    // stage_M
    output reg[2:0] MWOP,
    output reg[1:0] width,
    output MemWrite,
    output LoadOp,
    // stage_W  
    output RegWrite,
    output reg[2:0] MemToReg,
    // forward_src
    output [2:0] Forward_sel,
    // sctrl
    output calc_r,
    output calc_i,
    output load,
    output store,
    output branch,
    output j_r,
    output j_l,
    output md,
    output mf, 
    output mt
    );

/***************************instructions****************************/

    wire R;
    wire add, sub, And, Or, slt, sltu;
    wire addi, andi, ori;
    wire lw, lh, lb, lhu, lbu;
    wire sw, sh, sb;
    wire beq, bne;
    wire lui;
    wire jal, jr, jalr;
    wire mult, multu, div, divu;
    wire mfhi, mflo;
    wire mthi, mtlo;

    assign R    = (`OPCode == 6'b000000);

    // calc_r 
    assign add  = (R & `Funct == 6'b100000);
    assign sub  = (R & `Funct == 6'b100010);
    assign And  = (R & `Funct == 6'b100100);        // 'A'nd to void conflict
    assign Or   = (R & `Funct == 6'b100101);        // 'O'r as well
    assign slt  = (R & `Funct == 6'b101010);
    assign sltu = (R & `Funct == 6'b101011);
    
    assign calc_r = (add | sub | And | Or | slt | sltu);

    // calc_i
    assign addi = (`OPCode == 6'b001000);
    assign andi = (`OPCode == 6'b001100);
    assign ori  = (`OPCode == 6'b001101);

    assign calc_i = (addi | andi | ori);

    // load
    assign lw   = (`OPCode == 6'b100011);
    assign lh   = (`OPCode == 6'b100001);
    assign lhu  = (`OPCode == 6'b100101);
    assign lb   = (`OPCode == 6'b100000);
    assign lbu  = (`OPCode == 6'b100100);

    assign load = (lw | lh | lb | lhu | lbu);

    // store 
    assign sw   = (`OPCode == 6'b101011);
    assign sh   = (`OPCode == 6'b101001);
    assign sb   = (`OPCode == 6'b101000);

    assign store = (sw | sh | sb);

    // branch 
    assign beq  = (`OPCode == 6'b000100);
    assign bne  = (`OPCode == 6'b000101);

    assign branch = (beq | bne);

    // lui
    assign lui  = (`OPCode == 6'b001111);

    // j 
    assign jal  = (`OPCode == 6'b000011);
    assign jr   = (R & `Funct == 6'b001000);
    assign jalr = (R & `Funct == 6'b001001);

    assign j_r = (jr | jalr);
    assign j_l = (jal);

    // md
    assign mult = (R & `Funct == 6'b011000);
    assign multu= (R & `Funct == 6'b011001);
    assign div  = (R & `Funct == 6'b011010);
    assign divu = (R & `Funct == 6'b011011);

    assign md = (mult | multu | div | divu);

    // mf
    assign mfhi = (R & `Funct == 6'b010000);
    assign mflo = (R & `Funct == 6'b010010);

    assign mf = (mfhi | mflo);

    // mt
    assign mthi = (R & `Funct == 6'b010001);
    assign mtlo = (R & `Funct == 6'b010011); 

    assign mt = (mthi | mtlo);

/***************************signals****************************/

    // D
    always @(*) begin
        if (calc_r | jalr | mf) begin
            RegDst = `RegDst_rd;
        end
        else if (jal) begin
            RegDst = `RegDst_ra;            // 5'b11111
        end
        else if(calc_i | lui | load) begin
            RegDst = `RegDst_rt;
        end
        else begin
            RegDst = 3'b111;
        end
    end

    assign EXTOp =  (ori | andi) ? `zero_extend : 
                    (lui) ? `lui_extend :
                    `sign_extend;

    always @(*) begin
		if (beq | bne) begin
			nPC_sel = `nPC_branch;
		end
		else if (jal) begin
			nPC_sel = `nPC_jump;
		end
		else if (jr | jalr) begin
			nPC_sel = `nPC_jr;
		end
		else begin
			nPC_sel = `nPC_PC4;
		end
	end

    always @(*) begin
        if (beq)        BType = `Tbeq;
        else if (bne)   BType = `Tbne;
        else            BType = 4'b1111;
    end

    // E
    assign ALUSrc = (calc_i | load | store);

    always @(*) begin
        if (And | andi) begin
            ALUCtrl = `ALU_AND;
        end
        else if (Or | ori) begin
            ALUCtrl = `ALU_OR;
        end
        else if (add | load | store | addi) begin
            ALUCtrl = `ALU_ADD;
        end
        else if (sub) begin
            ALUCtrl = `ALU_SUB;
        end
        else if (slt) begin
            ALUCtrl = `ALU_SLT;
        end
        else if (sltu) begin
            ALUCtrl = `ALU_SLTU;
        end
        else begin
            ALUCtrl = 3'b111;
        end
    end

    always @(*) begin
        if (mult)       HILOType = `HILO_mult;
        else if (multu) HILOType = `HILO_multu;
        else if (div)   HILOType = `HILO_div;
        else if (divu)  HILOType = `HILO_divu;
        else if (mfhi)  HILOType = `HILO_mfhi;
        else if (mflo)  HILOType = `HILO_mflo;
        else if (mthi)  HILOType = `HILO_mthi;
        else if (mtlo)  HILOType = `HILO_mtlo;
        else HILOType = 4'b1111;
    end

    // M
    assign MemWrite = (sw | sh | sb);

    always @(*) begin
        if (sw | lw) begin
            width = `WORD;
        end
        else if (sh | lh | lhu) begin
            width = `HALF;
        end
        else if (sb | lb | lbu) begin
            width = `BYTE;
        end
        else begin
            width = 2'b11;
        end
    end

    assign LoadOp = (lb | lh);

    always @(*) begin
        if (lw) MWOP = `Mem_N;
        else if (lh) MWOP = `Mem_H_S;
        else if (lb) MWOP = `Mem_B_S;
        else MWOP = 0;
    end

    // W
    assign RegWrite = (calc_r | calc_i | jal | load | jal | jalr | lui | mf);

    always @(*) begin
        if (load) begin
            MemToReg = `RMToReg;
        end
        else if (jal | jalr) begin
            MemToReg = `LinkToReg;
        end
        else if (lui) begin
            MemToReg = `LuiToReg;
        end
        else if (mf) begin
            MemToReg = `HILOToReg;
        end
        else begin
            MemToReg = `ResultToReg;
        end
    end

    assign Forward_sel =    (load) ? `FW_RM :
                            (jal | jalr) ? `FW_Link :
                            (lui) ? `FW_Lui :
                            (mf) ? `FW_MF : 
                            `FW_Result;

endmodule


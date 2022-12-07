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
    output reg[3:0] ALUCtrl,
    output reg[3:0] HILOType,
    // stage_M
    output reg[2:0] MWOP,
    output reg[1:0] width,
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
    wire add, sub, And, Or, slt, sltu, addu, subu, Xor, Nor;
    wire sll, sllv, srl, srlv, sra, srav;
    wire addi, andi, ori, addiu, xori, slti, sltiu;
    wire lw, lh, lb, lhu, lbu;
    wire sw, sh, sb;
    wire beq, bne, bgtz, blez, bgez, bltz;
    wire lui;
    wire jal, jr, jalr;
    wire mult, multu, div, divu;
    wire mfhi, mflo;
    wire mthi, mtlo;

    assign R    = (`OPCode == 6'b000000);

    // calc_r 
    assign add  = (R & `Funct == 6'b100000);
    assign addu = (R & `Funct == 6'b100001);
    assign sub  = (R & `Funct == 6'b100010);
    assign subu = (R & `Funct == 6'b100011);
    assign And  = (R & `Funct == 6'b100100);        // 'A'nd to void conflict
    assign Or   = (R & `Funct == 6'b100101);        // 'O'r as well
    assign slt  = (R & `Funct == 6'b101010);
    assign sltu = (R & `Funct == 6'b101011);
    assign Xor  = (R & `Funct == 6'b100110);
    assign Nor  = (R & `Funct == 6'b100111);

    assign sll  = (R & `Funct == 6'b000000);
    assign sllv = (R & `Funct == 6'b000100);
    assign srl  = (R & `Funct == 6'b000010);
    assign srlv = (R & `Funct == 6'b000110);
    assign sra  = (R & `Funct == 6'b000011);
    assign srav = (R & `Funct == 6'b000111);
    
    assign calc_r = (add | addu | sub | subu | And | Or | slt | sltu | Xor | Nor | 
                    sll | sllv | srl | srlv | sra | srav);

    // calc_i
    assign addi = (`OPCode == 6'b001000);
    assign addiu= (`OPCode == 6'b001001);
    assign andi = (`OPCode == 6'b001100);
    assign ori  = (`OPCode == 6'b001101);
    assign xori = (`OPCode == 6'b001110);
    assign slti = (`OPCode == 6'b001010);
    assign sltiu= (`OPCode == 6'b001011);

    assign calc_i = (addi | andi | ori | addiu | xori | slti | sltiu);

    // load
    assign lw   = (`OPCode == 6'b100011);
    assign lh   = (`OPCode == 6'b100001);
    assign lb   = (`OPCode == 6'b100000);
    assign lhu  = (`OPCode == 6'b100101);
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
    assign bgtz = (`OPCode == 6'b000111 & Instruction[20:16] == 5'b00000);
    assign blez = (`OPCode == 6'b000110 & Instruction[20:16] == 5'b00000);
    assign bgez = (`OPCode == 6'b000001 & Instruction[20:16] == 5'b00001);
    assign bltz = (`OPCode == 6'b000001 & Instruction[20:16] == 5'b00000);

    assign branch = (beq | bne | bgtz | blez | bgez | bltz);

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

    assign EXTOp =  (ori | andi | xori) ? `zero_extend : 
                    (lui) ? `lui_extend :
                    `sign_extend;

    always @(*) begin
		if (branch) begin
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
        else if (bgtz)  BType = `Tbgtz;
        else if (blez)  BType = `Tblez;
        else if (bgez)  BType = `Tbgez;
        else if (bltz)  BType = `Tbltz;
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
        else if (add | addu | load | store | addi | addiu) begin
            ALUCtrl = `ALU_ADD;
        end
        else if (sub | subu) begin
            ALUCtrl = `ALU_SUB;
        end
        else if (slt | slti) begin
            ALUCtrl = `ALU_SLT;
        end
        else if (sltu | sltiu) begin
            ALUCtrl = `ALU_SLTU;
        end
        else if (Xor | xori) begin
            ALUCtrl = `ALU_XOR;
        end
        else if (sll | sllv) begin
            ALUCtrl = `ALU_SLL;
        end
        else if (srl | srlv) begin
            ALUCtrl = `ALU_SRL;
        end
        else if (sra | srav) begin
            ALUCtrl = `ALU_SRA;
        end
        else if (Nor) begin
            ALUCtrl = `ALU_NOR;
        end
        else begin
            ALUCtrl = 4'b1111;
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
    always @(*) begin
        if (sw) begin
            width = `WORD;
        end
        else if (sh) begin
            width = `HALF;
        end
        else if (sb) begin
            width = `BYTE;
        end
        else begin
            width = 2'b11;
        end
    end

    always @(*) begin
        if (lw) MWOP = `Mem_N;
        else if (lh) MWOP = `Mem_H_S;
        else if (lhu) MWOP = `Mem_H_Z;
        else if (lb) MWOP = `Mem_B_S;
        else if (lbu) MWOP = `Mem_B_Z;
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


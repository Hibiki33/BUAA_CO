`timescale 1ns / 1ps
// Module Name:    CPU 
// Project Name: 

`include "macro.v"
`define EXC_INT     5'd0
`define EXC_AdEL    5'd4
`define EXC_AdES    5'd5
`define EXC_Syscall 5'd8
`define EXC_RI      5'd10
`define EXC_Ov      5'd12

module CPU(
    input clk,                 
    input reset,      
    input [5:0] HWInt,         
               
    output [31:0] macroscopic_pc,

    output [31:0] i_inst_addr,  
    input  [31:0] i_inst_rdata,

    output [31:0] m_data_addr,  
    input  [31:0] m_data_rdata,   
    output [31:0] m_data_wdata,   
    output [3 :0] m_data_byteen, 

    output [31:0] m_inst_addr,   

    output w_grf_we,              
    output [4 :0] w_grf_addr,   
    output [31:0] w_grf_wdata,   

    output [31:0] w_inst_addr      
    );

/******************** Declaration ********************/
    // CTRL
    wire[2:0] D_RegDst;
    wire[1:0] D_EXTOp;
    wire[2:0] D_nPC_sel;
    wire[3:0] D_BType;
    wire[3:0] E_ALUCtrl;
    wire E_ALUSrc;
    wire[3:0] E_HILOType;
    wire M_MemWrite;
    //wire M_LoadOp;
    wire [1:0] M_width;
    wire[2:0] M_MWOP;
    wire W_RegWrite;
    wire[2:0] W_MemToReg;

    // Forward_Unit
    wire D_Forward_sel1;
    wire D_Forward_sel2;
    wire[31:0] E_Forward_Src, M_Forward_Src, W_Forward_Src;
    wire[2:0] E_Forward_sel, M_Forward_sel, W_Forward_sel;

    // Stall_Unit
    wire stall;
    
    // F
    wire[31:0] F_PC;
    wire[31:0] F_PC_final;
    wire[31:0] F_Instruction;
    wire[31:0] F_Instruction_final;

    // D
    wire[31:0] D_Instruction;
    wire[31:0] D_PC;
    wire[31:0] D_PCPlus4;
    wire[31:0] D_imm32;
    wire[31:0] D_RD1;
    wire[31:0] D_RD2;
    wire[31:0] D_Forward_RD1;
    wire[31:0] D_Forward_RD2;
    wire D_CMP_Result;
    wire[31:0] D_next_PC;
    wire[4:0] D_RegAddr;

    // E
    wire[31:0] E_Instruction;
    wire[31:0] E_PC;
    wire[31:0] E_RD1;
    wire[31:0] E_RD2;
    wire[4:0] E_RegAddr;
    wire[31:0] E_imm32;
    wire[4:0] E_rs;
    wire[4:0] E_rt;
    wire[4:0] E_rd;
    wire[31:0] E_SrcA;
    wire[31:0] E_SrcB;
    wire[31:0] E_Result;
    wire[31:0] E_Forward_RD1;
    wire[31:0] E_Forward_RD2;
    wire[31:0] E_HILOout;
    wire E_HILObusy;
    wire E_ALUAriOverflow;
    wire E_ALUDMOverflow;

    // M
    wire[31:0] M_PC;
    wire[31:0] M_Instruction;
    wire[31:0] M_Result;
    wire[31:0] M_WD;
    wire[4:0] M_RegAddr;
    wire[31:0] M_RD;
    wire[31:0] M_imm32;
    wire[31:0] M_Forward_WD;
    wire[31:0] M_HILOout;
    wire[31:0] M_WDout;

    // W
    wire[31:0] W_PC;
    wire[31:0] W_Instruction;
    wire[31:0] W_ReadData;
    wire[31:0] W_RegData;
    wire[31:0] W_Result;
    wire[4:0] W_RegAddr;
    wire[31:0] W_imm32;
    wire[31:0] W_HILOout;

    // Exception
    wire[4:0] F_excCode, D_excCode, E_excCode, M_excCode;
    wire[4:0] D_pre_excCode, E_pre_excCode, M_pre_excCode;
    wire D_Syscall;
    wire F_excAdEL, D_excRI, E_excOvAri, E_excOvDM, M_excOvDM, M_excOv, M_excAdEL, M_excAdES;
    wire F_BD, D_BD, E_BD, M_BD;
    wire D_eret, E_eret, M_eret;
    wire[31:0] EPC, M_CP0out, W_CP0out;
    wire req;

    assign F_excCode =  F_excAdEL ? `EXC_AdEL : 
                        0;

    assign D_excCode =  D_pre_excCode ? D_pre_excCode :
                        D_Syscall ? `EXC_Syscall : 
                        D_excRI ? `EXC_RI :
                        0;

    assign E_excCode =  E_pre_excCode ? E_pre_excCode :
                        E_excOvAri ? `EXC_Ov :
                        0;

    assign M_excCode =  M_pre_excCode ? M_pre_excCode :
                        M_excAdEL ? `EXC_AdEL :
                        M_excAdES ? `EXC_AdES :
                        0;

    assign F_BD = (D_nPC_sel != `nPC_PC4);

    /////////////////////////Forward//////////////////////// 
    assign E_Forward_Src =  (E_Forward_sel == `FW_Lui) ? E_imm32 :
                            (E_Forward_sel == `FW_Link) ? E_PC + 8 :
                            0; 

    assign M_Forward_Src =  (M_Forward_sel == `FW_Result) ? M_Result :
                            (M_Forward_sel == `FW_MF) ? M_HILOout :
                            (M_Forward_sel == `FW_Lui) ? M_imm32 :
                            (M_Forward_sel == `FW_Link) ? M_PC + 8 :
                            0; 

    assign W_Forward_Src =  (W_Forward_sel == `FW_Result) ? W_Result :
                            (W_Forward_sel == `FW_MF) ? W_HILOout :
                            (W_Forward_sel == `FW_Lui) ? W_imm32 :
                            (W_Forward_sel == `FW_Link) ? W_PC + 8 :
                            (W_Forward_sel == `FW_RM) ? W_ReadData :
                            (W_Forward_sel == `FW_MFC0) ? W_CP0out : 
                            0; 
    ///////////////////////////////////////////////////////

    SU su(
        .D_Instruction(D_Instruction),
        .E_Instruction(E_Instruction),
        .M_Instruction(M_Instruction),
        .E_HILObusy(E_HILObusy),
        .E_RegAddr(E_RegAddr),
        .M_RegAddr(M_RegAddr),
        .stall(stall)
    );

/******************** stage_F ********************/
// F_PC
    F_PC f_pc(
        .nPC(D_next_PC),
        .clk(clk),
        .reset(reset),
        .stall(stall),      
        .req(req),
        .PC(F_PC)
    );

// F_IM
    // F_IM f_im(
    //     .PC(F_PC),
    //     .Instruction(F_Instruction)
    // );

    assign i_inst_addr = F_PC_final;
    assign F_Instruction = i_inst_rdata;

    assign F_excAdEL = ((|F_PC_final[1:0]) | (F_PC_final < 32'h00003000) | (F_PC_final > 32'h00006ffc)) && !D_eret;
    assign F_PC_final = D_eret ? EPC : F_PC;
    assign F_Instruction_final = F_excAdEL ? 0 : F_Instruction;

/******************** stage_D ********************/
// IFID
    IFID if_id(
        .clk(clk),
        .req(req),
        .reset(reset),
        .stall(stall),    
        .F_Instruction(F_Instruction_final),
        .F_PC(F_PC_final),
        .F_BD(F_BD),
        .F_excCode(F_excCode),
        .D_Instruction(D_Instruction),
        .D_PC(D_PC),
        .D_BD(D_BD),
        .D_pre_excCode(D_pre_excCode)
    );

// D_CTRL
    CTRL d_ctrl(
        .Instruction(D_Instruction),
        .RegDst(D_RegDst),
        .EXTOp(D_EXTOp),
        .nPC_sel(D_nPC_sel),
        .BType(D_BType),
        .eret(D_eret),
        .excRI(D_excRI),
        .Syscall(D_Syscall)
    );

// D_GRF
    D_GRF d_grf(
        .PC(W_PC),                      // PC should be stage W
        .clk(clk),
        .reset(reset),
        .RegWrite(W_RegWrite),
        .A1(D_Instruction[25:21]),
        .A2(D_Instruction[20:16]),
        .A3(W_RegAddr),
        .WD(W_RegData),
        .RD1(D_RD1),
        .RD2(D_RD2)
    );

    assign D_Forward_RD1 =  (D_Instruction[25:21] == 0) ? 0 :
                            (D_Instruction[25:21] == E_RegAddr) ? E_Forward_Src :
                            (D_Instruction[25:21] == M_RegAddr) ? M_Forward_Src :
                            D_RD1;

    assign D_Forward_RD2 =  (D_Instruction[20:16] == 0) ? 0 :
                            (D_Instruction[20:16] == E_RegAddr) ? E_Forward_Src :
                            (D_Instruction[20:16] == M_RegAddr) ? M_Forward_Src :
                            D_RD2;

// D_EXT
    D_EXT d_ext(
        .imm16(D_Instruction[15:0]),
        .EXTOp(D_EXTOp),
        .imm32(D_imm32)
    );

// D_CMP
    D_CMP d_cmp(
        .SrcA(D_Forward_RD1),
        .SrcB(D_Forward_RD2),
        .BType(D_BType),
        .CMP_Result(D_CMP_Result)
    );

// NPC
    D_NPC d_npc(
        .req(req),
        .eret(D_eret),
        .EPC(EPC),

        .F_PC(F_PC_final),
        .D_PC(D_PC),
        .Imm26(D_Instruction[25:0]),
        .Ext32(D_imm32),
        .RD1(D_Forward_RD1),
        .nPC_sel(D_nPC_sel),
        .CMP_Result(D_CMP_Result),
        .next_PC(D_next_PC)
    );

// RegAddr
    // mux_4_5 d_regaddr(
    //     .inA(D_Instruction[20:16]),
    //     .inB(D_Instruction[15:11]),
    //     .inC(5'b11111),
    //     .inD(5'b00000),
    //     .sel(D_RegDst),
    //     .out(D_RegAddr)
    // );

    assign D_RegAddr =  (D_RegDst == `RegDst_rt) ? D_Instruction[20:16] :
                        (D_RegDst == `RegDst_rd) ? D_Instruction[15:11] :
                        (D_RegDst == `RegDst_ra) ? 5'b11111 :
                        5'b00000;


/******************** stage_E ********************/
// IDEX
    IDEX id_ex(
        .req(req),
        .clk(clk),
        .reset(reset), 
        .clear(stall),

        .D_PC(D_PC),
        .D_Instruction(D_excRI ? 32'b0 : D_Instruction),
        .D_RD1(D_Forward_RD1),
        .D_RD2(D_Forward_RD2),
        .D_RegAddr(D_RegAddr),
        .D_imm32(D_imm32),

        .E_PC(E_PC),
        .E_Instruction(E_Instruction),
        .E_RD1(E_RD1),
        .E_RD2(E_RD2),
        .E_RegAddr(E_RegAddr),
        .E_imm32(E_imm32),

        .D_BD(D_BD),
        .E_BD(E_BD),
        .D_excCode(D_excCode),
        .E_pre_excCode(E_pre_excCode)
    );


// E_CTRL
	CTRL e_ctrl(
		.Instruction(E_Instruction),
		.ALUSrc(E_ALUSrc),
		.ALUCtrl(E_ALUCtrl),
        .HILOType(E_HILOType),
        .Forward_sel(E_Forward_sel),
        .ALUExcOvAri(E_ALUAriOverflow),
        .ALUExcOvDM(E_ALUDMOverflow)
    );

// 
	assign E_Forward_RD1 =  (E_Instruction[25:21] == 0) ? 0 :
                            (E_Instruction[25:21] == M_RegAddr) ? M_Forward_Src :
                            (E_Instruction[25:21] == W_RegAddr) ? W_Forward_Src :
                            E_RD1;

    assign E_Forward_RD2 =  (E_Instruction[20:16] == 0) ? 0 :
                            (E_Instruction[20:16] == M_RegAddr) ? M_Forward_Src :
                            (E_Instruction[20:16] == W_RegAddr) ? W_Forward_Src :
                            E_RD2;

// 
    assign E_SrcA = E_Forward_RD1;

	// mux_2_32 e_srcb(
	// 	.inA(E_Forward_RD2),
	// 	.inB(E_imm32),
	// 	.sel(E_ALUSrc),
	// 	.out(E_SrcB)
    // );

    assign E_SrcB = E_ALUSrc ? E_imm32 : E_Forward_RD2;

// E_ALU
	E_ALU e_alu(
        .ALUExcOvAri(E_ALUAriOverflow),
        .ALUExcOvDM(E_ALUDMOverflow),
        .excOvAri(E_excOvAri),
        .excOvDM(E_excOvDM),
        
		.A(E_SrcA),
		.B(E_SrcB),
        .shamt(E_Instruction[10:6]),
		.ALUCtrl(E_ALUCtrl),
		.ALU_Result(E_Result)
    );

// E_HILO
    E_HILO e_hilo(
        .req(req),
        .clk(clk),
        .reset(reset),
        .RD1(E_Forward_RD1),
        .RD2(E_Forward_RD2),
        .Type(E_HILOType),
        .HILObusy(E_HILObusy),
        .HILOout(E_HILOout)
    );

/******************** stage_M ********************/
// EXMEM
	EXMEM ex_mem(
		.clk(clk),
		.reset(reset),

        .req(req),
        .E_excCode(E_excCode),
        .E_BD(E_BD),
        .E_excOvDM(E_excOvDM),
        .M_pre_excCode(M_pre_excCode),
        .M_BD(M_BD),
        .M_excOvDM(M_excOvDM),

		.E_PC(E_PC),
		.E_Instruction(E_Instruction),
		.E_Result(E_Result),
		.E_WD(E_Forward_RD2),
		.E_RegAddr(E_RegAddr),
        .E_imm32(E_imm32),
        .E_HILOout(E_HILOout),

		.M_PC(M_PC),
		.M_Instruction(M_Instruction),
		.M_Result(M_Result),
		.M_WD(M_WD),
		.M_RegAddr(M_RegAddr),
        .M_imm32(M_imm32),
        .M_HILOout(M_HILOout)
    );

    wire M_mtc0, M_load, M_store;

// M_CTRL
	CTRL m_ctrl(
		.Instruction(M_Instruction),
		.MWOP(M_MWOP),
        .width(M_width),
        .Forward_sel(M_Forward_sel),
        .mtc0(M_mtc0),
        .eret(M_eret),
        .load(M_load),
        .store(M_store)
    );

    assign M_Forward_WD =   (M_Instruction[20:16] == 0) ? 0 :
                            (M_Instruction[20:16] == W_RegAddr) ? W_Forward_Src :
                            M_WD;

// M_DM
	// M_DM m_dm(
	// 	.PC(M_PC),
	// 	.clk(clk),
	// 	.reset(reset),
	// 	.WE(M_MemWrite),
	// 	.MemAddr(M_Result),
	// 	.WD(M_Forward_WD),
	// 	.width(M_width),
	// 	.LoadOp(M_LoadOp),
	// 	.RD(M_RD)
    // );

// M_BE
    M_BE m_be(
        .req(req),
        .Low(M_Result[1:0]),
        .WDin(M_Forward_WD),
        .width(M_width),
        .RDin(m_data_rdata),
        .MWOP(M_MWOP),
        .WDout(M_WDout),
        .RDout(M_RD),
        .ByteEn(m_data_byteen)
    );

    assign m_inst_addr = M_PC;
    assign m_data_addr = M_Result;
    assign m_data_wdata = M_WDout;
    //assign m_data_wdata = M_Forward_WD;   

    wire M_ErrAlign = (((M_width == `WORD) || (M_MWOP == `Mem_N)) && (|M_Result[1:0])) ||
                      (((M_width == `HALF) || (M_MWOP == `Mem_H_S) || (M_MWOP == `Mem_H_Z)) && (M_Result[0]));

    wire M_ErrOutOfRange =!(((M_Result >= 32'h0000_0000) && (M_Result <= 32'h0000_2fff)) ||
                            ((M_Result >= 32'h0000_7f00) && (M_Result <= 32'h0000_7f0b)) ||
                            ((M_Result >= 32'h0000_7f10) && (M_Result <= 32'h0000_7f1b)) ||
                            ((M_Result >= 32'h0000_7f20) && (M_Result <= 32'h0000_7f23)));

    wire M_ErrTimer = ((M_width != `WORD) && (M_MWOP != `Mem_N)) && (M_Result >= 32'h0000_7f00/* && M_Result <= 32'h0000_7f1b*/);
    
    wire M_ErrSaveTimer = (M_Result >= 32'h0000_7f08 && M_Result <= 32'h0000_7f0b) ||
                          (M_Result >= 32'h0000_7f18 && M_Result <= 32'h0000_7f1b);

    assign M_excAdEL = M_load && (M_ErrAlign || M_ErrOutOfRange || M_ErrTimer || M_excOvDM);
    assign M_excAdES = M_store && (M_ErrAlign || M_ErrOutOfRange || M_ErrTimer || M_ErrSaveTimer || M_excOvDM);

// CP0

    assign macroscopic_pc = M_PC;

    CP0 m_cp0(
        .clk(clk),
        .reset(reset),
        .A1(M_Instruction[15:11]),
        .A2(M_Instruction[15:11]),
        .Din(M_Forward_WD),
        .PC(M_PC),
        .ExcCodeIn(M_excCode),
        .HWInt(HWInt),
        .BDin(M_BD),
        .WE(M_mtc0),
        .EXLClr(M_eret),
        .Req(req),
        .EPCout(EPC),
        .Dout(M_CP0out)
    );


/******************** stage_W ********************/
// MEMWB
	MEMWB mem_wb(
        .req(req),
        .M_CP0out(M_CP0out),
        .W_CP0out(W_CP0out),
        
		.clk(clk),
		.reset(reset),

		.M_PC(M_PC),
		.M_Instruction(M_Instruction),
		.M_RD(M_RD),
		.M_Result(M_Result),
		.M_RegAddr(M_RegAddr),
        .M_imm32(M_imm32),
        .M_HILOout(M_HILOout),

		.W_PC(W_PC),
		.W_Instruction(W_Instruction),
		.W_RD(W_ReadData),
		.W_Result(W_Result),
		.W_RegAddr(W_RegAddr),
        .W_imm32(W_imm32),
        .W_HILOout(W_HILOout)
    );
    

// W_CTRL
	CTRL w_ctrl(  
        .Instruction(W_Instruction),
		.RegWrite(W_RegWrite),
		.MemToReg(W_MemToReg),
        .Forward_sel(W_Forward_sel)
    );

    assign W_RegData =  (W_MemToReg == `RMToReg) ? W_ReadData :
                        (W_MemToReg == `LinkToReg) ? W_PC + 8 :
                        (W_MemToReg == `LuiToReg) ? W_imm32 :
                        (W_MemToReg == `HILOToReg) ? W_HILOout :
                        (W_MemToReg == `MFC0ToReg) ? W_CP0out :
                        W_Result;

    assign w_grf_we = W_RegWrite;
    assign w_grf_addr = W_RegAddr;
    assign w_grf_wdata = W_RegData;
    assign w_inst_addr = W_PC;

endmodule


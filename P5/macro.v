`timescale 1ns / 1ps
// Module Name:    macro 
// Project Name:   Pipeline CPU of MIPS


/******************** CTRL ********************/

`define OPCode      Instruction[31:26]
`define Funct       Instruction[5:0]

`define Tbeq        4'b0000
`define Tbne        4'b0001

`define RegDst_rd   3'b001
`define RegDst_rt   3'b000
`define RegDst_ra   3'b010

`define FW_RM       3'b001
`define FW_Link     3'b010
`define FW_Lui      3'b011
`define FW_Result   3'b000
`define FW_MF       3'b100

`define HILO_mult   4'b0000
`define HILO_multu  4'b0001
`define HILO_div    4'b0010
`define HILO_divu   4'b0011
`define HILO_mfhi   4'b0100
`define HILO_mflo   4'b0101
`define HILO_mthi   4'b0110
`define HILO_mtlo   4'b0111


/******************** stage_F ********************/



/******************** stage_D ********************/

// D_EXT
`define zero_extend 2'b0
`define sign_extend 2'b1
`define lui_extend  2'b10

// NPC
`define nPC_branch  3'b001
`define nPC_jump    3'b010
`define nPC_jr      3'b011
`define nPC_PC4     3'b000


/******************** stage_E ********************/

// E_ALU
`define ALU_ADD     3'b000
`define ALU_SUB     3'b001
`define ALU_AND     3'b010
`define ALU_OR      3'b011
`define ALU_XOR     3'b100
`define ALU_SLT     3'b101
`define ALU_SLTU    3'b110


/******************** stage_M ********************/

// M_DM
`define WORD        2'b00
`define HALF        2'b01
`define BYTE        2'b10

`define Mem_N       3'b000
`define Mem_B_Z     3'b001
`define Mem_B_S     3'b010
`define Mem_H_Z     3'b011
`define Mem_H_S     3'b100

/******************** stage_W ********************/

`define ResultToReg 3'b000
`define RMToReg     3'b001
`define LinkToReg   3'b010
`define LuiToReg    3'b011
`define HILOToReg   3'b100



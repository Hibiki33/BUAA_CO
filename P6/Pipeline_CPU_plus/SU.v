`timescale 1ns / 1ps
// Module Name:    SU 
// Project Name: 

module SU(
    input [31:0] D_Instruction,
    input [31:0] E_Instruction,
    input [31:0] M_Instruction,
    input E_HILObusy,
    input [4:0] E_RegAddr,
    input [4:0] M_RegAddr,
    output stall
    );

    /////////////////////// StageD
    wire D_calc_r, D_calc_i, D_load, D_store, D_j_r, D_branch, D_md, D_mf, D_mt;
    
    CTRL _DInterp (
        .Instruction(D_Instruction),
        .calc_r(D_calc_r),
        .calc_i(D_calc_i),
        .load(D_load),
        .store(D_store),
        .j_r(D_j_r),
        .branch(D_branch),
        .md(D_md),
        .mf(D_mf),
        .mt(D_mt)
    );

    wire[2:0] TuseRS =  (D_branch | D_j_r) ? 3'd0 :
                        (D_calc_r | D_calc_i | D_load | D_store | D_md | D_mt) ? 3'd1 :
                        3'd3;
    wire[2:0] TuseRT =  D_branch ? 3'd0 :
                        (D_calc_r | D_md) ? 3'd1 :
                        D_store  ? 3'd2 :
                        3'd3;

    /////////////////////// StageE
    wire E_calc_r, E_calc_i, E_load, E_mf;

    CTRL _EInterp (
        .Instruction(E_Instruction),
        .calc_r(E_calc_r),
        .calc_i(E_calc_i),
        .load(E_load),
        .mf(E_mf)
    );

    wire[2:0] TnewE =   (E_calc_r | E_calc_i | E_mf) ? 3'd1 :
                        E_load ? 3'd2 :
                        3'd0;

    /////////////////////// StageM
    wire M_load;

    CTRL _MInterp (
        .Instruction(M_Instruction),
        .load(M_load)
    );

    wire [2:0] TnewM =  M_load ? 3'd1 :
                        3'd0;

    // Tuse < Tnew
    wire stall_rs_e = (TuseRS < TnewE) && (D_Instruction[25:21] && D_Instruction[25:21] == E_RegAddr);
    wire stall_rs_m = (TuseRS < TnewM) && (D_Instruction[25:21] && D_Instruction[25:21] == M_RegAddr);
    wire stall_rs = stall_rs_e | stall_rs_m;

    wire stall_rt_e = (TuseRT < TnewE) && (D_Instruction[20:16] && D_Instruction[20:16] == E_RegAddr);
    wire stall_rt_m = (TuseRT < TnewM) && (D_Instruction[20:16] && D_Instruction[20:16] == M_RegAddr);
    wire stall_rt = stall_rt_e | stall_rt_m;

    wire stall_HILO = E_HILObusy & (D_md | D_mf | D_mt);

    assign stall = (stall_rs | stall_rt | stall_HILO);
    

endmodule

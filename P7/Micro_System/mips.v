`timescale 1ns / 1ps
// Module Name:    mips 
// Project Name:   Pipeline_CPU of MIPS

`include "macro.v"


module mips(
    input clk,                
    input reset,               
    
    input interrupt,          
    output [31:0] macroscopic_pc, 

    output [31:0] i_inst_addr,   
    input  [31:0] i_inst_rdata,  

    output [31:0] m_data_addr,  
    input  [31:0] m_data_rdata,   
    output [31:0] m_data_wdata,   
    output [3 :0] m_data_byteen,  

    output [31:0] m_int_addr,    
    output [3 :0] m_int_byteen, 

    output [31:0] m_inst_addr,  

    output w_grf_we,            
    output [4 :0] w_grf_addr,  
    output [31:0] w_grf_wdata,  

    output [31:0] w_inst_addr 
	);
	
    wire [31:0] tmp_m_data_wdata, tmp_m_data_addr;
    wire [3:0] tmp_m_data_byteen;
    wire [31:0] tmp_m_data_rdata;
    wire TC1_IRQ, TC0_IRQ; 

    // wire [31:0] bridge_m_data_addr;
    // wire [3:0] bridge_m_data_byteen;

    wire [5:0] HWInt = {3'b000, interrupt, TC1_IRQ, TC0_IRQ};
    //TC0
    wire [31:0] TC0_Addr, TC0_Din, TC0_Dout;
    wire TC0_WD, TC0_WE;
    //TC1
    wire [31:0] TC1_Addr, TC1_Din, TC1_Dout;
    wire TC1_WD, TC1_WE;

    CPU cpu(
        .clk(clk),                 
        .reset(reset), 
        .HWInt(HWInt), 

        .macroscopic_pc(macroscopic_pc),

        .i_inst_addr(i_inst_addr),  
        .i_inst_rdata(i_inst_rdata),

        .m_data_addr(tmp_m_data_addr),  
        .m_data_rdata(tmp_m_data_rdata),   
        .m_data_wdata(tmp_m_data_wdata),
        .m_data_byteen(tmp_m_data_byteen),

        .m_inst_addr(m_inst_addr),   

        .w_grf_we(w_grf_we),              
        .w_grf_addr(w_grf_addr),   
        .w_grf_wdata(w_grf_wdata),   

        .w_inst_addr(w_inst_addr)   
    );

    Bridge bridge(
        .m_data_addr(m_data_addr),
        .m_data_wdata(m_data_wdata),
        .m_data_byteen(m_data_byteen),
        .m_data_rdata(m_data_rdata),

        .tmp_m_data_addr(tmp_m_data_addr),
        .tmp_m_data_wdata(tmp_m_data_wdata),
        .tmp_m_data_byteen(tmp_m_data_byteen),
        .tmp_m_data_rdata(tmp_m_data_rdata),

        .m_int_addr(m_int_addr),    
        .m_int_byteen(m_int_byteen), 

        .TC0_Addr(TC0_Addr),
        .TC0_WE(TC0_WE),
        .TC0_Din(TC0_Din),
        .TC0_Dout(TC0_Dout),

        .TC1_Addr(TC1_Addr),
        .TC1_WE(TC1_WE),
        .TC1_Din(TC1_Din),
        .TC1_Dout(TC1_Dout)
    );

    TC tc0(
        .clk(clk),
        .reset(reset),
        .WE(TC0_WE),
        .Addr(TC0_Addr[31:2]),
        .Din(TC0_Din),
        .Dout(TC0_Dout),
        .IRQ(TC0_IRQ)
    );

    TC tc1(
        .clk(clk),
        .reset(reset),
        .WE(TC1_WE),
        .Addr(TC1_Addr[31:2]),
        .Din(TC1_Din),
        .Dout(TC1_Dout),
        .IRQ(TC1_IRQ)
    );

endmodule
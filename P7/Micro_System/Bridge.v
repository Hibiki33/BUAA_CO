`timescale 1ns / 1ps

module Bridge(
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3:0] m_data_byteen,
    input [31:0] m_data_rdata,

    input [31:0] tmp_m_data_addr,
    input [31:0] tmp_m_data_wdata,
    input [3:0] tmp_m_data_byteen,
    output [31:0] tmp_m_data_rdata,

    output [31:0] m_int_addr,    
    output [3 :0] m_int_byteen, 

    output [31:0] TC0_Addr,
    output TC0_WE,
    output [31:0] TC0_Din,
    input [31:0] TC0_Dout,

    output [31:0] TC1_Addr,
    output TC1_WE,
    output [31:0] TC1_Din,
    input [31:0] TC1_Dout
    );

    assign m_data_addr = tmp_m_data_addr;
    assign m_int_addr = tmp_m_data_addr;
    assign TC0_Addr = tmp_m_data_addr;
    assign TC1_Addr = tmp_m_data_addr;

    assign TC0_Din = tmp_m_data_wdata;
    assign TC1_Din = tmp_m_data_wdata;
    assign m_data_wdata = tmp_m_data_wdata; 

    wire SelDM  = (tmp_m_data_addr >= 32'h0000_0000) && (tmp_m_data_addr <= 32'h0000_2fff);
    wire SelInt = (tmp_m_data_addr >= 32'h0000_7f20) && (tmp_m_data_addr <= 32'h0000_7f23);
    wire SelTC0 = (tmp_m_data_addr >= 32'h0000_7f00) && (tmp_m_data_addr <= 32'h0000_7f0b);
    wire SelTC1 = (tmp_m_data_addr >= 32'h0000_7f10) && (tmp_m_data_addr <= 32'h0000_7f1b);

    assign TC0_WE = (|tmp_m_data_byteen) && SelTC0;
    assign TC1_WE = (|tmp_m_data_byteen) && SelTC1;

    assign m_data_byteen = SelDM  ? tmp_m_data_byteen : 4'd0;
    assign m_int_byteen  = SelInt ? tmp_m_data_byteen : 4'd0;
    
    assign tmp_m_data_rdata = (SelTC0) ? TC0_Dout :
                              (SelTC1) ? TC1_Dout :
                              (SelInt) ? 32'd0    :
                              m_data_rdata;

endmodule

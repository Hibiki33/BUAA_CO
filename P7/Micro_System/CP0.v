`timescale 1ns / 1ps
// Module Name:    CP0 
// Project Name: 

`define IM SR[15:10]            // Interrupt Mask
`define EXL SR[1]               // Exception Level
`define IE SR[0]                // Interrupt Enable
`define BD Cause[31]            // Branch Delay
`define IP Cause[15:10]         // Interrupt Pending
`define ExcCode Cause[6:2]      // 

`define SRAddr		5'd12
`define CAUSEAddr	5'd13
`define EPCAddr		5'd14

module CP0(
    input clk,
    input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [31:0] Din,
    input [31:0] PC,
    input [4:0] ExcCodeIn,
    input [7:2] HWInt,
    input BDin,
    input WE,
    input EXLClr,
    output Req,
    output [31:0] EPCout,
    output [31:0] Dout
    );

    reg[31:0] SR;
    reg[31:0] Cause;
    reg[31:0] EPC;

    initial begin
        SR      <= 0;
        Cause   <= 0;
        EPC     <= 0;
    end

    wire inter_req  = (|(HWInt & `IM)) & `IE & (!`EXL);    // 中断有效判断
    wire exc_req    = (|ExcCodeIn) & (!`EXL);       // 异常有效判断
    assign Req      = inter_req | exc_req; 

    assign Dout =   (A1 == `SRAddr) ? SR :
                    (A1 == `CAUSEAddr) ? Cause :
                    (A1 == `EPCAddr) ? EPCout :
                    0;

    wire [31:0] tmp_EPC = (Req) ? (BDin ? (PC - 32'd4) : PC)
                                : EPC;

    assign EPCout = tmp_EPC;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            SR      <= 0;
            Cause   <= 0;
            EPC     <= 0;
        end
        else begin
            if (EXLClr) `EXL <= 1'b0;
            if (Req) begin
                `ExcCode <= inter_req ? 5'b0 : ExcCodeIn;
                `EXL <= 1'b1;
                `BD <= BDin;
                EPC <= tmp_EPC; 
            end
            else if (WE) begin
                if (A2 == `SRAddr) SR <= Din;
                else if (A2 == `EPCAddr) EPC <= Din;
            end
            `IP <= HWInt;
        end
    end


endmodule

`timescale 1ns / 1ps
// Module Name:    M_VD 
// Project Name: 

`include "macro.v"

module M_BE(
    input [1:0] Low,
    input [31:0] WDin,
    input [1:0] width,
    input [31:0] RDin,
    input [2:0] MWOP,
    output reg[31:0] WDout,
    output reg[31:0] RDout,
    output reg[3:0] ByteEn
    );

    always @(*) begin
        case (width) 
            `WORD : begin
                ByteEn <= 4'b1111;
                WDout <= WDin;
            end
            `HALF : begin
                case (Low[1])
                    0 : begin
                        ByteEn <= 4'b0011;
                        WDout <= {16'b0, WDin[15:0]};
                    end
                    1 : begin
                        ByteEn <= 4'b1100;
                        WDout <= {WDin[15:0], 16'b0};
                    end
                endcase
            end
            `BYTE : begin
                case (Low)
                    2'b00 : begin
                        ByteEn <= 4'b0001;
                        WDout <= {24'b0, WDin[7:0]};
                    end
                    2'b01 : begin
                        ByteEn <= 4'b0010;
                        WDout <= {16'b0, WDin[7:0], 8'b0};
                    end
                    2'b10 : begin
                        ByteEn <= 4'b0100;
                        WDout <= {8'b0, WDin[7:0], 16'b0};
                    end
                    2'b11 : begin
                        ByteEn <= 4'b1000;
                        WDout <= {WDin[7:0], 24'b0};
                    end
                endcase
            end
            default : begin
                ByteEn <= 4'b0000;
                WDout <= 0;
            end
        endcase
    end

    always @(*) begin
        case (MWOP)
            `Mem_N   : RDout = RDin;
            `Mem_H_S : begin
                case (Low[1])
                    0 : RDout = {{16{RDin[15]}}, RDin[15:0]};
                    1 : RDout = {{16{RDin[31]}}, RDin[31:16]};
                endcase
            end
            `Mem_H_Z : begin
                case (Low[1])
                    0 : RDout = {16'b0, RDin[15:0]};
                    1 : RDout = {16'b0, RDin[31:16]};
                endcase
            end
            `Mem_B_S : begin
                case (Low)
                    2'b00 : RDout = {{24{RDin[7]}}, RDin[7:0]};
                    2'b01 : RDout = {{24{RDin[15]}}, RDin[15:8]};
                    2'b10 : RDout = {{24{RDin[23]}}, RDin[23:16]};
                    2'b11 : RDout = {{24{RDin[31]}}, RDin[31:24]};
                endcase
            end 
            `Mem_B_Z : begin
                case (Low)
                    2'b00 : RDout = {24'b0, RDin[7:0]};
                    2'b01 : RDout = {24'b0, RDin[15:8]};
                    2'b10 : RDout = {24'b0, RDin[23:16]};
                    2'b11 : RDout = {24'b0, RDin[31:24]};
                endcase
            end
            default : RDout = 0;
        endcase
    end

endmodule

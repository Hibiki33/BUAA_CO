`timescale 1ns / 1ps 
// Module Name:    E_HILO 
// Project Name: 

`include "macro.v"

module E_HILO(
    input req,
    input clk,
    input reset,
    input [31:0] RD1,
    input [31:0] RD2,
    input [3:0] Type,
    output HILObusy,
    output [31:0] HILOout
    );

    integer state = 0;
    reg[31:0] hi, lo, temp_hi, temp_lo;

    wire start =   (Type == `HILO_mult  |
                    Type == `HILO_multu | 
                    Type == `HILO_div   | 
                    Type == `HILO_divu);
    reg busy;

    assign HILObusy = (start | busy);
    assign HILOout =    (Type == `HILO_mfhi) ? hi :
                        (Type == `HILO_mflo) ? lo : 
                        32'd0;

    initial begin
        state <= 0;
        busy <= 0;
        hi <= 0;
        lo <= 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
            busy <= 0;
            hi <= 0;
            lo <= 0;
        end
        else if (!req) begin
            if (state == 0) begin
                case (Type) 
                    `HILO_mthi : begin
                        hi <= RD1;
                    end
                    `HILO_mtlo : begin
                        lo <= RD1;
                    end
                    `HILO_mult : begin
                        busy <= 1;
                        state <= 5;
                        {temp_hi, temp_lo} <= $signed(RD1) * $signed(RD2);
                    end
                    `HILO_multu : begin
                        busy <= 1;
                        state <= 5;
                        {temp_hi, temp_lo} <= RD1 * RD2;
                    end
                    `HILO_div : begin
                        busy <= 1;
                        state <= 10;
                        temp_lo <= $signed(RD1) / $signed(RD2);
                        temp_hi <= $signed(RD1) % $signed(RD2);
                    end
                    `HILO_divu : begin
                        busy <= 1;
                        state <= 10;
                        temp_lo <= RD1 / RD2;
                        temp_hi <= RD1 % RD2;
                    end
                endcase
            end
            else if (state == 1) begin
                state <= 0;
                busy <= 0;
                hi <= temp_hi;
                lo <= temp_lo;
            end
            else begin
                state = state - 1;
            end
        end
    end

endmodule

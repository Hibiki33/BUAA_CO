`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:56 08/23/2022 
// Design Name: 
// Module Name:    cpu_checker 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define S0  4'h0
`define S1  4'h1
`define S2  4'h2
`define S3  4'h3
`define S4  4'h4
`define S5  4'h5
`define S6  4'h6
`define S7  4'h7
`define S8  4'h8
`define S9  4'h9
`define S10 4'ha
`define S11 4'hb
`define S12 4'hc
`define S13 4'hd

module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
    output [1:0] format_type
    );

	reg [3:0] status;
	reg ft;
	reg [2:0] cnt_10_time;
	reg [3:0] cnt_16_pc;
	reg [2:0] cnt_10_grf;
	reg [3:0] cnt_16_addr;
	reg [3:0] cnt_16_data;

	always @(posedge clk) begin
		if (reset == 1'b1) begin
			status <= `S0;
			cnt_10_time <= 3'b000;
			cnt_16_pc   <= 4'b0000;
			cnt_10_grf  <= 3'b000;
			cnt_16_addr <= 4'b0000;
			cnt_16_data <= 4'b0000;
		end
		else begin
			case (status)
				//First of All
				`S0 : begin
					if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end 
				//"^"
				`S1 : begin
					if (char >= "1" && char <= "9") begin
						status <= `S2;
						cnt_10_time <= cnt_10_time + 3'b001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>"
				`S2 : begin
					if (cnt_10_time <= 3'b100 && char == "@") begin
						status <= `S3;
						cnt_16_pc <= 4'b0000;
					end
					else if (cnt_10_time < 3'b100 && char >= "0" && char <= "9") begin
						status <= `S2;
						cnt_10_time <= cnt_10_time + 3'b001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin 
						status <= `S0;
					end
				end
				//"^<d>@"
				`S3 : begin
					if (char >= "0" && char <= "9" || char >= "a" && char <= "f") begin
						status <= `S4;
						cnt_16_pc <= cnt_16_pc + 4'b0001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>"
				`S4 : begin
					if (cnt_16_pc == 4'b1000 && char == ":")	begin
						status <= `S5;
					end
					else if (cnt_16_pc < 4'b1000 && (char >= "0" && char <= "9" || char >= "a" && char <= "f")) begin
						status <= `S4;
						cnt_16_pc <= cnt_16_pc + 4'b0001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>:"
				`S5 : begin
					if (char == " ") begin
						status <= `S5;
					end
					else if (char == "$") begin
						status <= `S6;
						cnt_10_grf <= 3'b000;
						ft <= 1'b0;
					end
					else if (char == "*") begin
						status <= `S8;
						cnt_16_addr <= 4'b0000;
						ft <= 1'b1;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $"
				`S6 : begin
					if (char >= "1" && char <= "9") begin
						cnt_10_grf <= cnt_10_grf + 3'b001;
						status <= `S7;
					end
					else if (char == "^") begin
						status <= `S1;
					end
					else begin
						status <= `S0;
					end
				end
				`S7 : begin
					if (cnt_10_grf <= 3'b100 && char == " ") begin 
						status <= `S9;
					end
					else if (cnt_10_grf <= 3'b100 && char == "<") begin 
						status <= `S10;
					end
					else if (cnt_10_grf < 3'b100 && char >= "0" && char <= "9") begin
						status <= `S7;
						cnt_10_grf <= cnt_10_grf + 3'b001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: *"
				`S8 : begin
					if (cnt_16_addr == 4'b1000 && char == " ") begin
						status <= `S9;
					end
					else if (cnt_16_addr == 4'b1000 && char == "<") begin
						status <= `S10;
					end
					else if (cnt_16_addr < 4'b1000 &&(char >= "0" && char <= "9" || char >= "a" && char <= "f")) begin
						status <= `S8;
						cnt_16_addr <= cnt_16_addr + 4'b0001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/*<h>"
				`S9 : begin
					if (char == " ") begin
						status <= `S9;
					end
					else if (char == "<") begin
						status <= `S10;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/*<h> <"
				`S10 : begin
					if (char == "=") begin
						status <= `S11;
						cnt_16_data <= 4'b0000;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/*<h> <="
				`S11 : begin
					if (char == " ") begin
						status <= `S11;
					end
					else if (char >= "0" && char <= "9" || char >= "a" && char <= "f") begin
						status <= `S12;
						cnt_16_data <= cnt_16_data + 4'b0001; 
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/*<h> <= <h>"
				`S12 : begin
					if (cnt_16_data == 4'b1000 && char == "#") begin
						status <= `S13;
					end
					else if (cnt_16_data < 4'b1000 && (char >= "0" && char <= "9" || char >= "a" && char <= "f")) begin
						status <= `S12;
						cnt_16_data <= cnt_16_data + 4'b0001;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin 
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/*<h> <= <h>#"
				`S13 : begin 
					if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
					end
					else begin
						status <= `S0;
					end
				end
				
				default : status <= `S0;	
			endcase
		end
	end

	assign format_type = (status != `S13) ? 2'b00 : 
								(ft == 1'b0)     ? 2'b01 : 2'b10;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:17 08/24/2022 
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
    input [15:0] freq,
    output [1:0] format_type,
    output [3:0] error_code
    );
	reg [3:0] status;
	reg ft;
	reg [2:0] cnt_10_time;
	reg [3:0] cnt_16_pc;
	reg [2:0] cnt_10_grf;
	reg [3:0] cnt_16_addr;
	reg [3:0] cnt_16_data;
	
	function func (
		input [15:0] m,
		input [15:0] sub
		);
		begin
			while (sub != 0) begin
				sub = sub << 1;
				m = m << 1;
			end
			func = (m == 0) ? 1 : 0;
		end
	endfunction
	
	function [13:0] multiple_ten;
		input [13:0] in;
		multiple_ten = in + in + in + in + in + in + in + in + in + in;
	endfunction
	
	function is_4;
		input [31:0] in;
		begin
			is_4 = ((in << 30) == 0) ? 1 : 0;
		end
	endfunction

	wire [15:0] pre_freq;
	assign pre_freq = freq >> 1;
	
	reg [13:0] _time;
	reg [31:0] _pc;
	reg [31:0] _addr;
	reg [13:0] _grf;
	
	wire [3:0] j1;
	wire [3:0] j2;
	wire [3:0] j3;
	wire [3:0] j4;
	
	assign j1 = func({0, 0, _time}, pre_freq) 												? 4'b0000 : 4'b0001;
	assign j2 = (is_4(_pc) && _pc >= 32'h0000_3000 && _pc <= 32'h0000_4fff) 		? 4'b0000 : 4'b0010;
	assign j3 = (is_4(_addr) && _addr >= 32'h0000_0000 && _addr <= 32'h0000_2fff) ? 4'b0000 : 4'b0100;
	assign j4 = (_grf >= 0 && _grf <= 31) 														? 4'b0000 : 4'b1000;
	
	always @(posedge clk) begin
		if (reset == 1'b1) begin
			//Put status to initial
			status <= `S0;
			//Put register to 0
			cnt_10_time <= 3'b000;
			cnt_16_pc   <= 4'b0000;
			cnt_10_grf  <= 3'b000;
			cnt_16_addr <= 4'b0000;
			cnt_16_data <= 4'b0000;
			//Put counter to 0
			_time <= 0;
			_pc 	<= 0;
			_addr <= 0;
			_grf  <= 0;
		end
		else begin
			case (status)
				//First of All
				`S0 : begin
					if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						_time <= multiple_ten(_time) + char - "0";
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						_pc <= 0;
					end
					else if (cnt_10_time < 3'b100 && char >= "0" && char <= "9") begin
						status <= `S2;
						cnt_10_time <= cnt_10_time + 3'b001;
						_time <= multiple_ten(_time) + char - "0";
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						if (char >= "0" && char <= "9") begin
							_pc <= (_pc << 4) + char - "0";
						end
						else begin
							_pc <= (_pc << 4) + char - "a" + 10; 
						end
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						if (char >= "0" && char <= "9") begin
							_pc <= (_pc << 4) + char - "0";
						end
						else begin
							_pc <= (_pc << 4) + char - "a" + 10; 
						end
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						_grf <= 0;
						ft <= 1'b0;
					end
					else if (char == 8'd42) begin
						status <= `S8;
						cnt_16_addr <= 4'b0000;
						_addr <= 0;
						ft <= 1'b1;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $"
				`S6 : begin
					if (char >= "1" && char <= "9") begin
						status <= `S7;
						cnt_10_grf <= cnt_10_grf + 3'b001;
						_grf <= multiple_ten(_grf) + char - "0";
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
						_grf <= multiple_ten(_grf) + char - "0";
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: ()"
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
						if (char >= "0" && char <= "9") begin
							_addr <= (_addr << 4) + char - "0";
						end
						else begin
							_addr <= (_addr << 4) + char - "a" + 10;
						end
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/()<h>"
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
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/()<h> <"
				`S10 : begin
					if (char == "=") begin
						status <= `S11;
						cnt_16_data <= 4'b0000;
					end
					else if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/()<h> <="
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
						_time <= 0;
					end
					else begin
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/()<h> <= <h>"
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
						_time <= 0;
					end
					else begin 
						status <= `S0;
					end
				end
				//"^<d>@<h>: $<d>/()<h> <= <h>#"
				`S13 : begin 
					if (char == "^") begin
						status <= `S1;
						cnt_10_time <= 3'b000;
						_time <= 0;
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
								
	assign error_code = (status != `S13) ? 0 : 
							  (ft == 1'b0)     ?	j1 + j2 + j4 : j1 + j2 + j3;

endmodule



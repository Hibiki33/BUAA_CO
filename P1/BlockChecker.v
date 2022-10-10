`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:21 10/05/2022 
// Design Name: 
// Module Name:    BlockChecker 
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
module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );
	
	reg[3:0] status;
	
	parameter S0 = 4'h0,
				 S1 = 4'h1,
				 S2 = 4'h2,
				 S3 = 4'h3,
				 S4 = 4'h4,
				 S5 = 4'h5,
				 S6 = 4'h6,
				 S7 = 4'h7,
				 S8 = 4'h8,
				 S9 = 4'h9,
				 S10 = 4'ha;
	
	reg[31:0] begin_cnt, end_cnt;
	reg begin_tmp, end_tmp;
	
	assign result = ((begin_cnt + begin_tmp == end_cnt + end_tmp) && status != S10) ? 1'b1 : 1'b0;
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			begin_cnt <= 0;
			begin_tmp <= 0;
			end_cnt <= 0;
			end_tmp <= 0;
			status <= S1;
		end
		else begin
			case (status)
				S0 : begin
					if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S1 : begin
					if (in == "b" || in == "B") status <= S2;
					else if (in == "e" || in == "E") status <= S7;
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S2 : begin
					if (in == "e" || in == "E") status <= S3;
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S3 : begin
					if (in == "g" || in == "G") status <= S4;
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S4 : begin
					if (in == "i" || in == "I") status <= S5;
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S5 : begin
					if (in == "n" || in == "N") begin
						status <= S6;
						begin_tmp <= 1;
					end
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S6 : begin
					begin_tmp <= 0;
					if (in == " ") begin
						begin_cnt <= begin_cnt + 1;
						status <= S1;
					end
					else begin 
						status <= S0;
					end
				end
				
				S7 : begin
					if (in == "n" || in == "N") status <= S8;
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S8 : begin
					if (in == "d" || in == "D") begin
						end_tmp <= 1;
						status <= S9;
					end
					else if (in == " ") status <= S1;
					else status <= S0;
				end
				
				S9 : begin
					end_tmp <= 0;
					if (in == " ") begin
						if (end_cnt < begin_cnt) begin
							end_cnt <= end_cnt + 1;
							status <= S1;
						end
						else if (end_cnt == begin_cnt) begin
							status <= S10;
						end
					end
					else begin
						status <= S0;
					end
				end
				
				S10 : begin
					status <= S10;
				end
				
				default : begin	
					status <= S0;
				end
			endcase
		end
	end

endmodule

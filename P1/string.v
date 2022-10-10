`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:52 10/05/2022 
// Design Name: 
// Module Name:    string 
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
module string(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );
	 
	reg[3:0] status;
	 
	parameter S0 = 4'b0001,
				 S1 = 4'b0010,
				 S2 = 4'b0100,
				 S3 = 4'b1000;
	
	assign out = (status == S2) ? 1 : 0;
	
	always @(posedge clk, posedge clr) begin
		if (clr) begin
			status <= S0;
		end
		else begin
			case (status)
				S0 : begin
					if (in == "+" || in == "*") begin
						status <= S1;
					end
					else if (in >= "0" && in <= "9") begin
						status <= S2;
					end
					else begin
						status <= S0;
					end
				end
				S1 : begin
					if (in == "+" || in == "*") begin
						status <= S1;
					end
					else if (in >= "0" && in <= "9") begin
						status <= S1;
					end
					else begin
						status <= S0;
					end
				end
				S2 : begin
					if (in == "+" || in == "*") begin
						status <= S3;
					end
					else if (in >= "0" && in <= "9") begin
						status <= S1;
					end
					else begin
						status <= S0;
					end
				end
				S3 : begin
					if (in == "+" || in == "*") begin
						status <= S1;
					end
					else if (in >= "0" && in <= "9") begin
						status <= S2;
					end
					else begin
						status <= S0;
					end
				end
				default : begin
					status <= S0;
				end
			endcase 
		end
	end

endmodule

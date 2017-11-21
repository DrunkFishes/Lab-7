`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:58 11/17/2017 
// Design Name: 
// Module Name:    p_c 
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
module Reg_16(clk, reset, ld, count, Din, Dout);

input clk, reset, ld, count;
input [15:0] Din;
output reg [15:0] Dout;

always @ (posedge clk or posedge reset)
	if(reset == 1'b1)
		Dout <= 16'b0;
	else
		case({ld,count})
			2'b10: Dout <= Din;
			2'b01: Dout <= Din +16'b1;
			default: Dout <= Dout;
		endcase
endmodule


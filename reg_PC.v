`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:34 11/25/2017 
// Design Name: 
// Module Name:    reg_PC 
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
module reg_PC(clk, reset, ld, count, Din, Dout);

input clk, reset, ld, count;
input [15:0] Din;
output reg [15:0] Dout;

always @ (posedge clk or posedge reset)
	if(reset)
		Dout <= 16'b0;
	else
		case({ld,count})
			2'b10: Dout <= Din;
			2'b01: Dout <= Dout + 16'b1;
            2'b11: Dout <= Din + 16'b1;
			default: Dout <= Dout;
		endcase
endmodule

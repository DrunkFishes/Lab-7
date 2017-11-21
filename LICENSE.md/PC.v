`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:56 11/17/2017 
// Design Name: 
// Module Name:    PC 
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
`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Steven Phan
 * Email:	 
 * Filename: 
 * Date:     October 23, 2017
 * Version:  1.0
 * Purpose:  
 *					
 * Notes:	 
 *******************************************************************************/
module PC(clk, reset, ld, Din, DA, DB, oeA, oeB);

	input 		   clk, reset, ld, oeA, oeB;
	input  [15:0]  Din;
	output [15:0]  DA, DB;
	reg    [15:0]  Dout;
	
// behavioral section for writing to the regisdter
always@ (posedge clk or posedge reset)
	if (reset)
		Dout <= 16'b0;
	else
		if (ld)
				Dout <= Din;
		else  Dout <= Dout;
	
// conditional continout assignments for reading th3e register
assign DA = oeA ? Dout : 16'hz;
assign DB = oeB ? Dout : 16'hz;

endmodule

`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Steven Phan
 * Email:    1anh21@gmail.com
 * Filename: dec3to8.v
 * Date:     October 25, 2017
 * Version:  1.2
 * Purpose:  Module acts as a 3-bit input to 8-bit output decoder. When 
	     enable is low. Output Y as 8-bit 0. If Enable is asserted 
	     high, module will output the 8-bit Y signal. Each signal is
	     different and is dedicated, pertaining to each 3-bit X input
 *					
 * Notes:    Signals can be used for device selection
 *******************************************************************************/
module dec3to8(X, En, Y);
	
		input      [2:0] X;
		input            En;
		output reg [7:0] Y;

	always @ (X or En) begin
	if(En==0)
		Y = 8'b00000000; // 0 if enable is deasserted
		
	// Note: 3-bit X is shown as a hex value
	// Logic for each different output for every inputs
	else
		case(X)
			3'b000 : Y =8'b0000_0001;
			3'b001 : Y =8'b0000_0010;
			3'b010 : Y =8'b0000_0100;
			3'b011 : Y =8'b0000_1000;
			3'b100 : Y =8'b0001_0000;
			3'b101 : Y =8'b0010_0000;
			3'b110 : Y =8'b0100_0000;
			3'b111 : Y =8'b1000_0000;
			default: Y = 8'b0000_0000; // default is 0
		endcase
	end
endmodule

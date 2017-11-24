`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Steven Phan
 * Email:	 1anh21@gmail.com
 * Filename: dec3to8.v
 * Date:     October 23, 2017
 * Version:  1.0
 * Purpose:  
 *					
 * Notes:	 
 *******************************************************************************/
module dec3to8(X, En, Y);
    input      [2:0] X;
    input            En;
    output reg [7:0] Y;

	always @ (X or En) begin
	    if(En==0)
		    Y = 8'b00000000;
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
			    default: Y = 8'b0000_0000;
		endcase
	end
endmodule

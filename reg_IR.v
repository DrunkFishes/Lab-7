`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:21 11/25/2017 
// Design Name: 
// Module Name:    reg_IR 
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
module reg_IR(clk, reset, ld, Din, Dout);
	input 		  clk, reset, ld;
	input  [15:0] Din;
	output [15:0] Dout; reg [15:0] Dout;
	
    // behavioral section for writing to the register
    always@ (posedge clk or posedge reset)
        if (reset)
            Dout <= 16'b0;
	    else
            if(ld)
		        Dout <= Din;
            else
		        Dout <= Dout;
    
endmodule

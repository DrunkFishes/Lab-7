`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Steven Phan
 * Email:	 1anh21@gmail.com
 * Filename: reg16.v
 * Date:     October 23, 2017
 * Version:  1.0
 * Purpose:  
 *					
 * Notes:	 
 *******************************************************************************/
module reg16(clk, reset, ld, Din, DA, DB, oeA, oeB);
	input 		  clk, reset, ld, oeA, oeB;
	input  [15:0] Din;
	output [15:0] DA, DB;
	reg    [15:0] Dout;
	
    // behavioral section for writing to the regisdter
    always@ (posedge clk or posedge reset)
        if (reset)
            Dout <= 16'b0;
	    else
            if (ld)
		        Dout <= Din;
            else
		        Dout <= Dout;
	
    // conditional continout assignments for reading th3e register
    assign DA = oeA ? Dout : 16'hz;
    assign DB = oeB ? Dout : 16'hz;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:40 11/18/2017 
// Design Name: 
// Module Name:    CPU_EU 
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
module CPU_EU(clk, reset, Din, we, addr_sel, sel, ld_pc, count_pc, ld_ir, 
              C, N, Z, Addr_out, Dout);

	input clk, reset, we, sel, addr_sel, ld_pc, count_pc, ld_ir;
	input [15:0] Din; 
	
	output wire   C,N,Z;
	output wire [15:0] Addr_out, Dout;
	
	wire [15:0] Reg_out, Alu_out, ir_Q, pc_Q;
	
									//(clk, reset, W_En, S_Sel, W_Adr,     R_Adr,     S_Adr, Alu_  Op,         DS, 
	integer_datapath  IDCP	  (clk, reset, W_EN, sel,   ir_Q[8:6], ir_Q[8:6], ir_Q[2:0],   ir_Q[15:12],Din,
	
									//C, N, Z, Reg_Out, Alu_Out);
									 C, N, Z, Reg_out,  Dout);
	
	
					// (clk, reset, ld,    count,    Din,  Dout)
	Reg_16   PC  (clk, reset, ld_pc, count_pc, Dout, pc_Q);
	Reg_16   IR  (clk, reset, ld_ir, count_pc, Din,  ir_Q);
	
	
	assign Addr_out = (addr_sel)? Reg_out: pc_Q;

endmodule

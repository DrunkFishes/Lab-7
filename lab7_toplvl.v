`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:23:23 11/24/2017 
// Design Name: 
// Module Name:    lab7_toplvl 
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
module lab7_toplvl(clk, reset, step, mem_w, w_en, addr_sel, s_sel, pc_ld, pc_inc, ir_ld, An, a, b, c, d, e, f, g);
    input clk, reset, step, mem_w, w_en, addr_sel, s_sel, pc_ld, pc_inc, ir_ld;
    output a, b, c, d, e, f, g;
    output [7:0] An;
    
    wire        clk500_out, step_clk, memw_en, C, N, Z;
    wire [15:0] CPU_Addr, CPU_Dout, Addr, Dout;
    
    //clk_500Hz(clk_in, reset, clk_out)
    clk_500Hz   clk500(clk, reset, clk500_out);
    
    //one_shot(D_in, clk_in, reset, D_out)
    one_shot    btd(step, clk500_out, reset, step_clk);
    one_shot    btl(mem_w, clk500_out, reset, memw_en);
    
    //CPU_EU       (clk, reset,     Din  ,  we , addr_sel,  sel , ld_pc, count_pc, ld_ir, C, N, Z, Addr_out,   Dout  )
    CPU_EU      cpu(clk, reset, Addr_Dout, w_en, addr_sel, s_sel, pc_ld,  pc_inc , ir_ld, C, N, Z, CPU_Addr, CPU_Dout);
    
    //ram          (clk, we, [15:0]addr,[15:0] din,[15:0] dout)
    ram         mem(clk, memw_en, CPU_Addr, CPU_Dout, Addr_Dout);
    
    //display_controller           (clk, reset, An,           D         , a, b, c, d, e, f, g)
    display_controller      display(clk, reset, An, {CPU_Addr, CPU_Dout}, a, b, c, d, e, f, g);

endmodule

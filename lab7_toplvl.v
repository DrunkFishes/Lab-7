`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Benjamin Adinata
 * Email:	 benjaminadinata@yahoo.com
 * Filename: lab7_toplvl.v
 * Date:     November 26, 2017
 * Version:  1.0
 * Purpose:  The purpose of this module is to interconnect the CPU_EU, Memory,
 *           and Display to execute the instructions stored  in memory. We also
 *           had 2 debounced switches used for the clk step and memory write
 *           enable.
 *					
 * Notes:	 The ram module was loaded with the ram_256x16_lab7Fa17.coe file.
 *******************************************************************************/
module lab7_toplvl(clk, reset, step, mem_w, w_en, addr_sel, s_sel, pc_ld, 
                   pc_inc, ir_ld, An, a, b, c, d, e, f, g);
                   
    input        clk, reset, step, mem_w, w_en, addr_sel, s_sel, pc_ld, pc_inc,
                 ir_ld;
    output       a, b, c, d, e, f, g;
    output [7:0] An;
    
    wire         clk500_out, step_clk, memw_en, C, N, Z;
    wire  [15:0] CPU_Addr, CPU_Dout, Addr_Dout;
    
    //clk_500Hz       (clk_in, reset,   clk_out )
    clk_500Hz   clk500(  clk , reset, clk500_out);
    
    //one_shot     ( D_in,   clk_in  , reset,   D_out )
    one_shot    btd( step, clk500_out, reset, step_clk);
    one_shot    btl(mem_w, clk500_out, reset,  memw_en);
    
    //CPU_EU       (   clk  , reset,     Din  ,  we , addr_sel,  sel , ld_pc,
    CPU_EU      cpu(step_clk, reset, Addr_Dout, w_en, addr_sel, s_sel, pc_ld,
    //             count_pc, ld_ir, C, N, Z, Addr_out,   Dout  )
                    pc_inc , ir_ld, C, N, Z, CPU_Addr, CPU_Dout);
    
    //ram          (clk,    we  ,   addr  ,    din  ,    dout  )
    ram         mem(clk, memw_en, CPU_Addr, CPU_Dout, Addr_Dout);
    
    //display_controller           (clk, reset, An,           D         ,
    display_controller      display(clk, reset, An, {CPU_Addr, CPU_Dout},
    //                              a, b, c, d, e, f, g)
                                    a, b, c, d, e, f, g);

endmodule

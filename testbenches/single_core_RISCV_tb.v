`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 07:54:22
// Design Name: 
// Module Name: single_core_RISCV_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module single_core_RISCV_tb(
    );
    reg clk, rst;
    
    single_cycle_top Single_Cycle_Top(.clk(clk),.rst(rst));
    
//    initial begin
//        $dumpfile("Single Cycle.vcd");
//        $dumpvar(0, single_core_RISCV_tb);
//    end
    
    always begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
        rst= 1'b0;
        #150;
        rst=1'b1 ;
        #500;
        $finish;
    end   
endmodule

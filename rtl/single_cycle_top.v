`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2025 07:59:56
// Design Name: 
// Module Name: single_cycle_top
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


module single_cycle_top(
input clk,rst
    );
    
    wire [31:0] PC_top, RD_Instr, RD1_top, Imm_ext_top, ALUResult, ReadData, PC_Plus4, Result, RD2_top, SrcB;
    wire RegWrite, ResultSrc, MemWrite, ALUSrc;
    wire [2:0] ALUControl_top;
    wire [1:0] ImmSrc;
    
    pc PC(
        .clk(clk), 
        .rst(rst), 
        .PC(PC_top), 
        .PC_next(PC_Plus4));
        
    PC_adder PC_Adder(
        .a(PC_top),
        .b(32'd4),
        .c(PC_Plus4)
        );
    
    inst_mem Instruction_Memory(
        .rst(rst), 
        .A(PC_top), 
        .RD(RD_Instr));
    
    reg_file Register_File(
        .clk(clk), 
        .rst(rst),
        .we3(RegWrite), 
        .A1(RD_Instr[19:15]), 
        .A2(RD_Instr[24:20]), 
        .A3(RD_Instr[11:7]), 
        .RD1(RD1_top), 
        .RD2(RD2_top), 
        .WD3(Result));
    
    sign_extender Sign_Ext(
        .in(RD_Instr),
        .imm_ext(Imm_ext_top),
        .ImmSrc(ImmSrc[0]));
        
        
    mux Mux_Register_to_ALU(
                            .a(RD2_top),
                            .b(Imm_Ext_top),
                            .s(ALUSrc),
                            .c(SrcB));
    
    alu ALU( 
        .A(RD1_top),
        .B(SrcB),
        .ALUControl(ALUControl_top), 
        .Result(ALUResult), 
        .Carry(), 
        .OverFlow(), 
        .Zero(), 
        .Negative());
        
    control_unit_top Control_Unit_Top(
        .Op(RD_Instr[6:0]),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(),
        .funct3(RD_Instr[14:12]),
        .funct7(RD_Instr[6:0]),
        .ALUControl(ALUControl_top));
        
    data_memory Data_Memory(
        .clk(clk),
        .rst(rst),
        .we(MemWrite),
        .A(ALUResult),
        .WD(RD2_top),
        .RD(ReadData));
        
        
    mux Mux_DataMemory_to_Register(
                            .a(ALUResult),
                            .b(ReadData),
                            .s(ResultSrc),
                            .c(Result)
    );
        
    
        
endmodule

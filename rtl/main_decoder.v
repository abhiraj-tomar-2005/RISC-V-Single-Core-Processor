`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2025 22:53:38
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
input [6:0]op_code,
output ResultSrc,MemWrite,RegWrite,Branch,ALUSrc,
output [1:0] ImmSrc, ALUOp
    );
  
 
  
 assign RegWrite=(op_code==7'b0000011|op_code==7'b0110011)?1'b1:1'b0;
 assign ImmSrc=(op_code==7'b0100011)?2'b01:(op_code==7'b1100011)?2'b10:2'b00;
 assign ALUSrc=(op_code==7'b0000011|op_code==7'b0100011)?1'b1:1'b0;  
 assign MemWrite=(op_code==7'b0100011)?1'b1:1'b0;
 assign ResultSrc=(op_code==7'b0000011)?1'b1:1'b0;
 assign Branch=(op_code==7'b1100011)?1'b1:1'b0;
 assign ALUOp=(op_code==7'b0110011)?2'b10:(op_code==7'b1100011)?2'b01:2'b00;

    
endmodule

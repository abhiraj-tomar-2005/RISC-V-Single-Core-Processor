`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2025 08:29:46
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(
output [31:0] imm_ext,
input [31:0] in, 
input ImmSrc 
    );
    
    assign imm_ext = (ImmSrc == 1'b1) ? ({{20{in[31]}},in[31:25],in[11:7]}):
                                        {{20{in[31]}},in[31:20]};           //extracting the value of immediate from the opcode, based on I-type or S-type instruction (because both of them have different bits assigned to the immediate value) 
endmodule                                                                   //and also extending the sign    

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2025 07:28:26
// Design Name: 
// Module Name: reg_file
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


module reg_file(
input clk, we3, rst,
input [4:0] A1,A2,A3,
input [31:0] WD3,
output [31:0] RD1,RD2
    );
    
    reg [31:0] registers [0:31];
    
    assign RD1=(~rst)?32'h00000000: registers[A1];
    assign RD2=(~rst)?32'h00000000: registers[A2]; 
    always @ (posedge clk) begin 
        if (we3==1)
            registers[A3]<=WD3;   
    end
    
    initial begin
        registers[5]=32'h00000005;
        registers[6]=32'h00000004;
    end
    
endmodule

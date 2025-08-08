`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2025 07:09:00
// Design Name: 
// Module Name: pc
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

module pc(
input [31:0] PC_next,
input rst,clk,
output reg [31:0] PC
);
    always @(posedge clk) begin //To update PC in every clock cycle we used Sequqntial Logic
        if(rst==1'b0)
            PC <=32'h00000000;
        else 
            PC<=PC_next;
    end
endmodule

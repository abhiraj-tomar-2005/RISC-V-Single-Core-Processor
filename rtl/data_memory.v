`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2025 07:50:26
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input clk,we,rst,
input [31:0] A,WD,
output [31:0] RD
);
    
    reg [31:0] data_mem [1023:0];  //creating a memory with 1024 cells each of 32 bits 
    
    
    always @ (posedge clk) begin
        if (we)
        data_mem[A]<= WD;
    end
    
    assign RD = (~rst) ? 32'd0 : data_mem[A];
    
//    initial begin
//        data_mem[28] = 32'h00000020;
//        data_mem[40] = 32'h00000002;
//        //mem[40] = 32'h00000002;
//    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2025 23:55:19
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
input [31:0]A, //address port
input rst, 
output [31:0]RD //read port
    );
    
   reg [31:0] Mem [0:1023]; //a mem named register, which has let's say 1024 "cells", each of 32-bits
    assign RD=(rst==1'b0)? 32'h00000000 : Mem[A[31:2]]; //we have implemented memory here, with an active low reset
    
    initial begin
//        Mem[0]=32'hFFC4A303;   
//        Mem[1]=32'h00832383;      //these are for Load Instructions

//          Mem[0]=32'h0064A423;
//          Mem[1]=32'h00B62423; //these are for S-Type Instructions

//           Mem[0]=32'h0062E233;   //for R-type Instruction

        $readmemh("memfile.hex",Mem);
           
    end
endmodule

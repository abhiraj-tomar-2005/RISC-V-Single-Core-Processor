`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhiraj Tomar
// 
// Create Date: 18.07.2025 08:32:43
// Module Name: alu
// Project Name: RISC-V Single Core 
//////////////////////////////////////////////////////////////////////////////////


module alu(
input [31:0] A,B,
input [2:0]  ALUControl,
output [31:0] Result,
output Carry, OverFlow, Zero, Negative
);

wire [31:0] sum;
wire Cout;
assign {Cout,sum}= (ALUControl[0]==1'b0)?A+B:(A+((~B)+1));

assign Result= (ALUControl==3'b000)? sum:
                        (ALUControl==3'b001)?sum:
                        (ALUControl==3'b010)?A&B:
                        (ALUControl==3'b011)? A|B:
                        (ALUControl==3'b101)?{{31{1'b0}},(sum[31])}:{32{1'b0}};
                        
assign OverFlow = ((sum[31]^ A[31]) & (~(ALUControl[0]^ B[31] ^ A[31])) & (~ALUControl[1])); //checking is the result is overflowing the set limit of bits

assign Carry = ((~ALUControl[1]) & Cout); 
assign Zero=&(~Result); //to check if the result is all zeroes, &(~Result): this performs and on every bit of the Result
assign Negative= Result[31]; //to check if the result is negative
endmodule

//***What I tried to make just by reading the circuit Diagram:-***
//module alu(
//input [31:0] A,B,
//input [2:0]  ALUControl,
//output [31:0] Result,
//);
//wire [31:0] sum;
//reg [31:0] mux_out;
//reg [31:0] result;
//reg [31:0] sum;
////wire [31:0] ab_and,ab_or,not_B;
////assign ab_and=A&B;
////assign ab_or=A|B;
////assign not_B= ~B;

//always @(*) begin
////not_B= ~B;
//    case (ALUControl)
//        2'b000: mux_out=B;
//        2'b001: mux_out=~B;
//    endcase
//    sum = A + mux_out +ALUControl[0];
//end
//always @(*) begin
//    case (ALUControl)
//        2'b000: result=sum;
//        2'b001: result=sum;
//        2'b010: result=A&B;
//        2'b011: result=A|B;
//    endcase
//end
//endmodule

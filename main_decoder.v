`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 11:31:30 AM
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
input wire [5:0] opcode,
output reg regWrite, regDest, aluSrc, branch, memWrite, memtoReg, 
output reg [1:0] aluOp
    );
    
    always @(*)
    begin
    case (opcode)
    6'b000000 : 
    begin
    regWrite = 1; regDest = 1; aluSrc = 0; branch = 0; memWrite = 0; memtoReg = 0; aluOp = 2'b10; 
    end
    
    6'b100011 :
    begin
    regWrite = 1; regDest = 0; aluSrc = 1; branch = 0; memWrite = 0; memtoReg = 1; aluOp = 2'b00; 
    end
    
    6'b101011 :
    begin
    regWrite = 0; regDest = 1'bx; aluSrc = 1; branch = 0; memWrite = 1; memtoReg = 1'bx; aluOp = 2'b0; 
    end
    
    6'b000100 :
    begin
    regWrite = 0; regDest = 1'bx; aluSrc = 0; branch = 1; memWrite = 0; memtoReg = 1'bx; aluOp = 2'b01; 
    end 
    
    default :
    begin
    regWrite = 0; regDest = 0; aluSrc = 0; branch = 0; memWrite = 0; memtoReg = 0; aluOp = 2'b00; 
    end
    
    endcase
    
    
    end
endmodule

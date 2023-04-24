`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 11:44:13 AM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
input wire [1:0] aluOp,
input wire [5:0] funct5,
output reg [2:0] aluControl
    );
    
    always @(*)
    begin
    case({aluOp, funct5})
    8'b00xxxxxx : aluControl = 3'b010;   // add
    8'bx1xxxxxx : aluControl = 3'b110;   // subtract
    8'b1x100000 : aluControl = 3'b010;   // add
    8'b1x100010 : aluControl = 3'b110;   // subtract
    8'b1x100100 : aluControl = 3'b000;   // and
    8'b1x100101 : aluControl = 3'b001;   // or
    8'b1x101010 : aluControl = 3'b111;   // set less than
    //8'b1x100000 : aluControl = 3'b010;   // add
    default : aluControl = 3'b000;
    endcase
    end
endmodule

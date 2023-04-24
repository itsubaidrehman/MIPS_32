`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:27:29 AM
// Design Name: 
// Module Name: alu
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


module alu (
input wire [31:0] a, b,
input wire [2:0] aluControl,
output reg [31:0] result,
output wire z
    );
    
    always @(*)
    begin
    case (aluControl)
    3'b000 : result = a & b;
    3'b001 : result = a | b;
    3'b010 : result = a + b;
    //3'b011 : result = ;
    //3'b100 : result = ;
    //3'b101 : result = ;
    3'b110 : result = a-b ;
    //3'b111 : result = ;
    default : result = 0;
    endcase
    
    
    end
    assign z = ((a - b) == 0) ? 1 : 0;
endmodule

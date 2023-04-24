`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:17:27 PM
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
//input wire [1:0] aluOp,
input wire [5:0] funct5,
input wire [5:0] opcode,
output wire regWrite, regDest, aluSrc, branch, memWrite, memtoReg, 
//output wire [1:0] aluOp,
output wire [2:0] aluControl
    );
    
    //instantiating the aluDecoder and main decoder module to have a single control unit
    wire [1:0] aluOp;
    main_decoder main_decoder (
    .opcode(opcode),
    .regWrite(regWrite),
    .regDest(regDest), 
    .aluSrc(aluSrc), 
    .branch(branch), 
    .memWrite(memWrite), 
    .memtoReg(memtoReg),
    .aluOp(aluOp)
    );
    
    alu_decoder alu_decoder (
    .aluOp(aluOp),
    .funct5(funct5),
    .aluControl(aluControl)
    );
endmodule

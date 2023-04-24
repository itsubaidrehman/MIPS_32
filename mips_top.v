`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:43:10 PM
// Design Name: 
// Module Name: mips_top
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


module mips_top (
input wire clk, rst
    );
    
    wire PCSrc;  // o/p of and gate, to be used as input of mux i.e before the program counter
    wire zero;  //o/p of ALU
    
     wire regWrite, regDest, aluSrc, branch, memWrite, memtoReg; // o/p of control unit, these signal tell the control path how to behave
     wire [5:0] funct5, opcode;  // o/p of control unit, these signal tell the control path how to behave
     wire [2:0] aluControl;   // o/p of control unit, these signal tell the control path how to behave, used as inpput to ALU
     
     wire [31:0] PC_next_in, PC_out;  // PC_next_in - wire connected with the input of program counter and output of mux
     wire [31:0] PCPlus4, PCbranch;
     
     wire [31:0] instr;  // o/p of instr mem, generate the instructions
     wire [31:0] result;
     
     wire [31:0] SrcA, SrcB, writeData; //SrcA, writeData - o/p of reg file from rd1 and rd2, writeData is used as i/p to wd of data mem
     
     wire [31:0] SignImm;  //o/p of sign extended block, used as input to mux b/w reg and ALU as well as i/p of left shift block
     
     wire [31:0] aluResult;  //wire connected to the o/p of ALU  and i/p of data mem on A port
     
     wire [31:0] read_data;  // o/p of data mem from rd port
     
     wire [31:0] writeReg;  //input to the A3 port of reg file and o/p of the mux after reg file
    
    gate_and gate (
    .a(branch),
    .b(zero),
    .out(PCSrc)
    );
    
    controlUnit controlUnit (
    .funct5(funct5),
    .opcode(opcode),
    .regWrite(regWrite), 
    .regDest(regDest), 
    .aluSrc(aluSrc), 
    .branch(branch), 
    .memWrite(memWrite), 
    .memtoReg(memtoReg),
    .aluControl(aluControl)
    
    );
    
    mux mux_before_pc (
    .in1(PCPlus4),
    .in2(PCbranch),
    .sel(PCSrc),
    .mux_out(PC_next_in)
    );
    
    program_counter program_counter (
    .clk(clk),
    .rst(rst),
    .PC_next(PC_next_in),
    .PC(PC_out)
    );
    
    instr_mem instr_mem (
    .rst(rst),
    .a(PC_out),
    .rd(instr)
    );
    
    reg_file reg_file (
    .a1(instr[25:21]),
    .a2(instr[20:16]),
    .a3(writeReg[4:0]),
    .clk(clk),
    .we3(regWrite),
    .rst(rst),
    .wd3(result),
    .rd1(SrcA),
    .rd2(writeData)
    );
    
    mux mux_after_reg_file (
    .in1(instr[20:16]),
    .in2(instr[15:11]),
    .sel(regDest),
    .mux_out(writeReg)
    );
    
    mux mux_bw_reg_file_and_alu (
    .in1(writeData),
    .in2(SignImm),
    .sel(aluSrc),
    .mux_out(SrcB)
    );
    
    alu alu (
    .a(SrcA),
    .b(SrcB),
    .aluControl(aluControl),
    .result(aluResult),
    .z(zero)
    );
    
    data_mem data_mem (
    .a(aluResult),
    .wd(writeData),
    .we(memWrite),
    .clk(clk),
    .rst(rst),
    .rd(read_data)
    );
    
    mux mux_after_data_mem (
    .in1(aluResult),
    .in2(read_data),
    .sel(memtoReg),
    .mux_out(result)
    );
    
    pc_add pc_adder (
    .in1(PC_out),
    .add(PCPlus4)
    );
    
    sign_extend sign_extended (
    .in(instr[15:0]),
    .out_extended(SignImm)
    );
    
    wire [31:0] shift_out;
    left_shift2 left_shift(
    .in(SignImm),
    .out(shift_out)
    );
    
    adder adder (
    .in1(shift_out),
    .in2(PCPlus4),
    .out(PCbranch)
    );
    
    
    
endmodule

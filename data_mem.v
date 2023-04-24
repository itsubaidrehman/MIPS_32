`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:05:50 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input wire [31:0] a, wd,
input wire we, clk, rst,
output reg [31:0] rd
    );
    reg [31:0] registers [1023:0];
    always @(posedge clk)
    begin
    if (rst)
    rd <= 0;
    else if (we)
    registers[a] <= wd;
    else
    rd <= registers[a];
    end
endmodule

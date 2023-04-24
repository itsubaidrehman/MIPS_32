`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 09:56:47 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
input wire [4:0] a1, a2, a3, 
input wire [31:0] wd3,
input wire clk, we3, rst,
output reg [31:0] rd1, rd2
    );
    
    reg [31:0] registers [31:0];
    always @(posedge clk)
    begin
    if (rst)
    registers[a3] <= 0;
    else if (we3) 
    registers[a3] <= wd3;
    else
    begin
    rd1 <= registers[a1];
    rd2 <= registers[a2];
    end
    
    end
endmodule

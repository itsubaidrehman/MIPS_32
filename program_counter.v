`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 09:47:12 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk, rst,
input wire [31:0] PC_next,
output reg [31:0] PC
    );
    always @(posedge clk)
    begin
    if (rst)
    PC <= 0;
    else
    PC <= PC_next;
    end
endmodule

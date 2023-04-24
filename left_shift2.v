`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:45:18 AM
// Design Name: 
// Module Name: left_shift2
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


module left_shift2(
input wire [31:0] in,
output wire [31:0] out
    );
    
    assign out = {in[29:0], 2'b00};
endmodule

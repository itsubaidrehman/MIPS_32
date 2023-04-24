`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:42:57 AM
// Design Name: 
// Module Name: pc_add
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


module pc_add(
input wire [31:0] in1,
output wire [31:0] add
    );
    
    assign add = in1 + 32'd4;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:35:45 AM
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
input wire [15:0] in,
output wire [31:0] out_extended
    );
    
    //assign out_extended = (in[31]) ? {{16{in[31]}}, in[15,0]} : { {16{in[31]}}, in[15,0]}; 
    assign out_extended = { {16{in[15]}} , in };
endmodule

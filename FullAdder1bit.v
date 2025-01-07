`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2024 19:10:57
// Design Name: 
// Module Name: FullAdder1bit
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


module FullAdder1bit(input a, input b, input Cin,
                     output sum, output Cout);
                     
   assign sum = a ^ b ^ Cin;
   assign Cout = (a & b) | (Cin & (a ^ b));
         
endmodule

`timescale 1ns / 1ps

module Multiplier(input [19:0] a, input [19:0] b,
                  output [39:0] mul);
                  
   assign mul = a * b;
              
endmodule

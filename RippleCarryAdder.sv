`timescale 1ns / 1ps

module RippleCarryAdder(
    input [39:0] a,    // 40-bit input A
    input [39:0] b,    // 40-bit input B
    input Cin,         // Carry-in for the least significant bit
    output [39:0] sum, // 40-bit sum output
    output Cout        // Carry-out from the most significant bit
);

    wire [39:0] carry; // Internal carry signals
    
    genvar i;
    generate
        for (i = 0; i < 40; i = i + 1) begin
            case (i)
                0: FullAdder1bit FA (.a(a[i]), .b(b[i]), .Cin(0), .sum(sum[i]), .Cout(carry[i]));
                
                39: FullAdder1bit FA (.a(a[i]), .b(b[i]), .Cin(carry[i-1]), .sum(sum[i]), .Cout(cout));
                
                default: FullAdder1bit FA (.a(a[i]), .b(b[i]), .Cin(carry[i-1]), .sum(sum[i]), .Cout(carry[i]));  
            endcase
            
        end

    endgenerate

endmodule
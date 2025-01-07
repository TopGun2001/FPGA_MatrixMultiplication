`timescale 1ns / 1ps

module calculate #(parameter aRow = 1, 
                   parameter aCol = 1,
                   parameter bRow = 1,
                   parameter bCol = 1)
                          
                  (input [19:0] a[0:aCol-1], 
                   input [19:0] b[0:bRow-1][0:bCol-1],
                   output reg [39:0] vals[0:bCol-1]);



    integer i, j;                         

    wire [39:0] product[0:bCol-1][0:bRow-1];        // Wires to hold multiplication results
    wire [39:0] sum[0:bCol-1][0:bRow-1];            // Wires to hold intermediate addition results
    wire carry [0:bCol-1][0:bRow-1];                // Wires for carry-out from adders

    // Instantiate multipliers
    genvar r, c;
    generate
        for (r = 0; r < bCol; r = r + 1) begin : row
            for (c = 0; c < bRow; c = c + 1) begin : col
                Multiplier multiplier_inst (
                    .a(a[c]),         // Element from the vector
                    .b(b[c][r]),      // Corresponding element from the matrix
                    .mul(product[r][c])
                );
            end
        end
    endgenerate

    // Instantiate adders to accumulate the results for each row
    generate
        for (r = 0; r < bCol; r = r + 1) begin : adder_row
            for (c = 0; c < bRow; c = c + 1) begin : adder_col
                if (c == 0) begin
                    // First adder in the row (initialize with 0)
                    RippleCarryAdder adder_inst (
                        .a(40'd0),                   // Initialize sum to 0
                        .b(product[r][c]),           // Extend product to 40 bits
                        .Cin(1'b0),                  // No carry-in for the first adder
                        .sum(sum[r][c]),             // Sum output
                        .Cout(carry[r][c])           // Carry output
                    );
                end else begin
                    // Add subsequent products
                    RippleCarryAdder adder_inst (
                        .a(sum[r][c - 1]),           // Previous sum
                        .b(product[r][c]),           
                        .Cin(carry[r][c - 1]),       // Carry from the previous adder
                        .sum(sum[r][c]),             // Sum output
                        .Cout(carry[r][c])           // Carry output
                    );
                end
            end
        end
    endgenerate

    // Assign final sums to vals
    always @(*) begin
        for (i = 0; i < bCol; i = i + 1) begin
            vals[i] = sum[i][bRow-1]; // Final sum for each row
        end
    end

endmodule

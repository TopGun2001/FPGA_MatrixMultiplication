`timescale 1ns / 1ps

module MatrixMultiplier #(parameter aRow = 1, 
                          parameter aCol = 1,
                          parameter bRow = 1,
                          parameter bCol = 1)
                          
                        (input [19:0] a[0:aRow-1][0:aCol-1], 
                         input [19:0] b[0:bRow-1][0:bCol-1],
                         output [39:0] mul[0:aRow-1][0:bCol-1]);

    wire [39:0] rows[0:aRow-1][0:bCol-1];

    genvar i;
    generate 
        for(i = 0; i < aRow; i += 1) begin
            calculate #(aRow,aCol,bRow,bCol) executeEachRow (a[i], b, rows[i]); //each row of Matrix A multiplied with matrix B
        end
    endgenerate 

    assign mul = rows;

endmodule

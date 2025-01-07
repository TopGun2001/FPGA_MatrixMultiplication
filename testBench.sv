`timescale 1ns / 1ps

module testBench();

    // Parameters
    parameter aRow = 5;
    parameter aCol = 3;
    parameter bRow = 3;
    parameter bCol = 6;

    // Matrices
    reg [19:0] a[0:aRow-1][0:aCol-1];
    reg [19:0] b[0:bRow-1][0:bCol-1];
    wire [39:0] vals[0:aRow-1][0:bCol-1];

    // Instantiate the MatrixMultiplier module
    MatrixMultiplier #(aRow, aCol, bRow, bCol) uut (
        .a(a),
        .b(b),
        .mul(vals)
    );


    integer i;

    initial begin
        a[0][0] = 1000; a[0][1] = 2000; a[0][2] = 3000;
        a[1][0] = 4000; a[1][1] = 5000; a[1][2] = 6000;
        a[2][0] = 7000; a[2][1] = 8000; a[2][2] = 9000;
        a[3][0] = 10000; a[3][1] = 11000; a[3][2] = 12000;
        a[4][0] = 13000; a[4][1] = 14000; a[4][2] = 15000;

        b[0][0] = 111111; b[0][1] = 222222; b[0][2] = 333333; b[0][3] = 444444; b[0][4] = 555555; b[0][5] = 666666;
        b[1][0] = 777777; b[1][1] = 888888; b[1][2] = 999999; b[1][3] = 101010; b[1][4] = 111111; b[1][5] = 121212;
        b[2][0] = 131313; b[2][1] = 141414; b[2][2] = 151515; b[2][3] = 161616; b[2][4] = 171717; b[2][5] = 181818;
        
        $display("____________________________________________________________________________________________________");
        // Display the input matrices and output matrix
        $display("Matrix A:");
        for (i = 0; i < aRow; i = i + 1) begin
            $display("%d %d %d", a[i][0], a[i][1], a[i][2]);
        end

        $display("\nMatrix B:");
        for (i = 0; i < bRow; i = i + 1) begin
            $display("%d %d %d %d %d %d", b[i][0], b[i][1], b[i][2], b[i][3], b[i][4], b[i][5]);
        end
        
        #50;
        $display("\nResultant Matrix (A * B):");
        for (i = 0; i < aRow; i = i + 1) begin
            $display("%d %d %d %d %d %d", vals[i][0], vals[i][1], vals[i][2], vals[i][3], vals[i][4], vals[i][5]);
        end
        
        $display("____________________________________________________________________________________________________");
        $finish;
    end
endmodule
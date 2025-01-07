# Matrix Multiplication using System Verilog
This is a simple matrix multiplication project implemented in System Verilog HDL for educational purposes. 
I wanted to learn how to execute matrix multiplication in parallel.
I am not sure if my code can be optimized further. Please do suggest any improvements if can be made.
#
I will explain the 3 most imporant files in the project. The remaining are self-explanatory when you see the code.

### MatrixMultiplier.sv 
* This system verilog file uses ***generate*** to instantiate the matrix multiplication for each row of matrix A with every element in matrix B.
* Assume both matrices are of size 3x3. Each row in matrix A is to multiplied with every column in matrix B and the corresponding product is stored in each row of the final matrix.

### calculate.sv 
* This file is the most important part of the whole program and it can be split into 2 parts:
  - First generate block: calculates the product for each element in matrix A with every element in matrix B. Stored in ***wire product***.
  - Second generate bloc: calculates the corresponding sum value in final matrix by adding all products as per matrix multiplication rules. ***wire sum***
* The final sum for each element in the final matrix is basically the addition of all products stored in ***wire product***.
* The last always(*) block extracts the final sum from the last element of ***wire sum***.

### testBench.sv 
* The file named testBench.sv contains the code for simulation.
* For now I have chosen the maximum value of an element in a matrix to be within ***20 bits*** for simplicity purposes.
* You can set the dimensions of the matrices A and B using ***arow, acol, brow, bcol***. Make sure ***acol == brow*** as per matrix multiplication rules.
* In my testbench, I have set matrix A to be of size **5x3** and matrix B to be of size **3x6**. The final matrix is of size **5x6**.
#

Visit [Matrix Multiplication Calculator](https://matrix.reshish.com/multiplication.php) to verify the final matrix.

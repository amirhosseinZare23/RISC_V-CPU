module SQRT_Unit # (
    parameter WIDTH = 32,
    parameter FBITS = 10
) (
    input CLK,
    input [1 : 0] stage,

    input [6 : 0] opcode,
    input [6 : 0] funct7,
    input funct7_valid,

    input [31 : 0] bus_rs1,

    output reg [31 : 0] sqrt_output,
    output reg sqrt_busy
);

    /*

     Write your codes here
    
    */

endmodule
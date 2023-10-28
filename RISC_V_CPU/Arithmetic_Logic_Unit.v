module Arithmetic_Logic_Unit #(parameter FLEN = 10) 
(
    input [6 : 0] opcode,
    input [6 : 0] funct7,
    input funct7_valid,

    input [31 : 0] bus_rs1,
    input [31 : 0] bus_rs2,
    input [31 : 0] immediate,

    output reg [31 : 0] alu_output
);
    /*

     Write your codes here
    
    */
endmodule
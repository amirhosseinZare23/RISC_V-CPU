`include "Instruction_Memory.v"

module Fetch_Unit 
(
    input [1 : 0] stage,
    input [31 : 0] PC,

    output [31 : 0] instruction
);
    wire enable;
    assign enable = (stage == 3);

    Instruction_Memory Imem (
    .ImemReadEnable(enable),
    .ImemReadAddress(PC/4),
    .ImemReadData(instruction)
    );

    /*

     Write your codes here
    
    */
    
endmodule
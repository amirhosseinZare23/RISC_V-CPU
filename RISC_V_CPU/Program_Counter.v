`include "Register.v"

module Program_Counter 
(
    input CLK,
    input Reset,
    input [1 : 0] stage,

    input branch_enable,
    input [31 : 0] immediate,

    output [31 : 0] PC
);
    wire [31:0] branch_target;
    wire [31:0] next_PC, PC_register_input;
    wire enable;


    assign branch_target = PC + immediate;
    assign next_PC = branch_enable ? branch_target : PC + 4;
    assign PC_register_input = Reset ? 32'b0 - 4 : next_PC;
    assign enable = ((stage == 3) | (Reset)) ? 1 : 0;
    Register PC_register (CLK, enable, PC_register_input, PC);

endmodule
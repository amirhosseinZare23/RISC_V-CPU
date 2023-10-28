module Control_Unit 
(
    input [31 : 0] instruction,
    input [1 : 0] stage,

    output branch_instruction,
    output reg [31 : 0] immediate,

    output reg [6 : 0] opcode,
    output reg [6 : 0] funct7,
    output reg funct7_valid,

    output reg [4 : 0] read_index_1,
    output reg [4 : 0] read_index_2,
    output reg [4 : 0] write_index,

    output IRF_read_enable_1,
    output IRF_read_enable_2,
    output IRF_write_enable,

    output FRF_read_enable_1,
    output FRF_read_enable_2,
    output FRF_write_enable
);
    reg [31:0] IR;
    reg [3:0] IR_type;
    reg [4:0] Type_Buff;
    reg [2:0] funct3;

    initial begin
        Type_Buff = 4'b0000;

    end
    // Assign the instruction based on the stage-Part A
    always @ (*) begin
        if (stage == 2'b01) // Instruction Decode
        IR <= instruction;
        Type_Buff <= {IR[6:5] , IR[4:2] };

        case ( Type_Buff )
        5'b00000: IR_type = 3'b001; // I
        5'b00001: IR_type = 3'b001;
        5'b00100: IR_type = 3'b001;
        5'b00110: IR_type = 3'b001;
        5'b11001: IR_type = 3'b001;
        5'b00101: IR_type = 3'b100; // U
        5'b01101: IR_type = 3'b100;
        5'b01000: IR_type = 3'b010; // S
        5'b01001: IR_type = 3'b010;
        5'b01011: IR_type = 3'b000; // R
        5'b01100: IR_type = 3'b000;
        5'b01110: IR_type = 3'b000;
        5'b10100: IR_type = 3'b000;
        5'b11000: IR_type = 3'b011; // B
        5'b11011: IR_type = 3'b101; // J
        default: IR_type = 3'b111; // Default to unknown type
    endcase
    // Extract the immediate value-Part B //
    // Immediate assignment for I-type instructions
    if (IR_type == 3'b001) begin
        immediate = { {21{IR[31]}}, IR[30:20] };
    end
    // Immediate assignment for S-type instructions
    else if (IR_type == 3'b100) begin
        immediate = { {21{IR[31]}}, IR[30:25], IR[11:7] };
    end
    // Immediate assignment for B-type instructions
    else if (IR_type == 3'b011) begin
        immediate = { {20{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0 };
    end
    // Immediate assignment for U-type instructions
    else if (IR_type == 3'b100) begin
        immediate = { IR[31:12], IR[11:8], 11'b0 };
    end
    // Immediate assignment for J-type instructions
    else if (IR_type == 3'b101) begin
        immediate = { {12{IR[31]}}, IR[19:12], IR[20], IR[30:21], 1'b0 };
    end
    //Extract other fields of the instruction register-Part C //
    case( IR_type )
    3'b001 :begin           // R
        opcode = IR[6:0];
        write_index = IR[10:7];
        funct3 = IR[14:12];
        read_index_1 = IR[19:15];
        read_index_2 = IR[24:20];
        funct7 = IR[31:25];
        funct7_valid = 1'b1;
    end
    3'b100 :begin           // I
        opcode = IR[6:0];
        write_index = IR[10:7];
        funct3 = IR[14:12];
        read_index_1 = IR[19:15];
        funct7_valid = 1'b0;
    end
    3'b010 : begin          // S
        opcode = IR[6:0];
        funct3 = IR[14:12];
        read_index_1 = IR[19:15];
        read_index_2 = IR[24:20];
        funct7_valid = 1'b0;
    end
    3'b000 : begin          // B
        opcode = IR[6:0];
        funct3 = IR[14:12];
        read_index_1 = IR[19:15];
        read_index_2 = IR[24:20];
        funct7_valid = 1'b0;
    end
    3'b011 : begin          // U
        opcode = IR[6:0];
        write_index = IR[10:7];
        funct7_valid = 1'b0;
    end
    3'b101 : begin          // J
        opcode = IR[6:0];
        write_index = IR[10:7];
        funct7_valid = 1'b0;
    end
    default : begin
        opcode = 0;
        write_index = 0;
        funct3 = 0;
        read_index_1 = 0;
        read_index_2 = 0;
        funct7 = 0;
        funct7_valid = 0;
    end
    endcase
    end

    assign branch_instruction = (opcode == 7'b1100011) ? 1'b1 : 1'b0; // according to instruction type table for B-type
    assign IRF_read_enable_1 = 1'b1; // Enable IRF read port 1 for all operations
    assign IRF_read_enable_2 = (opcode[5] == 1'b1) ? 1'b1 : 1'b0; // Enable IRF read port 1 for MUL & ADD operations
    assign IRF_write_enable = 1'b0; // Enable IRF write for all operations

    assign FRF_read_enable_1 = 1'b1; // Enable FRF read port 1 for all operations
    assign FRF_read_enable_2 = (opcode == 7'b1010011) ? 1'b1 : 1'b0; // Enable FRF read port 2 for F-type instructions (opcode = 7'b1010011)
    assign FRF_write_enable = (opcode == 7'b1010011) ? 1'b1 : 1'b0; // Enable FRF write for F-type instructions (opcode = 7'b1010011)

endmodule
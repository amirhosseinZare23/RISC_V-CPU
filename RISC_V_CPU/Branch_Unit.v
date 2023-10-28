module Branch_Unit 
(
    input [1 :0] stage,
    input branch_instruction,

    input [31 : 0] bus_rs1,
    input [31 : 0] bus_rs2,

    output reg branch_enable
);
    always @(*) begin
    // Check condition for branch instruction (BLT)
    if (stage == 2'b01) begin
        if (branch_instruction == 1'b1) begin
            if (bus_rs1 < bus_rs2) begin
                branch_enable = 1'b1; // Branch condition is true
            end
            else begin
                branch_enable = 1'b0; // Branch condition is false
            end
            end
        else begin
            branch_enable = 1'b0; // Branch condition is false for non-branch instructions
        end
    end
    else begin
        branch_enable = 1'b0; // Default branch condition is false
    end
    end

endmodule
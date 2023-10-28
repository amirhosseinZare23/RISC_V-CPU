`include "Data_Memory.v"

module Load_Unit 
(
    input [1 : 0] stage,
    input [6 : 0] opcode,

    input [31 : 0] bus_rs1,
    input [31 : 0] immediate,

    output reg [31 : 0] load_unit_output
);

wire memory_read_enable;
wire [31:0] memory_read_output;

reg [31:0] address_reg;
    
Data_Memory data_mem (
    .DmemWriteEnable(1'b0),
    .DmemReadEnable(memory_read_enable),
    .DmemAddress(address_reg),
    .DmemWriteData(32'b0),
    .DmemReadData(memory_read_output)
);

always @(stage) begin
    if (stage == 2)
      address_reg <= bus_rs1 + immediate;
end

assign memory_read_enable = (stage == 3) && (opcode == 7'b0000011); // default values for stage and upcode 

always @(*) begin
    if (memory_read_enable)
      load_unit_output <= memory_read_output;
    else
      load_unit_output <= 32'bz;
end
	
endmodule
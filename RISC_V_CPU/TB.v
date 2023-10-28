`include "Fetch_Unit.v"
`timescale 1ns / 1ps
module TB(
    );

reg [1 : 0] tstage;
reg [31 : 0] tPC;
wire [31 : 0] tinstruction;

Fetch_Unit uut(tstage, tPC, tinstruction);

initial
begin
$dumpfile("t0.vcd");
$dumpvars(0,TB);
tstage = 2;
tPC = 7;
#10
tstage = 3;
tPC = 7;
#10
tstage = 3;
tPC = 13;
#10

$finish;
end
/*reg tCLK = 0; //PC
reg tReset;
reg [1 : 0] tstage;
reg tbranch_enable;
reg [31 : 0] timmediate;
wire [31 : 0] tPC;

Program_Counter uut(tCLK, tReset, tstage, tbranch_enable, timmediate, tPC);

always tCLK = #5 ~tCLK;

initial
begin
$dumpfile("t0.vcd");
$dumpvars(0,TB);
tReset = 1;
tstage = 2;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
tReset = 0;
tstage = 3;
tbranch_enable = 1;
timmediate = 52;
#100
tReset = 1;
tstage = 3;
tbranch_enable = 0;
timmediate = 52;
#100
$finish;
end*/
/*
reg [1 :0] tstage;
reg tbranch_instruction;
reg [31 : 0] tbus_rs1;
reg [31 : 0] tbus_rs2;
wire tbranch_enable;

Branch_Unit uut(tstage, tbranch_instruction, tbus_rs1, tbus_rs2, tbranch_enable);

initial
begin
  $dumpfile("t0.vcd");
  $dumpvars(0,TB);
  tbranch_instruction = 1'b0;
  tstage = 1;
  tbus_rs1 = 3;
  tbus_rs2 = 5;
  #1000;
  tbranch_instruction = 1'b1; 
  tstage = 0;
  #1000;
  tbranch_instruction = 1'b1; 
  tstage = 1;
  #1000;
  $finish;
end*/


/*reg [31:0] tinstruction;
reg [1:0] tstage;
wire tbranch_instruction;
wire [31 : 0] timmediate;

wire [6 : 0] topcode;
wire [6 : 0] tfunct7;
wire tfunct7_valid;

wire [4 : 0] tread_index_1;
wire [4 : 0] tread_index_2;
wire [4 : 0] twrite_index;

wire tIRF_read_enable_1;
wire tIRF_read_enable_2;
wire tIRF_write_enable;

wire tFRF_read_enable_1;
wire tFRF_read_enable_2;
wire tFRF_write_enable;

Control_Unit uut( tinstruction, tstage, tbranch_instruction, timmediate,
                  topcode, tfunct7, tfunct7_valid, tread_index_1, tread_index_2,
                  twrite_index, tIRF_read_enable_1, tIRF_read_enable_2, tIRF_write_enable,
                  tFRF_read_enable_1, tFRF_read_enable_2, tFRF_write_enable
);

initial
begin
$dumpfile("t0.vcd");
$dumpvars(0,TB);
tinstruction = 32'h00000533;  // add x10 x0 x0
tstage = 0;
#1000
tinstruction = 32'h00000533;  // add x10 x0 x0
tstage = 1;
#1000;
tinstruction = 32'h00100593;  // addi x11 x0 1
tstage = 1;
#1000;
tinstruction = 32'h021081B3;  // mul x3 x1 x1
tstage = 1;
#1000;
$finish;
end*/
/*
reg [1 : 0] tstage;
reg [6 : 0] topcode;
reg [31 : 0] tbus_rs1;
reg [31 : 0] timmediate;
wire [31 : 0] tload_unit_output;

Load_Unit uut (
  .stage(tstage),
  .opcode(topcode),
  .bus_rs1(tbus_rs1),
  .immediate(timmediate),
  .load_unit_output(tload_unit_output)
);
	
initial
begin
$dumpfile("t0.vcd");
$dumpvars(0,TB);
tstage = 0;topcode = 0;tbus_rs1 = 0;timmediate = 0;
#1000
tstage = 1;topcode = 15;tbus_rs1 = 5;timmediate = 8;
#1000
tstage = 2;topcode = 12;tbus_rs1 = 8;timmediate = 6;
#1000
tstage = 3;topcode = 5;tbus_rs1 = 1;timmediate = 2;
#1000
tstage = 3;topcode = 3;tbus_rs1 = 1;timmediate = 2;
#1000
$finish;
end*/
endmodule

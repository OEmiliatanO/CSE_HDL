/////////////////////////////////////////////////////////////////
// GLOBAL PARAMETER DEFINITIONS
`define WORD_SIZE 32    // bits in data registers and address
`define HWORD_SIZE 16   // instruction word size
`define REG_FILE_SIZE 8 // number of general-purpose registers

// OPCODE DEFINITIONS
// Undefined Instruction Thumb Opcode
`define UNDEFINED_INSTRUCTION 16'hDE00 // 16 = `HWORD_SIZE
// Internal Encoding for Thumb Instructions Supported in "thumb.v"
`define ADC        6'b00_0000
`define ADD_1      6'b00_0001
`define ADD_2      6'b00_0010
`define ADD_3      6'b00_0011
`define ADD_5      6'b00_0100
`define ADD_6      6'b00_0101
`define ADD_7      6'b00_0110
`define AND        6'b00_0111
`define ASR_1      6'b00_1000
`define ASR_2      6'b00_1001
`define B_1        6'b00_1010
`define B_2        6'b00_1011
`define BIC        6'b00_1100
`define BL_BLX_H10 6'b00_1101
`define BL_BLX_H11 6'b00_1110
`define CMN        6'b00_1111
`define CMP_1      6'b01_0000
`define CMP_2      6'b01_0001
`define EOR        6'b01_0010
`define LDMIA      6'b01_0011
`define LDR_1      6'b01_0100
`define LDR_2      6'b01_0101
`define LDR_3      6'b01_0110
`define LDR_4      6'b01_0111
`define LDRB_1     6'b01_1000
`define LDRB_2     6'b01_1001
`define LDRH_1     6'b01_1010
`define LDRH_2     6'b01_1011
`define LDRSB      6'b01_1100
`define LDRSH      6'b01_1101
`define LSL_1      6'b01_1110
`define LSL_2      6'b01_1111
`define LSR_1      6'b10_0000
`define LSR_2      6'b10_0001
`define MOV_1      6'b10_0010
`define MUL        6'b10_0011
`define MVN        6'b10_0100
`define NEG        6'b10_0101
`define ORR        6'b10_0110
`define POP_R0     6'b10_0111
`define POP_R1     6'b10_1000
`define PUSH_R0    6'b10_1001
`define PUSH_R1    6'b10_1010
`define ROR        6'b10_1011
`define SBC        6'b10_1100
`define STMIA      6'b10_1101
`define STR_1      6'b10_1110
`define STR_2      6'b10_1111
`define STR_3      6'b11_0000
`define STRB_1     6'b11_0001
`define STRB_2     6'b11_0010
`define STRH_1     6'b11_0011
`define STRH_2     6'b11_0100
`define SUB_1      6'b11_0101
`define SUB_2      6'b11_0110
`define SUB_3      6'b11_0111
`define SUB_4      6'b11_1000
`define SWI        6'b11_1001
`define TST        6'b11_1010
`define UNDEF      6'b11_1111
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
// MODULE: Pipelined CPU for THUMB microprocessor: thumb.v
// Author: Sunggu Lee
// Created: July 31, 2003
// Last Modified: August 22, 2003
// Description: Implements the instruction set for the THUMB
//   microprocessor described in the "ARM Architecture Reference
//   Manual" ([ARM 2000]).  The SWI (software interrupt) instr.
//   is reimplemented as a HALT.  Currently, a few instructions
//   are not implemented due to a desire to keep the design
//   relatively simple.  Unimplemented instructions are ARM
//   Version 5 Thumb instructions, instructions using the high
//   (R8-R15) registers, LDMIA, STMIA, and PUSH and POP with the
//   PC register or multiple registers.  The specific
//   unimplemented instructions, as listed in [ARM 2000], are
//   ADD(4), BKPT, BLX(H=01), BLX(2), BX, CMP(3), LDMIA, MOV(3),
//   POP(>1 register), POP(PC), PUSH(>1 register), PUSH(PC),
//   STMIA, and SWI (implemented as HALT only).

// INCLUDE files
//`include "thumb_defs.vh"    // global constant definitions

// IF: Instruction Fetch Stage
module IF(reset_n, clk, OLD_PC, branch_taken, branch_target, instruction, 
          read_instruction_n, IF_IR, IF_PC, PC);
  input reset_n, clk;
  input [`WORD_SIZE-1:0] OLD_PC;
  input branch_taken;
  input [`WORD_SIZE-1:0] branch_target;
  input [`HWORD_SIZE-1:0] instruction;
  
  output reg read_instruction_n;
  output reg [`HWORD_SIZE-1:0] IF_IR;    // IR value stored at end of IF
  output reg [`WORD_SIZE-1:0] IF_PC;           // saved PC value
  output reg [`WORD_SIZE-1:0] PC;

  always @(negedge reset_n or posedge clk) begin
    if (~reset_n) begin
      PC <= 0;              // start fetching from location 0
      read_instruction_n <= 0; // and start memory read
      IF_IR <= 0;
      IF_PC <= 0;
      PC <= 0;
    end
    else begin        // on positive clock edge,
      // execute operations and then save values in pipeline reg
      read_instruction_n <= 0; // read next instruction
      if (branch_taken) begin  // determine next instruction
        PC <= branch_target;   // operation for IF stage
        IF_IR <= `UNDEFINED_INSTRUCTION;  // to create a pipeline 
        IF_PC <= branch_target;           // stall (bubble)
      end
      else begin
        PC <= PC + 2;         // operation for IF stage
        IF_IR <= instruction; // read instruction and store in IR
        IF_PC <= PC + 2;      // save next instruction address
      end
    end
  end  // of IF stage
endmodule

// ID: Instruction Decode Stage
module ID (reset_n, clk, Rin, IF_PC, branch_taken, IF_IR, 
          ID_PC, ID_Rd, ID_Rn, ID_Rm_Rs, ID_cond, ID_Rd_code, ID_opcode, ID_imm_offset);
  input reset_n, clk;
  input [`WORD_SIZE*`REG_FILE_SIZE-1:0] Rin;
  input [`WORD_SIZE-1:0] IF_PC;
  input branch_taken;
  input [`HWORD_SIZE-1:0] IF_IR;

  output reg [`WORD_SIZE-1:0] ID_PC;
  output reg [`WORD_SIZE-1:0] ID_Rd, ID_Rn, ID_Rm_Rs; // Rd, Rn, Rm/Rs
  output reg [3:0] ID_cond;        // ARM condition code (same as THUMB)
  output reg [2:0] ID_Rd_code;
  output reg [5:0] ID_opcode;
  output reg [10:0] ID_imm_offset; // immediate, offset or register list

  wire [`WORD_SIZE-1:0] R[`REG_FILE_SIZE-1:0];
  genvar g;
  generate
  for (g = 0; g < `REG_FILE_SIZE; g=g+1) begin : REG
    assign R[g] = Rin[`WORD_SIZE*(g+1)-1 : `WORD_SIZE*g];
  end
  endgenerate
  
  always @(negedge reset_n or posedge clk) begin
    if (~reset_n) begin
      ID_PC <= 0;
      ID_Rd <= 0;
      ID_Rn <= 0;
      ID_Rm_Rs <= 0;
      ID_cond <= 0;
      ID_Rd_code <= 0;
      ID_opcode <= 0;
      ID_imm_offset <= 0;
    end
    else begin
      case (IF_IR[`HWORD_SIZE-1:13])
        3'b000: begin // shift by immediate or add/sub
          case (IF_IR[12:11])
            2'b11: begin
              case (IF_IR[10:9])
                2'b10: begin // if imm = 000, same as MOV_2
                  ID_opcode <= `ADD_1;
                  ID_imm_offset[2:0] <= IF_IR[8:6];
                  ID_Rn <= R[IF_IR[5:3]];
                  ID_Rd <= R[IF_IR[2:0]];
                  ID_Rd_code <= IF_IR[2:0];
                end
                2'b00: begin
                  ID_opcode <= `ADD_3;
                  ID_Rm_Rs <= R[IF_IR[8:6]];
                  ID_Rn <= R[IF_IR[5:3]];
                  ID_Rd <= R[IF_IR[2:0]];
                  ID_Rd_code <= IF_IR[2:0];
                end
                2'b11: begin
                  ID_opcode <= `SUB_1;
                  ID_imm_offset[2:0] <= IF_IR[8:6];
                  ID_Rn <= R[IF_IR[5:3]];
                  ID_Rd <= R[IF_IR[2:0]];
                  ID_Rd_code <= IF_IR[2:0];
                end
                default: begin // == case 2'b01
                  ID_opcode <= `SUB_3;
                  ID_Rm_Rs <= R[IF_IR[8:6]];
                  ID_Rn <= R[IF_IR[5:3]];
                  ID_Rd <= R[IF_IR[2:0]];
                  ID_Rd_code <= IF_IR[2:0];
                end
              endcase
            end // of case IF_IR[12:11] = 2'b11
            2'b10: begin
              ID_opcode <= `ASR_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            2'b00: begin
              ID_opcode <= `LSL_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            default: begin // == case 2'b01
              ID_opcode <= `LSR_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
          endcase
        end // of case IF_IR[15:13] = 3'b000
        3'b001: begin // add/sub/compare/move immediate
          case (IF_IR[12:11])
            2'b10: begin
              ID_opcode <= `ADD_2;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b01: begin
              ID_opcode <= `CMP_1;
              ID_Rn <= R[IF_IR[10:8]];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b00: begin
              ID_opcode <= `MOV_1;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            default: begin // == case 2'b11
              ID_opcode <= `SUB_2;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
          endcase
        end // of case IF_IR[15:13] = 3'b001
        3'b010: begin // data processing
          casex (IF_IR[12:6])
            7'b000_0101: begin
              ID_opcode <= `ADC;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0000: begin
              ID_opcode <= `AND;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0100: begin
              ID_opcode <= `ASR_2;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1110: begin
              ID_opcode <= `BIC;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1011: begin
              ID_opcode <= `CMN;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rn <= R[IF_IR[2:0]];
            end
            7'b000_1010: begin
              ID_opcode <= `CMP_2;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rn <= R[IF_IR[2:0]];
            end
            7'b000_0001: begin
              ID_opcode <= `EOR;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0010: begin
              ID_opcode <= `LSL_2;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0011: begin
              ID_opcode <= `LSR_2;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0111: begin
              ID_opcode <= `ROR;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_0110: begin
              ID_opcode <= `SBC;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1101: begin
              ID_opcode <= `MUL;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1111: begin
              ID_opcode <= `MVN;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1001: begin
              ID_opcode <= `NEG;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1100: begin
              ID_opcode <= `ORR;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b000_1000: begin
              ID_opcode <= `TST;
              ID_Rm_Rs <= R[IF_IR[5:3]];
              ID_Rn <= R[IF_IR[2:0]];
            end
            7'b1100_xxx: begin
              ID_opcode <= `LDR_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b01_xxxxx: begin
              ID_opcode <= `LDR_3;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            7'b1110_xxx: begin
              ID_opcode <= `LDRB_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1101_xxx: begin
              ID_opcode <= `LDRH_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1011_xxx: begin
              ID_opcode <= `LDRSB;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1111_xxx: begin
              ID_opcode <= `LDRSH;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1000_xxx: begin
              ID_opcode <= `STR_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1010_xxx: begin
              ID_opcode <= `STRB_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            7'b1001_xxx: begin
              ID_opcode <= `STRH_2;
              ID_Rm_Rs <= R[IF_IR[8:6]];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            default: ID_opcode <= `UNDEF;
          endcase
        end // of case IF_IR[15:13] = 3'b010
        3'b011: begin // load/store word/byte immediate offset
          case (IF_IR[12:11])
            2'b01: begin
              ID_opcode <= `LDR_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            2'b11: begin
              ID_opcode <= `LDRB_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            2'b00: begin
              ID_opcode <= `STR_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            default: begin // == case 2'b10
              ID_opcode <= `STRB_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
          endcase
        end // of case IF_IR[15:13] = 3'b011
        3'b100: begin // other load/store
          case (IF_IR[12:11])
            2'b11: begin
              ID_opcode <= `LDR_4;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b01: begin
              ID_opcode <= `LDRH_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
            2'b10: begin
              ID_opcode <= `STR_3;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            default: begin // == case 2'b00
              ID_opcode <= `STRH_1;
              ID_imm_offset[4:0] <= IF_IR[10:6];
              ID_Rn <= R[IF_IR[5:3]];
              ID_Rd <= R[IF_IR[2:0]];
              ID_Rd_code <= IF_IR[2:0];
            end
          endcase
        end // of case IF_IR[15:13] = 3'b100
        3'b101: begin // add to SP/PC or Miscellaneous
          case (IF_IR[12:11])
            2'b00: begin // add to PC and store in Rd
              ID_opcode <= `ADD_5;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b01: begin // add to SP and store in Rd
              ID_opcode <= `ADD_6;
              ID_Rd <= R[IF_IR[10:8]];
              ID_Rd_code <= IF_IR[10:8];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b10: begin // add imm_7 to SP
              case (IF_IR[10:8])
                3'b000: begin
                  if (IF_IR[7] == 1'b0) begin
                    ID_opcode <= `ADD_7;
                    ID_imm_offset[6:0] <= IF_IR[6:0];
                  end
                  else begin // IF_IR[7] == 1'b1
                    ID_opcode <= `SUB_4;
                    ID_imm_offset[6:0] <= IF_IR[6:0];
                  end
                end
                3'b100: begin
                  ID_opcode <= `PUSH_R0;
                  ID_imm_offset[7:0] <= IF_IR[7:0];
                end
                3'b101: begin
                  ID_opcode <= `PUSH_R1;
                  ID_imm_offset[7:0] <= IF_IR[7:0];
                end
                default: ID_opcode <= `UNDEF;
              endcase
            end // of case IF_IR[12:11] = 2'b10
            default: begin // == case 2'b11
              case (IF_IR[10:8])
                3'b100: begin
                  ID_opcode <= `POP_R0;
                  ID_imm_offset[7:0] <= IF_IR[7:0];
                end
                3'b101: begin
                  ID_opcode <= `POP_R1;
                  ID_imm_offset[7:0] <= IF_IR[7:0];
                end
                default: ID_opcode <= `UNDEF;
              endcase
            end // of case IF_IR[12:11] = 2'b11 (default)
          endcase
        end // of case IF_IR[15:13] = 3'b101
        3'b110: begin // load/store multiple, branch, interrupt
          case (IF_IR[12:11])
            2'b01: begin
              ID_opcode <= `LDMIA;
              ID_Rn <= R[IF_IR[10:8]];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            2'b00: begin
              ID_opcode <= `STMIA;
              ID_Rn <= R[IF_IR[10:8]];
              ID_imm_offset[7:0] <= IF_IR[7:0];
            end
            default: begin // has (IF_IR[12] == 1'b1)
              if (IF_IR[11:8] == 4'b1110) ID_opcode <= `UNDEF;
              else if (IF_IR[11:8] == 4'b1111) begin
                ID_opcode <= `SWI; // SWI used as HALT instruction
                ID_imm_offset[7:0] <= IF_IR[7:0];
              end
              else begin // others are valid conditional branch
                ID_opcode <= `B_1;
                ID_cond <= IF_IR[11:8];
                ID_imm_offset[7:0] <= IF_IR[7:0];
              end
            end // of case IF_IR[12] = 1'b1 (default)
          endcase
        end // of case IF_IR[15:13] = 3'b110
        3'b111: begin // uncond. branch or subroutine call (BL)
          case (IF_IR[12:11])
            2'b00: begin
              ID_opcode <= `B_2;
              ID_imm_offset <= IF_IR[10:0];
            end
            2'b10: begin
              ID_opcode <= `BL_BLX_H10;
              ID_imm_offset <= IF_IR[10:0];
            end
            2'b11: begin
              ID_opcode <= `BL_BLX_H11;
              ID_imm_offset <= IF_IR[10:0];
            end  // note: H=01 is not supported in T Variant 4
            default: ID_opcode <= `UNDEF;
          endcase
        end // of case IF_IR[15:13] = 3'b111
        default: ID_opcode <= `UNDEF; // added for completeness
      endcase
      // check for branch, and insert bubble if branch
      if (branch_taken)
        ID_opcode <= `UNDEF;
      // save other pipeline register values
      ID_PC <= IF_PC;
    end
  end  // of ID stage
endmodule

// EX: Instruction Execution Stage
module EX(reset_n, clk, Rin, SP_in, ID_PC, ID_Rd, ID_Rn, ID_Rm_Rs, ID_cond, ID_Rd_code, ID_opcode, ID_imm_offset, LR_in, ALU_out_in, C_Flag_in, N_Flag_in, Z_Flag_in, V_Flag_in, 
          branch_taken, branch_target, read_data_n, write_data_n, EX_opcode, ALU_out, EX_ALU_out, EX_imm_offset, EX_Rd_code, SP, LR, DR, C_Flag, N_Flag, Z_Flag, V_Flag, data_address);
  input reset_n, clk;
  input [`WORD_SIZE*`REG_FILE_SIZE-1:0] Rin;
  input [`WORD_SIZE-1:0] SP_in;
  input [`WORD_SIZE-1:0] ID_PC;
  input [`WORD_SIZE-1:0] ID_Rd, ID_Rn, ID_Rm_Rs; // Rd, Rn, Rm/Rs
  input [3:0] ID_cond;        // ARM condition code (same as THUMB)
  input [2:0] ID_Rd_code;
  input [5:0] ID_opcode;
  input [10:0] ID_imm_offset; // immediate, offset or register list
  input [`WORD_SIZE-1:0] LR_in;
  input [`WORD_SIZE:0] ALU_out_in;
  input C_Flag_in, N_Flag_in, Z_Flag_in, V_Flag_in;

  // Function and Task Definitions
  // Function to check condition codes
  function condition_passed;
    input [3:0] cond_code;  // 4-bit Thumb/ARM condition code
  begin
    case (cond_code)  // codes in Table 3-1 of [ARM 2000]
      4'b0000: condition_passed = Z_Flag_in;  // EQ (equal)
      4'b0001: condition_passed = ~Z_Flag_in; // NE (not equal)
      4'b0010: condition_passed = C_Flag_in;  // CS/HS (carry set)
      4'b0011: condition_passed = ~C_Flag_in; // CC (carry clear)
      4'b0100: condition_passed = N_Flag_in;  // MI (minus)
      4'b0101: condition_passed = ~N_Flag_in; // PL (plus)
      4'b0110: condition_passed = V_Flag_in;  // VS (overflow)
      4'b0111: condition_passed = ~V_Flag_in; // VC (no overflow)
      4'b1000: condition_passed = (C_Flag_in & (~Z_Flag_in)); // HI
      4'b1001: condition_passed = ((~C_Flag_in) & Z_Flag_in); // LS
      4'b1010: condition_passed = (N_Flag_in == V_Flag_in);  // GE
      4'b1011: condition_passed = (N_Flag_in != V_Flag_in);  // LT
      4'b1100: condition_passed = ~Z_Flag_in & (N_Flag_in == V_Flag_in);
                                           // GT (greater than)
      4'b1101: condition_passed = Z_Flag_in & (N_Flag_in != V_Flag_in);
                                           // LE (less or eq)
      4'b1110: condition_passed = 1'b1;    // AL (always)
      default: condition_passed = 1'b1; // note: 4'b1111 invalid
    endcase
  end  // of function body
  endfunction  // of function condition_passed

  output reg branch_taken;
  output reg [`WORD_SIZE-1:0] branch_target;
  output reg read_data_n, write_data_n;
  output reg [5:0] EX_opcode;
  output reg [`WORD_SIZE:0] ALU_out;
  output reg [`WORD_SIZE-1:0] EX_ALU_out;
  output reg [7:0] EX_imm_offset;  // 8 bits required in WB stage
  output reg [2:0] EX_Rd_code;  // Rd register number
  output reg [`WORD_SIZE-1:0] SP;
  output reg [`WORD_SIZE-1:0] LR;
  output reg [`WORD_SIZE-1:0] DR;
  output reg C_Flag, N_Flag, Z_Flag, V_Flag;
  output reg [`WORD_SIZE-1:0] data_address;

  integer i, found_i;
  wire [`WORD_SIZE-1:0] R[`REG_FILE_SIZE-1:0];
  genvar g;
  generate
    for (g = 0; g < `REG_FILE_SIZE; g=g+1) begin : REG2
      assign R[g] = Rin[`WORD_SIZE*(g+1)-1:`WORD_SIZE*g];
    end
  endgenerate

  always @(negedge reset_n or posedge clk) begin
    if (~reset_n) begin
      branch_taken <= 1'b0;  // initialize to branch not taken
      branch_target <= 0;
      read_data_n <= 1'b0;   // disable data memory
      write_data_n <= 1'b0;
      EX_opcode <= 0;
      ALU_out = 0;
      EX_ALU_out <= 0;
      EX_imm_offset <= 0;
      EX_Rd_code <= 0;
      SP <= 0;
      LR <= 0;
      DR <= 0;
      C_Flag <= 0;
      N_Flag <= 0;
      Z_Flag <= 0;
      V_Flag <= 0;
      data_address <= 0;
    end
    else begin  // on positive clock edge
      read_data_n <= 1'b1;   // set default values for data mem.
      write_data_n <= 1'b1;
      if (branch_taken) begin
        EX_opcode <= `UNDEF;
        branch_taken <= 1'b0;
      end
      else begin
        case (ID_opcode)  // 1st part of EX operations
          `ADC: ALU_out = ID_Rd + ID_Rm_Rs + C_Flag;
          `ADD_1: ALU_out = ID_Rn + ID_imm_offset[2:0];
          `ADD_2: ALU_out = ID_Rd + ID_imm_offset[7:0];
          `ADD_3: ALU_out = ID_Rn + ID_Rm_Rs;
          `ADD_5: EX_ALU_out <= (ID_PC & 33'hfffffffc)
            + {ID_imm_offset[7:0], 2'b00}; // 33 = `WORD_SIZE+1
          `ADD_6: EX_ALU_out <= SP + {ID_imm_offset[7:0], 2'b00};
          `ADD_7: SP <= SP + {ID_imm_offset[7:0], 2'b00};
          `AND: ALU_out = ID_Rd & ID_Rm_Rs;
          `ASR_1: begin
            if (ID_imm_offset[4:0] == 0) begin
              if (ID_Rm_Rs[`WORD_SIZE-1] == 0)
                ALU_out = 0;
              else
                ALU_out = 33'h1ffffffff; //(`WORD_SIZE+1) = 33
            end
            else begin  // imm != 0
              ALU_out = {1'b0, ID_Rm_Rs};
              for (i = 0;  i < `WORD_SIZE;  i = i + 1) begin
                if (i < ID_imm_offset[4:0]) begin
                  {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]} =
                    {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]} >> 1;
                  ALU_out[`WORD_SIZE-1] = ID_Rm_Rs[`WORD_SIZE-1];
                end // of if
              end // of for
            end // of else if imm != 0
          end // of case `ASR_1
          `ASR_2: begin
            if (ID_Rm_Rs[7:0] < `WORD_SIZE) begin
              ALU_out = {1'b0, ID_Rd};
              for (i = 0;  i < `WORD_SIZE;  i = i + 1) begin
                if (i < ID_Rm_Rs[7:0]) begin
                  {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]} =
                    {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]} >> 1;
                  ALU_out[`WORD_SIZE-1] = ID_Rd[`WORD_SIZE-1];
                end // of if
              end // of for
            end // of if (Rs[7:0] < `WORD_SIZE)
            else begin // Rs[7:0] >= `WORD_SIZE
              if (ID_Rd[`WORD_SIZE-1] == 0)
                ALU_out = 0;
              else // Rd[`WORD_SIZE-1] == 1
                ALU_out = 33'h1ffffffff; // (`WORD_SIZE+1) = 33
            end // of else if Rs[7:0] >= `WORD_SIZE
          end // of case `ASR_2
          `B_1: begin  // conditional branch
            if (condition_passed(ID_cond)) begin
              for (i = `WORD_SIZE-1;  i > 8;  i = i - 1)
                ALU_out[i] = ID_imm_offset[7]; // sign-extension
              ALU_out[8:1] = ID_imm_offset[7:0];
              ALU_out[0] = 1'b0;
              branch_taken <= 1'b1;
              branch_target <= ID_PC+2 + ALU_out[`WORD_SIZE-1:0];
            end
          end // of case `B_1
          `B_2: begin  // unconditional branch
            for (i = `WORD_SIZE-1;  i > 11;  i = i - 1)
              ALU_out[i] = ID_imm_offset[10]; // sign-extension
            ALU_out[11:1] = ID_imm_offset[10:0];
            ALU_out[0] = 1'b0;
            branch_taken <= 1'b1;
            branch_target <= (ID_PC+2) + ALU_out[`WORD_SIZE-1:0];
          end // of case `B_2
          `BIC: ALU_out[`WORD_SIZE-1:0] = ID_Rd & (~ID_Rm_Rs);
          `BL_BLX_H10: begin
            for (i = `WORD_SIZE-1;  i > 22;  i = i - 1)
              ALU_out[i] = ID_imm_offset[10];
            ALU_out[22:12] = ID_imm_offset[10:0];
            for (i = 11;  i >= 0;  i = i - 1)
              ALU_out[i] = 1'b0;
            LR <= ID_PC + ALU_out[`WORD_SIZE-1:0];
          end // of case `BL_BLX_H10
          `BL_BLX_H11: begin
            ALU_out = LR + {ID_imm_offset[10:0], 1'b0};
            branch_taken <= 1'b1;
            branch_target <= ALU_out[`WORD_SIZE-1:0];
            LR <= ALU_out[`WORD_SIZE-1:0] | 'h00000001;
          end // of case `BL_BLX_H11
          `CMN: ALU_out = ID_Rn + ID_Rm_Rs;
          `CMP_1: ALU_out = ID_Rn - ID_imm_offset[7:0];
          `CMP_2: ALU_out = ID_Rn - ID_Rm_Rs;
          `EOR: ALU_out = ID_Rd ^ ID_Rm_Rs; // Exclusive-OR
          //`LDMIA: null; // currently unimplemented
          `LDR_1: ALU_out = ID_Rn + {ID_imm_offset[4:0], 2'b00};
          `LDR_2, `LDRB_2, `LDRH_2, `LDRSB, `LDRSH:
                  ALU_out = ID_Rn + ID_Rm_Rs;
          `LDR_3: ALU_out = {ID_PC[`WORD_SIZE-1:2], 2'b00}
                            + {ID_imm_offset[7:0], 2'b00};
          `LDR_4: ALU_out = SP + {ID_imm_offset[7:0], 2'b00};
          `LDRB_1: ALU_out = ID_Rn + ID_imm_offset[4:0];
          `LDRH_1: ALU_out = ID_Rn + {ID_imm_offset[4:0], 1'b0};
          `LSL_1: ALU_out = {1'b0,ID_Rm_Rs} <<ID_imm_offset[4:0];
          `LSL_2: if (ID_Rm_Rs[7:0] <= `WORD_SIZE)
                    ALU_out = {1'b0, ID_Rd} << ID_Rm_Rs[7:0];
                  else
                    ALU_out = 0;
          `LSR_1: {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]}
                    = {ID_Rm_Rs, 1'b0} >> ID_imm_offset[4:0];         
          `LSR_2: if (ID_Rm_Rs[7:0] <= `WORD_SIZE)
                    {ALU_out[`WORD_SIZE-1:0],ALU_out[`WORD_SIZE]}
                      = {ID_Rd, 1'b0} >> ID_Rm_Rs[7:0];         
                  else
                    ALU_out = 0;
          `MOV_1: ALU_out[`WORD_SIZE-1:0] =
                    {24'b0, ID_imm_offset[7:0]};
          `MUL: ALU_out[`WORD_SIZE-1:0] = ID_Rd * ID_Rm_Rs;
          `MVN: ALU_out[`WORD_SIZE-1:0] = ~ID_Rm_Rs;
          `NEG: ALU_out = 0 - {ID_Rm_Rs[`WORD_SIZE-1], ID_Rm_Rs};
          `ORR: ALU_out[`WORD_SIZE-1:0] = ID_Rd | ID_Rm_Rs;
          `POP_R0: begin // only POP of 1 register supported
            data_address <= SP;
            read_data_n <= 1'b0;
            SP <= SP + 4;
            EX_imm_offset[7:0] <= ID_imm_offset[7:0];
          end // of case `POP_R0
          //`POP_R1: null; // POP(PC) not supported yet
          `PUSH_R0: begin // only PUSH of 1 register supported
            ALU_out[`WORD_SIZE-1:0] = SP - 4;
            found_i = 0;
            for (i = 0;  i < `REG_FILE_SIZE; i = i + 1)
              if (ID_imm_offset[i]) // at least 1 bit must = 1
                found_i = i;
            DR <= R[found_i];
            write_data_n <= 1'b0;
            data_address <= ALU_out[`WORD_SIZE-1:0];
            SP <= ALU_out[`WORD_SIZE-1:0];
            EX_imm_offset[7:0] <= ID_imm_offset[7:0];
          end // of case `PUSH_R0
          //`PUSH_R1: null; // PUSH(PC) not supported yet
          `ROR: {ALU_out[`WORD_SIZE-1:0], ALU_out[`WORD_SIZE]} =
                    {ID_Rd, 1'b0} >> ID_Rm_Rs[4:0];         
          `SBC: ALU_out = ID_Rd - ID_Rm_Rs - (~C_Flag);
          //`STMIA: null; // not supported yet
          `STR_1: ALU_out = ID_Rn + {ID_imm_offset[4:0], 2'b00};
          `STR_2, `STRB_2, `STRH_2:
                  ALU_out = ID_Rn + ID_Rm_Rs;
          `STR_3: ALU_out = SP + {ID_imm_offset[7:0], 2'b00};
          `STRB_1: ALU_out = ID_Rn + ID_imm_offset[4:0];
          `STRH_1: ALU_out = ID_Rn + {ID_imm_offset[4:0], 1'b0};
          `SUB_1: ALU_out = ID_Rn - ID_imm_offset[2:0];
          `SUB_2: ALU_out = ID_Rn - ID_imm_offset[7:0];
          `SUB_3: ALU_out = ID_Rn - ID_Rm_Rs;
          `SUB_4: SP <= SP - {ID_imm_offset[6:0], 2'b00};
          `SWI: begin // currently implemented as a HALT instr.
            branch_taken <= 1'b1;
            branch_target <= ID_PC - 2; // repeat SWI forever
          end
          `TST: begin
            ALU_out = ID_Rn & ID_Rm_Rs;
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
          end
          default: ALU_out = 'bx;  // added for completeness
        endcase
        case (ID_opcode)  // 2nd part of EX operations
          `ADD_1: begin // note: (imm == 000) implies MOV_2
            EX_ALU_out[`WORD_SIZE-1:0] <=ALU_out[`WORD_SIZE-1:0];
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
            if (ID_imm_offset[2:0] != 3'b000) begin  // not MOV_2
              C_Flag <= ALU_out[`WORD_SIZE];
              V_Flag <=
                (ALU_out[`WORD_SIZE] != ALU_out[`WORD_SIZE-1]);
            end
          end
          `ADC, `ADD_2, `ADD_3, `CMN, `CMP_1, `CMP_2,
          `NEG, `SBC, `SUB_1, `SUB_2, `SUB_3, `SUB_4: begin
            EX_ALU_out[`WORD_SIZE-1:0] <= ALU_out[`WORD_SIZE-1:0];
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
            C_Flag <= ALU_out[`WORD_SIZE];
            V_Flag <=
              (ALU_out[`WORD_SIZE] != ALU_out[`WORD_SIZE-1]);
          end
          `ASR_1, `ASR_2, `LSL_1, `LSL_2, `LSR_2: begin
            EX_ALU_out[`WORD_SIZE-1:0] <=ALU_out[`WORD_SIZE-1:0];
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
            C_Flag <= ALU_out[`WORD_SIZE];
          end
          `LDR_1, `LDR_2, `LDR_3, `LDR_4, `LDRB_1, `LDRB_2,
          `LDRH_1, `LDRH_2, `LDRSB, `LDRSH: begin
            data_address <= ALU_out[`WORD_SIZE-1:0];
            read_data_n <= 1'b0;
          end
          `LSR_1: begin
            if (ID_imm_offset[4:0] == 0) begin
              C_Flag <= ALU_out[`WORD_SIZE-1];
              EX_ALU_out[`WORD_SIZE-1:0] <= 'b0;
            end
            else begin
              C_Flag <= ALU_out[`WORD_SIZE];
              EX_ALU_out[`WORD_SIZE-1:0] <=
                ALU_out[`WORD_SIZE-1:0];
            end
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
          end // of case `LSR_1
          `AND, `BIC, `EOR, `MOV_1, `MUL, `MVN, `ORR: begin
            EX_ALU_out[`WORD_SIZE-1:0] <=
              ALU_out[`WORD_SIZE-1:0];
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
          end
          `ROR: begin
            if (ID_Rm_Rs[7:0] == 0)
              EX_ALU_out[`WORD_SIZE-1:0] <= ID_Rd;
            else if (ID_Rm_Rs[4:0] == 0) begin
              C_Flag <= ALU_out[`WORD_SIZE-1];
              EX_ALU_out[`WORD_SIZE-1:0] <= ID_Rd;
            end
            else begin // Rs[4:0] > 0
              C_Flag <= ALU_out[`WORD_SIZE];
              EX_ALU_out[`WORD_SIZE-1:0] <=
                ALU_out[`WORD_SIZE-1:0];
            end
            N_Flag <= ALU_out[`WORD_SIZE-1];
            Z_Flag <= (ALU_out[`WORD_SIZE-1:0] == 0);
          end // of case `ROR
          `STR_1, `STR_2, `STR_3, `STRB_1, `STRB_2, `STRH_1,
          `STRH_2: begin
            data_address <= ALU_out[`WORD_SIZE-1:0];
            DR <= ID_Rd;
            write_data_n <= 1'b0;
          end
          default: EX_ALU_out <= 'bx;
        endcase // of second case
        // then save values into pipeline registers
        EX_opcode <= ID_opcode;
        EX_Rd_code <= ID_Rd_code;
      end // of else (branch not taken)
    end // of else (posedge clk)
  end // of EX stage
endmodule

module WB (reset_n, clk, EX_opcode, EX_Rd_code, EX_ALU_out, EX_imm_offset, data, 
           Rout);
  input reset_n, clk;
  input [5:0] EX_opcode;
  input [2:0] EX_Rd_code;
  input [`WORD_SIZE-1:0] EX_ALU_out;
  input [7:0] EX_imm_offset;
  input [`WORD_SIZE-1:0] data;
  
  output reg [`WORD_SIZE*`REG_FILE_SIZE-1:0] Rout;

  reg [`WORD_SIZE-1:0] R[`REG_FILE_SIZE-1:0];

  integer wb_i;
  integer found_wb_i, i;
  // WB: Write Back Stage (final stage)
  always @(negedge reset_n or posedge clk) begin
    if (~reset_n) begin
        for (wb_i=0; wb_i<`REG_FILE_SIZE; wb_i=wb_i+1)
            R[wb_i] <= 'h00000000;  // initialize general registers
        Rout <= 255'b0;
    end
    else begin
      case (EX_opcode) 
        `ADC, `ADD_1, `ADD_2, `ADD_3, `ADD_5, `ADD_6, `AND,
        `ASR_1, `ASR_2, `BIC, `EOR, `LSL_1, `LSL_2, `LSR_1,
        `LSR_2, `MOV_1, `ROR,
        `SBC, `SUB_1, `SUB_2, `SUB_3, `SUB_4: begin
          R[EX_Rd_code] <= EX_ALU_out;  // write back to Rd
         end
        `LDR_1, `LDR_2, `LDR_3, `LDR_4: begin
          R[EX_Rd_code] <= data;  // read data from data memory
         end
        `LDRB_1, `LDRB_2: begin R[EX_Rd_code] <= {24'b0, data[7:0]}; end
        `LDRH_1, `LDRH_2: begin 
          R[EX_Rd_code] <= {16'b0, data[`HWORD_SIZE-1:0]};
         end
        `LDRSB: if (data[7]) begin
                  R[EX_Rd_code] <= {24'hffffff, data[7:0]};
                end
                else begin
                  R[EX_Rd_code] <= {24'h000000, data[7:0]};
                end
        `LDRSH: if (data[`HWORD_SIZE-1]) begin
                  R[EX_Rd_code] <=             // 16 = `HWORD_SIZE
                    {16'hffff, data[`HWORD_SIZE-1:0]};
                end
                else begin
                  R[EX_Rd_code] <=             // 16 = `HWORD_SIZE
                    {16'h0000, data[`HWORD_SIZE-1:0]};
                end
        `POP_R0: begin
          found_wb_i = 0;
          for (wb_i = 0;  wb_i < `REG_FILE_SIZE;  wb_i = wb_i + 1)
            if (EX_imm_offset[wb_i]) // at least 1 bit must = 1
              found_wb_i = wb_i;
          R[found_wb_i] <= data;
        end // of case `POP_R0
        `UNDEF: found_wb_i = 32'bx;
        default: found_wb_i = 32'bx;
      endcase
      Rout <= {R[7], R[6], R[5], R[4], R[3], R[2], R[1], R[0]};
    end
  end // of WB stage
endmodule

// MODULE DECLARATION
module thumb (read_instruction_n, instruction_address,
              instruction, read_data_n, write_data_n,
              data_address, data, reset_n, clk);
  output read_instruction_n;  // enable read from instruction mem
  output [`WORD_SIZE-1:0] instruction_address; // instr. address
  input [`HWORD_SIZE-1:0] instruction;  // current instruction
  output read_data_n;     // enable read from data memory
  output write_data_n;    // enable write to data memory
  output [`WORD_SIZE-1:0] data_address; // address of data
  inout [`WORD_SIZE-1:0] data;          // current data
  input reset_n;    // active-low RESET signal
  input clk;        // clock signal

  // SIGNAL DECLARATIONS for chip inputs and outputs
  reg read_instruction_n, read_data_n, write_data_n;
  wire [`WORD_SIZE-1:0] instruction_address;
  reg [`WORD_SIZE-1:0] data_address;
  wire [`HWORD_SIZE-1:0] instruction;
  wire [`WORD_SIZE-1:0] data;
  wire reset_n;
  wire clk;
  
  // SIGNAL DECLARATIONS for internal registers and wires
  reg [`WORD_SIZE-1:0] PC;        // program counter = R15
  reg [`WORD_SIZE-1:0] LR;        // link register = R14
  reg [`WORD_SIZE-1:0] SP;        // stack pointer = R13
  reg [`HWORD_SIZE-1:0] IR;       // instruction register
  reg [`WORD_SIZE-1:0] R [`REG_FILE_SIZE-1:0]; // general regs
  reg N_Flag;             // condition flags (N = negative)
  reg Z_Flag;             // (Z = zero)
  reg C_Flag;             // (C = carry)
  reg V_Flag;             // (V = overflow)

  // SIGNAL DECLARATIONS used to aid in the Verilog description
  reg branch_taken;       // indicates a branch has been taken
  reg [`WORD_SIZE-1:0] branch_target; // branch target address
  reg [`WORD_SIZE-1:0] DR;        // holds data to be output
  integer i, wb_i;                // index variables
  integer found_i, found_wb_i;    // used for searching
  // Pipeline Regs (names prefixed with pipeline stage names)
  reg [`HWORD_SIZE-1:0] IF_IR;    // IR value stored at end of IF
  reg [`WORD_SIZE-1:0] IF_PC, ID_PC;           // saved PC value
  reg [`WORD_SIZE-1:0] ID_Rd, ID_Rn, ID_Rm_Rs; // Rd, Rn, Rm/Rs
  reg [`WORD_SIZE-1:0] EX_ALU_out;// ALU_out at end of EX stage
  reg [5:0] ID_opcode, EX_opcode; // internal Thumb opcode
  reg [10:0] ID_imm_offset; // immediate, offset or register list
  reg [7:0] EX_imm_offset;  // 8 bits required in WB stage
  reg [3:0] ID_cond;        // ARM condition code (same as THUMB)
  reg [2:0] ID_Rd_code, EX_Rd_code;  // Rd register number
  
  // ASSIGN STATEMENTS
  assign instruction_address = PC;  // set instr. address to PC
  assign data = (~write_data_n) ? DR : 0;  // tri-state data
  
  wire [`WORD_SIZE*`REG_FILE_SIZE-1:0] flat_R;
  genvar g;
  generate
  for(g = 0; g < `REG_FILE_SIZE; g = g + 1) begin : flatr
    assign flat_R[`WORD_SIZE*(g+1)-1:`WORD_SIZE*g] = R[g];
  end
  endgenerate

  wire [`HWORD_SIZE-1:0] IF_IR_w;
  wire [`WORD_SIZE-1:0] IF_PC_w;
  wire [`WORD_SIZE-1:0] NEW_PC;
  wire read_instruction_n_w;
  IF step1(.reset_n(reset_n), 
           .clk(clk), 
           .OLD_PC(PC), 
           .branch_taken(branch_taken), 
           .branch_target(branch_target), 
           .instruction(instruction),
           .read_instruction_n(read_instruction_n_w), 
           .IF_IR(IF_IR_w), .IF_PC(IF_PC_w), .PC(NEW_PC));

  wire [`WORD_SIZE-1:0] ID_PC_w;
  wire [`WORD_SIZE-1:0] ID_Rd_w, ID_Rn_w, ID_Rm_Rs_w;
  wire [3:0] ID_cond_w;
  wire [2:0] ID_Rd_code_w;
  wire [5:0] ID_opcode_w;
  wire [10:0] ID_imm_offset_w;
  ID step2(.reset_n(reset_n), 
           .clk(clk), 
           .Rin(flat_R), 
           .IF_PC(IF_PC), 
           .branch_taken(branch_taken), 
           .IF_IR(IF_IR),
           .ID_PC(ID_PC_w), 
           .ID_Rd(ID_Rd_w), 
           .ID_Rn(ID_Rn_w), 
           .ID_Rm_Rs(ID_Rm_Rs_w), 
           .ID_cond(ID_cond_w), 
           .ID_Rd_code(ID_Rd_code_w), 
           .ID_opcode(ID_opcode_w), 
           .ID_imm_offset(ID_imm_offset_w)
           );
  
  wire [`WORD_SIZE-1:0] EX_ALU_out_w;
  wire [5:0] EX_opcode_w;
  wire [7:0] EX_imm_offset_w;
  wire [2:0] EX_Rd_code_w;
  wire [`WORD_SIZE-1:0] data_address_w;
  wire [`WORD_SIZE-1:0] DR_w;
  wire [`WORD_SIZE-1:0] LR_w;
  wire [`WORD_SIZE-1:0] SP_w;
  wire [`WORD_SIZE-1:0] branch_target_w;
  wire branch_taken_w, read_data_n_w, write_data_n_w;
  wire C_Flag_w, N_Flag_w, Z_Flag_w, V_Flag_w;
  EX step3(.reset_n(reset_n), 
           .clk(clk), 
           .Rin(flat_R), 
           .SP_in(SP),
           .ID_PC(ID_PC),
           .ID_Rd(ID_Rd),
           .ID_Rn(ID_Rn),
           .ID_Rm_Rs(ID_Rm_Rs), 
           .ID_cond(ID_cond), 
           .ID_Rd_code(ID_Rd_code),
           .ID_opcode(ID_opcode),
           .ID_imm_offset(ID_imm_offset), 
           .LR_in(LR),
           .C_Flag_in(C_Flag), 
           .N_Flag_in(N_Flag), 
           .Z_Flag_in(Z_Flag), 
           .V_Flag_in(V_Flag), 
           .branch_taken(branch_taken_w),
           .branch_target(branch_target_w),
           .read_data_n(read_data_n_w),
           .write_data_n(write_data_n_w),
           .EX_opcode(EX_opcode_w), 
           .EX_ALU_out(EX_ALU_out_w), 
           .EX_imm_offset(EX_imm_offset_w), 
           .EX_Rd_code(EX_Rd_code_w), 
           .SP(SP_w), 
           .LR(LR_w), 
           .DR(DR_w), 
           .C_Flag(C_Flag_w),
           .N_Flag(N_Flag_w),
           .Z_Flag(Z_Flag_w),
           .V_Flag(V_Flag_w),
           .data_address(data_address_w)
           );

  wire [`WORD_SIZE*`REG_FILE_SIZE-1:0] R_wb;
  WB step4(.reset_n(reset_n),
           .clk(clk),
           .EX_opcode(EX_opcode),
           .EX_Rd_code(EX_Rd_code), 
           .EX_ALU_out(EX_ALU_out), 
           .EX_imm_offset(EX_imm_offset), 
           .data(data), 
           .Rout(R_wb)
       );

  always @(*) begin
    // IF 
    PC <= NEW_PC;
    IF_IR <= IF_IR_w; 
    IF_PC <= IF_PC_w;
    read_instruction_n <= read_instruction_n_w;

    // ID
    ID_PC <= ID_PC_w; 
    ID_Rd <= ID_Rd_w; 
    ID_Rn <= ID_Rn_w; 
    ID_Rm_Rs <= ID_Rm_Rs_w;
    ID_cond <= ID_cond_w;
    ID_Rd_code <= ID_Rd_code_w;
    ID_opcode <= ID_opcode_w;
    ID_imm_offset <= ID_imm_offset_w;

    // EX 
    branch_taken <= branch_taken_w;
    branch_target <= branch_target_w;
    EX_opcode <= EX_opcode_w;
    EX_ALU_out <= EX_ALU_out_w;
    EX_imm_offset <= EX_imm_offset_w;
    EX_Rd_code <= EX_Rd_code_w;
    SP <= SP_w;
    LR <= LR_w;
    DR <= DR_w;
    C_Flag <= C_Flag_w;
    N_Flag <= N_Flag_w;
    Z_Flag <= Z_Flag_w;
    V_Flag <= V_Flag_w;
    data_address <= data_address_w;
    read_data_n <= read_data_n_w;
    write_data_n <= write_data_n_w;

    // WB 
    R[0] <= R_wb[`WORD_SIZE-1:0];
    R[1] <= R_wb[`WORD_SIZE*2-1:`WORD_SIZE];
    R[2] <= R_wb[`WORD_SIZE*3-1:`WORD_SIZE*2];
    R[3] <= R_wb[`WORD_SIZE*4-1:`WORD_SIZE*3];
    R[4] <= R_wb[`WORD_SIZE*5-1:`WORD_SIZE*4];
    R[5] <= R_wb[`WORD_SIZE*6-1:`WORD_SIZE*5];
    R[6] <= R_wb[`WORD_SIZE*7-1:`WORD_SIZE*6];
    R[7] <= R_wb[`WORD_SIZE*8-1:`WORD_SIZE*7];
  end
  
endmodule
/////////////////////////////////////////////////////////////////

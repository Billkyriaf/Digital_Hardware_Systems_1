`timescale 1ns / 1ps

`ifndef MUX
  `include "MUX.v"
  `define MUX
`endif

`ifndef REGISTER_FILE
  `include "REGISTER_FILE.v"
  `define REGISTER_FILE
`endif

//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:    01/03/2022 
// Design Name: 
// Module Name:    DECSTAGE 
// Project Name:   Digital_Hardware_Systems
//
// Description:
//
//      Decodes the instructions and feeds the register file with addresser for read ans write 
//
// Dependencies: 
//
//      1. MUX.v
//      2. REGISTER_FILE.v
//
//////////////////////////////////////////////////////////////////////////////////

module DECSTAGE(
    input [31:0] Instr,
    input RF_WrEn,
    input [31:0] ALU_out,
    input [31:0] MEM_out,
    input RF_WrData_sel,
    input RF_Bsel,
    input Clk,
    output reg [31:0] Immed,
    output wire [31:0] RF_A,
    output wire [31:0] RF_B
    );


    // Write data to register

    wire [2 * 32 - 1:0] write_select_bus;  // Connects the ALU_out and MEM_out to the multiplexer
    wire [2 * 5 - 1:0] read_addr_select_bus;  // Connects Instr[15:11] ans Instr[20:16] to the multiplexer
    wire [31:0] write_data;  // Connects the output of the Write Data multiplexer to the RF
    wire [4:0] read_addr_2;  // Connects the output of the Read Address Multiplexer to the RF
    // wire [31:0] regA;
    // wire [31:0] regB;

    assign write_select_bus[63:32] = MEM_out;  // From wire 32 to 63 connects the ALU_out
    assign write_select_bus[31:0] = ALU_out;  // From wire 0 to 31 connects the MEM_out

    assign read_addr_select_bus[4:0] = Instr[15:11];  // From wire 4 to 0 connects the Instr[15:11]
    assign read_addr_select_bus[9:5] = Instr[20:16];  // From wire 20 to 16 connects the Instr[20:16]

    // Mux that decides the source of the data to write to the RF
    MUX #(.BUS_WIDTH(32), .SEL(1)) write_select (
        .Din(write_select_bus),
        .Sel(RF_WrData_sel),
        .Dout(write_data)
    );

    // Selects which part of the instruction will be passed as the read address 
    MUX #(.BUS_WIDTH(5), .SEL(1)) read_addr_select (
        .Din(read_addr_select_bus),
        .Sel(RF_Bsel),
        .Dout(read_addr_2)
    );

    REGISTER_FILE rf (
        .Adr1(Instr[25:21]),
        .Adr2(read_addr_2),
        .Awr(Instr[20:16]),
        .Din(write_data),
        .WrEn(RF_WrEn),
        .Clk(Clk),
        .Dout1(RF_A),
        .Dout2(RF_B)
    );


    integer i;
    
    // Immediate module triggers on instruction change
    always @(Instr) begin
        case (Instr[31:26])
            6'b001111,      // lw
            6'b011111,      // sw
            6'b110000,      // addi
            6'b111000,      // li
            6'b000011,      // lb
            6'b000111:      // sb
            begin
                // This case is for all the opcodes that need a sigh extend on immediate vALUe

                Immed[15:0] = Instr[15:0];  // the first 16 bits of the immediate vALUe is passed to the output
                
                // The bits 16 to 31 are filled with the most significant byte of the immediate vALUe
                for (i = 16; i < 32; i = i + 1) begin
                    Immed[i] = Instr[15];               
                end
            end

            6'b000000,      // beq
            6'b000001,      // bne
            6'b111111:      // b
            begin
                // This case is for all the opcodes that need a sigh extend on immediate vALUe

                Immed[15:0] = Instr[15:0];  // the first 16 bits of the immediate vALUe is passed to the output
                
                // The bits 16 to 31 are filled with the most significant byte of the immediate vALUe
                for (i = 16; i < 32; i = i + 1) begin
                    Immed[i] = Instr[15];               
                end

                Immed = Immed << 2;  // Immed = Immed * 4
            end

            6'b111001:       // lui
            begin
                // This is the load unsigned immediate instruction.
                Immed[31:16] = Instr[15:0];  // MSBs are filled with the immediate vALUe
                Immed[15:0] = 0;  // LSBs are zero filled
            end
            6'b110010,       // andi
            6'b110011:       // ori
            begin
                // This case is for the instructions that need zero fill on immediate vALUe.
                Immed[15:0] = Instr[15:0];  // LSBs are filled with the immediate vALUe
                Immed[31:16] = 0;  // MSBs are zero filled
            end

            default:
                // If the instruction does not use immediate vALUe...
                Immed[31:0] = 0;  // ... the immediate vALUe becomes 0
        endcase
    end
    
endmodule

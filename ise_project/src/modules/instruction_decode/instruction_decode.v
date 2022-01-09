`timescale 1ns / 1ps

`include "../help_modules/mux_32_1.v"

//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:    21:34:40 01/03/2022 
// Design Name: 
// Module Name:    instruction_decode 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
// Dependencies: 
//
//
//////////////////////////////////////////////////////////////////////////////////

module instruction_decode(
    input [31:0] Instr,
    input RF_WrEn,
    input [31:0] ALU_out,
    input [31:0] MEM_out,
    input RF_WrData_sel,
    input RF_Bsel,
    input Clk,
    output reg [31:0] Immed,
    output reg [31:0] RF_A,
    output reg [31:0] RF_B
    );


    // Write data to register

    wire [2 * 32 - 1:0] write_select_bus;  // Connects the ALU_out and MEM_out to the multiplexer
    wire [31:0] write_data;  // Connects the output of the multiplexer to the RF

    assign write_select_bus[63:32] = ALU_out;  // From wire 32 to 63 connects the ALU_out
    assign write_select_bus[31:0] = MEM_out;  // From wire 0 to 31 connects the MEM_out

    // Mux that decides the source of the data to write to the RF
    mux_32_1 #(.BUS_WIDTH(32), .SEL(1)) write_select (
        .Din(write_select_bus),
        .Sel(RF_WrData_sel),
        .Dout(write_data)
    );


    // Immediate module triggers on instruction change
    always @(Instr) begin
        integer i;

        case (Instr[5:0])
            6'b000000,      // beq
            6'b000001,      // bne
            6'b000011,      // lb
            6'b000111,      // sb
            6'b001111,      // lw
            6'b011111,      // sw
            6'b110000,      // addi
            6'b111000,      // li
            6'b111111:      // b
            begin
                // This case is for all the opcodes that need a sigh extend on immediate value

                Immed[15:0] = Instr[15:0];  // the first 16 bits of the immediate value is passed to the output
                
                // The bits 16 to 31 are filled with the most significant byte of the immediate value
                for (i = 16; i < 32; i = i + 1) begin
                    Immed[i] = Instr[15];               
                end
            end

            6'b111001:       // lui
            begin
                // This is the load unsigned immediate instruction.
                Immed[31:16] = Instr[15:0];  // MSBs are filled with the immediate value
                Immed[15:0] = 0;  // LSBs are zero filled
            end
            6'b110010,       // andi
            6'b110011:       // ori
            begin
                // This case is for the instructions that need zero fill on immediate value.
                Immed[15:0] = Instr[15:0];  // LSBs are filled with the immediate value
                Immed[31:16] = 0;  // MSBs are zero filled
            end

            default:
                // If the instruction does not use immediate value...
                Immed[31:0] = 0;  // ... the immediate value becomes 0
        endcase
    end
    
endmodule

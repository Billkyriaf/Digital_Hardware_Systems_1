`timescale 1ns / 1ps

`ifndef IMEM
  `include "IMEM.v"
  `define IMEM
`endif

`ifndef MUX
  `include "MUX.v"
  `define MUX
`endif

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    01/03/2022 
// Design Name: 
// Module Name:    IFSTAGE 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//      
//      Fetches the next instruction from memory when the PC_LdEn becomes 1. The instruction
//      is passed the the DECSTAGE.
//
// Dependencies: 
// 
//      1. IMEM.v
//      2. MUX.v
//
//////////////////////////////////////////////////////////////////////////////////

module IFSTAGE(
    input [31:0] PC_Immed,
    input PC_Sel,
    input PC_LdEn,
    input Reset,
    input Clk,
    output [31:0] Instr
);

    reg [31:0] PC;  // The program counter
    wire [2 * 32 - 1:0] mux_input;  // Input bus to the immediate multiplexer
    wire [31:0] mux_to_pc;  // Connects the mux output to the PC reg for updating the value 
    wire [31:0] pc_to_memory;  // PC to memory input for instruction fetching

    assign pc_to_memory = PC;

    assign mux_input[31:0] = PC + 4;
    assign mux_input[63:32] = PC + 4 + PC_Immed;

    IMEM imem(
        .clk(Clk),
        .addr(pc_to_memory[11:2]),
        .dout(Instr)
    );


    // MUX that selects between + 4 or + 4 + immediate for the PC
    MUX #(.BUS_WIDTH(32), .SEL(1)) mux(
        .Din(mux_input),
        .Sel(PC_Sel),
        .Dout(mux_to_pc)
    );

    initial begin
        // Initialize the program counter. Only for simulation not for synthesis.
        // On actual hardware the Reset signal must become 1 for 1 cycle for the PC to initialize.
        PC = 0; 
    end


    // On every positive clock edge ...
    always @(posedge Clk) begin
        if(Reset == 1) begin
            PC = 0;  // ... if the Reset signal is set PC = 0
        end else if (PC_LdEn == 1) begin
            PC = mux_to_pc;  // ... else if PC_LdEn is set advance the program counter
        end else begin
            PC = PC;  // ...else keep the same value
        end
    end
endmodule



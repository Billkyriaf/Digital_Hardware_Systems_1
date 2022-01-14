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
// Create Date:    01:07:02 01/03/2022 
// Design Name: 
// Module Name:    IFSTAGE 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
// Dependencies: 
//
//
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

    reg [31:0] PC;
    wire [2 * 32 - 1:0] mux_input;
    wire [31:0] mux_to_pc;
    wire [31:0] pc_to_memory;

    assign pc_to_memory = PC;

    assign mux_input[31:0] = PC + 4;
    assign mux_input[63:32] = PC + 4 + PC_Immed;

    IMEM imem(
        .clk(Clk),
        .addr(pc_to_memory[11:2]),
        .dout(Instr)
    );

    MUX #(.BUS_WIDTH(32), .SEL(1)) mux(
        .Din(mux_input),
        .Sel(PC_Sel),
        .Dout(mux_to_pc)
    );

    initial begin
        PC = 0;
    end


    // always @(mux_to_pc) begin
    //     if(Reset == 1) begin
    //         PC = 0;
    //     end else if (PC_LdEn == 1) begin
    //         PC = mux_to_pc;
    //     end else begin
    //         PC = PC;
    //     end
    // end

    always @(posedge Clk) begin
        if(Reset == 1) begin
            PC = 0;
        end else if (PC_LdEn == 1) begin
            PC = mux_to_pc;
        end else begin
            PC = PC;
        end
    end
endmodule



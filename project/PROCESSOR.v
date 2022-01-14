`timescale 1ns / 1ps

`ifndef IFSTAGE
    `include "IFSTAGE.v"
    `define IFSTAGE
`endif

`ifndef DECSTAGE
    `include "DECSTAGE.v"
    `define DECSTAGE
`endif

`ifndef ALUSTAGE
    `include "ALUSTAGE.v"
    `define ALUSTAGE
`endif

`ifndef MEMSTAGE
    `include "MEMSTAGE.v"
    `define MEMSTAGE
`endif

`ifndef CONTROL
    `include "CONTROL.v"
    `define CONTROL
`endif

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:36 01/12/2022 
// Design Name: 
// Module Name:    PROCESSOR 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module PROCESSOR(
    input Clk,
    output [31:0] instruction,
    output [31:0] register_file_A,
    output [31:0] register_file_B,
    output [31:0] immed,
    output [31:0] alu_output,
    output alu_zero,
    output [31:0] memory_out
);

    wire [31:0] immediate;
    wire PC_Sel;
    wire PC_LdEn;
    wire Reset;
    wire [31:0] Instr;

    wire RF_WrEn;
    wire [31:0] ALU_out;
    wire [31:0] MEM_out;
    wire RF_WrData_sel;
    wire RF_Bsel;
    wire [31:0] RF_A;
    wire [31:0] RF_B;

    wire ALU_Bin_sel;
    wire [3:0] ALU_func;
    wire zero;

    wire Mem_WrEn;
    wire Mem_In_Out_Sel;

    assign instruction = Instr;
    assign register_file_A = RF_A;
    assign register_file_B = RF_B;
    assign immed = immediate;
    assign alu_output = ALU_out;
    assign alu_zero = zero;
    assign memory_out = MEM_out;

    IFSTAGE instruction_fetch (
        .PC_Immed(immediate),
        .PC_Sel(PC_Sel),
        .PC_LdEn(PC_LdEn),
        .Reset(Reset),
        .Clk(Clk),
        .Instr(Instr)
    );

    DECSTAGE instruction_decode (
        .Instr(Instr),
        .RF_WrEn(RF_WrEn),
        .ALU_out(ALU_out),
        .MEM_out(MEM_out),
        .RF_WrData_sel(RF_WrData_sel),
        .RF_Bsel(RF_Bsel),
        .Clk(Clk),
        .Immed(immediate),
        .RF_A(RF_A),
        .RF_B(RF_B)
    );

    ALUSTAGE alu (
        .RF_A(RF_A),
        .RF_B(RF_B),
        .Immed(immediate),
        .ALU_Bin_sel(ALU_Bin_sel),
        .ALU_func(ALU_func),
        .ALU_out(ALU_out),
        .zero(zero)
    );

    MEMSTAGE memory (
        .clk(Clk),
        .Mem_WrEn(Mem_WrEn),
        .Mem_In_Out_Sel(Mem_In_Out_Sel),
        .ALU_MEM_Addr(ALU_out),
        .MEM_DataIn(RF_B),
        .MEM_DataOut(MEM_out)
    );

    CONTROL control (
        .Instr(Instr),
        .Clk(Clk),
        .Zero(zero),
        .PC_Sel(PC_Sel),
        .PC_LdEn(PC_LdEn),
        .Reset(Reset),
        .RF_B_sel(RF_Bsel),
        .RF_WrData_sel(RF_WrData_sel),
        .RF_WEn(RF_WrEn),
        .ALU_Bin_sel(ALU_Bin_sel),
        .ALU_func(ALU_func),
        .MEM_WrEn(Mem_WrEn),
        .Mem_In_Out_Sel(Mem_In_Out_Sel)
    );


endmodule

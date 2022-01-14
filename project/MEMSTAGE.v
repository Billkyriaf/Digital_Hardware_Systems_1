`timescale 1ns / 1ps

`ifndef MEM
    `include "MEM.v"
    `define MEM
`endif

`ifndef MUX
    `include "MUX.v"
    `define MUX
`endif

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:51 01/11/2022 
// Design Name: 
// Module Name:    MEMSTAGE 
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

module MEMSTAGE(
    input clk,
    input Mem_WrEn,
    input Mem_In_Out_Sel,
    input [31:0] ALU_MEM_Addr,
    input [31:0] MEM_DataIn,
    output [31:0] MEM_DataOut
    );

    wire [32 * 2 - 1:0] input_mux_data;
    wire [31:0] input_mux_to_mem;

    assign input_mux_data[31:0] = MEM_DataIn;
    assign input_mux_data[63:32] = MEM_DataIn & 32'b00000000_00000000_00000000_11111111;

    // This multiplexer selects if the input will be only the 8 LSBs from the input or the hole word
    // This is useful for the sb instruction
    MUX #(.BUS_WIDTH(32), .SEL(1)) input_mux(
        .Din(input_mux_data),
        .Sel(Mem_In_Out_Sel),
        .Dout(input_mux_to_mem)
    );

    wire [32 * 2 - 1:0] output_mux_data;
    wire [31:0] mem_to_output_mux;

    assign output_mux_data[31:0] = mem_to_output_mux;
    assign output_mux_data[63:32] = mem_to_output_mux & 32'b00000000_00000000_00000000_11111111;

    // This multiplexer selects if the output will be only the 8 LSBs from the memory or the hole word
    // This is useful for the lb instruction
    MUX #(.BUS_WIDTH(32), .SEL(1)) output_mux(
        .Din(output_mux_data),
        .Sel(Mem_In_Out_Sel),
        .Dout(MEM_DataOut)
    );

    MEM memory (
        .clk(clk),
        .we(Mem_WrEn),
        .addr(ALU_MEM_Addr[11:2]),
        .din(input_mux_to_mem),
        .dout(mem_to_output_mux)
    );

endmodule

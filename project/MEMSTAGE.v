`timescale 1ns / 1ps

`ifndef MEM
    `include MEM.v
    `define MEM
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
    input [31:0] ALU_MEM_Addr,
    input [31:0] MEM_DataIn,
    output [31:0] MEM_DataOut
    );

    MEM memory (
        .clk(clk),
        .we(Mem_WrEn),
        .addr(ALU_MEM_Addr[11:2]),
        .din(MEM_DataIn),
        .dout(MEM_DataOut)
    );

endmodule

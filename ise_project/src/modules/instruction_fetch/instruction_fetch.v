`timescale 1ns / 1ps
`include "../help_modules/mux_32_1.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:07:02 01/03/2022 
// Design Name: 
// Module Name:    instruction_fetch 
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
module instruction_fetch(
    input [31:0] PC_Immed,
    input PC_Sel,
    input PC_LdEn,
    input Reset,
    input Clk,
    output [31:0] Instr
    );

    reg [31:0] PC;
    wire [31:0] mux_to_pc;
    reg [2*32 - 1:0] mux_input;

    IMEM imem(
        .clk(Clk),
        .addr(PC[11:2]),
        .dout(Instr)
    );

    mux_32_1 #(.BUS_WIDTH(32), .SEL(1)) mux(
        .Din(mux_input),
        .Sel(PC_Sel),
        .Dout(mux_to_pc)
    );

    always @(posedge Clk) begin
        if(Reset == 1) begin
            PC = 0;
        end else if (PC_LdEn == 1) begin
            mux_input[31:0] = PC + 4;
            mux_input[63:32] = PC + 4 + PC_Immed;  
            PC = mux_to_pc;          
        end else begin
            PC = PC;
        end

        
    end

  
endmodule



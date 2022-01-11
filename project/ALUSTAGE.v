`timescale 1ns / 1ps

`ifndef ALU
    `include "ALU.v"
    `define ALU
`endif

`ifndef MUX
    `include "MUX.v"
    `define MUX
`endif

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:41 01/11/2022 
// Design Name: 
// Module Name:    ALUSTAGE 
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
module ALUSTAGE(
    input [31:0] RF_A,
    input [31:0] RF_B,
    input [31:0] Immed,
    input ALU_Bin_sel,
    input [3:0] ALU_func,
    output wire [31:0] ALU_out,
    output wire zero
);

    wire [2*32 - 1:0] inputs;  // the input array to the mux
    wire [31:0] mux_to_ALU;   // the output of the mux that becomes
                             // the input to ALU module
    
    assign inputs[31:0] = RF_B;  
    assign inputs[63:32] = Immed;  
    
    
   

    MUX #(.BUS_WIDTH(32), .SEL(1)) alu_mux (
        .Din(inputs),
        .Sel(ALU_Bin_sel),
        .Dout(mux_to_ALU)
    );

    ALU alu (
        .A(RF_A),
        .B(mux_to_ALU),
        .Op(ALU_func),
        .Out(ALU_out),
        .Zero(zero)
    );

    
endmodule

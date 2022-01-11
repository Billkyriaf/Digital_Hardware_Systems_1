`timescale 1ns / 1ps

`ifndef DECODER_5_32
  `include "DECODER_5_32.v"
  `define DECODER_5_32
`endif

`ifndef MUX
  `include "MUX.v"
  `define MUX
`endif

`ifndef REGISTER_0_32BIT
  `include "REGISTER_0_32BIT.v"
  `define REGISTER_0_32BIT
`endif

`ifndef REGISTER_32BIT
  `include "REGISTER_32BIT.v"
  `define REGISTER_32BIT
`endif

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    12/28/2021 
// Design Name: 
// Module Name:    REGISTER_FILE 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      The group of registers of the processor. The supported operations are read from 2 registers or write to one register.
//
// Dependencies: 
//      
//      1. src/help_modules/DECODER_5_32.v 
//      2. src/help_modules/MUX.v 
//      3. src/REGISTER_FILE/REGISTER_32BIT.v 
//      4. src/REGISTER_FILE/REGISTER_0_32BIT.v  
//
//////////////////////////////////////////////////////////////////////////////////

module REGISTER_FILE(
    input [4:0] Adr1,    // Read address 1
    input [4:0] Adr2,    // Read address 2
    input [4:0] Awr,     // Write address
    input [31:0] Din,    // Data bus to write to Awr register 
    input WrEn,          // Write enable
    input Clk,           // CLOCK
    output [31:0] Dout1, // Data output bus 1
    output [31:0] Dout2  // Data output bus 2
    );

    wire [31:0] decoderToRegister;  // Connection between the decoder and the register write enable signal
    
    // Connection between the registers and the Multiplexers. This is a bus with 32 groups of 32 data lines.
    // One group for every register
    wire [32 * 32 - 1:0] RegToMultiplexer;  // 0 - 1023


    // Decoder for write address
    DECODER_5_32 addressDecoder (
            .Addr(Awr),
            .Out(decoderToRegister)
    );


    // Generate all the registers.
    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin : registers 
            if (i == 0) begin
                // R0 is a zero register meaning it only outputs 0 and can not be written
                REGISTER_0_32BIT R_0 (
                    .Clk(Clk),
                    .Dout(RegToMultiplexer[(i + 1) * 32 - 1:i * 32])  // Same as .Dout(RegToMultiplexer[31:0])
                );
            end else begin
                // Every other register is a normal 32 bit register. Every register gets a part of the very wide
                // data bus to the multiplexers
                REGISTER_32BIT R_i (
                    .Clk(Clk),
                    .WE(decoderToRegister[i] && WrEn),
                    .Data(Din),
                    .Dout(RegToMultiplexer[(i + 1) * 32 - 1:i * 32])
                );
            end
        end
    endgenerate


    // Address 1 multiplexer outputs data to Dout1
    MUX mux_1 (
        .Din(RegToMultiplexer),
        .Sel(Adr1),
        .Dout(Dout1)
    );

    // Address 2 multiplexer outputs data to Dout2
    MUX mux_2 (
        .Din(RegToMultiplexer),
        .Sel(Adr2),
        .Dout(Dout2)
    );

endmodule

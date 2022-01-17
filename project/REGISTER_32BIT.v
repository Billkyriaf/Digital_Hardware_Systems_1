`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    12/27/2021 
// Design Name: 
// Module Name:    REGISTER_32BIT 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      32 bit register. if the Write enable signal is high the output becomes the input data else the
//      output exports its shelf.
//
// Dependencies: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module REGISTER_32BIT(
    input Clk,              // CLOCK
    input WE,               // Write enable
    input [31:0] Data,      // Input data
    output reg [31:0] Dout  // Output data
    );

    // For every CLOCK edge ...
    always @(posedge Clk) begin

        // Update the data if WriteEnable is high
        if (WE == 1) begin
            Dout = Data;
        end else begin
            Dout = Dout;  // Export the data else
        end
    end
endmodule
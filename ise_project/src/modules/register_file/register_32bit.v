`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    21:01:31 12/27/2021 
// Design Name: 
// Module Name:    register_32bit 
// Project Name: 
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
module register_32bit(
    input Clk,              // Clock
    input WE,               // Write enable
    input [31:0] Data,      // Input data
    output reg [31:0] Dout  // Output data
    );

    // For every clock edge ...
    always @(posedge Clk, negedge Clk) begin

        // Update the data if WriteEnable is high
        if (WE == 1) begin
            Dout <= Data;
        end else begin
            Dout <= Dout;  // Export the data else
        end
    end


endmodule
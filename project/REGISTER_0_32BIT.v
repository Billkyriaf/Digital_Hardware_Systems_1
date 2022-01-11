`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    12/30/2021 
// Design Name: 
// Module Name:    REGISTER_0_32BIT 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      This is the $R0. It always outputs 0 and can not be written.
//
// Dependencies: 
//
//////////////////////////////////////////////////////////////////////////////////
module REGISTER_0_32BIT(
    input Clk,              // CLOCK
    output reg [31:0] Dout  // Output bus
    );

    // Output 0 on every CLOCK state
    always @(Clk) begin
        Dout = 0;
    end

endmodule

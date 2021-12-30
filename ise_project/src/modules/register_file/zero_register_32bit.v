`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    12/30/2021 
// Design Name: 
// Module Name:    zero_register_32bit 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      This is the $R0. It always outputs 0 and can not be written.
//
// Dependencies: 
//
//////////////////////////////////////////////////////////////////////////////////
module zero_register_32bit(
    input Clk,              // Clock
    output reg [31:0] Dout  // Output bus
    );

    // Output 0 on every clock state
    always @(Clk) begin
        Dout = 0;
    end

endmodule

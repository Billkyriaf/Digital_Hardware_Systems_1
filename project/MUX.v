`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   12/28/2021
// Design Name:
// Module Name:   MUX
// Project Name:  Digital_Hardware_Systems
//
// Description: 
//
//     Multiplexer 32 to 1. Each input is a 32 bit bus. The Select signal is 5 bits.
//
// Dependencies:
// 
// 
////////////////////////////////////////////////////////////////////////////////

module MUX
#(parameter BUS_WIDTH = 32,              // The bits of a single input
  parameter SEL = 5)                     // The number of select bits
( input [(BUS_WIDTH*(2**SEL))-1:0] Din,  // Create a big Bus that fits all inputs
  input [SEL-1:0] Sel,                   // Select signal
  output reg [BUS_WIDTH-1:0] Dout        // Dout signal
);
    integer i;
    
    always @ ( * ) begin
        for (i = 0; i < 2 ** SEL; i = i + 1) begin
            if (i == Sel) begin
                Dout = Din[i * BUS_WIDTH +: BUS_WIDTH];
            end
        end
    end

endmodule
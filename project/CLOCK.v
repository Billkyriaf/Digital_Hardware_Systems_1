`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    12/27/2021 
// Design Name: 
// Module Name:    CLOCK 
// Project Name:   Digital_Hardware_Systems
//
// Description:
//
//      CLOCK module
//
// Dependencies: 
//
//
//////////////////////////////////////////////////////////////////////////////////

module CLOCK(
    output reg Clk  // CLOCK
    );

    initial begin
        Clk = 0;  // 0 initially

        forever begin
            #1 Clk = ~Clk;  // Invert CLOCK every 1 ns (1 GHz)
        end
    end

endmodule

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    12/27/2021 
// Design Name: 
// Module Name:    clock 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//      Clock module
//
// Dependencies: 
//
//
//////////////////////////////////////////////////////////////////////////////////

module clock(
    output reg Clk  // Clock
    );

    initial begin
        Clk = 0;  // 0 initially

        forever begin
            #1 Clk = ~Clk;  // Invert clock every 1 ns (1 GHz)
        end
    end

endmodule

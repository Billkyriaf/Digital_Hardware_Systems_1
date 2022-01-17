`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    01/11/2022 
// Design Name: 
// Module Name:    MEM 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      Memory. This could be a cache memory or a RAM on a cache-less cpu 
//
// Dependencies: 
//
//////////////////////////////////////////////////////////////////////////////////

module MEM(
    input clk,
    input we,
    input [9:0] addr,
    input [31:0] din,
    output reg [31:0] dout
    );

    reg [31:0] RAM [1023:0];
    
    always @(posedge clk) begin
        if(we)
            RAM[addr] = din;
        else
            dout = RAM[addr];
    end

endmodule

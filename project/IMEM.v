`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    01/08/2022 
// Design Name: 
// Module Name:    IMEM 
// Project Name:   Digital_Hardware_Systems
// 
// Description: 
//
//      Instruction memory
//
// Dependencies:  
//
//////////////////////////////////////////////////////////////////////////////////

module IMEM(
    input clk,
    input [9:0] addr,
    output reg [31:0] dout
);
    reg [31:0] ROM [1023:0];

    initial begin
        $readmemb("rom.data", ROM);
    end

    always @(posedge clk) begin
        dout <= ROM[addr];
    end
    
endmodule

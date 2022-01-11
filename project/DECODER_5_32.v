`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   12/28/2021
// Design Name:
// Module Name:   DECODER_5_32
// Project Name:  Digital_Hardware_Systems
//
// Description: 
//
//     Get an input Address and outputs to a Bus. The only data line in the bus with vALUe 1 is the line with 
//     Address same as the input address. Every other line is 0.
//
// Dependencies:
// 
// 
////////////////////////////////////////////////////////////////////////////////

module DECODER_5_32
    #(parameter OUTPUTS = 32,       // The output bus size.
      parameter ADDR = 5)           // The address size
    (input [ADDR - 1:0] Addr,       // The input address
    output reg [OUTPUTS - 1:0] Out  // The output bus. Only the Addr line of the bus is 1 at all times
    );

    integer i;

    always @(Addr) begin

        // For all the lines in the bus...
        for(i = 0; i < OUTPUTS; i = i + 1) begin
            // If the line address matches the input Addr...
            if (i == Addr) begin
                Out[i] = 1;  // ...make the output 1
            end else begin
                Out[i] = 0;  // ...else make the output 0.
            end
        end
    end


endmodule

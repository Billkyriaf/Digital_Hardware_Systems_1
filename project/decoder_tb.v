`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   12/28/2021
// Design Name:   decoder_5_32
// Module Name:   decoder_tb.v
// Project Name:  Digital_Hardware_Systems
//
// Description: 
//
// 		Verilog Test Fixture created by ISE for module: decoder_5_32
//
// Dependencies:
// 
// 		1. decoder_5_32.v module
//
////////////////////////////////////////////////////////////////////////////////

module decoder_tb;

	// Inputs
	reg [4:0] Addr;
	reg WrEn;
	wire [31:0] signalOut ;

	// Instantiate the Unit Under Test (UUT)
	decoder_5_32 uut (
		.Addr(Addr), 
		.Out(signalOut)
	);

	integer i = 0;

	initial begin
		// Initialize Inputs
		Addr = 0;
		WrEn = 1;
        
		for (i = 0; i < 32; i = i + 1) begin
			Addr = i;
			#2;
		end
	end
      
endmodule


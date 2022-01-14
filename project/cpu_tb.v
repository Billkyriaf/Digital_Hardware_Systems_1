`timescale 1ns / 1ps

`ifndef CLOCK
  `include "CLOCK.v"
  `define CLOCK
`endif

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:55:39 01/13/2022
// Design Name:   PROCESSOR
// Module Name:   /home/vasilisk/Git/Digital_Hardware_Systems_1/project/cpu_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_tb;

	// Inputs
	wire Clk;

	CLOCK clk (
		.Clk(Clk)
	);

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


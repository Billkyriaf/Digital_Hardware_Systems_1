`timescale 1ns / 1ps

`ifndef CLOCK
  `include "CLOCK.v"
  `define CLOCK
`endif

`ifndef IFSTAGE
  `include "IFSTAGE.v"
  `define IFSTAGE
`endif


////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   22:17:10 01/08/2022
// Design Name:   IFSTAGE
// Module Name:   IFSTAGE_tb.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Dependencies:
// 
// 
////////////////////////////////////////////////////////////////////////////////

module IFSTAGE_tb;

	// Inputs
	reg [31:0] pc_immed;
	reg pc_sel;
	reg pc_lden;
	reg reset;
	wire clk;
	wire [31:0] instr;

	CLOCK CLK(
		.Clk(clk)
	);

	// Instantiate the Unit Under Test (UUT)
	IFSTAGE uut (
		.PC_Immed(pc_immed),
		.PC_Sel(pc_sel),
		.PC_LdEn(pc_lden),
		.Reset(reset),
		.Clk(clk),
		.Instr(instr)
	);

	initial begin
		// Initialize Inputs
		pc_immed = 0;
		pc_sel = 0;
		pc_lden = 0;
		reset = 0;
		#3;
		
		pc_lden = 1;
		#2;

		pc_lden = 0;
		#4;

		pc_immed = -8;
		pc_sel = 1;
		pc_lden = 1;
		#2;

		pc_lden = 0;
		#4;

		pc_sel = 0;
		pc_lden = 0;
		reset = 1;
		#4;

		reset = 0;
		pc_lden = 1;

	end
      
endmodule


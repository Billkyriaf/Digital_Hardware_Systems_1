`timescale 1ns / 1ps
`include "../modules/clock.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:10 01/08/2022
// Design Name:   instruction_fetch
// Module Name:   E:/Uni/HW/Digital_Hardware_Systems_1/ise_project/src/test_benches/instruction_fetch_tb.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_fetch_tb;

	// Inputs
	reg [31:0] pc_immed;
	reg pc_sel;
	reg pc_lden;
	reg reset;
	wire clk;
	wire [31:0] instr;

	clock CLK(
		.Clk(clk)
	);

	// Instantiate the Unit Under Test (UUT)
	instruction_fetch uut (
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
		reset = 1;
		#2;
		reset = 0;
		#2;
		pc_lden = 1;
		#2;
		pc_lden = 0;
	end
      
endmodule


`timescale 1ns / 1ps

`include "ALUSTAGE.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:21:48 01/11/2022
// Design Name:   ALUSTAGE
// Module Name:   E:/Uni/HW/Digital_Hardware_Systems_1/project/alu_stage_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_stage_tb;

	// Inputs
	reg [31:0] RF_A;
	reg [31:0] RF_B;
	reg [31:0] Immed;
	reg ALU_Bin_sel;
	reg [3:0] ALU_func;

	// Outputs
	wire [31:0] ALU_out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALUSTAGE uut (
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.Immed(Immed), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.ALU_out(ALU_out), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		RF_A = 0;
		RF_B = 0;
		Immed = 0;
		ALU_Bin_sel = 0;
		ALU_func = 0;
		#2;

		RF_A = 10;
		RF_B = 5;
		ALU_func = 4'b0000;
		#2;

		ALU_func = 4'b0001;
		#2;

		ALU_func = 4'b0010;
		#2;

		ALU_func = 4'b0011;
		#2;

		ALU_func = 4'b0100;
		#2;

		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0000;

	end
      
endmodule


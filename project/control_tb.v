`timescale 1ns / 1ps
`include "CONTROL.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:42 01/12/2022
// Design Name:   CONTROL
// Module Name:   /home/vasilisk/Git/Digital_Hardware_Systems_1/project/control_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CONTROL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_tb;

	// Inputs
	reg [31:0] Instr;
	reg Clk;

	// Outputs
	wire PC_Sel;
	wire PC_LdEn;
	wire Reset;
	wire RF_B_sel;
	wire RF_WrData_sel;
	wire RF_WEn;
	wire ALU_Bin_sel;
	wire [3:0] ALU_func;
	wire MEM_WrEn;

	// Instantiate the Unit Under Test (UUT)
	CONTROL uut (
		.Instr(Instr), 
		.Clk(Clk), 
		.PC_Sel(PC_Sel), 
		.PC_LdEn(PC_LdEn), 
		.Reset(Reset), 
		.RF_B_sel(RF_B_sel), 
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_WEn(RF_WEn), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.MEM_WrEn(MEM_WrEn)
	);

	initial begin
		// Initialize Inputs
		Instr = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


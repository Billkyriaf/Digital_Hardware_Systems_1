`timescale 1ns / 1ps
`include "clock.v"
`include "instruction_decode.v"


////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   01/10/2022
// Design Name:   instruction_decode
// Module Name:   instruction_decode_tb.v
// Project Name:  Digital_Hardware_Systems
// 
// Description: 
//
//
// Dependencies:
// 
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_decode_tb;

	// Inputs
	reg [31:0] Instr;
	reg RF_WrEn;
	reg [31:0] ALU_out;
	reg [31:0] MEM_out;
	reg RF_WrData_sel;
	reg RF_Bsel;
	wire clk;

	// Outputs
	wire [31:0] Immed;
	wire [31:0] RF_A;
	wire [31:0] RF_B;


	clock CLK(
		.Clk(clk)
	);

	// Instantiate the Unit Under Test (UUT)
	instruction_decode uut (
		.Instr(Instr), 
		.RF_WrEn(RF_WrEn), 
		.ALU_out(ALU_out), 
		.MEM_out(MEM_out), 
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_Bsel(RF_Bsel), 
		.Clk(clk), 
		.Immed(Immed), 
		.RF_A(RF_A), 
		.RF_B(RF_B)
	);

	integer i;
	reg [31:0] increment = 32'b000000_00000_00001_0000000000000000;

	initial begin
		// Init Register file
		RF_WrEn = 1;
		RF_WrData_sel = 0;
		Instr = 32'b110000_00100_00000_1000000000000100;

		for (i = 0; i < 32; i = i + 1) begin
			if (i == 0) begin
				ALU_out = 1;
				#2;

				Instr = Instr + increment;
			end else begin
				ALU_out = i;
				#2;

				Instr = Instr + increment;
			end
		end

		// Initialize Inputs
		Instr = 0;
		RF_WrEn = 0;
		ALU_out = 0;
		MEM_out = 0;
		
		RF_Bsel = 1;        
		#2;

		Instr = 32'b110000_00100_01001_1000000000000100;
	end
      
endmodule


`timescale 1ns / 1ps

`include "clock.v"
`include "register_file.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:39:45 12/28/2021
// Design Name:   register_file
// Module Name:   /home/vasilisk/Git/Digital_Hardware_Systems_1/ise_project/src/test_benches/register_file_tb.v
// Project Name:  Digital_Hardware_Systems
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg [4:0] Adr1;
	reg [4:0] Adr2;
	reg [4:0] Awr;
	reg [31:0] Din;
	reg WrEn;
	wire Clk;

	// Outputs
	wire [31:0] Dout1;
	wire [31:0] Dout2;

	clock clk (
		.Clk(Clk)
	);

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.Adr1(Adr1), 
		.Adr2(Adr2), 
		.Awr(Awr), 
		.Din(Din), 
		.WrEn(WrEn), 
		.Clk(Clk), 
		.Dout1(Dout1), 
		.Dout2(Dout2)
	);

	initial begin
		// Initialize Inputs
		Adr1 = 0;
		Adr2 = 0;
		Awr = 0;
		Din = 0;
		WrEn = 0;

		Din = 32'b1111_0000_1111_0000_1111_0000_1111_0000;
		Awr = 5'b00000;
		WrEn = 1;
		#2;

		WrEn = 0;
		Awr = 5'b00001;
		#2;

		Din = 32'b0000_1111_0000_1111_0000_1111_0000_1111;
		WrEn = 1;
		#2;

		WrEn = 0;
		Awr = 5'b00010;
		#2;

		Din = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		WrEn = 1;
		#2;

		WrEn = 0;
		Adr1 = 5'b00001;
		Adr2 = 5'b00010;
		#2;

		Adr1 = 5'b00000;
		Adr2 = 5'b00011;
        

	end
      
endmodule


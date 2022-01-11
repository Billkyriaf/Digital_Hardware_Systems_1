`timescale 1ns / 1ps
`include "clock.v"

module register_tb;

	// Inputs
	wire Clk;
	reg WE;
	reg [31:0] Data;

	// Outputs
	wire [31:0] Dout;

	clock clk(
		.Clk(Clk)
	);

	// Instantiate the Unit Under Test (UUT)
	register_32bit uut (
		.Clk(Clk), 
		.WE(WE), 
		.Data(Data), 
		.Dout(Dout)
	);

	initial begin
		// Initialize Inputs
		WE = 0;
		Data = 0;
		#2;

		Data = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		WE = 1;
		#2;

		WE = 0;
		#2;

		Data = 32'b1111_0000_1111_0000_1111_0000_1111_0000;
		#2;
		
	end
      
endmodule


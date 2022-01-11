`timescale 1ns / 1ps

`ifndef CLOCK
  `include "CLOCK.v"
  `define CLOCK
`endif


module register_tb;

	// Inputs
	wire Clk;
	reg WE;
	reg [31:0] Data;

	// Outputs
	wire [31:0] Dout;

	CLOCK clk(
		.Clk(Clk)
	);

	// Instantiate the Unit Under Test (UUT)
	REGISTER_32BIT uut (
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


`timescale 1ns / 1ps

module test_tb;

	// Inputs
	reg A;
	reg B;
	reg C;

	// Outputs
	wire F;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	test uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.F(F), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		A = 1'b0;
		B = 1'b0;
		C = 1'b0;
		#5;

		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		#5;
		
		A = 1'b0;
		B = 1'b1;
		C = 1'b0;
		#5;
		
		A = 1'b0;
		B = 1'b1;
		C = 1'b1;
		#5;
		
		A = 1'b1;
		B = 1'b0;
		C = 1'b0;
		#5;
		
		A = 1'b1;
		B = 1'b0;
		C = 1'b1;
		#5;
		
		A = 1'b1;
		B = 1'b1;
		C = 1'b0;
		#5;
		
		A = 1'b1;
		B = 1'b1;
		C = 1'b1;
		#5;
	end

endmodule


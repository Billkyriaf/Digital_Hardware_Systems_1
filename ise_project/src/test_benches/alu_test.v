`timescale 1ns / 1ps

module alu_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] Op;

	// Outputs
	wire [31:0] Out;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.Op(Op), 
		.Out(Out), 
		.Zero(Zero)
	);

	localparam delay = 5;

	initial begin
		A = 12;
		B = 12;
		Op = 4'b0000;

		#delay;
		Op = 4'b0001;

		#delay;
		Op = 4'b0010;

		#delay;
		Op = 4'b0011;

		#delay;
		Op = 4'b0100;

		#delay;
		Op = 4'b1000;

		#delay;
		Op = 4'b1110;

	end
      
endmodule


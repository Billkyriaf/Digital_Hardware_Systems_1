`timescale 1ns / 1ps

module alu_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] Op;
	reg clk;
	reg enable;

	// Outputs
	wire [31:0] Out;
	wire Zero;


	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.Op(Op),
		.clk(clk),
		.enable(enable),
		.Out(Out), 
		.Zero(Zero)
	);

	localparam delay = 1;

	initial begin
		clk = 0;
		forever begin
			#delay clk = ~clk;
		end
	end

	initial begin
		A = 32'b1001_0110_1111_0010_0000_1011_1110_0101;
		B = 32'b1011_0100_1010_1100_0010_1001_0010_0011;
		
		Op = 4'b0000;  // Addition

		enable = 1;
		#2;
		enable = 0;
		#2;


		Op = 4'b0001;  // Subtraction

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b0010;  // Logic AND

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b0011;  // Logic OR

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b0100;  // Inverse A

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b1000;  // Arithmetic shift 1 right

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b1001;  // Logic shift 1 left

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b1010;  // Logic shift 1 right

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b1100;  // Rotate 1 left

		enable = 1;
		#2;
		enable = 0;
		#2;

		Op = 4'b1101;  // Rotate 1 right

		enable = 1;
		#2;
		enable = 0;
		#2;
		
		Op = 4'b1111;  // Undefined op code

	end
      
endmodule


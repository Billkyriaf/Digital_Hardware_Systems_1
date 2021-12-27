`timescale 1ns / 1ps

module alu(
    input wire [31:0] A,    // First operant
    input wire [31:0] B,    // Second operant
    input wire [3:0] Op,    // Operation code
    output reg [31:0] Out,  // Output signal
    output reg Zero         // Single bit, 1 if output is 0, 0 else
    );

    // if any of the inputs changes...
    always @(*) begin
        // Write the output depending on the op code
        case (Op)
            4'b0000: Out = A + B;    // Addition
            4'b0001: Out = A - B;    // Addition
            4'b0010: Out = A & B;    // Bitwise and
            4'b0011: Out = A | B;    // Bitwise or
            4'b0100: Out = ~A;       // Bitwise not
            4'b1000: Out = A >>> 1;  // Arithmetic shift right
            4'b1001: Out = A << 1;   // Logic shift left
            4'b1010: Out = A >> 1;   // Logic shift right
            // 4'b1100:
            // 4'b1101:
            default: Out = 32'bz;    // The default state of out is high impedance
        endcase

        Zero = 0;  // Zero by default is 0

        // If the output becomes 0...
        if (Out == 0) begin
            Zero = 1;  // ...Zero becomes 1
        end
    end
endmodule

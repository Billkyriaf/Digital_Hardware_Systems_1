`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   12/28/2021
// Design Name:
// Module Name:   ALU
// Project Name:  Digital_Hardware_Systems
//
// Description: 
//
//     ALU module. Supports:
// 
//          1. Addition,      opcode: 0000
//          2. Subtraction,   opcode: 0001
//          3. Bitwise AND,   opcode: 0010
//          4. Bitwise OR,    opcode: 0011
//          5. Bitwise NOT,   opcode: 0100
//
//          6. Arithmetic Shift Right,  opcode: 1000
//          7. Logic Shift Left 1 bit,  opcode: 1001
//          8. Logic Shift Right 1 bit, opcode: 1010
//          9. Rotate Left 1 bit,       opcode: 1100
//         10. Rotate Right 1 bit,      opcode: 1101
//
// Dependencies:
// 
// 
////////////////////////////////////////////////////////////////////////////////

module ALU(
    input wire [31:0] A,    // First operant
    input wire [31:0] B,    // Second operant
    input wire [3:0] Op,    // Operation code
    output reg [31:0] Out,  // Output signal
    output reg Zero         // Single bit, 1 if output is 0, 0 else
    );

    reg tmp;

    // On the positive edge of the CLOCK...
    always @( * ) begin

            // Write the output depending on the op code
        case (Op)
            4'b0000: Out = A + B;    // Addition
            4'b0001: Out = A - B;    // Subtraction
            4'b0010: Out = A & B;    // Bitwise and
            4'b0011: Out = A | B;    // Bitwise or
            4'b0100: Out = ~A;       // Bitwise not
            4'b1000: begin           // Arithmetic shift right
                Out = A >> 1;
                Out[31] = Out[30];  
            end 
            4'b1001: Out = A << 1;   // Logic shift left
            4'b1010: Out = A >> 1;   // Logic shift right
            4'b1100: begin           // Rotate left 1 bit
                tmp = A[31];
                Out = A << 1;
                Out[0] = tmp;
            end
            4'b1101: begin           // Rotate right 1 bit
                tmp = A[0];
                Out = A >> 1;
                Out[31] = tmp;
            end
            default: Out = 32'bz;    // The default state of out is high impedance
        endcase

        Zero = 0;  // Zero by default is 0

        // If the output becomes 0...
        if (Out == 32'b0) begin
            Zero = 1;  // ...Zero becomes 1
        end
    end
endmodule

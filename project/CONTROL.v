`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    01/12/2022 
// Design Name: 
// Module Name:    CONTROL 
// Project Name:   Digital_Hardware_Systems
//
// Description: 
//
//      Sets all the control signals for every stage of the execution of every instruction.
//
// Dependencies: 
//
//
//////////////////////////////////////////////////////////////////////////////////

module CONTROL(
    input [31:0] Instr,
    input Clk,
    input Zero,                  // ALU out
    output reg PC_Sel,           // IFSTAGE
    output reg PC_LdEn,          // IFSTAGE
    output reg Reset,            // IFSTAGE 

    output reg RF_B_sel,         // DECSTAGE
    output reg RF_WrData_sel,    // DECSTAGE
    output reg RF_WEn,           // DECSTAGE

    output reg ALU_Bin_sel,      // ALU
    output reg [3:0] ALU_func,   // ALU

    output reg MEM_WrEn,         // MEMSTAGE
    output reg Mem_In_Out_Sel    // MEMSTAGE selects if the input/output will be a 32bit word or 8bits with 24 leading 0s 
);
    // The adder register counts the sub phases for all the instructions.
    // Every instruction is spit on multiple phases and for every phase different signals must be enabled
    reg [2:0] adder;



    initial begin
        // Set all the control signals to 0 initially
        adder = 0;
        PC_Sel = 0;
        PC_LdEn = 0;
        Reset = 0;
        RF_B_sel = 0;
        RF_WrData_sel = 0;
        RF_WEn = 0;
        ALU_Bin_sel = 0;
        ALU_func = 0;
        MEM_WrEn = 0;
        Mem_In_Out_Sel = 0;
    end

    always @(posedge Clk) begin
        // On every positive edge of the clock the adder advances by one.
        adder = adder + 1;

        // If the adder reaches 6 the adder is reset because no instruction has more than 5 phases.
        if (adder > 6) begin
            adder = 0;
        end
    end

    // If the adder counter changes this means that the previous stage of the instruction
    // is complete and we need to set the signals for the next one
    always @(adder) begin
        // This if else if else case covers all the cases for the opcodes.
        if (Instr[31:0] == 0) begin  // nop instruction

            // For every instruction / instruction group there is a case statement the switches for every value of the adder counter 
            case (adder)
                // For the 4rth stage ...
                3'b100: begin
                    PC_LdEn = 1;  // ... only the PC_LdEn needs to be set
                end

                // For every case that is not specified above all the signals need to be 0
                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase

        end else if(Instr[31:26] == 6'b100000) begin  // Arithmetic (ALU) operations
            case (adder)
                3'b010: begin
                    ALU_func = Instr[3:0];
                end

                3'b011: begin
                    RF_WEn = 1;
                end

                3'b100: begin
                    RF_WEn = 0;
                    PC_LdEn = 1;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end

            endcase
            
        end else if (Instr[31:26] == 6'b111000 || Instr[31:26] == 6'b111001 || Instr[31:26] == 6'b110000) begin   // li, lui, addi instructions
             case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end
                
                3'b010: begin
                    ALU_Bin_sel = 1;
                end

                3'b011: begin
                    RF_WEn = 1;
                    ALU_Bin_sel = 1;
                end

                3'b100: begin
                    PC_LdEn = 1;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    RF_B_sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase

        end else if (Instr[31:26] == 6'b110010) begin  // andi instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 4'b0010;
                end

                3'b011: begin
                    RF_WEn = 1;
                    ALU_Bin_sel = 1;
                end

                3'b100: begin
                    PC_LdEn = 1;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    RF_B_sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end else if (Instr[31:26] == 6'b110011) begin  // ori instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 4'b0011;
                end

                3'b011: begin
                    RF_WEn = 1;
                    ALU_Bin_sel = 1;
                end

                3'b100: begin
                    PC_LdEn = 1;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    RF_B_sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end else if (Instr[31:26] == 6'b111111) begin  // b instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    RF_B_sel = 1;
                end

                3'b011: begin
                    RF_B_sel = 1;
                end

                3'b100: begin
                    PC_Sel = 1;
                    PC_LdEn = 1;
                    RF_B_sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end else if (Instr[31:26] == 6'b000000) begin  // beq instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    RF_B_sel = 1;
                end

                3'b011: begin
                    PC_Sel = Zero;
                    RF_B_sel = 1;
                    ALU_func = 4'b001;
                end
                
                3'b100: begin
                    PC_Sel = Zero;
                    PC_LdEn = 1;
                    RF_B_sel = 1;
                    ALU_func = 4'b001;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end else if (Instr[31:26] == 6'b000001) begin  // bne instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    RF_B_sel = 1;
                end

                3'b011: begin
                    PC_Sel = ~Zero;
                    RF_B_sel = 1;
                    ALU_func = 4'b001;
                end
                
                3'b100: begin
                    PC_Sel = ~Zero;
                    PC_LdEn = 1;
                    RF_B_sel = 1;
                    ALU_func = 4'b001;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase

        end else if (Instr[31:26] == 6'b001111) begin  // lw instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end
                
                3'b010: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                end

                3'b011: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
                
                3'b100: begin
                    RF_WrData_sel = 1;
                    RF_WEn = 1;
                end

                3'b101: begin
                    PC_Sel = 0;
                    PC_LdEn = 1;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end else if (Instr[31:26] == 6'b011111) begin  // sw instruction
            case (adder)
                3'b010: begin
                    RF_B_sel = 1;
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                end

                3'b011: begin
                    RF_B_sel = 1;
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                    MEM_WrEn = 1;
                    Mem_In_Out_Sel = 0;
                end

                3'b100: begin
                    PC_Sel = 0;
                    PC_LdEn = 1;
                    RF_B_sel = 0;
                    ALU_Bin_sel = 0;
                    MEM_WrEn = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        
        end else if (Instr[31:26] == 6'b000111) begin  // sb instruction
            case (adder)
                3'b010: begin
                    RF_B_sel = 1;
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                end

                3'b011: begin
                    RF_B_sel = 1;
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                    MEM_WrEn = 1;
                    Mem_In_Out_Sel = 0;
                    Mem_In_Out_Sel = 1;
                end

                3'b100: begin
                    PC_Sel = 0;
                    PC_LdEn = 1;
                    RF_B_sel = 0;
                    ALU_Bin_sel = 0;
                    MEM_WrEn = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase

        end else if (Instr[31:26] == 6'b000011) begin  // lb instruction
            case (adder)
                3'b001: begin
                    RF_B_sel = 1;
                end

                3'b010: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                end

                3'b011: begin
                    ALU_Bin_sel = 1;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 1;
                end
                
                3'b100: begin
                    RF_WrData_sel = 1;
                    RF_WEn = 1;
                    Mem_In_Out_Sel = 1;
                end

                3'b101: begin
                    PC_Sel = 0;
                    PC_LdEn = 1;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    Mem_In_Out_Sel = 0;
                end

                default: begin
                    PC_Sel = 0;
                    PC_LdEn = 0;
                    Reset = 0;
                    RF_B_sel = 0;
                    RF_WrData_sel = 0;
                    RF_WEn = 0;
                    ALU_Bin_sel = 0;
                    ALU_func = 0;
                    MEM_WrEn = 0;
                    Mem_In_Out_Sel = 0;
                end
            endcase
        end
    end

endmodule

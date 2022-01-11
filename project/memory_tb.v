`timescale 1 ns / 1 ps

`ifndef CLOCK
  `include "CLOCK.v"
  `define CLOCK
`endif

`ifndef MEMSTAGE
  `include "MEMSTAGE.v"
  `define MEMSTAGE
`endif

module memory_tb;

	// Inputs
	reg Mem_WrEn;
	reg [31:0] ALU_MEM_Addr;
	reg [31:0] MEM_DataIn;
	wire Clk;

	// Outputs
	wire [31:0] MEM_DataOut;

	CLOCK clk (
		.Clk(Clk)
	);

    MEMSTAGE mem (
        .clk(Clk),
        .Mem_WrEn(Mem_WrEn),
        .ALU_MEM_Addr(ALU_MEM_Addr),
        .MEM_DataIn(MEM_DataIn),
        .MEM_DataOut(MEM_DataOut)
    );

	initial begin
        Mem_WrEn = 0;
        ALU_MEM_Addr = 0;
        MEM_DataIn = 0;
        #2;

        Mem_WrEn = 1;
        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000000_00;
        MEM_DataIn = 0;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000001_00;
        MEM_DataIn = 1;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000010_00;
        MEM_DataIn = 2;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000011_00;
        MEM_DataIn = 3;
        #2;


        Mem_WrEn = 0;
        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000000_00;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000001_00;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000010_00;
        #2;

        ALU_MEM_Addr = 32'b0000_0000_0000_0000_0000_0000000011_00;
        #2;
	end
      
endmodule
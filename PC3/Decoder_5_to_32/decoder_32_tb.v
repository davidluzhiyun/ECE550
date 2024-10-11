// set the timescale
`timescale 1 ns / 100 ps
module decoder_32_tb(); 

	// inputs as regs, including clock
   reg [4:0] in;
	// clock
	reg clk;

	
	// output as wires
	wire [31:0] out;
	
	// track errors
	integer errors;
	// index for cycle
	integer index;
	
	decoder_32 decoder_test (in,out);
	
	initial
	begin
		for(index = 0; index <= 31; index = index + 1) begin
			@(negedge clk);
			in = index;
		end
		@(negedge clk);
	      $stop;
	end
	
		
 	always
       	#10 clk = ~clk; // toggle clock every 10 timescale units
 	
endmodule
		
	
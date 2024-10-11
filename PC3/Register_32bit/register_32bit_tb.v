// set the timescale
`timescale 1 ns / 100 ps
module register_32bit_tb(); 

	// inputs as regs, including clock
   reg [31:0] d; 
	reg clk, en, clr;	
	
	// output as wires
	wire [31:0] q;
	
	// track errors
	integer errors;
	
	register_32bit register_test (q, d, clk, en, clr);
	
	initial
	begin
		$display($time, " << Starting the Simulation >>");
		clk = 1'b0;    // at time 0
		errors = 0;
		
		clr = 1'b1;    // assert reset
		@(negedge clk);    // wait until next negative edge of clock
		@(negedge clk);    // wait until next negative edge of clock

		clr = 1'b0;    // de-assert reset
		@(negedge clk);    // wait until next negative edge of clock

		@(negedge clk);
			d = 32'b11011101110111011101110111011101;
			en = 1'b0;
		
		@(negedge clk);
			en = 1'b1;
			
		@(negedge clk);
			clr = 1'b1;
		@(negedge clk);
	      $stop;
		
		if (errors == 0) begin
			$display("The simulation completed without errors");
		end
		else begin
			$display("The simulation failed with %d errors", errors);
		end
	end
		
 	always
       	#10 clk = ~clk; // toggle clock every 10 timescale units
 	
endmodule
		
	
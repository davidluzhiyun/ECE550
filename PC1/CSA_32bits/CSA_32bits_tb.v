// set the timescale
`timescale 1 ns / 100 ps
module CSA_32bits_tb(); 
	
	// inpts as regs
 	reg [31:0]in1;
 	reg [31:0]in2;
	reg c_in;
 	
 	// clocks are useful for testbenches because they allow you to check your
 	// circuit at regular intervals large enough for signals to propagate
 	reg clock;
 	
 	// set up output as wire
 	wire c_out;
	wire [31:0] sum;
 	
 	// other variables
 	integer num_errors;
 	
 	// instantiate the RCA 
 	CSA_32bits test_CSA (in1, in2, c_in, c_out, sum);
 	
 	// begin simulation
 	initial begin
       	$display($time, " simulation start");
       	
       	clock = 1'b0;
       	
       	       	
   @(negedge clock);
       	in1 = 32'hFFFFFFFA;
       	in2 = 32'h00000005;
	      c_in = 1'b0;
	@(negedge clock); // wait for the clock to go negative
       	in1 = 32'hFFFFFFF9;
       	in2 = 32'h00000006;
	      c_in = 1'b1;
   @(negedge clock);
	      $stop;
	   
 	end
 	
 	always
       	#10 clock = ~clock; // toggle clock every 10 timescale units
 	
endmodule

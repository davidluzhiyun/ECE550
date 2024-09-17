// set the timescale
`timescale 1 ns / 100 ps
module RCA_16bits_tb(); 
	
	// inpts as regs
 	reg [15:0]in1;
 	reg [15:0]in2;
	reg c_in;
 	
 	// clocks are useful for testbenches because they allow you to check your
 	// circuit at regular intervals large enough for signals to propagate
 	reg clock;
 	
 	// set up output as wire
 	wire c_out;
	wire [15:0] sum;
 	
 	// other variables
 	integer num_errors;
 	
 	// instantiate the RCA 
 	RCA_16bits test_RCA (in1, in2, c_in, c_out, sum);
 	
 	// begin simulation
 	initial begin
       	$display($time, " simulation start");
       	
       	clock = 1'b0;
       	
       	       	
   @(negedge clock);
       	in1 = 16'b1101110111011101;
       	in2 = 16'b1000100010001000;
	      c_in = 1'b1;
	@(negedge clock); // wait for the clock to go negative
       	in1 = 16'b1010101010101010;
       	in2 = 16'b1001100110011001;
	      c_in = 1'b0;
   @(negedge clock);
	      $stop;
	   
 	end
 	
 	always
       	#10 clock = ~clock; // toggle clock every 10 timescale units
 	
endmodule

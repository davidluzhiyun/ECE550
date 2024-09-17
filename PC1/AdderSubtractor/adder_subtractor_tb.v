// set the timescale
`timescale 1 ns / 100 ps
module adder_subtractor_tb(); 
	
	// inpts as regs
 	reg [31:0]in1;
 	reg [31:0]in2;
	reg add_sub;
 	
 	// clocks are useful for testbenches because they allow you to check your
 	// circuit at regular intervals large enough for signals to propagate
 	reg clock;
 	
 	// set up output as wire
 	wire c_out;
	wire ovf;
	wire [31:0] sum;
 	
 	// other variables
 	integer num_errors;
 	
 	// instantiate the RCA 
 	adder_subtractor test_adder_subtractor (in1, in2, add_sub, c_out, ovf, sum);
 	
 	// begin simulation
 	initial begin
       	$display($time, " simulation start");
       	
       	clock = 1'b0;
       	
       	       	
   @(negedge clock);
       	in1 = 32'h7FFFFFFF;
       	in2 = 32'h00000001;
	      add_sub = 1'b0;
	@(negedge clock); // wait for the clock to go negative
       	in1 = 32'hFFFFFFF9;
       	in2 = 32'hFFFFFFFA;
	      add_sub = 1'b1;
   @(negedge clock);
	      $stop;
	   
 	end
 	
 	always
       	#10 clock = ~clock; // toggle clock every 10 timescale units
 	
endmodule

// set the timescale
`timescale 1 ns / 100 ps
module full_adder_tb(); // testbench
	// set up inputs as registers so that I can manipulate them
	reg a;
	reg b;
	reg c_in;
	
	// clock
	reg clock;
	
	// set up outputs as wires
	wire sum;
	wire c_out;
	
	// some other variables
	integer num_errors;
	
	// instantiate full adder
	full_adder test_full_adder (sum, c_out, a, b, c_in);
	
	// begin simulation and initialize
	initial begin
		$display($time,  "simulation start");
		clock = 1'b0;
		num_errors = 0;
		
		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b0;
		b = 1'b0;
		c_in = 1'b0;
		
		// test results
		@(negedge clock);
      if (sum != 1'b0 || c_out != 1'b0) begin
			$display("a %b b %b c_in %b Error: sum expected 0 got %b, c_out expected 0 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end

		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b0;
		b = 1'b0;
		c_in = 1'b1;
		
		// test results
		@(negedge clock);
      if (sum != 1'b1 || c_out != 1'b0) begin
			$display("a %b b %b c_in %b Error: sum expected 1 got %b, c_out expected 0 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end		
		
		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b0;
		b = 1'b1;
		c_in = 1'b0;
		
		// test results
		@(negedge clock);
      if (sum != 1'b1 || c_out != 1'b0) begin
			$display("a %b b %b c_in %b Error: sum expected 1 got %b, c_out expected 0 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end

		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b0;
		b = 1'b1;
		c_in = 1'b1;
		
		// test results
		@(negedge clock);
      if (sum != 1'b0 || c_out != 1'b1) begin
			$display("a %b b %b c_in %b Error: sum expected 0 got %b, c_out expected 1 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end
		
		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b1;
		b = 1'b0;
		c_in = 1'b0;
		
		// test results
		@(negedge clock);
      if (sum != 1'b1 || c_out != 1'b0) begin
			$display("a %b b %b c_in %b Error: sum expected 1 got %b, c_out expected 0 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end

		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b1;
		b = 1'b0;
		c_in = 1'b1;
		
		// test results
		@(negedge clock);
      if (sum != 1'b0 || c_out != 1'b1) begin
			$display("a %b b %b c_in %b Error: sum expected 0 got %b, c_out expected 1 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end		
		
		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b1;
		b = 1'b1;
		c_in = 1'b0;
		
		// test results
		@(negedge clock);
      if (sum != 1'b0 || c_out != 1'b1) begin
			$display("a %b b %b c_in %b Error: sum expected 0 got %b, c_out expected 1 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end

		// update at the negative edge of the clock
		@(negedge clock);
		a = 1'b1;
		b = 1'b1;
		c_in = 1'b1;
		
		// test results
		@(negedge clock);
      if (sum != 1'b1 || c_out != 1'b1) begin
			$display("a %b b %b c_in %b Error: sum expected 1 got %b, c_out expected 1 got %b", a, b, c_in, sum, c_out);
			num_errors = num_errors + 1;
      end
		
		
		// summary
		if (num_errors == 0) begin
			$display("Simulation succeeded with no errors.");
		end else begin
			$display("Simulation failed with %d error(s).", num_errors);
      end
		
		$stop; // stop simulation
	end
	always
		#10 clock = ~clock; // toggle clock every 10 timescale units
endmodule


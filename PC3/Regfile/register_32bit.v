module register_32bit(q, d, clk, en, clr);
	 //Inputs
   input [31:0] d; 
	input clk, en, clr;

   //Output
   output [31:0] q;
	
	// stack 32 dffe together
	genvar i;
	
	generate
		for (i=0; i<32; i=i+1) begin : generate_register
			dffe_ref dffe_i(q[i], d[i], clk, en, clr);
		end
	endgenerate
endmodule

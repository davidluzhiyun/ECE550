module RCA_16bits (in1, in2, c_in,c_out,sum);
	// inputs definition
	input [15:0] in1;
	input [15:0] in2;
	input c_in;
	
 	// outputs definiton;
	output c_out;
	output [15:0] sum;
	
	// array of wires for carrying
	wire c [14:0];
	
	// manually connect for the two edge full adders
	full_adder lowest_full_adder(sum[0],c[0],in1[0],in2[0],c_in);
	full_adder highest_full_adder(sum[15],c_out,in1[15],in2[15],c[14]);
	
	// use generate for on the other full adders
	genvar i;
	
	generate
		for (i=1; i<=14; i=i+1) begin : name_for_generate_block//Due to Quartus Bug ID: 15010773232 we need to name the generate block
			full_adder full_adder_i(
				.sum (sum[i]),
				.c_out (c[i]),
				.a (in1[i]),
				.b (in2[i]),
				.c_in (c[i-1])
			);
		end
	endgenerate
endmodule

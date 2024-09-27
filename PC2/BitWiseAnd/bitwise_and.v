module bitwise_and (in1, in2, out);
	// inputs definition
	input [31:0] in1;
	input [31:0] in2;
	
	// outputs definitio
	output [31:0] out;
	
	genvar i;
	
	generate
		for (i=0; i<=31; i=i+1) begin : name_for_generate_block//Due to Quartus Bug ID: 15010773232 we need to name the generate block
			and(out[i], in1[i], in2[i]);
		end
	endgenerate
endmodule

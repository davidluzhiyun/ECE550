module adder_subtractor(in1, in2, add_sub, c_out, ovf, sum);

	// inputs definition
	input [31:0] in1;
	input [31:0] in2;
	input add_sub;
	
	// outputs definiton
	output c_out;
	output ovf;
	output [31:0] sum;
	
	// wires definition
	wire [31:0] not_in2;
	wire [31:0] processed_in2;
	
	// use generate for to bitwise not in2
	genvar i;
	
	generate
		for (i=0; i<=31; i=i+1) begin : bitwise_not_in2_generate_block//Due to Quartus Bug ID: 15010773232 we need to name the generate block
			not(not_in2[i], in2[i]);
		end
	endgenerate
	
	// mux to select between in2 and not_in2
	assign processed_in2 = add_sub ? not_in2 : in2;
	
	// use the adder
	CSA_32bits my_adder(in1, processed_in2, add_sub, c_out, ovf, sum);
endmodule

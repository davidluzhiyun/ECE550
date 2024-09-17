module CSA_32bits (in1, in2, c_in,c_out, ovf, sum);
	// inputs definition
	input [31:0] in1;
	input [31:0] in2;
	input c_in;
	
 	// outputs definiton;
	output c_out;
	output [31:0] sum;
	output ovf;
	
	//carry selection wire
	wire c;
	
	// overflow wires
	wire ovf_lower;
	wire ovf_higher_0;
	wire ovf_higher_1;
	
	// wires for the results of the higher 16 bits
	wire [15:0] higher_0;
	wire [15:0] higher_1;
	wire c_out_0;
	wire c_out_1;
	
	// lower 16 bits
	RCA_16bits lower_RCA(in1[15:0], in2[15:0], c_in, c, ovf_lower, sum[15:0]);
	
	// higher 16 bits;
	RCA_16bits higher_RCA_0(in1[31:16], in2[31:16], 1'b0, c_out_0, ovf_higher_0, higher_0);
	RCA_16bits higher_RCA_1(in1[31:16], in2[31:16], 1'b1, c_out_1, ovf_higher_1, higher_1);
	
	// muxes
	assign sum[31:16] = c ? higher_1 : higher_0;
	assign c_out = c ? c_out_1 : c_out_0;
	assign ovf = c ? ovf_higher_1 : ovf_higher_0;

endmodule

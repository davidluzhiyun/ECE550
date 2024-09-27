module logical_left_shift(in1, ctrl_shiftamt, out);
	// inputs definition
	input [31:0] in1;
	input [4:0] ctrl_shiftamt;
	
	// outputs definition
	output [31:0] out;
	
	wire [31:0] w[0:3];

	// initial stage
	
	genvar h;
	
	generate
		for (h=0; h<=31; h=h+1) begin : initial_block
			if(h>=2**0) begin
				assign w[0][h] = ctrl_shiftamt[0]? in1[h-(2**0)] : in1[h];
			end
			else begin
				assign w[0][h] = ctrl_shiftamt[0]? 1'b0 : in1[h];
			end
		end
	endgenerate
		
	genvar i;
	genvar j;
	generate
		for (i=1; i<=3; i=i+1) begin : outer_block
			for (j=0; j <=31; j=j+1) begin : inner_block 
				if(j >= 2**i) begin
					assign w[i][j] = ctrl_shiftamt[i]? w[i-1][j-(2**i)] : w[i-1][j];
				end
				else begin
					assign w[i][j] = ctrl_shiftamt[i]? 1'b0 : w[i-1][j];
				end
			end
		end
	endgenerate

	genvar k;
	
	generate
		for (k=0; k<=31; k=k+1) begin : end_block
			if(k>=2**4) begin
				assign out[k] = ctrl_shiftamt[4]? w[3][k-(2**4)] : w[3][k];
			end
			else begin
				assign out[k] = ctrl_shiftamt[4]? 1'b0 : w[3][k];
			end
		end
	endgenerate
endmodule 
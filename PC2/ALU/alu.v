module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	// input wires for the mux, placeholders
	wire [31:0] in [31:0];
	
	// unused c_out wire 
	wire c_out;
	// sum wire
	wire [31:0]sum;
	
	
	// instantiate the mux for output
	// decoider and tri-state buffer would be quicker, but they aren't allowed for PC1
	mux_32 alu_mux(ctrl_ALUopcode, sum, sum, in[2], in[3], in[4], in[5], in[6], in[7], in[8],
				  in[9], in[10], in[11], in[12], in[13], in[14], in[15], in[16], in[17], 
				  in[18], in[19], in[20], in[21], in[22], in[23], in[24], in[25], in[26], 
				  in[27], in[28], in[29], in[30], in[31], data_result);
				  
	// since overflow is only for add subtract, we are not using another mux here
	
	adder_subtractor alu_adder(data_operandA, data_operandB, ctrl_ALUopcode[0], c_out, overflow, sum);
	
	// for other operations, we will use the input wires for the mux since other result are conected to only one port
	bitwise_and alu_and(data_operandA, data_operandB, in[2]);
	bitwise_or alu_or(data_operandA, data_operandB, in[3]);
	logical_left_shift alu_sll(data_operandA, ctrl_shiftamt, in[4]);
	arithmetic_right_shift alu_sra(data_operandA, ctrl_shiftamt, in[5]);
	
	// is less than
	wire a_neg_b_pos;
	wire not_a_pos_b_neg;
	wire b_pos;
	not(b_pos,data_operandB[31]);
	and(a_neg_b_pos,data_operandA[31],b_pos);
	or(not_a_pos_b_neg, data_operandA[31],b_pos);
	wire res1;
	or(res1,data_result[31],a_neg_b_pos);
	and(isLessThan, res1, not_a_pos_b_neg);
	
	// not equal
	wire ne[0:31];
	or(ne[0],data_result[0],1'b0);
	genvar i;
		generate
		for (i=1; i<=31; i=i+1) begin : block
			or(ne[i], ne[i-1], data_result[i]);
		end
	endgenerate
	or(isNotEqual, ne[31], overflow);
	
endmodule

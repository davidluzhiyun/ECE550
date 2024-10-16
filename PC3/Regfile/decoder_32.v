module decoder_32(in,out);
	input [4:0] in;
	output [31:0] out;
	and(out[0],~in[4],~in[3],~in[2],~in[1],~in[0]);
	and(out[1],~in[4],~in[3],~in[2],~in[1], in[0]);
	and(out[2],~in[4],~in[3],~in[2], in[1],~in[0]);
	and(out[3],~in[4],~in[3],~in[2], in[1], in[0]);
	and(out[4],~in[4],~in[3], in[2],~in[1],~in[0]);
	and(out[5],~in[4],~in[3], in[2],~in[1], in[0]);
	and(out[6],~in[4],~in[3], in[2], in[1],~in[0]);
	and(out[7],~in[4],~in[3], in[2], in[1], in[0]);
	and(out[8],~in[4], in[3],~in[2],~in[1],~in[0]);
	and(out[9],~in[4], in[3],~in[2],~in[1], in[0]);
	and(out[10],~in[4], in[3],~in[2], in[1],~in[0]);
	and(out[11],~in[4], in[3],~in[2], in[1], in[0]);
	and(out[12],~in[4], in[3], in[2],~in[1],~in[0]);
	and(out[13],~in[4], in[3], in[2],~in[1], in[0]);
	and(out[14],~in[4], in[3], in[2], in[1],~in[0]);
	and(out[15],~in[4], in[3], in[2], in[1], in[0]);
	and(out[16], in[4],~in[3],~in[2],~in[1],~in[0]);
	and(out[17], in[4],~in[3],~in[2],~in[1], in[0]);
	and(out[18], in[4],~in[3],~in[2], in[1],~in[0]);
	and(out[19], in[4],~in[3],~in[2], in[1], in[0]);
	and(out[20], in[4],~in[3], in[2],~in[1],~in[0]);
	and(out[21], in[4],~in[3], in[2],~in[1], in[0]);
	and(out[22], in[4],~in[3], in[2], in[1],~in[0]);
	and(out[23], in[4],~in[3], in[2], in[1], in[0]);
	and(out[24], in[4], in[3],~in[2],~in[1],~in[0]);
	and(out[25], in[4], in[3],~in[2],~in[1], in[0]);
	and(out[26], in[4], in[3],~in[2], in[1],~in[0]);
	and(out[27], in[4], in[3],~in[2], in[1], in[0]);
	and(out[28], in[4], in[3], in[2],~in[1],~in[0]);
	and(out[29], in[4], in[3], in[2],~in[1], in[0]);
	and(out[30], in[4], in[3], in[2], in[1],~in[0]);
	and(out[31], in[4], in[3], in[2], in[1], in[0]);
endmodule

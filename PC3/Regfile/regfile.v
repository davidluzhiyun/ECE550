module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	// wires for reading registers
	wire [31:0] reg_out [0:31];
	// write port and the registers
	wire [31:0] write_decoder_out;
	wire [31:0] enables;
	decoder_32 write_decoder(ctrl_writeReg,write_decoder_out);
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin : generate_write_and_reg
			and(enables[i],ctrl_writeEnable,write_decoder_out[i]);
			if (i==0) begin
				// reg0 always 0
				register_32bit register_i(reg_out[i],data_writeReg,clock,enables[i],1'b1);
			end
			else begin
				register_32bit register_i(reg_out[i],data_writeReg,clock,enables[i],ctrl_reset);
			end
		end
	endgenerate
	// read port
	wire [31:0] readA_decoder_out;
	wire [31:0] readB_decoder_out;
	decoder_32 readA_decoder(ctrl_readRegA,readA_decoder_out);
	decoder_32 readB_decoder(ctrl_readRegB,readB_decoder_out);
	genvar j;
	generate
		for (j=0; j<32; j=j+1) begin : generate_read
			assign data_readRegA = readA_decoder_out[j] ? reg_out[j] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
			assign data_readRegB = readB_decoder_out[j] ? reg_out[j] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
		end
	endgenerate
endmodule

module full_adder (sum, c_out, a, b, c_in);
    input a, b, c_in;
    output sum, c_out;
    wire a_XOR_b, a_AND_b, w3;
    xor(a_XOR_b, a, b);
	 and(a_AND_b, a, b);
    and(w3, a_XOR_b, c_in);
    xor(sum, c_in, a_XOR_b);
    or(c_out, w3, a_AND_b);
endmodule

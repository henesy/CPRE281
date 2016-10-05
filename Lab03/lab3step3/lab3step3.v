module lab3step3(F, C, G, W, A);
	input F, C, G, W;
	output A;
	
	assign A = ((~F & G & C) | (~F & G & ~C & W) | (F & ~G & ~C) | (F & ~G & C & ~W));
	
endmodule

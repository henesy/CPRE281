module lab3step2(C, G, W, A);
	input C, G, W;
	output A;
	
	assign A = ((C | ~G | W) & (~C | G | ~W));
	
endmodule

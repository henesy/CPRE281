module mProjstep7(W, X, Y, Z, P);
	input W, X, Y, Z;
	output P;
	
	assign P = (X & ~Y & Z) | (Z & ~W & X) | (Y & ~W & ~X) | (~X & Y & Z);

endmodule

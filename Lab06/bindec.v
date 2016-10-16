module bindec(c0, s3, s2, s1, s0, z2, y2, x2, w2, z1, y1, x1, w1);
	input c0, s3, s2, s1, s0;
	output z2, y2, x2, w2, z1, y1, x1, w1;
	
	assign z2 = 0;
	assign y2 = 0;
	assign x2 = (c0 & s2) | (c0 & s3);
	assign w2 = (~c0 & s3 & s1) | (~c0 & s3 & s2) | (s3 & s2 & s1) | (c0 & ~s3 & ~s2);
	assign z1 = (~c0 & s3 & ~s2 & ~s1) | (c0 & ~s3 & ~s2 & s1) | (c0 & s3 & s2 & ~s1);
	assign y1 = (~c0 & ~s3 & s2) | (~c0 & s2 & s1) | (c0 & ~s2 & ~s1) | (c0 & s3 & ~s2);
	assign x1 = (~c0 & ~s3 & s1) | (~s3 & s2 & s1) | (~c0 & s3 & s2 & ~s1) | (c0 & ~s3 & ~s2 & ~s1) | (c0 & s3 & ~s2 & s1);
	assign w1 = s0;

endmodule

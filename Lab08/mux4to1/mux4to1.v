module mux4to1(i0, i1, i2, i3, s0, s1, f);
	input i0, i1, i2, i3, s0, s1;
	output reg f;
	
	always @(i0 or i1 or i2 or i3 or s0 or s1)
	begin
		case({s0, s1})
			2'b00: f = i0;
			2'b01: f = i1;
			2'b10: f = i2;
			2'b11: f = i3;
		endcase
	end
endmodule

module decoder_2to4(Y3, Y2, Y1, Y0, A, B, en);

	output Y3, Y2, Y1, Y0;
	input A, B;
	input en;
	reg Y3, Y2, Y1, Y0;

	always @(A or B or en) begin
	if (en == 1'b1)
	case ( {A,B} )
	2'b00: {Y3,Y2,Y1,Y0} = 4'b1110;
	2'b01: {Y3,Y2,Y1,Y0} = 4'b1101;
	2'b10: {Y3,Y2,Y1,Y0} = 4'b1011;
	2'b11: {Y3,Y2,Y1,Y0} = 4'b0111;
	default: {Y3,Y2,Y1,Y0} = 4'bxxxx;
	endcase
	if (en == 0)
	{Y3,Y2,Y1,Y0} = 4'b1111;
	end

endmodule

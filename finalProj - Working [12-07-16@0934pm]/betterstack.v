
module betterstack(w2, w1, in3, in2, in1, in0, r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, or00, or01, or02, or03, or10, or11, or12, or13, or20, or21, or22, or23, or30, or31, or32, or33, ctl, y3, y2, y1, z3, z2, z1, lopd, opd);
	input ctl, w2, w1, in3, in2, in1, in0, or00, or01, or02, or03, or10, or11, or12, or13, or20, or21, or22, or23, or30, or31, or32, or33, y3, y2, y1, lopd;
	output reg r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, z3, z2, z1, opd;
		
	always@(ctl)
	begin
	
	if(ctl == 0 && lopd == 0)
	begin
		opd = 1;
		/* begin raw 3 bit state logic */
		if(y3 == 0 && y2 == 0 && y1 == 0)
		begin
		/* 000 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 0;
				z2 = 0;
				z1 = 1;
			end
			
			else if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 0;
			end
		end
		
		else if(y3 == 0 && y2 == 0 && y1 == 1)
		begin
		/* 001 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 0;
				z2 = 1;
				z1 = 0;
			end
			
			else if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 0;
			end
		end
		
		else if(y3 == 0 && y2 == 1 && y1 == 0)
		begin
		/* 010 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 0;
				z2 = 1;
				z1 = 1;
			end
			
			else if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 1;
			end
		end
		
		else if(y3 == 0 && y2 == 1 && y1 == 1)
		begin
		/* 011 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 1;
				z2 = 0;
				z1 = 0;
			end
			
			else if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 1;
				z1 = 0;
			end
		end
		
		else if(y3 == 1 && y2 == 0 && y1 == 0)
		begin
		/* 100 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 1;
				z2 = 0;
				z1 = 0;
			end
			
			else if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 1;
				z1 = 1;
			end
		end
		else
		begin
			z3 = y3;
			z2 = y2;
			z1 = y1;
		end
	
	
		/*** END STATE MACHINE ***/
		
		/* push */
		if(w2 == 0 && w1 == 0)
		begin
			case({y3, y2, y1})
			3'b000:
			begin
			/* 0 in queue */
			r00 = in0;
			r01 = in1;
			r02 = in2;
			r03 = in3;
			end
			
			3'b001:
			begin
			/* 1 */
			r10 = in0;
			r11 = in1;
			r12 = in2;
			r13 = in3;
			end
			
			3'b010:
			begin
			/* 2 */
			r20 = in0;
			r21 = in1;
			r22 = in2;
			r23 = in3;
			end
			
			3'b011:
			begin
			/* 3 */
			r30 = in0;
			r31 = in1;
			r32 = in2;
			r33 = in3;
			end
			
			3'b100:
			begin
			/* 4 */
			r30 = or30;
			r31 = or31;
			r32 = or32;
			r33 = or33;
			end
			
			endcase
		end
		
		
		/* pop */
		else if(w2 == 0 && w1 == 1)
		begin
			case({y3, y2, y1})
			3'b000:
			begin
			/* 0 in queue */
			r00 = 0;
			r01 = 0;
			r02 = 0;
			r03 = 0;
			end
			
			3'b001:
			begin
			/* 1 */
			r00 = 0;
			r01 = 0;
			r02 = 0;
			r03 = 0;
			end
			
			3'b010:
			begin
			/* 2 */
			r10 = 0;
			r11 = 0;
			r12 = 0;
			r13 = 0;
			end
			
			3'b011:
			begin
			/* 3 */
			r20 = 0;
			r21 = 0;
			r22 = 0;
			r23 = 0;
			end
			
			3'b100:
			begin
			/* 4 */
			r30 = 0;
			r31 = 0;
			r32 = 0;
			r33 = 0;
			end
			
			endcase
		end
		else
		begin
			r00 = or00;
			r01 = or01;
			r02 = or02;
			r03 = or03;
			
			r10 = or10;
			r11 = or11;
			r12 = or12;
			r13 = or13;
			
			r20 = or20;
			r21 = or21;
			r22 = or22;
			r23 = or23;
			
			r30 = or30;
			r31 = or31;
			r32 = or32;
			r33 = or33;
		end
	end
	else
	begin
		opd = 0;
	end
		
	end
	
	
endmodule

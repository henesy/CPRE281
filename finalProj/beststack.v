module beststack(w2, w1, in3, in2, in1, in0, r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, ctl, over, under, rst);
	input w2, w1, in3, in2, in1, in0, ctl, rst;
	output reg r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, over, under;
	
	integer state;
	
	initial
	begin
	state = 0;
	
	r00 = 0;
	r01 = 0;
	r02 = 0;
	r03 = 0;
	
	r10 = 0;
	r11 = 0;
	r12 = 0;
	r13 = 0;
	
	r20 = 0;
	r21 = 0;
	r22 = 0;
	r23 = 0;
	
	r30 = 0;
	r31 = 0;
	r32 = 0;
	r33 = 0;
	
	over = 0;
	under = 0;
	end
	
	always@(negedge ctl)
	begin
	
		case(state)
			0:
			begin
				if(w2 == 1)
				begin
					/* push */
					r00 = in0;
					r01 = in1;
					r02 = in2;
					r03 = in3;
					state = state + 1;
				end
				else if(w1 == 1)
				begin
					/* pop */
					under = 1;
				end
			end
			
			1:
			begin
				if(w2 == 1)
				begin
					/* push */
					r10 = in0;
					r11 = in1;
					r12 = in2;
					r13 = in3;
					state = state + 1;
				end
				else if(w1 == 1)
				begin
					/* pop */
					r00 = 0;
					r01 = 0;
					r02 = 0;
					r03 = 0;
					state = state - 1;
				end
			end
			
			2:
			begin
				if(w2 == 1)
				begin
					/* push */
					r20 = in0;
					r21 = in1;
					r22 = in2;
					r23 = in3;
					state = state + 1;
				end
				else if(w1 == 1)
				begin
					/* pop */
					r10 = 0;
					r11 = 0;
					r12 = 0;
					r13 = 0;
					state = state - 1;
				end
			end
			
			
			3:
			begin
				if(w2 == 1)
				begin
					/* push */
					r30 = in0;
					r31 = in1;
					r32 = in2;
					r33 = in3;
					state = state + 1;
				end
				else if(w1 == 1)
				begin
					/* pop */
					r20 = 0;
					r21 = 0;
					r22 = 0;
					r23 = 0;
					state = state - 1;
				end
			end
			
			4:
			begin
				if(w2 == 1)
				begin
					/* push */
					over = 1;
				end
				else if(w1 == 1)
				begin
					/* pop */
					r30 = 0;
					r31 = 0;
					r32 = 0;
					r33 = 0;
					state = state - 1;
				end
			end
		
		endcase
		
		if(rst == 0)
		begin
			state = 0;
			
			r00 = 0;
			r01 = 0;
			r02 = 0;
			r03 = 0;
			
			r10 = 0;
			r11 = 0;
			r12 = 0;
			r13 = 0;
			
			r20 = 0;
			r21 = 0;
			r22 = 0;
			r23 = 0;
			
			r30 = 0;
			r31 = 0;
			r32 = 0;
			r33 = 0;
			
			over = 0;
			under = 0;
		end
		
	end
	
endmodule

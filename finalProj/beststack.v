module beststack(w2, w1, in3, in2, in1, in0, r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, ctl, over, under, rst, w3, z3, z2, z1);
	input w2, w1, in3, in2, in1, in0, ctl, rst, w3;
	output reg r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, over, under, z3, z2, z1;
	
	integer state;
	
	reg t0, t1, t2, t3;
	
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
	
	t0 = 0;
	t1 = 0;
	t2 = 0;
	t3 = 0;
	
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
					r00 = 0;
					r01 = 0;
					r02 = 0;
					r03 = 0;
					state = state;
				end
				else if(w3 == 1)
				begin
					/* pop & exch */
					under = 1;
					r00 = 0;
					r01 = 0;
					r02 = 0;
					r03 = 0;
					state = state;
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
				else if(w3 == 1)
				begin
					/* pop & exch */		
					r00 = r00;
					r01 = r01;
					r02 = r02;
					r03 = r03;
					state = state;
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
				else if(w3 == 1)
				begin
					/* pop & exch */
					t0 = r00;
					t1 = r01;
					t2 = r02;
					t3 = r03;
					
					r00 = r10;
					r01 = r11;
					r02 = r12;
					r03 = r13;
					
					r10 = t0;
					r11 = t1;
					r12 = t2;
					r13 = t3;
					state = state;
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
				else if(w3 == 1)
				begin
					/* pop & exch */
					t0 = r20;
					t1 = r21;
					t2 = r22;
					t3 = r23;
					
					r20 = r10;
					r21 = r11;
					r22 = r12;
					r23 = r13;
					
					r10 = t0;
					r11 = t1;
					r12 = t2;
					r13 = t3;
					state = state;
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
				else if(w3 == 1)
				begin
					/* pop & exch */
					t0 = r30;
					t1 = r31;
					t2 = r32;
					t3 = r33;
					
					r30 = r20;
					r31 = r21;
					r32 = r22;
					r33 = r23;
					
					r20 = t0;
					r21 = t1;
					r22 = t2;
					r23 = t3;
					state = state;
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
		
		if(under == 1 && state > 0)
		begin
			under = 0;
		end
		
		if(over == 1 && state < 4)
		begin
			over = 0;
		end
		
		if(state == 0)
		begin
			z3 = 0;
			z2 = 0;
			z1 = 0;
		end
		else if(state == 1)
		begin
			z3 = 0;
			z2 = 0;
			z1 = 1;
		end
		else if(state == 2)
		begin
			z3 = 0;
			z2 = 1;
			z1 = 0;
		end
		else if(state == 3)
		begin
			z3 = 0;
			z2 = 1;
			z1 = 1;
		end
		else if(state == 4)
		begin
			z3 = 1;
			z2 = 0;
			z1 = 0;
		end
		
	end
	
endmodule

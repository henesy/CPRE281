module betterstatemachine(y3, y2, y1, w2, w1, z3, z2, z1, ww2, ww1, ctl);
	input y3, y2, y1, w2, w1, ctl;
	output reg z3, z2, z1, ww2, ww1;
	
	always@(*)
	begin
	
	ww2 = w2;
	ww1 = w1;
	
	if(ctl == 1)
	begin
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
			
			if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 0;
			end
		end
		
		if(y3 == 0 && y2 == 0 && y1 == 1)
		begin
		/* 001 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 0;
				z2 = 1;
				z1 = 0;
			end
			
			if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 0;
			end
		end
		
		if(y3 == 0 && y2 == 1 && y1 == 0)
		begin
		/* 010 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 0;
				z2 = 1;
				z1 = 1;
			end
			
			if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 0;
				z1 = 1;
			end
		end
		
		if(y3 == 0 && y2 == 1 && y1 == 1)
		begin
		/* 011 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 1;
				z2 = 0;
				z1 = 0;
			end
			
			if(w2 == 0 && w1 == 1)
			begin
			/* pop */
				z3 = 0;
				z2 = 1;
				z1 = 0;
			end
		end
		
		if(y3 == 1 && y2 == 0 && y1 == 0)
		begin
		/* 100 */
			if(w2 == 0 && w1 == 0)
			begin
			/* push */
				z3 = 1;
				z2 = 0;
				z1 = 0;
			end
			
			if(w2 == 0 && w1 == 1)
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
	end
	
	end
	
endmodule

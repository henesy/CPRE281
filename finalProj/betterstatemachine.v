module betterstatemachine(y3, y2, y1, w2, w1, z3, z2, z1);
	input y3, y2, y1, w2, w1;
	output reg z3, z2, z1;
	
	always@(*)
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
	
	end
	
endmodule

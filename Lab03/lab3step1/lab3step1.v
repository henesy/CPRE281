module lab3step1(C, G, W, A);
	input C, G, W;
	output A;
	
	not(G_n, G);
	not(C_n, C);
	not(W_n, W);
		
	or(c_gn_w, C, W, G_n);
	or(cn_g_wn, C_n, G, W_n);
	
	and(A, c_gn_w, cn_g_wn);
	
	
endmodule

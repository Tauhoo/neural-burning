module clock_sum(clk_a, clk_b, clk_out);
	input clk_a;
	input clk_b;
	output clk_out;
	
	assign clk_out = clk_a & clk_b;
endmodule

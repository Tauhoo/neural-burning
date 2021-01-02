module spreader(data_in, data_out_a, data_out_b);
	parameter size = 1;
	input [size - 1:0] data_in;
	output [size - 1:0] data_out_a;
	output [size - 1:0] data_out_b;
	
	assign data_out_a = data_in;
	assign data_out_b = data_in;
endmodule

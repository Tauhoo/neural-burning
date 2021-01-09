module diff_start(x, diff);
	parameter size = 3;
	parameter data_size = 16;
	
	input [size*data_size - 1:0] x;
	output [size*data_size - 1:0] diff;

	assign diff = x;
endmodule

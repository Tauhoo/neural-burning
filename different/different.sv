module different (weight, x, diff_dense_out, diff_start_out, diff_to_all_out, clk);
    parameter size = 3;
	parameter data_size = 16;

	input [size*data_size - 1:0] weight;
    input [size*data_size - 1:0] x;
    input clk;

    output [size*data_size - 1:0] diff_dense_out;
    output [size*data_size - 1:0] diff_start_out;
    output [size*data_size - 1:0] diff_to_all_out;

    diff_dense dd(.weight(weight), .diff(diff_dense_out), .clk(clk));
    diff_start ds(.x(x), .diff(diff_start_out), .clk(clk));
    diff_to_all dta(.weight(weight), .diff(diff_to_all_out), .clk(clk));
endmodule

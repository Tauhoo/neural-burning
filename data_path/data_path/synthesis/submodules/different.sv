module different (weight, x, z, predict_value, cost_type, dense_type, diff_dense_out, diff_start_out, diff_to_all_out, diff_cost_out);
    parameter size = 3;
	parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;

	input [size*data_size - 1:0] weight;
    input [size*data_size - 1:0] x;
    input [size*data_size - 1:0] z;
    input [size*data_size - 1:0] predict_value;

    input [cost_type_size - 1:0] cost_type;
    input [dense_type_size - 1:0] dense_type;

    output [size*data_size - 1:0] diff_dense_out;
    output [size*data_size - 1:0] diff_start_out;
    output [size*data_size - 1:0] diff_to_all_out;
    output [size*data_size - 1:0] diff_cost_out;

    diff_dense dd(.weight(weight), .diff(diff_dense_out));
    diff_start ds(.x(x), .diff(diff_start_out));
    diff_to_all dta(.weight(weight), .diff(diff_to_all_out));
    diff_cost dc(.predict_value(predict_value), .z(z), .diff(diff_cost_out));
endmodule

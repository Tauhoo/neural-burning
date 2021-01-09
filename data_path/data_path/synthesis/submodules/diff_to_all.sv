module diff_to_all (
    weight,
    diff
);
    parameter size = 3;
	parameter data_size = 16;

    input [size*data_size - 1:0] weight;
    output [size*data_size - 1:0] diff;

    assign diff = weight;
endmodule
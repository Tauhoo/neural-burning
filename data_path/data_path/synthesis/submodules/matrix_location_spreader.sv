module matrix_location_spreader (
    read_layer_index,
    read_row_index,    
    read_layer_index_1,
    read_row_index_1,    
    read_layer_index_2,
    read_row_index_2
);
    parameter layer_index_size = 32;
    parameter row_index_size = 32;

    input [layer_index_size - 1:0] read_layer_index;
    input [row_index_size - 1:0] read_row_index;

    output [layer_index_size - 1:0] read_layer_index_1;
    output [row_index_size - 1:0] read_row_index_1;
    output [layer_index_size - 1:0] read_layer_index_2;
    output [row_index_size - 1:0] read_row_index_2;

    spreader #( .size(layer_index_size) ) spreader_1 (.data_in(read_layer_index), .data_out_a(read_layer_index_1), .data_out_b(read_layer_index_2));

    spreader #( .size(row_index_size) ) sreader_2 (.data_in(read_row_index), .data_out_a(read_row_index_1), .data_out_b(read_row_index_2));
endmodule
module weight_interface_spreader (
    is_load,
    w_row_index,
    w_layer_index,
    is_load_out,
    w_row_index_out,
    w_layer_index_out,
    w_row_index_out_forward,
    w_layer_index_out_forward
);

    input is_load;
    input [31:0] w_row_index;
    input [31:0] w_layer_index;

    output is_load_out;
    output [31:0] w_row_index_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out_forward;
    output [31:0] w_layer_index_out_forward;

    assign is_load_out = is_load;

    spreader #( .size(32) ) spreader_1 (.data_in(w_row_index), .data_out_a(w_row_index_out), .data_out_b(w_row_index_out_forward));
    spreader #( .size(32) ) spreader_2 (.data_in(w_layer_index), .data_out_a(w_layer_index_out), .data_out_b(w_layer_index_out_forward));
endmodule
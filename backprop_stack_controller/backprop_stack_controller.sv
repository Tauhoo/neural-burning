module backprop_stack_controller(
    backprop_cost,
    is_update,
    w_layer_index,
    w_row_index,
    is_cost_layer,

    diff_start,
    diff_to_all,
    diff_dense,
    diff_cost,

    reset, 
    current_layer_index, 
    dc_dw_layer_index, 
    copy, 
    cal_dy_dy_old,
    
    diff_start_out,
    diff_to_all_out,
    diff_dense_out,
    
    is_cost_layer_out,
    
    w_layer_index_out,
    w_row_index_out);

    parameter size = 3;
    parameter data_size = 16;

    input backprop_cost;
    input is_update;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input is_cost_layer;

    input [data_size*size - 1:0] diff_start;
    input [data_size*size - 1:0] diff_to_all;
    input [data_size*size - 1:0] diff_dense;
    input [data_size*size - 1:0] diff_cost;

    output reset;
    output [31:0] current_layer_index;
    output [31:0] dc_dw_layer_index;
    output copy;
    output cal_dy_dy_old;

    output [data_size*size - 1:0] diff_start_out;
    output [data_size*size - 1:0] diff_to_all_out;
    output [data_size*size - 1:0] diff_dense_out;

    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;

    output is_cost_layer_out;

    assign reset = is_update && w_row_index == 0 ? 1'b1 : 1'b0;
    assign current_layer_index = is_update ? w_layer_index : 0;
    assign dc_dw_layer_index = is_update && is_cost_layer ? w_row_index : 0;
    assign copy = is_update && is_cost_layer && w_row_index == 0 ? 1'b1 : 1'b0;
    assign cal_dy_dy_old = is_update && w_row_index == size - 1 ?  1'b1 : 1'b0;
    
    assign diff_start_out = ~is_update || backprop_cost ? 0 : diff_start;
    assign diff_to_all_out = is_update ? 
                                backprop_cost ? diff_cost : diff_to_all : 
                                0;
    assign diff_dense_out = is_update  ? 
                                backprop_cost ? diff_cost : diff_dense :
                                0;

    assign w_layer_index_out = is_update ? w_layer_index : 0;
    assign w_row_index_out = is_update ? w_row_index : 0;
    assign is_cost_layer_out = is_cost_layer;

endmodule

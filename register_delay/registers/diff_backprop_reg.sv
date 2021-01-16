module diff_backprop_reg (
    w_layer_index,
    w_row_index,
    backprop_cost,
    diff_to_all,
    diff_start,
    diff_dense,
    diff_cost,
    is_update,
    is_cost_layer,
    z,
    predict_value,

    w_layer_index_out,
    w_row_index_out,
    backprop_cost_out,
    diff_to_all_out,
    diff_start_out,
    diff_dense_out,
    diff_cost_out,
    is_update_out,
    is_cost_layer_out,
    z_out,
    predict_value_out,

    clk
);

    parameter size = 3;
    parameter data_size = 16;
    parameter dense_type_size = 4;

    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input backprop_cost;
    input [size*data_size - 1:0] diff_to_all;
    input [size*data_size - 1:0] diff_start;
    input [size*data_size - 1:0] diff_dense;
    input [size*data_size - 1:0] diff_cost;
    input is_update;
    input is_cost_layer;
    input [size*data_size - 1:0] z;
    input [size*data_size - 1:0] predict_value;

    input clk;

    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;
    output backprop_cost_out;
    output [size*data_size - 1:0] diff_to_all_out;
    output [size*data_size - 1:0] diff_start_out;
    output [size*data_size - 1:0] diff_dense_out;
    output [size*data_size - 1:0] diff_cost_out;
    output is_update_out;
    output is_cost_layer_out;
    output [size*data_size - 1:0] z_out;
    output [size*data_size - 1:0] predict_value_out;
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_backprop_cost(.bus_in(backprop_cost), .bus_out(backprop_cost_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_to_all(.bus_in(diff_to_all), .bus_out(diff_to_all_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_start(.bus_in(diff_start), .bus_out(diff_start_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_dense(.bus_in(diff_dense), .bus_out(diff_dense_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_cost(.bus_in(diff_cost), .bus_out(diff_cost_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_is_update(.bus_in(is_update), .bus_out(is_update_out), .clk(clk));

    delay #(.data_size(1), .size(1))
    delay_inst_is_cost_layer(.bus_in(is_cost_layer), .bus_out(is_cost_layer_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_predict_value(.bus_in(predict_value), .bus_out(predict_value_out), .clk(clk));
    
endmodule